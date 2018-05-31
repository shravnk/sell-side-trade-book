Handlebars.registerHelper('checkType', function(trade_type, button_type) {
    if (trade_type == button_type) {
        return "checked";
      } else {
        return ""
      }
})

$(".js-next-transact").on("click", function() {
    $("#duplicate").empty()
     var nextId = parseInt($(".js-next-transact").attr("data-id"));
     $.get("/transacts/" + nextId + ".json", function(data) {
        var sp_names = []
        var salespeople = data.salespeople
        for (i in salespeople) {
          sp_names.push(salespeople[i]["name"])
        }
        $("#description").text(data["bond"]["description"])
        $("#price").text(data["price"])
        $("#type").text(data["trade_type"])
        $("#size").text(data["size"])
        $("#trader").text(data["trader_name"])
        $("#client").text(data["client_name"])
        $("#salespeople").text(sp_names.join(', '))
        $("#trade_time").text(data["f_trade_time"])
        $("#updated_at").text(data["f_updated_at"])
        $("#created_at").text(data["f_created_at"])
        $("#edit").attr("href", `/transacts/${data["id"]}/edit`)
        $("#cancel").attr("href", `/transacts/${data["id"]}/cancel`)
        $("#confirm").attr("href", `/transacts/${data["id"]}/confirm`)

        $(".js-next-transact").attr("data-id", data["next_id"])
        $(".js-new-transact").attr("data-id", data["id"])
      })
})


$(".js-new-transact").on("click", function() {
var currentId = parseInt($(".js-new-transact").attr("data-id"));
$.get("/transacts/" + currentId + ".json").done(function(data) {
    var bond_id = data["bond"]["id"]
    var size = data["size"]
    var price = data["price"]
    var trade_type = data["trade_type"]
    var trader_id = data["trader"]["id"] 
    var client_id = data["client"]["id"]

    var salespeople_ids = []
    var salespeople = data.salespeople
    for (i in salespeople) {
      salespeople_ids.push(salespeople[i]["id"])
    }
  
    var now = new Date()
    var trade_time = now.toISOString().substring(0, now.toISOString().length-1)

    var tradeDetails = {size, trade_type, price, trade_time}

    var transactFormTemplate = document.getElementById("duplicate-transact-template").innerHTML
    var template = Handlebars.compile(transactFormTemplate)
    document.getElementById("duplicate").innerHTML = template(tradeDetails)

    $("#transact_bond_id").val(bond_id)
    $("#transact_trader_id").val(trader_id)
    $("#transact_client_id").val(client_id)
    $("#transact_salesperson_ids").val(salespeople_ids)
  })
})

