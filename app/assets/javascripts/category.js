$(function() {
  initial();
  function initial(){
    $('.select-wrap').eq(1).hide();
    $('.select-wrap').eq(2).hide();
    $('.select-wrap').eq(3).hide();
    $('.select-wrap').eq(4).hide();
    $('.select-wrap').eq(5).hide();
    $('.select-wrap').eq(6).hide();
    $('.select-wrap').eq(7).hide();
    $('.select-wrap').eq(8).hide();
    $('.select-wrap').eq(9).hide();
    $('.select-wrap').eq(10).hide();
    $('.select-wrap').eq(11).hide();
    $('.select-wrap').eq(12).hide();
    $('.select-wrap').eq(13).hide();
  }
    $("select").change(function(){
    var value = $('option:selected').val();
    console.log(value)
    if (value == "") {
      initial();
    }else if (value == 'レディース' ) {
      initial();
      $('.select-wrap').eq(1).show();
    }
    else if (value == 'メンズ' ) {
      initial();
      $('.select-wrap').eq(2).show();
    }
    else if (value == 'ベビー・キッズ' ) {
      initial();
      $('.select-wrap').eq(3).show();
    }
    else if (value == 'インテリア住まい・小物' ) {
      initial();
      $('.select-wrap').eq(4).show();
    }else if (value == '本・音楽・ゲーム' ) {
      initial();
      $('.select-wrap').eq(5).show();
    }else if (value == 'おもちゃ・ホビー・グッズ' ) {
      initial();
      $('.select-wrap').eq(6).show();
    }else if (value == 'コスメ・香水・美容' ) {
      initial();
      $('.select-wrap').eq(7).show();
    }else if (value == '家電・スマホ・カメラ' ) {
      initial();
      $('.select-wrap').eq(8).show();
    }else if (value == 'スポーツ・レジャー' ) {
      initial();
      $ ('.select-wrap').eq(9).show();
    }else if (value == 'ハンドメイド' ) {
      initial();
      $('.select-wrap').eq(10).show();
    }else if (value == 'チケット' ) {
      initial();
      $('.select-wrap').eq(11).show();
    }else if (value == '自転車・オートバイ' ) {
      initial();
      $('.select-wrap').eq(12).show();
    }else if (value == 'その他' ) {
      initial();
      $('.select-wrap').eq(13).show();
    }
  })
})