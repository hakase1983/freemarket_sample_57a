$(function(){
  $("#item_price").on("keyup",function(){
    var a = $("#item_price.input-default").val()
    if(a.length !== 0){
      $('.list-fee-right').text("￥" + a)
    }else{
      $('.list-fee-right').text(a)
    }
    var price = $("#item_price.input-default").val()
    if(price.length >= 3){
      fee = price*0.1
      profit_dp= price-fee
      var profit = Math.ceil(profit_dp) ;
      $('.list-profit-right').text("￥" + profit)
    }else if(a.length == 0){
      $('.list-profit-right').text(price)
    }
  })
})
