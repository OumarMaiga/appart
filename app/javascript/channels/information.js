const info = function() {
    $(document).on('turbolinks:load', function() {
        console.log('Info');
        $('.info').fadeOut(5000);
    })
}

export { info }