// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
$(document).on('page:load ready', function() {
  $('#add-tag').submit(function(e) {
    e.preventDefault();
    var self = $(this)

    $.ajax({
      url: self.attr('href'),
      type: 'PATCH',
      dataType: 'script'
    })
  });

  //$(document).on('submit', '#new_pledge', function(e) {
  //  e.preventDefault();
  //  var self = $(this)
  //
  //  console.log(self.attr('action'));
  //  console.log(self.attr('method'));
  //  $.ajax({
  //    url: self.attr('action'),
  //    type: self.attr('method'),
  //    dataType: 'script',
  //    data: self.serialize(),
  //    success: function(data) {
  //      //self.hide();
  //    }
  //  })
  //});

  //$(document).on('submit', '.edit_pledge', function(e) {
  //  e.preventDefault();
  //  var self = $(this);
  //
  //  $.ajax({
  //    url: self.attr('action'),
  //    type: self.attr('method'),
  //    dataType: 'script',
  //    data: self.serialize(),
  //    success: function(data) {
  //        //self.hide();
  //
  //
  //        //console.log("Project fully funded")
  //
  //        //$("#pledge_amount").val('');
  //        //
  //        //$("#total-pledges").val(@project.funding_goal);
  //        //
  //        //$("#pledges-exists").hide();
  //
  //    }
  //  })
  //})
});
