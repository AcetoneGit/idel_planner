import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static values = { startOfWeek: String };
  static targets = ["dateCell", "dayCircle"];

  connect() {
    this.updateWeekDates();
    console.log("DynamicDaybarController connected");
  }

  updateWeekDates() {
    const startOfWeek = new Date(this.startOfWeekValue);
    const dayNames = ["D", "L", "M", "M", "J", "V", "S"]; // Noms des jours abrégés

    this.dateCellTargets.forEach((cell, index) => {
      const currentDate = new Date(startOfWeek);
      currentDate.setDate(startOfWeek.getDate() + index);

      cell.textContent = currentDate.getDate(); // Affiche uniquement la date

      if (this.isToday(currentDate)) {
        cell.classList.add("today");
      }
    });

    this.dayCircleTargets.forEach((circle, index) => {
      circle.textContent = dayNames[index]; // Affiche uniquement la lettre du jour

      const currentDate = new Date(this.startOfWeekValue);
      currentDate.setDate(new Date(this.startOfWeekValue).getDate() + index);

      if (this.isToday(currentDate)) {
        circle.parentNode.classList.add("today");
      }
    });
  }

  isToday(date) {
    const today = new Date();
    return (
      date.getDate() === today.getDate() &&
      date.getMonth() === today.getMonth() &&
      date.getFullYear() === today.getFullYear()
    );
  }
}
