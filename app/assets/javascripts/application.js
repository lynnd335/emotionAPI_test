// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .



// "use strict";

// (function(){
	
//   console.log('script loaded.');

//   $('.pure-button').click(function(e){
//   	e.preventDefault();
//   	console.log('click noticed');

//   	$.ajax({
// 			type: "GET",
// 			url: "http://api.openweathermap.org/data/2.5/weather?q="+city+"&units=imperial&appid=44db6a862fba0b067b1930da0d769e98",
// 			// data: { q: "Milwaukee,US", units: "units=imperial", appid: "44db6a862fba0b067b1930da0d769e98"},
// 			success: function(data){
// 				$('#forecast').text("The weather today in "+city+" is "+data.main.temp + " degrees Farenheit")
// 				$('.date').text("Today: " + moment().format('MMMM Do YYYY, h:mm:ss a'));
// 			}
// 		})
//   	$.ajax({
// 			type: "GET",
// 			url: "http://api.openweathermap.org/data/2.5/forecast/daily?q="+city+"&units=imperial&mode=json&cnt=5&appid=44db6a862fba0b067b1930da0d769e98",
// 			// data: { q: "Milwaukee,US", units: "units=imperial", appid: "44db6a862fba0b067b1930da0d769e98"},
// 			success: function(data){
				
// 				data.list.forEach(function(day) { 
// 				 	date = day.dt;
// 					date = moment.unix(date).format('ll');
// 					$('<center><div id="five-day"></div></center>').appendTo('body').text(date + ": "+day.temp.day + " degrees")
// 					// $('body').append( "The weather today in "+city+" is "+data.main.temp + " degrees Farenheit" );
// 					// $('.date').text(moment().format('MMMM Do YYYY, h:mm:ss a'));
// 			     })
// 			  }
// 			})
  
//   	})


// })();