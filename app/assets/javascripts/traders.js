$(document).on('turbolinks:load', () => {
if($('#display-trader-bonds-template').length >0 ){
  addTraderBondsListener()
}
 });

function addTraderBondsListener() {
	var template = compileTraderBondsTemplate()
	$("#trader-bonds-js").on("click", function() {
		var traderId = parseInt($("#trader-bonds-js").attr("data-id"));
		$.get("/traders/" + traderId + "/bonds.json", function(data) {
			bonds = data
			$("#bonds-i-trade").html(template(bonds))
	})
	})
}

function compileTraderBondsTemplate() {
  var displayBondsTemplate = $("#display-trader-bonds-template").html()
  return Handlebars.compile(displayBondsTemplate)
}
