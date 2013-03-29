//= require active_admin/base

// FRAME BUSTER
// Security: forbid the admin screens from being loaded into a frameset

if (top.frames.length !== 0) {
  top.location = self.document.location;
}

// ACTIVE ADMIN JAVASCRIPT
// Javascript in this file will be run on each ActiveAdmin page view
// ActiveAdmin comes with a copy of jQuery already included
// Add dependencies to the top of this file in the mainifest

$(function() {

});
