import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["overlay", "overlayFilter", "dateCell"]; // Ajout de la cible "dateCell"
  static values = {
    previousView: { type: String, default: "day" },
    startOfWeek: String // Déclare la valeur startOfWeek
  };

  connect() {
    console.log("Calendar controller connected");
    console.log("Start of week value:", this.startOfWeekValue);

    // Appel de la méthode pour mettre à jour les dates
    this.updateWeekDates();
  }

  updateWeekDates() {
    if (!this.startOfWeekValue) {
      console.error("startOfWeekValue is undefined");
      return;
    }

    const startOfWeek = new Date(this.startOfWeekValue); // Convertit la valeur en objet Date
    const dayNames = ["L", "M", "M", "J", "V", "S", "D"]; // Correspond à Appointment::DAY_NAMES

    // Met à jour chaque cellule de date
    this.dateCellTargets.forEach((cell, index) => {
      const currentDate = new Date(startOfWeek);
      currentDate.setDate(startOfWeek.getDate() + index); // Ajoute les jours

      // Met à jour le contenu des cellules
      cell.innerHTML = `
        <span class="day-name">${dayNames[index]}</span>
        <span class="date">${currentDate.getDate()}</span>
      `;

      // Ajoute une classe "today" si c'est aujourd'hui
      if (this.isToday(currentDate)) {
        cell.classList.add("today");
      } else {
        cell.classList.remove("today");
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

  open() {
    this.overlayTarget.classList.add("active");
    this.overlayFilterTarget.classList.add("active");
  }

  close() {
    this.overlayTarget.classList.remove("active");
    this.overlayFilterTarget.classList.add("hidden");

    setTimeout(() => {
      this.overlayFilterTarget.classList.remove("active", "hidden");
    }, 200);
  }

  toggleMonthView(event) {
    event.preventDefault();
    const params = new URLSearchParams(window.location.search);
    const currentDisplay = params.get("display") || "day";

    if (currentDisplay === "month") {
      params.set("display", this.previousViewValue);
    } else {
      this.previousViewValue = currentDisplay;
      params.set("display", "month");
    }

    if (params.has("jd")) {
      const jd = params.get("jd");
      params.set("jd", jd);
    }

    window.location.href = window.location.pathname + "?" + params.toString();
  }
}
