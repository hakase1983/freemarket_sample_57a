$(function(){
  $('#token_submit').on('click', function() {
    
    Payjp.setPublicKey('pk_test_0a0a49e31db4fc41da70e36b');
    var card = {
      number: parseInt($("#a").val()),
      cvc: parseInt($("#b").val()),
      exp_month: parseInt($("#c").val()),
      exp_year: parseInt($("#d").val())
    };
    Payjp.createToken(card, function(status, response) {
      if (status == 200) {
        $("#a").removeAttr("name");
        $("#b").removeAttr("name");
        $("#c").removeAttr("name");
        $("#d").removeAttr("name"); //データを自サーバにpostしないように削除
        $("#card_token").append(
          $('<input type="hidden" name="payjp-token">').val(response.id)
        ); //取得したトークンを送信できる状態にします
        document.inputForm.submit();
        alert("登録が完了しました"); //確認用
      }else {
        alert("カード情報が正しくありません。"); //確認用
      }
    });
  })
})