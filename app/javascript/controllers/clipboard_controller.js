import {Controller} from "@hotwired/stimulus"
import ClipboardController from "./clipboard_controller";

application.register("clipboard", ClipboardController)

export default class extends Controller {
    static targets = ["email"]

    copy() {
        navigator.clipboard.writeText(this.emailTarget.textContent);
        document.getElementsByClassName("notice")[0].innerText = 'copy email: ' + this.emailTarget.textContent
    }
}