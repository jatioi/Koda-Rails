import {Controller} from "@hotwired/stimulus"

export default class extends Controller {
    connect() {
        // this.element.textContent = "Hello World!"
    }

    greet() {
        const element = this.nameTarget
        const name = element.value
        console.log(`Hello, ${name}!`)
    }
}
