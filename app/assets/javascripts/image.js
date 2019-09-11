$(function(){
  var dropzone = $('.dropzone-area');
  var dropzone2 = $('.dropzone-area2');
  var dropzone_box = $('.dropzone-box');
  var images = [];
  var inputs  =[];
  var input_area = $('.input_area');
  var preview = $('#preview');
  var preview2 = $('#preview2');

  $('form').on('change', 'input[type= "file"].upload-image',function(event) {
    var file = $(this).prop('files')[0];
    var reader = new FileReader();
    inputs.push($(this));
    var topHtml = $(`<li class="sell-upload-item" id="a">`)
    var img = $(`<figure class="sell-upload-figure"><img class= "preview  width= "114px" height= "85px"></figure>`);
    topHtml.append(img);
    reader.onload = function(e) {
      var btn_wrapper = $(`<div class="sell-upload-button"><div class="sell-upload-edit">編集</div><a class="image-delete">削除</a></div>`);
      topHtml.append(btn_wrapper);
      topHtml.find('img').attr({
        src: e.target.result
      })
    }
    reader.readAsDataURL(file);
    images.push(topHtml);

    if(images.length >= 5) {
      dropzone2.css({
        'display': 'inline-block'
      })
      dropzone.css({
        'display': 'none'
      })
      $.each(images, function(index, image) {
        image.attr('data-image', index);
        preview2.append(image);
        dropzone2.css({
          'width': `calc(100% - (125px * ${images.length - 5}))`
        })
      })
      if(images.length == 9) {
        dropzone2.find('p').replaceWith('<i class="fa fa-camera"></i>')
      }
    } else {
        $('#preview').empty();
        $.each(images, function(index, image) {
          image.attr('data-image', index);
          preview.append(image);
        })
        dropzone.css({
          'width': `calc(100% - (125px * ${images.length}))`
        })
        dropzone.css('display','inline-block')
      }
      if(images.length == 4) {
        dropzone.find('p').replaceWith('<i class="fa fa-camera"></i>')
      }
    if(images.length == 10) {
      dropzone2.css({
        'display': 'none'
      })
      return;
    }
    var new_image = $(`<input multiple= "multiple" name="images[name][]" class="upload-image" data-image= ${images.length} type="file" id="upload-image">`);
    input_area.prepend(new_image);
  });
  $(document).on('click', '.image-delete', function() {
    var target_image = $(this).parent().parent();
    $.each(inputs, function(index, input){
      if ($(this).data('image') == target_image.data('image')){
        $(this).remove();
        target_image.remove();
        var num = $(this).data('image');
        images.splice(num, 1);
        inputs.splice(num, 1);
        if(inputs.length == 0) {
          $('input[type= "file"].upload-image').attr({
            'data-image': 0
          })
        }
      }
    })
    $('input[type= "file"].upload-image:first').attr({
      'data-image': inputs.length
    })
    $.each(inputs, function(index, input) {
      var input = $(this)
      input.attr({
        'data-image': index
      })
      $('input[type= "file"].upload-image:first').after(input)
    })
    if (images.length >= 5) {
      dropzone2.css({
        'display': 'block'
      })
      $.each(images, function(index, image) {
        image.attr('data-image', index);
        preview2.append(image);
      })
      dropzone2.css({
        'width': `calc(100% - (125px * ${images.length - 5}))`
      })
      if(images.length == 9) {
        dropzone2.find('p').replaceWith('<i class="fa fa-camera"></i>')
      }
      if(images.length == 8) {
        dropzone2.find('i').replaceWith('<pre>ドラッグアンドドロップまたはクリックしてファイルをアップロード</pre>')
      }
    } else {
      dropzone.css({
        'display': 'block'
      })
      $.each(images, function(index, image) {
        image.attr('data-image', index);
        preview.append(image);
      })
      dropzone.css({
        'width': `calc(100% - (125px * ${images.length}))`
      })
    }
    if(images.length == 4) {
      dropzone2.css({
        'display': 'none'
      })
    }
    if(images.length == 3) {
      dropzone.find('i').replaceWith('<pre>ドラッグアンドドロップまたはクリックしてファイルをアップロード</pre>')
    }
  })
});