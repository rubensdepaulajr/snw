loadJavaScriptFile("Scripts/jquery-1.4.1.min.js");
loadJavaScriptFile("Scripts/jquery.tooltip.min.js");

function loadJavaScriptFile(jspath) {
    document.write('<script type="text/javascript" src="' + jspath + '"><\/script>');
}

function pageLoad(sender, args) {
    if (args.get_isPartialLoad()) {
        InitializeToolTip();
    }
}

function InitializeToolTip() {
    $(".gridViewToolTip").tooltip({
        track: true,
        delay: 0,
        showURL: false,
        fade: 100,
        bodyHandler: function () {
            return $($(this).next().html());
        },
        showURL: false
    });
}