const filter = function() {
    $(document).ready( function() {
        console.log("Filterrr");
        $('input[type="checkbox"]').change(function() {
            console.log("checkbox "+this.id+" clicked");

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
