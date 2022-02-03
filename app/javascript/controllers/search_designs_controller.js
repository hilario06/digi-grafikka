import { Controller } from "stimulus";

export default class extends Controller {
  static targets = ['searchForm', 'searchInput', 'list'];

  connect() {
    //console.log(this.searchFormTarget);
    //console.log(this.searchInputTarget);
    //console.log(this.listTarget);
  }
  update() {
    //console.log(this.searchInputTarget.value);
    //console.log(`${this.searchFormTarget.action}?query=${this.searchInputTarget.value}`);
    const url = `${this.searchFormTarget.action}?query=${this.searchInputTarget.value}`
    fetch(url, { headers: { 'Accept': 'text/plain' } })
      .then(response => response.text())
      .then((data) => {
        this.listTarget.outerHTML = data;
      })
  }
}
