import { Controller } from "@hotwired/stimulus"
import debounce from "lodash.debounce"
// Connects to data-controller="location-search"

export default class extends Controller {
  connect() {
    console.log("Hello from super search controller!", this.element)
  }

  changed = debounce(() => {
    // console.log(this.element.value)
    this.element.form.requestSubmit()
  }, 1000)  // 1.0 second
  
}
