$(document).ready(function(){
  $("#share").on('click',(event)=>{
    const artist = $("#artist").html()
    const song = $('#song').html()
    $("#form_artist").val(artist)
    $("#form_song").val(song)
  })

})
