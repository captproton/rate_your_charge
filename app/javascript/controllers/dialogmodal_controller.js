import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="dialogmodal"
export default class extends Controller {
  connect() {
    console.log("Hello from dialogmodal controller!", this.element)

  }
}

import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["dialogmodal"]

  alert(event) {
    event.preventDefault();
  }

  open(event) {
    event.preventDefault();

    this.modalTarget.showModal();
  }

  close(event) {
    event.preventDefault();

    this.modalTarget.close();
  }
}