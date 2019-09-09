$(function(){
	$("#delete-button").animatedModal({
		modalTarget:'item-delete-popup',	// ポップアップさせるモーダルウィンドウを指定
		animatedIn: 'lightSpeedIn',	// モーダルウィンドウが開くときの動きを設定
		animatedOut: 'rollOut',	// モーダルウィンドウが閉じるときの動きを設定
		animationDuration: '0.8s',	// アニメーションに要する時間
		color: 'white'	// モーダルウィンドウのエリア外の挙動
  });
  $("#item-delete-popup").css('width','650px')
  $("#item-delete-popup").css('height','300px')
  $("#item-delete-popup").css('top','15%')
  $("#item-delete-popup").css('left','40%')
  $("#delete-button").on('click',function(){
    $("#item-delete-layer").show()
  })
  $(".close-item-delete-popup").on('click',function(){
    $("#item-delete-layer").hide()
  })
});