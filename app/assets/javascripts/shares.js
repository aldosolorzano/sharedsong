$(document).ready(function(){
  var songs = new Bloodhound({
    datumTokenizer: Bloodhound.tokenizers.whitespace,
    queryTokenizer: Bloodhound.tokenizers.whitespace,
    remote: {
      url: '/songs/autocomplete?query=%QUERY',
      wildcard: '%QUERY'
    }
  });
  $("#search").typeahead(null,{
    name: 'my-dataset',
    source: songs
  })
  $("#search-form").on('submit',function(event){
    var searchTerm =  $("#search").val()
    if(searchTerm == "") {
      event.preventDefault()
      alert('Can\'t be blank')
    }
  })
  $(".share").on('click',function(event){
    var {target} =event
    var container = $(target).attr('data-id')
    var containerSelector = $(`[id='${container}']`);
    var song = $(containerSelector).find('.song-name').html()
    var artist = $(containerSelector).find('.artist-name').html()

    $("#form_artist").val(artist)
    $("#form_song").val(song);
  })

  $('.chosen-select').chosen({
     allow_single_deselect: true,
     no_results_text: 'No results matched',
     width: '200px'
 });

 $('i').on('click',(event)=>{
   var {target} = event;
   var iconClass = $(target).attr('class');
   var playClass = 'glyphicon glyphicon-play';
   var pauseClass = 'glyphicon glyphicon-pause';
   var audio = $(target).next()

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
