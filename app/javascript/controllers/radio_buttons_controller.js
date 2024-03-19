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
    console.log(selectedButton);

    this.radioButtonTargets.forEach((button) => {
      console.log(button.parentNode.classList);
      button.parentNode.classList.remove(
        "border-transparent",
        "bg-indigo-600",
        "text-white",
        "hover:bg-indigo-700",
        "ring-2",
        "ring-indigo-500",
        "ring-offset-2"
      );

      button.parentNode.classList.remove(
        "border-gray-200",
        "bg-white",
        "text-gray-900",
        "hover:bg-gray-50"
      );
    });

    if (selectedButton.checked) {
      selectedButton.parentNode.classList.remove(
        "border-gray-200",
        "bg-white",
        "text-gray-900",
        "hover:bg-gray-50"
      );
      selectedButton.parentNode.classList.add(
        "border-transparent",
        "bg-indigo-600",
        "text-white",
        "hover:bg-indigo-700",
        "ring-2",
        "ring-indigo-500",
        "ring-offset-2"
      );
    }
  }

  handleRadioFocus(event) {
    event.target.parentNode.classList.add(
      "ring-2",
      "ring-indigo-500",
      "ring-offset-2"
    );
  }

  handleRadioBlur(event) {
    event.target.parentNode.classList.remove(
      "ring-2",
      "ring-indigo-500",
      "ring-offset-2"
    );
  }
}
