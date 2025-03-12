import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  makeACall(event) {
    alert("You made a call!")
  }
}
