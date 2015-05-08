//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require jquery.turbolinks
//= require_tree .



<script src="http://connect.soundcloud.com/sdk.js"></script>
<script>
// initialize client with app credentials
SC.initialize({
  client_id: 'YOUR_CLIENT_ID',
  redirect_uri: 'REDIRECT_URL'
});

// initiate auth popup
SC.connect(function() {
  SC.get('/me', function(me) {
    alert('Hello, ' + me.username);
  });
});
</script>