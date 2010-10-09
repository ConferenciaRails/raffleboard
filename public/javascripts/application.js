$(function() {

    $('#drawing li').solari('DevinRio');

    $('#pick_1').click(function() {
        $.get('/sortear', function(data) {
            $('#drawing li').solari(data);
        });
    });
});

