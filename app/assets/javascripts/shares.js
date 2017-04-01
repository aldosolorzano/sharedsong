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

 $('i').on('click',(event)=>{
   const {target} = event;
   const iconClass = $(target).attr('class');
   const playClass = 'glyphicon glyphicon-play';
   const pauseClass = 'glyphicon glyphicon-pause';
   const audio = $(target).next()

   if(iconClass == playClass) {
     $(target).toggleClass(playClass).addClass(pauseClass)
     console.log(audio)
     $(audio).trigger("play")
   } else {
     $(target).toggleClass(pauseClass).addClass(playClass)
     $(audio).trigger("pause")
   }
 })
})
