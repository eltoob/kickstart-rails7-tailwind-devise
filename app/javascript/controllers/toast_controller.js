import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect(event) {
  }
  
  hideToast(event) {
    event.preventDefault();
    const toastElement = event.target.closest(".toast")
    if (toastElement) {
      toastElement.classList.add("hidden");
    }
  }
}