const filter = function() {
    $(document).on('turbolinks:load', function() {
        console.log('Filter');
        
        $('input[type="checkbox"]').change(function() {

            $.ajax({
                url: '/filter',
                data: $('.filter').serialize(),
                type: 'GET',
                success: (data) => {
                    $('.appart_container').empty();
                    $('.appart_container').append(data)
                }
            });
        })
        

    });

};

export { filter };
