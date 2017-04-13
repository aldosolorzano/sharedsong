$(document).ready(function(){
  $('.glyphicon-thumbs-down').on('click',function(event){
  event.preventDefault();
  const {target} = event
  console.log('red')
  $(target).toggleClass('red')
  })
})
