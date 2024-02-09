import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  up() {
    this.element.click()
  }

  down() {
    this.element.click()
  }
}