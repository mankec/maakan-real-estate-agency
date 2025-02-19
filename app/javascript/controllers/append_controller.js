import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [ "input" ]

  connect() {
  }

  appendOptionalInput() {
    const newInput = this.inputTarget.cloneNode(true)
    const icon = newInput.querySelector("i")

    newInput.dataset.controller ="remove"
    newInput.querySelectorAll("input").forEach(input => input.value = "")

    icon.classList.remove("bi-plus")
    icon.classList.add("bi-x")
    icon.dataset.action = "click->remove#removeElement"

    this.element.append(newInput)
  }
}
