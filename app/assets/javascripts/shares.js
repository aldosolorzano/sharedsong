$(document).ready(function(){
  $(".share").on('click',(event)=>{
    const {target} =event
    const container = $(target).attr('data-id')
    const containerSelector = $(`[id='${container}']`);
    const song = $(containerSelector).find('.song-name').html()
    const artist = $(containerSelector).find('.artist-name').html()

    $("#form_artist").val(artist)
    $("#form_song").val(song);
  })

})
