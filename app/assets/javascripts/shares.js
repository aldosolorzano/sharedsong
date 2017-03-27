$(document).ready(function(){
  $("#share").on('click',(event)=>{
    const artist = $("#artist").html()
    const song = $('#song_title').html()
    console.log(song);
    $("#form_artist").val(artist)
    console.log($("#form_song").val(song));
  })

})
