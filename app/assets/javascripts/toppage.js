$(function(){
  $('.pickupContainer__itemBox__lists >li').each(function(index,element){
    var w = $(element).width() +10
    $('.pickupContainer__itemBox__lists').append('<li style="height:0; width:'+ w +'px; margin:0;"></li>')
  })
})