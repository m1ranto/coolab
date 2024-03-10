import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [ "source", "flash" ]

  copy() {
    // copy to clipboard
    navigator.clipboard.writeText(this.sourceTarget.value)

    // show flash
    this.flashTarget.innerHTML = `
      <section class="card-darker flash shadow-lg" data-controller="flash">
        <h3>
          <i class="bi bi-check-circle-fill text-green-500 me-1"></i>
          Invite link copied to clipboard
        </h3>
      </section>
    `
  }
}