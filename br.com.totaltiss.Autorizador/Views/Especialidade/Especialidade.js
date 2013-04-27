$(document).ready(function () {
    BuildGrid();
});

function BuildGrid() {
    var lastSel;
    jQuery("#grid").jqGrid({
        url: '@Url.Action("Lista", "Especialidade")',
        editurl: '@Url.Action("delete", "Especialidade")',
        datatype: 'json',
        mtype: 'GET',
        colNames: ['Id', 'Nome', 'CBO', 'Gestão', 'Compl?', 'Sexo', 'Mín.', 'Máx.', 'Máx.', 'Dia', 'Mês', 'Ano', 'Retorno'],
        colModel: [
          { name: 'IdEsp', index: 'IdEsp', width: 25, align: 'left', formatter: linkFormatter },
          { name: 'Esp_Dsc', index: 'Esp_Dsc', width: 230, align: 'left' },
          { name: 'Esp_Cbo', index: 'Esp_Cbo', width: 35, align: 'center' },
          { name: 'Esp_SisGst', index: 'Esp_SisGst', width: 50, align: 'rigt' },
          { name: 'Esp_AltCpx', index: 'Esp_AltCpx', width: 45, align: 'center', formatter: 'checkbox' },
          { name: 'Esp_Sxo', index: 'Esp_Sxo', width: 35, align: 'center' },
          { name: 'Esp_IddMin', index: 'Esp_IddMin', width: 25, align: 'center' },
          { name: 'Esp_IddMax', index: 'Esp_IddMax', width: 25, align: 'center' },
          { name: 'Esp_QtdMax', index: 'Esp_QtdMax', width: 25, align: 'center' },
          { name: 'Esp_QtdDia', index: 'Esp_QtdDia', width: 25, align: 'center' },
          { name: 'Esp_QtdMes', index: 'Esp_QtdMes', width: 25, align: 'center' },
          { name: 'Esp_QtdAno', index: 'Esp_QtdAno', width: 25, align: 'center' },
          { name: 'Esp_Rtn', index: 'Esp_Rtn', width: 45, align: 'center' }
        ],
        width: 800,
        height: 350,
        pager: jQuery('#pager'),
        rowNum: 15,
        rowList: [5, 15, 30, 50],
        sortname: 'IdEsp',
        sortorder: "desc",
        viewrecords: true,
        caption: 'Especialidades'
    })
    .navGrid('#pager', { edit: false, add: false, del: true, search: false })
   .navButtonAdd('#pager', {
       caption: "Add",
       buttonicon: "ui-icon-add",
       onClickButton: function () {
           alert("Adding Row");
       },
       position: "last"
   })
   .navButtonAdd('#pager', {
       caption: "Del",
       buttonicon: "ui-icon-del",
       onClickButton: function () {
           alert("Deleting Row");
       },
       position: "last"
   });

    jQuery("#grid").jqGrid('setGroupHeaders', {
        useColSpanStyle: true,
        groupHeaders: [
          { startColumnName: 'Esp_SisGst', numberOfColumns: 1, titleText: 'Cód.Sis.' },
          { startColumnName: 'Esp_AltCpx', numberOfColumns: 1, titleText: 'Alta' },
          { startColumnName: 'Esp_IddMin', numberOfColumns: 2, titleText: 'Idade' },
          { startColumnName: 'Esp_QtdMax', numberOfColumns: 4, titleText: 'Quantidades' }
        ]
    });
}

function linkFormatter(cellvalue, options, rowObject) {
    return "<a href=/Especialidade/Edit/" + cellvalue + ">" + cellvalue + "</a>";
}