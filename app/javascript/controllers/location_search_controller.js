// app/javascript/controllers/location_search_controller.js
import { Controller } from "stimulus"

export default class extends Controller {
  static targets = ["input", "results"]
  static values = {
    url: String
  }

  connect() {
    this.inputTarget.addEventListener("input", this.search.bind(this))
    this.resultsTarget.addEventListener("click", this.select.bind(this))
  }

  search() {
    fetch(this.urlValue + "?term=" + this.inputTarget.value)
      .then(response => response.json())
      .then(data => {
        this.renderResults(data)
      })
  }

  renderResults(data) {
    this.resultsTarget.innerHTML = ""
    data.forEach(result => {
      const option = document.createElement("option")
      option.value = result.city + ", " + result.state
      this.resultsTarget.appendChild(option)
    })
  }

  select(event) {
    const target = event.target
    if (target.tagName === "OPTION") {
      const searchValue = target.value
      const frame = document.getElementById("search-results-frame")
      frame.setAttribute("src", `/locations?search=${searchValue}`)
    }
  }
}
