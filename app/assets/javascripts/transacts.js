class Transact {
    constructor(data) {
        this.id = data.id
        this.nextId = data.next_id
        this.description = data.bond.description
        this.price = data.price
        this.type = data.trade_type
        this.size = data.size
        this.trader = data.trader_name
        this.client = data.client_name
        this.tradeTime = data.f_trade_time
        this.updatedAt = data.f_updated_at
        this.createdAt = data.f_created_at
        this.salespeople = data.salespeople
        this.spNames = this.createSalespersonNamesArray()

    }

    setShowAttributes() {
        $("#description").text(this.description)
        $("#price").text(this.price)
        $("#type").text(this.type)
        $("#size").text(this.size)
        $("#trader").text(this.trader)
        $("#client").text(this.client)

        $("#trade_time").text(this.tradeTime)
        $("#updated_at").text(this.updatedAt)
        $("#created_at").text(this.createdAt)

        $("#salespeople").text(spNames)
    }

    setShowLinks(data) {
        $("#edit").attr("href", `/transacts/${this.id}/edit`)
        $("#cancel").attr("href", `/transacts/${this.id}`)
        $("#cancel").attr("data-method", "delete")

        $("#confirm").attr("href", `/transacts/${this.id}/confirm`)

        $(".js-next-transact").attr("data-id", this.nextId)
        $(".js-new-transact").attr("data-id", this.id)
    }
    createSalespersonNamesArray() {
        if (this.salespeople) {
            var sp_names = []
            for (var i in this.salespeople) {
              sp_names.push(this.salespeople[i]["name"])
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
