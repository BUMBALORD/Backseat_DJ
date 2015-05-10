$(document).ready(function() {
  $('#new-user').on('submit', function(){
    $.ajax({
      url: $(this).attr('action'),
      method: 'POST',
      data: $(this).serialize()
    })
  })



  $('.search_bar').on("submit", function(event){
    debugger
    $('.playlist').text("Playlist:")
    event.preventDefault();
    $.ajax({
      url: "http://localhost:3000/playlists/new",
      method: 'get',
      data: $(this).serialize(),
      dataType: 'json'
    }).done(function(response){
      for(var i=0; i<response.length; i++){
      // response.title
      // $('a').parent().empty()
      // $('.kevinxu').append( "<p><a href=" + response[i].stream_url + ">" +  response[i].title + "</a></p>")
    $('.playlist').append( "<p class='songs'><a href=" + response[i].id + ">" +  response[i].title + "</a></p>")
    } // for loop
    $('.songs a').on("click", function(event){
      event.preventDefault();
      var song = $(this)
      var track = song.attr('href')
      var track_name = song.text();
        $.ajax({
          url: "http://localhost:3000/playlists",
          method: "POST",
          dataType: 'json',
          data: {track_id: track, title: track_name }
        }).done(function(response) {

          $('.current').append("<p>" + response.title + "</p>")
          // debugger
        })
      })
  }) // .done

    $('.play_songs').on("click", function(event){
        event.preventDefault();
    })

    // $('.songs').on("click", function(event){
      // console.log($(this).find('a').attr('href'))
    //   event.preventDefault();
    // })


  })  // search bar

    // $('.playlist_create').on("submit", function(event){
    //       event.preventDefault();
    //       debugger
    //       var name = $(this).find('input').attr('name')
    //       // var play_name = playlist.text()

    //       $.ajax({
    //         url: $(this).attr('action'),
    //         method:"POST",
    //         data: $(this).serialize(),
    //         dataType:"json"
    //       }).done(function(response){
    //         debugger
    //         console.log("yeah")
    //       })
    // })




});  // document







