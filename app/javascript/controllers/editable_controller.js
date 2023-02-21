import { Controller } from "@hotwired/stimulus"
import debounce from "lodash.debounce"
// Connects to data-controller="editable"
export default class extends Controller {
  connect() {
    console.log("Hello from editable controller!", this.element)
  }

  changed = debounce(() => {
    this.element.form.requestSubmit()
  }, 1000)  // 1.0 second
  
}
