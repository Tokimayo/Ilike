$(function() {

  var search_list = $(".search-user__box--list");
  
  function appendProduct(user) {
     var html = `<a class=".search-user__box--ele" href="/favorite_user/other_user/${ user.id }"><li>${ user.name }</li></a>`
      search_list.append(html);
   }
  
   function appendErrMsgToHTML(msg) {
      var html = `<li>${ msg }</li>`
      search_list.append(html);
    }
  
    $(".form-user-search").on("keyup", function() {
      var input = $(".form-user-search").val();
  
      $.ajax({
        type: 'GET',
        url: '/favorite_user/search',
        data: { keyword: input },
        dataType: 'json',
      })
      .done(function(users) {
        console.log(users);
        $(".search-user__box--list").empty();
        if (users.length !== 0) {
          users.forEach(function(user){
            appendProduct(user);
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