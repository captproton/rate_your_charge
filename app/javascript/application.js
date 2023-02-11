// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import "@hotwired/turbo-rails"
require("@rails/activestorage").start()
//require("trix")
//require("@rails/actiontext")
require("local-time").start()
require("@rails/ujs").start()

import './channels/**/*_channel.js'
import "./controllers"

// import * as bootstrap from "bootstrap"

// document.addEventListener("turbo:load", () => {
//   var tooltipTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="tooltip"]'))
//   var tooltipList = tooltipTriggerList.map(function (tooltipTriggerEl) {
//     return new bootstrap.Tooltip(tooltipTriggerEl)
//   })

//   var popoverTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="popover"]'))
//   var popoverList = popoverTriggerList.map(function (popoverTriggerEl) {
//     return new bootstrap.Popover(popoverTriggerEl)
//   })
// })


// window.initMap = () => {
//   console.log("map initialized");
// }
// @excid3's function (outdated per chatGPT)
// window.initMap = function(...args) {
//   const event = document.createEvent("Events")
//   event.initEvent("google-maps-callback", true, true)
//   event.args = args
//   window.dispatchEvent(event)
// }

// still works, but function below it has more modern syntax, per chatGPT
// window.initMap = () => {
//   const event = new Event("MapLoaded")
//   event.initEvent("map-loaded", true, true);
//   window.dispatchEvent(event)
// }

window.initMap = () => {
  console.log(`map initialized`)
  window.dispatchEvent(new Event("map-loaded"));
};
