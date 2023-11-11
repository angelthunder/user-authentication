import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="test"
export default class extends Controller {
  static targets = ["text"];
  static classes = ["myElement"];

  connect() {
    console.log("TestController: Connected!");
    console.log(
      "Classes: ",
      this.myElementClass,
      this.myElementClasses,
      this.hasMyElementClass,
    );
  }

  hello() {
    console.log("TestController: Button Clicked, Hello!");
    console.log("TestController: You typed: " + this.textTarget.value);
  }

  textTargetConnected() {
    console.log("TestController: @text property was connected...");
  }

  textTargetDisconnected() {
    console.log("TestController: @text property was disconnected...");
  }
}
