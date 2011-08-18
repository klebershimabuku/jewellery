// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults
function reload() {
	location.reload();
}


function remove_fields(link) {
  $(link).prev("input[type=hidden]").val("1");
  $(link).closest("tr").hide();
  $("#recalc").click();
}

function add_fields(link, association, content) {
  var new_id = new Date().getTime();
  var regexp = new RegExp("new_" + association, "g");


  // check for the existence 
  if ($("tr.individual_part").length) {
     $('tr.individual_part:last').after(content.replace(regexp, new_id));
  }
  else {
     $("#parts_table").find("tr.attributes").after(content.replace(regexp, new_id));
  }

	  $(".autocomplete").each(function() {
			random_id = Math.floor(Math.random()*1000);
			$(this).attr("id", "autocomplete_" + random_id);
			$(this).prev().attr("data-id-element", "#autocomplete_" + random_id);
	});

}

function load_part_price_select(id, value) {
	// alert(id);
	// alert(value);
	$('#' + id ).live('change',function() {
	    $.ajax({
		  url: '/parts/' + value + '/price',
		  type: 'get',
		  context: this,
		  dataType: 'script',
		  success: function(responseData) {
		    // alert('success: ' + responseData);	
		    $(this).parent().nextAll("td.price:first").html(Number(responseData).toFixed(2) ).effect("highlight", {}, 3000);
		  }
		});	
	});
};


jQuery(function($) {
	$(document).ready(function() {
		
		/********************************************************
		* Load the price for each part included on a item 
		*/

		setTimeout(function() {
		  $("#recalc").trigger('click');	
		
		  $(".autocomplete").each(function() {
			new_id = Math.floor(Math.random()*1000);
			$(this).attr("id", "autocomplete_" + new_id);
			$(this).prev().attr("data-id-element", "#autocomplete_" + new_id);
		});
		
		},10);
		
		$("input[data-id-element^=#autocomplete]").live("blur", function(ev) {
			ev.preventDefault();
			value = $(this).nextAll("input").val();
			if (value == '') {
				$(this).focus();
			}
		    $.ajax({
			  url: '/parts/' + value + '/price',
			  type: 'get',
			  context: this,
			  dataType: 'script',
			  success: function(responseData) {
			    // alert('success: ' + responseData);	
			    $(this).parent().nextAll("td.price:first").html(Number(responseData).toFixed(2) ).effect("highlight", {}, 3000);
			  }
			});	
			
		});
		
		
		// Fills up automatically the amount when user clicks out the quantity
		// for each attached part item considering the unit price 
		// and quantity.
		// Used for the create a new item screen
		
		$("input.quantity").live("blur", function() {
			var $this = $(this);
			
			quantity = parseInt($this.val());
			
			price = $this.parents("tr").find("td.price").text();
			price = parseFloat(price);
			
			amount = quantity * price;
			amount = Number(amount).toFixed(2);
			
			$this.parent().next("td.amount").html(amount).effect("highlight", {}, 4000);
			$("#recalc").trigger("click");
		});
		
		/***********************************************
		*
		* Update Total value if the Labour cost changes
		*
		************************************************/
		$("input.labour_cost").live("blur",function() {
			$("#recalc").click();
		});
		
		
		/***********************************************
		*
		* Make a recalculation of values
		*
		****/
		$("#recalc").click(function() {
			var subtotal = 0;
			var total = 0;
			
			$('input[data-id-element^=#autocomplete]').each(function () {
				
				// setting values to variables (unit_price, quantity and visible)
				unit_price = $(this).parents("tr").find("td.price").text();
				
				
				quantity = $(this).parents("tr").find("input.quantity").val();
				
				visible = $(this).closest("tr").is(":visible");
				// do some math ONLY if the part is visible to the parts list.
				if (visible) {
					amount = unit_price * quantity;
					amount = Number(amount).toFixed(2);					
				}
				else {
					amount = 0;
				}
				$(this).parent().siblings("td.amount").html(amount);
				subtotal = parseFloat(subtotal) + parseFloat(amount);
			});

			labour_cost = $("#item_essentials").find("input[type=text]:last").val(); // get the value of the user typed labour cost
			labout_cost = Number(labour_cost).toFixed(2);
			
			
			total = parseFloat(subtotal) + parseFloat(labour_cost); // do some math
			total = Number(total).toFixed(2); // format the total value to display only 2 decimals digits
			

			$('.labour_cost').html(labour_cost);
			
			$('#item_price').val(total); // Set the final price to the textfield.
		})
		
		
		
		
		
	});
});