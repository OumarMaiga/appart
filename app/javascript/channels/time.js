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

            let result = date+" "+month+" - "+hour+":"+minute;

            document.getElementById("time").innerText = result;

        }, 1000);
    });
}

export { time };