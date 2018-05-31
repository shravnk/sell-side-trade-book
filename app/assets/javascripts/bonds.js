$( () => {
  var requestId = 0
  $(".js-bond-trades").mouseenter(function() {
    var that = this
    $(this).css("background-color", "#d8e7ff")
    timer = setTimeout(function() {
        var bondId = parseInt($(that).attr("data-id"));
        var thisRequestId = requestId
        $.get("/bonds/" + bondId + ".json").done(function(data) {
          transacts = data
          current = document.querySelectorAll( ":hover" );
          var curBondId= [].slice.call(current).pop().getAttribute("data-id")
          if (thisRequestId == requestId) {
            for(let transact of transacts) {
              $("#js-display-trades-header").show()
              $("#js-display-trades").append(`<tr>
                <td>${transact.trade_type}</td>
                <td>${transact.size}</td>
                <td>${transact.price}</td>
                <td>${transact.trader_name}</td>
                <td>${transact.client_name}</td></tr>`)
              };
            }
          });
      }, 100);
      }).mouseleave(function () {
        clearTimeout(timer)
        requestId += 1
        $(this).css("background-color", "white");
        $("#js-display-trades").empty()
        $("#js-display-trades-header").hide()
      });

    })


