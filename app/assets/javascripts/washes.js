(function(App) {
  document.addEventListener("turbolinks:load", function() {
    if (document.querySelector('#new-wash-form')) {

      document.querySelector('[name="wash[vehicle_id]"]').addEventListener('change', function() {
        var selectedVehicleType = this.options[this.selectedIndex].getAttribute('data-vehicle-type');

        $('.section-vehicle-type').each(function() {
          $(this).attr('data-show', 'false');
        });
        
        $('.section-vehicle-type.show-' + selectedVehicleType).each(function() {
          $(this).attr('data-show', true);
        });

      });

    }
  });
}(App = window.App || {}));
