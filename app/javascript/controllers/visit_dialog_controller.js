import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="visit-dialog"
export default class extends Controller {
  connect() {
    console.log("Hello, visit-dialog!", this.element)
  }
// 
  static targets = ["dialog"];

  openDialog() {
    this.dialogTarget.showModal();
  }

  closeDialog() {
    this.dialogTarget.close();
  }

  // Handle the successful form submission
  success(event) {
    // Extract the response from the Turbo Stream
    const [result] = event.detail.fetchResponse.turbo_stream;
    
    // Update the dialog with the response
    this.dialogTarget.innerHTML = result;
  }
}
