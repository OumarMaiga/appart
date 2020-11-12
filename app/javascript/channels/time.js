const time = function(){
    $(document).on('turbolinks:load', function(){
        console.log('Time');

        setInterval(() => {
            let toDay = new Date();
            let date = toDay.getDate();
            let monthNum = toDay.getMonth();
            let monthArray = ["", "Jan", "Fev", "Mars", "Avrl", "Mai", "Juin", "Jull", "Août", "Sept", "Oct", "Nov", "Dec"];
            let month = monthArray[monthNum];

            let hour = toDay.getHours();
            let minute = toDay.getMinutes();

            let result = date+" "+month+" - "+hour+"<span id='common' style='visibility:visible'>:</span>"+minute;

            document.getElementById("time").innerHTML = result;



        }, 1000);

        const clignotant = function() {
            if(document.getElementById('common').style.visibility == 'visible'){
                document.getElementById('common').style.visibility = 'hidden';
            } else {
                document.getElementById('common').style.visibility = 'visible';
            }
        };

        setInterval(clignotant, 500);
    });
}

export { time };