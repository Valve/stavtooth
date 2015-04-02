//= require jquery_ujs
$("#diagnosis-template").on("change", function(e){
  var desc = $(this).val();
  $("#patient_diagnosis, #visit_diagnosis").val(desc);
});
$("#print-patient").on("click", function(){
  window.print();
});
