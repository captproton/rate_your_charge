import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="drawers"
export default class extends Controller {
  connect() {
  }

  close(event) {
    // Prevents the default action of the event from happening
    event.preventDefault();
    // Remove from parent
    const drawer = document.querySelector('.app-drawer');
    drawer.innerHTML = '';

    // Remove the src attribute from the drawer
    drawer.removeAttribute('src');

    // Remove the drawer
    drawer.remove();
  }
}
