import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="test"
export default class extends Controller {
  connect() {
    console.log("TestController: Connected!");
  }

  hello() {
    console.log("TestController: Button Clicked, Hello!");
  }
}
