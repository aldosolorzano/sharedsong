$(document).ready(function(){
  let songs = new Bloodhound({
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
    const searchTerm =  $("#search").val()
    if(searchTerm == "") {
      event.preventDefault();
      alert('Can\'t be blank');
    }
  })
  $(".share").on('click',function(event){
    const {target} = event;
    const container = $(target).attr('data-id');
    const containerSelector = $(`[id='${container}']`);
    const song = $(containerSelector).find('.song-name').html();
    const artist = $(containerSelector).find('.artist-name').html();

    $("#form_artist").val(artist)
    $("#form_song").val(song);
  })

  $('.chosen-select').chosen({
     allow_single_deselect: true,
     no_results_text: 'No results matched',
     width: '200px'
 });

 $('i').on('click',function(event){
   const {target} = event;
   const iconClass = $(target).attr('class');
   const playClass = 'glyphicon glyphicon-play';
   const pauseClass = 'glyphicon glyphicon-pause';
   const audio = $(target).next()

   if(iconClass == playClass) {
     $(target).toggleClass(playClass).addClass(pauseClass)
     $(audio).trigger("play")
   } else {
     $(target).toggleClass(pauseClass).addClass(playClass)
     $(audio).trigger("pause")
   }
 });

 $('.requestFriendship').on('click', function(event){
   const {target} = event;
   $(target).attr('disabled', function(_, attr){ return !attr});
   $(target).html('Requested');
 })
})
