$( () => {
  var displayTradesTemplate = document.getElementById("display-trades-template").innerHTML
  var template = Handlebars.compile(displayTradesTemplate)
  var requestId = 0
  
  $(".js-bond-trades").mouseenter(function() {
    var that = this
    $(this).css("background-color", "#d8e7ff")
    timer = setTimeout(function() {
        var bondId = parseInt($(that).attr("data-id"));
        var thisRequestId = requestId
        $.get("/bonds/" + bondId + ".json").done(function(data) {
          transacts = data
          if (thisRequestId == requestId) {
              document.getElementById("js-display-trades-column").innerHTML = template(transacts)
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


