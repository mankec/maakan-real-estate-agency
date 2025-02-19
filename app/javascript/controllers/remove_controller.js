import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = []

  connect() {
  }

  removeElement(event) {
    this.element.remove()
  }
}
