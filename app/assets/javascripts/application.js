//= require jquery
//= require jquery_ujs
//= require bootstrap-sprockets
//= require_tree .

$(function() {
  $("[data-add-fields]").click(function(e) {
    e.preventDefault();
    var new_id = new Date().getTime(),
        regexp = new RegExp(":fieldset_id", "g");
    $(this).closest("fieldset").append(
      $(this).data("add-fields")
        .replace(regexp, new_id)
        .replace(/^'|'$|\\n?/g, '')
    );
  });
  $(document).on("click", "[data-remove-fields]", function(e) {
    e.preventDefault();
    $(this).prev("input[type=hidden]").val("1");
    $(this).closest(".form-group").hide();
  });
});
