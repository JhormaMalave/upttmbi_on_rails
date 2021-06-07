// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"

Rails.start()
Turbolinks.start()
ActiveStorage.start()


// Argon style
import "@fortawesome/fontawesome-free/js/all";
import "jquery/dist/jquery.slim";
import "bootstrap/dist/js/bootstrap";
import "popper.js/dist/popper"
import "bootstrap/dist/js/bootstrap.bundle";
import "js-cookie/src/js.cookie";
import "jquery.scrollbar/jquery.scrollbar";
import "jquery-scroll-lock/jquery-scrollLock"
import "./argon";

// Argon components
import "./components/init/navbar"
import "./components/init/scroll-to"
import "./components/init/tooltip"
import "./components/vendor/scrollbar"