//= require lib/jquery
//= require_self

define('main', ['jquery'], function($) {

  "use strict";

  function requireAndInvokeModule(path) {
    require([path], function(invocation) {
      invocation();
    });
  }

  function applicationBootstrap () {

    // Require additional modules here by detecting
    // page elements or browser features

  }

  // Runs on DOMReady
  applicationBootstrap();

});
