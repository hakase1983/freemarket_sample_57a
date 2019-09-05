$(function(){
  var topHtml = `<li class="sell-upload-item" id="a">
                  <figure class="sell-upload-figure">`
  var bottomHtml = `<div class="sell-upload-button">
                      <a href="" class="sell-upload-edit">編集</a>
                      <a class="image-delete">削除</a>
                    </div>`;    
  var dropbox = `<label class="sell__image-dropbox1" for="item_image1" style="display: block;" id="1" name="dropbox">
                  <input class="sell__image-dropfile" type="file" style="display:none;" id="item_image2" name="item[image_attributes][image2]">
                  <pre>ドラッグアンドドロップ
                  またはクリックしてファイルをアップロード</pre>
                </label>`   
  //画像ファイルプレビュー表示のイベント追加 fileを選択時に発火するイベントを登録
  $('form').on('change','input[type="file"]', function(e) {
    $(".sell__image-dropbox0").hide()
    $(".sell__image-dropbox1").hide()
    var file = e.target.files[0],
        reader = new FileReader(),
        t = this;

    // 画像ファイル以外の場合は何もしない
    if(file.type.indexOf("image") < 0){
      return false;
    }

    // ファイル読み込みが完了した際のイベント登録
    reader.onload = (function(file) {
      return function(e) {
        //既存のプレビューを削除
        var drop_id = $('label[name="dropbox"]').attr('id');
        if ( drop_id == "0")
          $(".sell-upload-items ul").append(topHtml)
          // .prevewの領域の中にロードした画像を表示するimageタグを追加
          $(".sell-upload-figure").append($('<img>').attr({
                    src: e.target.result,
                    width: "114px",
                    height: "85px",
                    class: "preview",
                    id: "image1",
                    title: file.name
                }));
          $(".sell-upload-items li").append(bottomHtml)
          $(".sell__image-container").append(dropbox)
          
        };
    })(file);
    reader.readAsDataURL(file);
  });
});
