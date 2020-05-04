
const image = function() {

    $(document).on('turbolinks:load', function() {
        console.log('Image');
    $('#imageContainer img').each(function (index) {
        if ($(this).attr('onclick') != null) {
            if ($(this).attr('onclick').indexOf("runThis()") == -1) {       
                $(this).click(function () {
                    $(this).attr('onclick');
                    var src = $(this).attr("src");
                    ShowLargeImage(src);
                });
            }
        }
        else {       
            $(this).click(function () {                        
                var src = $(this).attr("src");
                ShowLargeImage(src);
            });
        }
    });

/*     $('body').on('click', '.modal-overlay', function () {
        $('.modal-overlay, .modal-img').remove();
        $('body').removeClass('noscroll');
    }); */

    function ShowLargeImage(imagePath) {
        $('.image_head img').attr('src', imagePath);
    }

/*     function ShowLargeImage(imagePath) {
        $('body').append('<div class="modal-overlay"><div class="modal-img"><img src="' + imagePath.replace("small","large") + '" /></div></div>').addClass('noscroll');
        $('.modal-img').animate({
            opacity: 1
        },1000);
    }
 */
});
};


export { image }