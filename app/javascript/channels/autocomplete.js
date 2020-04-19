import 'js-autocomplete/auto-complete.css';
import autocomplete from 'js-autocomplete';


const autocompleteSearch = function() {
    $(document).ready(function() {

        const adresses = JSON.parse(document.getElementById('search-data').dataset.adresses)
        const searchInput = document.getElementById('query');
      
        if (adresses && searchInput) {

            new autocomplete({
            selector: searchInput,
            minChars: 1,
            source: function(term, suggest){
                term = term.toLowerCase();
                const choices = adresses;
                const matches = [];
                for (let i = 0; i < choices.length; i++)
                    if (~choices[i].toLowerCase().indexOf(term)) matches.push(choices[i]);
                suggest(matches);
            },
            });
        }
    });
};

export { autocompleteSearch };