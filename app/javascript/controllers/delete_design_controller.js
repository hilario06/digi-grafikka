//import { confirm } from "@rails/ujs";
import { Controller } from "stimulus";

export default class extends Controller {
  //static targets = ['infos', 'form', 'card'];

  connect() {
   // this.infosTarget.classList.add('d-none');
    //this.formTarget.classList.remove('d-none');
    console.log(this.element);
  }

  delete(event){
    // event.preventDefault();
    console.log(window.scrollY);
    const currentY = window.scrollY;
    window.scrollTo(0, currentY);
  }
}
