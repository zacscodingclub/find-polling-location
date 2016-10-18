// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require bootstrap-sprockets
//= require_tree .

$(function() {
    initialize();
});

function initialize() {
    document.cookie = "lat_lng=;user_location=;";

    $('#user_input_location').keypress(function() {
        enableSubmit();
    });

    $('#user_gps_location').change(function() {
        getGeoLocation();
    });
}

function getGeoLocation() {
  $('#gps-message').show();
  navigator.geolocation.getCurrentPosition(setGeoCookie, errorCallback );
}

function setGeoCookie(position) {
  var cookie_val = position.coords.latitude + "|" + position.coords.longitude;
  document.cookie = "lat_lng=" + escape(cookie_val);
  enableSubmit();
}

function enableSubmit() {
    $('#submit').prop('disabled', false);
}

function errorCallback(error) {
    console.log(error);
}
