$(document).ready(function() {

  event.preventDefault();
  $.ajax({
    url: "http://localhost:3000",
    method: 'get',
    dataType: 'json'
  })
  .done(function(response){
    // debugger
    console.log('yay')
    // console.log(response.options.access_token)

  })
  .fail(function(response){
    console.log('fail')
  })

  $('h1').click(function(){

// initialize client with app credentials
    SC.initialize({
      client_id: ENV['client_id'],
      redirect_uri: 'http://localhost:9393/callback.html'
    });

// initiate auth popup
    SC.connect(function() {
      SC.get('/me', function(me) {
        alert('Hello, ' + me.username);
      });
    });
})
});


