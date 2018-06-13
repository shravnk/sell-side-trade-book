$(document).on('turbolinks:load', () => {
  window.requestId = 0
  addEventListeners()
  });

function bondRowEnter(event) {
  const row = event.currentTarget
  $(row).css("background-color", "#d8e7ff")
  const template = compileDisplayTradesTemplate()
  setTimeout(function() {
    const bondId = parseInt($(row).attr("data-id"));
    const thisRequestId = window.requestId
    $.get(`/bonds/${bondId}/transacts.json`).done(function(data) {
      var transacts = data
      if (thisRequestId === requestId) {
          $("#js-display-trades-column").html(template(transacts))
        }
      });
  }, 100);
}

function bondRowExit(event) {
  const row = event.currentTarget
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
