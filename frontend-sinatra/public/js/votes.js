$(document).ready(function(){
  $('.upskip').on("click", function(event){
    event.preventDefault();
    // debugger
    var path = window.location.pathname
    $.ajax({
      url: 'http://localhost:3000' + path +'/upskip',
      type: "GET"
    })
    .done({

    })
  })

  $('.downskip').on("click", function(event){
    event.preventDefault();
    // debugger
    var path = window.location.pathname
    $.ajax({
      url: 'http://localhost:3000' + path +'/downskip',
      type: "GET"
    })
    .done({

    })
  })

  $('.upreplay').on("click", function(event){
    event.preventDefault();
    // debugger
    var path = window.location.pathname
    $.ajax({
      url: 'http://localhost:3000' + path +'/upreplay',
      type: "GET"
    })
    .done({

    })
  })

  $('.downreplay').on("click", function(event){
    event.preventDefault();
    // debugger
    var path = window.location.pathname
    $.ajax({
      url: 'http://localhost:3000' + path +'/downreplay',
      type: "GET"
    })
    .done({

    })
  })
})
