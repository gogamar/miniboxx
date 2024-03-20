import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["quantity", "totalPrice"];

  updatePrice() {
    let newTotal = 0;
    this.quantityTargets.forEach((selectElement) => {
      const quantity = parseInt(selectElement.value);
      const price = parseFloat(selectElement.dataset.price);
      newTotal += quantity * price;
    });
    this.totalPriceTarget.textContent = `${newTotal.toFixed(2)}€`;
  }
}
