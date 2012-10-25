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
  $('.datepicker').datepicker({format: 'yyyy-mm-dd'});

  $(document).on('click', 'a#link-toggle-completed', function(e){
    e.preventDefault();
    var url = $(this).attr('href');
    $.ajax({ url: url,
             dataType: 'html',
             type: 'get'
    }).done(function(data){
      if (data=='0'){
        $('#todo-table tr.completed').show();
        $('a.sort-link').each(function(){ this.href = this.href.replace(/hide=0/, "hide=1") });
        $('a#link-toggle-completed').html('Hide completed');
      }else{
        $('#todo-table tr.completed').hide();
        $('a.sort-link').each(function(){ this.href = this.href.replace(/hide=1/, "hide=0") });
        $('a#link-toggle-completed').html('Show all');
      }
    });
    return false;
  })

  $(document).on('click', 'a#link-reset-form', function(){
    $('#form-new-task')[0].reset();
    false;
  })

})