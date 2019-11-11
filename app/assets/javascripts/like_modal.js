$(function() {
  $(document).on('click', '.regist_button', function(e){
    e.preventDefault();

    $('.modal_wrapper').animate({
      opacity: .7,
      }, 500);

    $('#modal').animate({
      width: "30%",
      height: "675px",
      opacity: 1,
      }, 500);

    $('.modal_wrapper').show();
    $('#modal').show();
  });

  $(document).on('click', '#modal__cancel', function(){

    $('.modal_wrapper').animate({
      opacity: 0,
      }, 500);

    $('#modal').animate({
      width: "25%",
      height: "625px",
      opacity: 0,
    }, 500);

    $('.modal_wrapper').hide();
    $('#modal').hide();
  })

  // $("a[id^='edit_button']").on('click', function(e){
  //   // e.preventDefault();

  //   var id = $(this).data("likeid");

  //   $('.modal_wrapper').show();
  //   $('#modal-edit' + id ).show();
  // });

  // $("[id^='modal-edit__cancel']").on('click', function(){
  //   location.reload();
    // var id = $(this).data("likeid");

    // console.log(id);
    // $('.modal_wrapper').hide();
    // $('#modal-edit' + id ).css('display', 'none');
  // });
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