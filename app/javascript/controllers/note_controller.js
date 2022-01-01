import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static values = { value: Number }
  static targets = ["star"]

  connect() {
    this.valueValue = document.getElementById("noteInputValue").getAttribute('initialValue')
  }

  select(event) {
    this.valueValue = event.target.getAttribute('value')
  }

  valueValueChanged() {
    this.starTargets.forEach(star => {
      if (this.valueValue >= star.getAttribute('value')) {
        star.setAttribute('fill', '#FFC41F')
      } else {
        star.setAttribute('fill', '#EEEEEE')
      }
    });
    document.getElementById("noteInputValue").setAttribute('value', this.valueValue)
  }
}