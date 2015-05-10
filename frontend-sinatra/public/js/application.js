$(document).ready(function() {

  $('.playlist-create').on('submit', function(event){
    event.preventDefault()
    var poo = "http://localhost:3000" + window.location.pathname
    $.ajax({
      url: poo,
      method: 'post',
      dataType: 'json',
      data: $(this).serialize()
    })
    .done(function(response){
    console.log("yes")

    var car = $('.testes').last().clone()
    var bar = $(car).html("<a href=/users/"+ response.user_id+ "/playlists/" +response.id +">Name: " + response.name + ", Genre: " + response.genre+ "</a>")

    $('.testes').last().append(bar)
    })

  })

  $('.playlist-index').ready(function(){

    var poo = "http://localhost:3000" + window.location.pathname
    $.ajax({
      url: poo,
      method: "get",
      dataType: 'json',
      // data: $(this).serialize()
    })
    .done(function(response){

      $('h1').text( response.user.user_name + "'s Playlist ")

      for (var i = 0; i < response.data.length; i++) {
      var car = $('.testes').last().clone();
      var bar = $(car).html("<a href=/users/"+ response.data[i].user_id+ "/playlists/" +response.data[i].id +">Name: " + response.data[i].name + ", Genre: " + response.data[i].genre+ "</a>")
      $('.testes').last().append(bar)
    }
    })
        //AJAXROUTE
        // $('.something').on("click", function(event){
              // $.ajax({
              //   url:
              //   method:
              //   data:
              // })
        // })
  })


  // $('#new-user').on('submit', function(event){
  //   event.preventDefault();
  //   $.ajax({
  //     url: $(this).attr('action'),
  //     method: 'POST',
  //     data: $(this).serialize()
  //   }).done(function(response){

  //   })
  // })
  //AJAX DISABLED

  $('.playlist_create').on("submit", function(event){
        event.preventDefault();
        debugger

    })



  $('.search_bar').on("submit", function(event){
    $('.playlist').text("Playlist:")
    event.preventDefault();
    path = $(this).attr('action')
    $.ajax({
      // url: "http://localhost:3000/users/36/playlists/1/songs",
      url: path,
      method: 'get',
      // data: $(this).serialize(),
      dataType: 'json'
    }).done(function(response){
      debugger
      for(var i=0; i<response.length; i++){
      $('.playlist').append( "<p class='songs'><a href=" + response[i].id + ">" +  response[i].title + "</a></p>")

      } // for loop

    $('.songs a').on("click", function(event){
      event.preventDefault();
      var song = $(this)
      var track = song.attr('href')
      var track_name = song.text();
        $.ajax({
          // url: "http://localhost:3000/",
          url: $(this).parent().parent().parent().find('.search_bar').attr('action'),
          method: "POST",
          dataType: 'json',
          data: {track_id: track, title: track_name }
        }).done(function(response) {
      debugger
      console.log('yay')

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







