import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["radioButton"];

  connect() {
    this.radioButtonTargets.forEach((button) => {
      button.addEventListener("change", this.handleRadioChange.bind(this));
      button.addEventListener("focus", this.handleRadioFocus.bind(this));
      button.addEventListener("blur", this.handleRadioBlur.bind(this));
    });
  }

  handleRadioChange(event) {
    const selectedButton = event.target;
    const checkedClasses = selectedButton.dataset.checkedStyle.split(" ");
    const uncheckedClasses = selectedButton.dataset.uncheckedStyle.split(" ");
    const focusClasses = selectedButton.dataset.focusStyle.split(" ");

    this.radioButtonTargets.forEach((button) => {
      button.parentNode.classList.remove(...checkedClasses);
    });

    if (selectedButton.checked) {
      selectedButton.parentNode.classList.remove(...uncheckedClasses);
      selectedButton.parentNode.classList.add(...checkedClasses);
    }
  }

  handleRadioFocus(event) {
    event.target.parentNode.classList.add(...focusClasses);
  }

  handleRadioBlur(event) {
    event.target.parentNode.classList.remove(...focusClasses);
  }
}
