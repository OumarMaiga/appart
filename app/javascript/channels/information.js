const info = function() {
    $(document).on('turbolinks:load', function() {
        console.log('Info');
        $('.info').fadeOut(8000);
    })
}

export { info }