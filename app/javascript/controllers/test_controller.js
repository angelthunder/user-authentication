import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="test"
export default class extends Controller {
  static targets = ["text"];
  static classes = ["myElement"];
  static values = {
    name: String,
    age: {
      type: Number,
      default: 27,
    },
  };

  connect() {
    console.log("TestController: Connected!");
    console.log(
      "Classes: ",
      this.myElementClass,
      this.myElementClasses,
      this.hasMyElementClass,
    );
    console.log("Values: ", this.nameValue, this.ageValue);
    this.nameValue = "Boris The Animal";
  }

  nameValueChanged(current, previous) {
    console.log("Name > Current:", current);
    console.log("Name > Previous:", previous);
  }

  hello() {
    console.log("TestController: Button Clicked, Hello!");
    console.log("TestController: You typed: " + this.textTarget.value);
    this.nameValue = this.textTarget.value;
  }

  textTargetConnected() {
    console.log("TestController: @text property was connected...");
  }

  textTargetDisconnected() {
    console.log("TestController: @text property was disconnected...");
  }
}
