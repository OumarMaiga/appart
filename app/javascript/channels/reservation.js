import 'flatpickr/dist/flatpickr.css';
import flatpickr from 'flatpickr';


  const toggleDateInputs = function() {
console.log("Reservation");
  window.onload = function () {

    const startDateInput = document.getElementById('reservation_debut');
    const endDateInput = document.getElementById('reservation_fin');

    console.log(startDateInput);

    if (startDateInput && endDateInput) {

      const unvailableDates = JSON.parse(document.querySelector('.modal-body').dataset.indisponible)
        
      flatpickr(startDateInput, {
        minDate: 'today',
        dateFormat: 'd-m-Y',
        disable: unvailableDates,
        onChange: function(selectedDates, selectedDate) {
          if (selectedDate === '') {
            endDateInput.disabled = true;
          }
          let minDate = selectedDates[0];
          minDate.setDate(minDate.getDate() + 1);
          endDateCalendar.set('minDate', minDate);
          endDateInput.disabled = false;
        }
      });
      const endDateCalendar =
        flatpickr(endDateInput, {
          dateFormat: 'd-m-Y',
          disable: unvailableDates,
        });
    }

  }
  };


  export { toggleDateInputs }
