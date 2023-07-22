import { Controller } from "@hotwired/stimulus";
import $ from 'jquery';
import selectize from 'selectize';

export default class extends Controller {
  static targets = ["selectField", "placeIdField", "areaMainTextField", "areaSecondaryTextField"];

  connect() {
    const oldSelectizeControl = $(this.element).siblings('.selectize-control');
        if (oldSelectizeControl.length) {
            $(oldSelectizeControl[0]).selectize()[0].selectize.destroy();
        }
    this.selectize = $(this.selectFieldTarget).selectize({
      create: false,
      load: this.loadOptions.bind(this),
      onChange: this.selectOption.bind(this)
  });
  }

  disconnect() {
    if (this.selectize) {
      this.selectize[0].selectize.destroy();
    }
  }

  loadOptions(query, callback) {
     if (query.length >= 3) {
       fetch(`/property_ad_locations/area_autocomplete_options/?input=${encodeURIComponent(query)}`)
         .then(response => response.json())
         .then(json => {
          console.log(json)
          this.selectize[0].selectize.clearOptions();
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
         });
     }
  }

  selectOption(value) {

    this.selectFieldTarget.value = value

    const selectedOption = this.selectize[0].selectize.options[value];
    this.placeIdFieldTarget.value = value;
    this.areaMainTextFieldTarget.value = selectedOption.mainText;
    this.areaSecondaryTextFieldTarget.value = selectedOption.secondaryText;

    this.selectize[0].selectize.clearOptions();
  }

}
