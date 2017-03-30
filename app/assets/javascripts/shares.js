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

  $('.chosen-select').chosen({
     allow_single_deselect: true,
     no_results_text: 'No results matched',
     width: '200px'
 });

})
