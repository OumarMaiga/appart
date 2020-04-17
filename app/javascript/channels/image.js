
const image = function() {

    $(document).ready(function() {
    console.log('im');
    $('#imageContainer img').each(function (index) {
        console.log('1+');
        if ($(this).attr('onclick') != null) {
        console.log('yes');    
            console.log('a');
            if ($(this).attr('onclick').indexOf("runThis()") == -1) {       
                console.log('g');
                $(this).click(function () {
                    console.log('e');
                    $(this).attr('onclick');
                    var src = $(this).attr("src");
                    ShowLargeImage(src);
                });
            }
        }
        else {       
            console.log('no');
            $(this).click(function () {                        
                var src = $(this).attr("src");
                ShowLargeImage(src);
            });
        }
    });

    $('body').on('click', '.modal-overlay', function () {
        $('.modal-overlay, .modal-img').remove();
        $('body').removeClass('noscroll');
    });

    function ShowLargeImage(imagePath) {
        $('body').append('<div class="modal-overlay"></div><div class="modal-img"><img src="' + imagePath.replace("small","large") + '" /></div>').addClass('noscroll');
        $('.modal-img').animate({
            opacity: 1
        },1000);
    }

});
};


export { image }