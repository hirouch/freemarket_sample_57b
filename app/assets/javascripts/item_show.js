$(function(){
  $(document).on('click','.ichi__exhibit__show__images', function(){
    var item_id = $(".ichi__exhibit__show__top__image").attr('id');
    var image_id = this.id
    $.ajax({
      type: 'GET',
      url: '/items/' + item_id,
      data: {id: item_id},
      dataType: 'json'
    }).done(function(images) {
      var number = image_id - 1
      var image_set = images[number]
      var  image = image_set.id
    $('.ichi__exhibit__show__top__image').remove();
    var html = `<img class="ichi__exhibit__show__top__image" id = "${item_id}" src = '${image.url}'>`
    $('.ichi__exhibit__own__item__images__top').append(html)
    });
  });
});