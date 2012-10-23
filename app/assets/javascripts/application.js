// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require twitter/bootstrap
//= require_tree .
//= require bootstrap-datepicker

$(document).ready(function(){
  // Initializes datepicker elements
  $('.datepicker').datepicker();

  $(document).on('click', 'a#link-toggle-completed', function(){
    if ($('a#link-toggle-completed').html()=='Hide completed'){
      $('#todo-table tr.completed').hide();
      $('#hide_completed').val('1');
      $('a.sort-link').each(function(){ this.href = this.href.replace(/hide_completed=0/, "hide_completed=1") });
      $('a#link-toggle-completed').html('Show all');
    }else{
      $('#todo-table tr.completed').show();
      $('#hide_completed').val('0');
      $('a.sort-link').each(function(){ this.href = this.href.replace(/hide_completed=1/, "hide_completed=0") });
      $('a#link-toggle-completed').html('Hide completed');
    }
    false;
  })

  $(document).on('click', 'a#link-reset-form', function(){
    $('#form-new-task')[0].reset();
    false;
  })

})