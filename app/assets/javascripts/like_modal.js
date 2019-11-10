$(function() {
  $(document).on('click', '.regist_button', function(e){
    e.preventDefault();

    $('.modal_wrapper').show();
    $('#modal').show();
  });

  // $("a[id^='edit_button']").on('click', function(e){
  //   // e.preventDefault();

  //   var id = $(this).data("likeid");

  //   $('.modal_wrapper').show();
  //   $('#modal-edit' + id ).show();
  // });

  $(document).on('click', '#modal__cancel', function(){
    $('.modal_wrapper').hide();
    $('#modal').hide();
  })

  $("[id^='modal-edit__cancel']").on('click', function(){
    location.reload();
    // var id = $(this).data("likeid");

    // console.log(id);
    // $('.modal_wrapper').hide();
    // $('#modal-edit' + id ).css('display', 'none');
  });
});

$(function() {
  function readURL(input) {
      if (input.files && input.files[0]) {
      var reader = new FileReader();
      reader.onload = function (e) {
        $('#img_prev').attr('src', e.target.result);
      }
      reader.readAsDataURL(input.files[0]);
      }
  }
  $("#like_img").change(function(){
    readURL(this);
  });
  $("#user_img").change(function(){
    readURL(this);
});
});