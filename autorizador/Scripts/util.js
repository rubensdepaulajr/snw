function ShowMessage(pTitle, pMessage, pIsSticky, pRemoveTimer) {

    var notice = '<div class="notice">'
                    + '<div class="notice-body">'
                        + '<img src="/Content/purr/info.png" />'
                        + '<h3>' + pTitle + '</h3>'
                        + '<p>' + pMessage + '</p>'
                    + '</div>'
                    + '<div class="notice-bottom">'
                    + '</div>'
                + '</div>';

    $(notice).purr(

      {
          fadeInSpeed: 200,
          fadeOutSpeed: 2000,
          removeTimer: pRemoveTimer,
          isSticky: pIsSticky
      } 

    );
}