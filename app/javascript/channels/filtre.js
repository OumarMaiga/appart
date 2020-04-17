const filtre = function() {
    $(document).ready(function() {
        var slider = $("#the_slider").slider({
            range: true,
            min: 200,
            max: 500,
            values: [250, 450],
            slide: function(event, ui) {
                $("#locations_bas").val(ui.values[0]);
                $("#locations_haut").val(ui.values[1]);
            }
        });
        $("#locations_bas").val(slider.slider("values")[0]);
        $("#locations_haut").val(slider.slider("values")[1]);
    });
};
export { filtre };