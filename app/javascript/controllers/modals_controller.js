import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="modals"
export default class extends Controller {
  connect() {
  }

  close(event) {
    // Prevents the default action of the event from happening
    event.preventDefault();
    // Remove from parent
    const modal = document.querySelector('.app-modal');
    modal.innerHTML = '';

    // Remove the src attribute from the modal
    modal.removeAttribute('src');

    // Remove the modal
    modal.remove();
  }
}
