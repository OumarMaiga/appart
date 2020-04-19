import 'flatpickr/dist/flatpickr.css';
import flatpickr from 'flatpickr';


  const searchToggleDateInputs = function() {

    $(document).ready(function() {

      const startDateInput = document.getElementById('debut');
      const endDateInput = document.getElementById('fin');

      if (startDateInput && endDateInput) {
          
        flatpickr(startDateInput, {
          minDate: 'today',
          dateFormat: 'd-m-Y',
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
          });
      }

    });
  };


  export { searchToggleDateInputs }
