$(document).ready(function() {
  $('#new-user').on('submit', function(){
    // debugger
    $.ajax({
      url: $(this).attr('action'),
      method: 'POST',
      data: $(this).serialize()
    })

  })

});


