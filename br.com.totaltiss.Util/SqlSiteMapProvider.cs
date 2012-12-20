using System;
using System.Web;
using System.Data.SqlClient;
using System.Collections.Specialized;
using System.Configuration;
using System.Web.Configuration;
using System.Collections.Generic;
using System.Runtime.CompilerServices;
using System.Configuration.Provider;
using System.Security.Permissions;
using System.Data.Common;

[SqlClientPermission(SecurityAction.Demand, Unrestricted = true)]
public class SqlSiteMapProvider : StaticSiteMapProvider
{
    private const string _errmsg1 = "Missing node ID";
    private const string _errmsg2 = "Duplicate node ID";
    private const string _errmsg3 = "Missing parent ID";
    private const string _errmsg4 = "Invalid parent ID";
    private const string _errmsg5 =
        "Empty or missing connectionStringName";
    private const string _errmsg6 = "Missing connection string";
    private const string _errmsg7 = "Empty connection string";

    private string _connect;
    private int _indexID, _indexTitle, _indexUrl,
        _indexDesc, _indexRoles, _indexParent;
    private Dictionary<int, SiteMapNode> _nodes =
        new Dictionary<int, SiteMapNode>(16);
    private SiteMapNode _root;

    public override void Initialize(string name,
        NameValueCollection config)
    {
        // Verify that config isn't null
        if (config == null)
            throw new ArgumentNullException("config");

        // Assign the provider a default name if it doesn't have one
        if (String.IsNullOrEmpty(name))
            name = "SqlSiteMapProvider";

        // Add a default "description" attribute to config if the
        // attribute doesn't exist or is empty
        if (string.IsNullOrEmpty(config["description"]))
        {
            config.Remove("description");
            config.Add("description", "SQL site map provider");
        }

        // Call the base class's Initialize method
        base.Initialize(name, config);

        // Initialize _connect
        string connect = config["connectionStringName"];

        if (String.IsNullOrEmpty(connect))
            throw new ProviderException(_errmsg5);

        config.Remove("connectionStringName");

        if (WebConfigurationManager.ConnectionStrings[connect] == null)
            throw new ProviderException(_errmsg6);

        _connect = WebConfigurationManager.ConnectionStrings
            [connect].ConnectionString;

        if (String.IsNullOrEmpty(_connect))
            throw new ProviderException(_errmsg7);

        // In beta 2, SiteMapProvider processes the
        // securityTrimmingEnabled attribute but fails to remove it.
        // Remove it now so we can check for unrecognized
        // configuration attributes.

        if (config["securityTrimmingEnabled"] != null)
            config.Remove("securityTrimmingEnabled");

        // Throw an exception if unrecognized attributes remain
        if (config.Count > 0)
        {
            string attr = config.GetKey(0);
            if (!String.IsNullOrEmpty(attr))
                throw new ProviderException
                    ("Unrecognized attribute: " + attr);
        }
    }

    public override SiteMapNode BuildSiteMap()
    {
        lock (this)
        {
            // Return immediately if this method has been called before
            if (_root != null)
                return _root;

            // Query the database for site map nodes
            SqlConnection connection = new SqlConnection(_connect);

            try
            {
                connection.Open();
                SqlCommand command =
                    new SqlCommand("ssSgn_Map", connection);
                command.CommandType = System.Data.CommandType.StoredProcedure;
                SqlDataReader reader = command.ExecuteReader();
                _indexID = reader.GetOrdinal("ID");
                _indexUrl = reader.GetOrdinal("Url");
                _indexTitle = reader.GetOrdinal("Title");
                _indexDesc = reader.GetOrdinal("Description");
                _indexRoles = reader.GetOrdinal("Roles");
                _indexParent = reader.GetOrdinal("Parent");

                if (reader.Read())
                {
                    // Create the root SiteMapNode and add it to
                    // the site map
                    _root = CreateSiteMapNodeFromDataReader(reader);
                    AddNode(_root, null);

                    // Build a tree of SiteMapNodes underneath
                    // the root node
                    while (reader.Read())
                    {
                        // Create another site map node and
                        // add it to the site map
                        SiteMapNode node =
                            CreateSiteMapNodeFromDataReader(reader);
                        AddNode(node,
                            GetParentNodeFromDataReader(reader));
                    }
                }
            }
            finally
            {
                connection.Close();
            }

            // Return the root SiteMapNode
            return _root;
        }
    }

    protected override SiteMapNode GetRootNodeCore()
    {
        BuildSiteMap();
        return _root;
    }

    // Helper methods
    private SiteMapNode
        CreateSiteMapNodeFromDataReader(DbDataReader reader)
    {
        // Make sure the node ID is present
        if (reader.IsDBNull(_indexID))
            throw new ProviderException(_errmsg1);

        // Get the node ID from the DataReader
        int id = reader.GetInt32(_indexID);

        // Make sure the node ID is unique
        if (_nodes.ContainsKey(id))
            throw new ProviderException(_errmsg2);

        // Get title, URL, description, and roles from the DataReader
        string title = reader.IsDBNull(_indexTitle) ?
            null : reader.GetString(_indexTitle).Trim();
        string url = reader.IsDBNull(_indexUrl) ?
            null : reader.GetString(_indexUrl).Trim();
        string description = reader.IsDBNull(_indexDesc) ?
            null : reader.GetString(_indexDesc).Trim();
        string roles = reader.IsDBNull(_indexRoles) ?
            null : reader.GetString(_indexRoles).Trim();

        // If roles were specified, turn the list into a string array
        string[] rolelist = null;
        if (!String.IsNullOrEmpty(roles))
            rolelist = roles.Split(new char[] { ',', ';' }, 512);

        // Create a SiteMapNode
        SiteMapNode node = new SiteMapNode(this, id.ToString(), url,
            title, description, rolelist, null, null, null);

        // Record the node in the _nodes dictionary
        _nodes.Add(id, node);

        // Return the node        
        return node;
    }

    private SiteMapNode
        GetParentNodeFromDataReader(DbDataReader reader)
    {
        // Make sure the parent ID is present
        if (reader.IsDBNull(_indexParent))
            throw new ProviderException(_errmsg3);

        // Get the parent ID from the DataReader
        int pid = reader.GetInt32(_indexParent);

        // Make sure the parent ID is valid
        if (!_nodes.ContainsKey(pid))
            throw new ProviderException(_errmsg4);

        // Return the parent SiteMapNode
        return _nodes[pid];
    }

    
    //### NOVO ### Mostra ou não o item de menu de acordo com as permissões de acesso do usuário.
    public override bool IsAccessibleToUser(HttpContext context, SiteMapNode node)
    {
        //If Security Trimming is not enabled return true
        if (!SecurityTrimmingEnabled)
            return true;

        //If there are no roles defined for the page
        //return true or false depending on your authorization scheme (when true pages with
        //no roles are visible to all users, when false no user can access these pages)
        if (node.Roles == null || node.Roles.Count == 0)
            return false;

        //check each role, if the user is in any of the roles return true
        foreach (string role in node.Roles)
        {
            if (context.User.IsInRole(role) || String.Equals(role, "*", StringComparison.InvariantCultureIgnoreCase))
                return true;
        }

        return false;
    }
}
