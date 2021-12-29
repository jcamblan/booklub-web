import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ['submit']

  add(event) {
    document
      .getElementById("inputBookGoogleId")
      .setAttribute('value', event.target.getAttribute('bookGoogleId'));
    document
      .getElementById("inputBookTitle")
      .setAttribute('value', event.target.getAttribute('bookTitle'));
    this.submitTarget.click()
  }


  connect() {
    this.submitTarget.hidden = true
  }
}