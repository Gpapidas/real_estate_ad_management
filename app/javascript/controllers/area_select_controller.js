import { Controller } from "@hotwired/stimulus";
import $ from 'jquery';
import selectize from 'selectize';

export default class extends Controller {
  static targets = ["selectField", "placeIdField", "areaMainTextField", "areaSecondaryTextField"];

  connect() {
    this.selectize = $(this.selectFieldTarget).selectize({
      create: false,
      load: this.loadOptions.bind(this),
      onChange: this.selectOption.bind(this),
      score: this.customScore.bind(this)
  });
  }

  disconnect() {
    if (this.selectize) {
      this.selectize[0].selectize.destroy();
    }
  }

  loadOptions(query, callback) {
    // Makes an HTTP get request to our backend. 
    // Expects a list of available options for our selectize.
    // Loads the results as options.
    if (query.length >= 3) {
      fetch(`/property_ad_locations/area_autocomplete_options/?input=${encodeURIComponent(query)}`)
        .then(response => response.json())
        .then(json => {
        this.selectize[0].selectize.clearOptions();
        if (json.error) {
          throw new Error(json.error);
        }
        json.forEach(area => {
          this.selectize[0].selectize.addOption(
            { 
              value: area.placeId, 
              text: area.mainText + ', ' + area.secondaryText, 
              mainText: area.mainText, 
              secondaryText: area.secondaryText 
            }
          );
        });
        this.selectize[0].selectize.refreshOptions(false);
        callback(json)
        })
        .catch(error => {
        console.error("Error fetching options:", error);
        alert(error);
      });
    }
  }

  customScore(search) {
    return (item) => {
      const score = this.calculateScore(item, search);
      return score;
    };
  }

  calculateScore(item, search) {
    // Custom score calculation
    // Here, you can define how the options should be ranked based on the search query
    // This is needed because the API can sometimes return data for a request
    // that do not contain the keyword given.
    // Example: A request with the keyword 'Athens' has 'Pireas' as an available
    // option
    const searchText = search.toLowerCase();
    const itemText = item.text.toLowerCase();

    if (itemText.startsWith(searchText)) {
      return 3;
    } else if (itemText.includes(searchText)) {
      return 2;
    }
    return 1;
  }

  selectOption(value) {
    // Assign values to hidden fields for the form submission
    this.selectFieldTarget.value = value

    const selectedOption = this.selectize[0].selectize.options[value];
    this.placeIdFieldTarget.value = value;
    if (selectedOption) {
      this.areaMainTextFieldTarget.value = selectedOption.mainText;
      this.areaSecondaryTextFieldTarget.value = selectedOption.secondaryText;
    }

    this.selectize[0].selectize.clearOptions();
  }

}
