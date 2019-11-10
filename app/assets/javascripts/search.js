$(function() {

  var search_list = $(".search__box--list");
  
  function appendProduct(like) {
     var html = `<li><a class=".search__box--ele" href="/likes/${ like.id }">${ like.user_name } / ${ like.genre } / ${ like.things }</a></li>`
      search_list.append(html);
   }
  
   function appendErrMsgToHTML(msg) {
      var html = `<li>${ msg }</li>`
      search_list.append(html);
    }
  
    $(".form-search").on("keyup", function() {
      var input = $(".form-search").val();
  
      $.ajax({
        type: 'GET',
        url: '/likes/search',
        data: { keyword: input },
        dataType: 'json',
      })
      .done(function(likes) {
        console.log(likes);
        $(".search__box--list").empty();
        if (likes.length !== 0) {
          likes.forEach(function(like){
            appendProduct(like);
          });
        } else {
          appendErrMsgToHTML("Not found");
        }
      })
      .fail(function() {
        alert('error');
      });
    });
  });