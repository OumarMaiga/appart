const filter = function() {
    $(document).ready( function() {
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
