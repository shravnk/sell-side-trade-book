$(document).ready(function() {
  window.requestId = 0
  addEventListeners()
  });

function  bondRowEnter(event) {
  row = event.currentTarget
  $(row).css("background-color", "#d8e7ff")
  var template = compileDisplayTradesTemplate()
  setTimeout(function() {
    var bondId = parseInt($(row).attr("data-id"));
    var thisRequestId = window.requestId
    $.get("/bonds/" + bondId + ".json").done(function(data) {
      transacts = data
      if (thisRequestId == requestId) {
          $("#js-display-trades-column").html(template(transacts))
        }
      });
  }, 100);
}

function bondRowExit(event) {
  row = event.currentTarget
  requestId += 1
  resetBondsPage(row)
}

function addEventListeners() {
  var bondRow = $('.js-bond-trades')
  bondRow.on("mouseenter" , bondRowEnter )
  bondRow.on("mouseleave" , bondRowExit )
}

function compileDisplayTradesTemplate() {
  var displayTradesTemplate = $("#display-trades-template").html()
  return Handlebars.compile(displayTradesTemplate)
}

function resetBondsPage(highlightedRow) {
  $(highlightedRow).css("background-color", "white");
  $("#js-display-trades-column").empty()
}
