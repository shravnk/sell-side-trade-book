class Transact {
    constructor(data) {
        this.data = data
    }

    setShowAttributes() {
        $("#description").text(this.data["bond"]["description"])
        $("#price").text(this.data["price"])
        $("#type").text(this.data["trade_type"])
        $("#size").text(this.data["size"])
        $("#trader").text(this.data["trader_name"])
        $("#client").text(this.data["client_name"])

        $("#trade_time").text(this.data["f_trade_time"])
        $("#updated_at").text(this.data["f_updated_at"])
        $("#created_at").text(this.data["f_created_at"])

        let sp_names = this.createSalespersonNamesArray()
        $("#salespeople").text(sp_names)
    }

    setShowLinks(data) {
        $("#edit").attr("href", `/transacts/${this.data["id"]}/edit`)
        $("#cancel").attr("href", `/transacts/${this.data["id"]}`)
        $("#cancel").attr("data-method", "delete")

        $("#confirm").attr("href", `/transacts/${this.data["id"]}/confirm`)

        $(".js-next-transact").attr("data-id", this.data["next_id"])
        $(".js-new-transact").attr("data-id", this.data["id"])
    }
    createSalespersonNamesArray() {
        if (this.data.salespeople) {
            var sp_names = []
            for (var i in this.data.salespeople) {
              sp_names.push(this.data.salespeople[i]["name"])
            }
            return sp_names.join(', ')
        } else {
            return ''
        }
    }
}

$(document).on('turbolinks:load', () => {
  setCheckTypeHelper()
  addNextTransactListener()
  addDuplicateTransactListener()
  });

function addNextTransactListener() {
    $(".js-next-transact").on("click", function() {
    $("#duplicate").empty()
     var nextId = parseInt($(".js-next-transact").attr("data-id"));
     if (nextId) {
     $.get("/transacts/" + nextId + ".json", function(data) {
        transact = new Transact(data)
        transact.setShowAttributes()
        transact.setShowLinks()
    })
    } else {alert("This is the most recent trade.")}
    })
}

function setCheckTypeHelper() {
    Handlebars.registerHelper('checkType', function(trade_type, button_type) {
        if (trade_type == button_type) {
            return "checked";
          } else {
            return ""
          }
    })
}

function addDuplicateTransactListener() {
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
        var trade_time = toISOLocal(now).substring(0, toISOLocal(now).length-1)

        var tradeDetails = {size, trade_type, price, trade_time}
        var transactFormTemplate = document.getElementById("duplicate-transact-template").innerHTML
        var template = Handlebars.compile(transactFormTemplate)
        document.getElementById("duplicate").innerHTML = template(tradeDetails)
        addDuplicateFormHandler()
        $("#transact_bond_id").val(bond_id)
        $("#transact_trader_id").val(trader_id)
        $("#transact_client_id").val(client_id)
        $("#transact_salesperson_ids").val(salespeople_ids)

        var position = $("#duplicate").position();
        scroll(0,position.top);
      })
    })
}

function addDuplicateFormHandler () {
    $('form').submit(function(event) {
      event.preventDefault();
      let tradeDetails = $(this).serialize();
      let posting = $.post('/transacts', tradeDetails);
      posting.done(function(data) {
          transact = new Transact(data)
          transact.setShowAttributes()
          transact.setShowLinks()
          $("#js-transact-success-message").html("<strong>Successfully booked new trade.</strong>")
      }).done(
      $(function() {
        $("#duplicate").empty()
      })
      )
    })
}

function toISOLocal(d) {
  var z = n => (n<10? '0':'')+n;
  var off = d.getTimezoneOffset();
  var sign = off < 0? '+' : '-';
  off = Math.abs(off);

  return d.getFullYear() + '-' + z(d.getMonth()+1) + '-' +
         z(d.getDate()) + 'T' + z(d.getHours()) + ':'  + z(d.getMinutes()) +
         ':' + z(d.getSeconds()) + '.' + z(off/60|0) + z(off%60);
}
