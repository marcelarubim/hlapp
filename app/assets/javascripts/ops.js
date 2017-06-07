$(document).on('turbolinks:load', function () {
  $(".ops.edit, .ops.new").ready(function () {
    $('#production-container').on('object-added', function (el) {
      const opId = document.querySelector('#op_id').dataset.target;
      const url = "/query/productions/op?op=" + opId;
      const collection = document.querySelectorAll('#production-container select[id^=op_productions_attributes_]');
      const target = collection[collection.length - 1];

      if (target == null) {
        return;
      }

      // const id = target.dataset.id;
      // const hidden = document.querySelector(`#object-production-${id} [type="hidden"][name$="[op_id]"]`);
      // hidden.value = opId;

      $.get(url, function (data) {
        $(target).html(data.map(function (production) {
            return '<option value="' + production.id + '">' + production.theme + '</option>';
        }).join(''));
      });
    });
  });
});
