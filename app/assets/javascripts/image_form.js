//= require turbolinks

$(function() {
  var dropzone = $(".kawa-sell-form__upload-box__dropbox__container");
  var preview = $("#kawa-preview");

  var images = [];
  var new_image_files = [];

  $(".kawa-sell-form__upload-box__dropbox").on("change", 'input[type= "file"]#kawa-upload-image', function() {
    var file = $(this).prop("files")[0];
    new_image_files.push(file);
    var reader = new FileReader();

    var img = $(`<div class="kawa-add_img">
                  <div class="kawa-img_area">
                    <img class="kawa-image">
                  </div>
                </div>`);
    var btn_wrapper = $(`<div class="kawa-btn_wrapper">
                          <a class="kawa-btn_delete">削除</a>
                        </div>`);
    img.append(btn_wrapper);

    
    reader.onload = function(e) {
      img.find("img").attr({
        src: e.target.result
      });
    };
    reader.readAsDataURL(file);
    images.push(img);

    if (images.length <= 4) {
      $('#kawa-preview').empty();
      $.each(images, function(index, image) {
        image.data("image", index);
        preview.append(image);
      })
      dropzone.css({
        "width": `calc(100% - (20% * ${images.length}))`
      })
    } else if (images.length == 5) {
      $("#kawa-preview").empty();
      $.each(images, function(index, image) {
        image.data("image", index);
        preview.append(image);
      });
      dropzone.css({
        display: "none"
      });
    }
  })

  $(".kawa-sell-form__upload-box__dropbox").on("click", ".kawa-btn_delete", function() {
    var target_image = $(this).parent().parent();
    var target_image_num = target_image.data("image");

    target_image.remove();
    images.splice(target_image_num, 1);
    new_image_files.splice(target_image_num, 1);

    if(images.length == 0) {
      $('input[type= "file"]#upload-image').attr({
        "data-image": 0
      })
    }
    if (images.length <= 4) {
      $("#kawa-preview").empty();
      $.each(images, function(index, image) {
        image.data("image", index);
        preview.append(image);
      })
      dropzone.css({
        "width": `calc(100% - (20% * ${images.length}))`,
        "display": "block"
      })
    } else if (images.length == 5) {
      $("#kawa-preview").empty();
      $.each(images, function(index, image) {
        image.data("image", index);
        preview.append(image);
      })
      dropzone.css({
        "display": "none"
      })
    }
  })

  $("#new_item").on("submit", function(e){
    e.preventDefault();
    var formData = new FormData($(this).get(0));
    if (new_image_files.length == 0) {
      formData.append("new_images[images][]", " ");
    } else {
      new_image_files.forEach(function(file) {
        formData.append("new_images[images][]", file);
      });
    }
    $.ajax({
      url:         "/items",
      type:        "POST",
      data:        formData,
      contentType: false,
      processData: false,
    })
    return false;
  });
});