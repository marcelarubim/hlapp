// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require rails-ujs
//= require tether
//= require popper
//= require bootstrap
//= require turbolinks
//= require jquery-readyselector
//= require_tree .

$(document).on('turbolinks:load', function () {
  $('form').on('click', '#remove-new-object', function(e) {
    e.preventDefault();

    const id = e.target.dataset.id;
    const className = e.target.dataset.type;
    const el = document.querySelector(`#object-${className}-${id}`);
    el.remove();
  });

  $(function(){
    $(".table").on("click", "tr[role=\"button\"]", function (e) {
      ok_to_propagate = ! $(e.target).hasClass('object_delete');
      if (ok_to_propagate) {
        window.location = $(this).data("href")
      }

      // if (e.target == this) {
      //   window.location = $(this).data("href");
      // }
    });
  });
});



