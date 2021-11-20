// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"

// jQuery Keywords declared
window.jQuery = $;
window.$ = $;

// MaterializeCSS
import 'materialize-css/dist/js/materialize';
// Application Stylesheet (scss)
import "../stylesheets/application";


// Import JS
import "./initialize";
import "./smooth_scroll";

Rails.start()
Turbolinks.start()
ActiveStorage.start()