import { Controller } from "@hotwired/stimulus"
import { useClickOutside } from 'stimulus-use'


export default class extends Controller {
  static targets = ['modalWrapper', 'modalContent', 'button']

  connect() {
    useClickOutside(this, { element: this.modalContentTarget })
  }

  clickOutside(event) {
    if (event.srcElement != this.buttonTarget) {
      this.modalWrapperTarget.classList.add('hidden')
    }
  }

  open() {
    this.modalWrapperTarget.classList.remove('hidden')
  }
}