//import { confirm } from "@rails/ujs";
import { Controller } from "stimulus";

export default class extends Controller {
  //static targets = ['infos', 'form', 'card'];

  connect() {
   // this.infosTarget.classList.add('d-none');
    //this.formTarget.classList.remove('d-none');
    console.log(this.element);
  }

  /*update(event) {
    event.preventDefault();
    const url = this.formTarget.action
    fetch(url, {
      method: 'PATCH',
      headers: { 'Accept': 'text/plain' },
      body: new FormData(this.formTarget)
    })
      .then(response => response.text())
      .then((data) => {
        this.cardTarget.outerHTML = data;
      })
  }*/
  delete(event){
    event.preventDefault();
  }
}
