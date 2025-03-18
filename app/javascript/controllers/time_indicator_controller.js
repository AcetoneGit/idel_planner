import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["line"]

  connect() {
    this.updateTimeIndicator()
    this.interval = setInterval(() => this.updateTimeIndicator(), 60000)
    console.log("coucou")
  }

  disconnect() {
    if (this.interval) clearInterval(this.interval)
  }

  updateTimeIndicator() {
    const now = new Date()
    const hours = now.getHours()
    const minutes = now.getMinutes()

    if (hours >= 6 && hours < 20) {
      const minutesSince6h = (hours - 6) * 60 + minutes
      this.lineTarget.style.top = `calc(${minutesSince6h}px + 9.5rem)`
      this.lineTarget.style.display = "block"
    } else {
      this.lineTarget.style.display = "none"
    }
  }
}
