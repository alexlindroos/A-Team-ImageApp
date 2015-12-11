$(document).ready(function(){
$('#img_first').click(function () {
$('#myMod').modal('show');
$('.modal-body').append('<p>image:'+$(this).attr('src')+'</p>');
});
$('#modErase').click(function () {
$('.modal-body p').remove();
});
});
//Like button
$(function () {
         $(".like").click(function () {
             var input = $(this).find('.qty1');
             input.val(parseInt(input.val())+ 1);
    
         });
  });
//Like v2
$(document).ready(function() {
    $('i.glyphicon-thumbs-up, i.glyphicon-thumbs-down').click(function(){
        var $this = $(this),
            c = $this.data('count');
        if (!c) c = 0;
        c++;
        $this.data('count',c);
        $('#'+this.id+'-bs3').html(c);
    });
    $(document).delegate('*[data-toggle="lightbox"]', 'click', function(event) {
        event.preventDefault();
        $(this).ekkoLightbox();
    });

}); 
