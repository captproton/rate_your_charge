import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="mapbox"
export default class extends Controller {
  connect() {
    console.log("Hello from mapbox!", this.element)
  }
}
