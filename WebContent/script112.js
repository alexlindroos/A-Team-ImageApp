$(document).ready(function(){

    $('button').click(function() {
	var comment = $('#commentfield').val();
    $('#commentfield').val("");
	$('#commentdiv').append('<p> Anon:' +comment+' </p>');

});
});