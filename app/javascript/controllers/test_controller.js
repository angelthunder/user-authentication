import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="test"
export default class extends Controller {
  static targets = ["text"];

  connect() {
    console.log("TestController: Connected!");
  }

  hello() {
    console.log("TestController: Button Clicked, Hello!");
    console.log("TestController: You typed: " + this.textTarget.value);
  }
}
