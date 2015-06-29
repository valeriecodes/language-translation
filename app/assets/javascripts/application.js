// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require bootstrap/dist/js/bootstrap
//= require turbolinks
//= require react
//= require react_ujs
//= require components
//= require_tree .

$(function() {
		  if ($("#articles").length > 0) {
          //FIXME - Need to fix this later by Isuri
		      //setTimeout(updateArticles, 10000);
		  }
});

function updateArticles (data) {
	  if ($(".article").length > 0) {
		        var article_id = $(".article:first").attr("data-id");
		        var after = $(".article:first").attr("data-time");
	                var len = $(".article").length
	  } else {
		        var after = "0";
	  }
          $.getScript('/articles.js?article_id=' + article_id + "&after=" + after + "&len=" + len ); 
          setTimeout(updateArticles, 10000);
}


