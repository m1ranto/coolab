import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="menu"
export default class extends Controller {
  static targets = [ "navigation" ]

  toggle() {
    this.navigationTarget.style.display = this.navigationTarget.style.display === "block" ? "none" : "block"
  }

  close() {
    this.navigationTarget.style.display = "none"
  }
}
