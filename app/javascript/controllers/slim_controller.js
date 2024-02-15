import { Controller } from "@hotwired/stimulus"
import SlimSelect from 'slim-select'

export default class extends Controller {
  connect() {
    new SlimSelect({
      select: this.element,
      settings: {
        placeholderText: 'Collaborator',
      }
    })
  }
}