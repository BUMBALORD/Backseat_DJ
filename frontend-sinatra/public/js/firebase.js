var BSDJFB = new Firebase("https://backseatdj.firebaseio.com/");

var getId = function(){
  $.ajax({
    url: 'http://localhost:3000/id',
    type: 'GET',
    dataType: "JSON"
  })
  .done(function(response){
    console.log(response)
    var url = "http://localhost:9393/users/1/playlists"
    // $(location).attr('href', url);
    window.location.replace("http://localhost:9393/users/1/playlists");
  })
  .fail(function(response){
    console.log("fail")
    console.log(response)
  })
}

$(document).ready(function() {
  getId();

});
