import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "email", "phone" ]

  validateEmail(event) {
    let email = event.target.value
    let emailRegex = /\S+@\S+\.\S+/
    if (!emailRegex.test(email)) {
      event.target.classList.add("border", "border-red-500")
      let error = document.createElement("div")
      error.classList.add("text-red-500", "text-sm", "mt-1")
      error.textContent = "Please enter a valid email address."
      event.target.parentNode.insertBefore(error, event.target.nextSibling)
    } else {
      event.target.classList.remove("border", "border-red-500")
      let error = event.target.parentNode.querySelector(".text-red-500")
      if (error) {
        error.remove()
      }
    }
  }

  validatePhone(event) {
    let phone = event.target.value.replace(/\D/g, "")
    let phoneRegex = /^(\d{3})(\d{3})(\d{4})$/
    if (!phoneRegex.test(phone)) {
      event.target.value = phone.replace(/(\d{3})(\d{0,3})/, "$1-$2")
      event.target.classList.add("border", "border-red-500")
      let error = document.createElement("div")
      error.classList.add("text-red-500", "text-sm", "mt-1")
      error.textContent = "Please enter a valid phone number."
      event.target.parentNode.insertBefore(error, event.target.nextSibling)
    } else {
      event.target.value = phone.replace(/(\d{3})(\d{3})(\d{4})/, "$1-$2-$3")
      event.target.classList.remove("border", "border-red-500")
      let error = event.target.parentNode.querySelector(".text-red-500")
      if (error) {
        error.remove()
      }
    }
  }
}