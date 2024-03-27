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

    this.radioButtonTargets.forEach((button) => {
      const label = button.parentElement;
      label.classList.remove(...checkedClasses);
      label.classList.add(...uncheckedClasses);
      const svgElement = label.querySelector("svg");
      if (svgElement) {
        svgElement.classList.add("hidden");
      }
    });

    if (selectedButton.checked) {
      const label = selectedButton.parentElement;
      label.classList.remove(...uncheckedClasses);
      label.classList.add(...checkedClasses);
      const svgElement = label.querySelector("svg");
      if (svgElement) {
        svgElement.classList.remove("hidden");
      }
    }
  }

  handleRadioFocus(event) {
    const selectedButton = event.target;
    const focusClasses = selectedButton.dataset.focusStyle.split(" ");
    event.target.parentNode.classList.add(...focusClasses);
  }

  handleRadioBlur(event) {
    const selectedButton = event.target;
    const focusClasses = selectedButton.dataset.focusStyle.split(" ");
    event.target.parentNode.classList.remove(...focusClasses);
  }
}
