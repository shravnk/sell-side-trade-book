$(document).on('turbolinks:load', () => {
  addRecentActivityListener()

 });

function addRecentActivityListener() {
	var template = compileClientTradesTemplate()
	$("#client-recent-js").on("click", function() {
		var clientId = parseInt($("#client-recent-js").attr("data-id"));
		$.get("/clients/" + clientId + "/transacts.json", function(data) {
			transacts = data
			$("#client-recent-transacts").html(template(transacts))
	})
	})
}

function compileClientTradesTemplate() {
  var displayTradesTemplate = $("#display-client-trades-template").html()
  return Handlebars.compile(displayTradesTemplate)
}

