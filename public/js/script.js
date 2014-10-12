$(document).ready(function(){
    
    // Password must be a valid one: at least one number, one lowercase and 
    // one uppercase letter, and at least eight characters.
    $('#pass').on('input', function() {
        var input=$(this);
        var re = /(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}/;
        var is_pwd=re.test(input.val());
        if (is_pwd){
            input.removeClass("invalid").addClass("valid");
        } else {
            input.removeClass("valid").addClass("invalid");
        }
    });

    // Reentered password must match previous password
    $('#reenterpass').on('input', function() {
        var input=$(this);
        var enteredPass = $('#pass').val();
        if (input.val() == enteredPass){
            input.removeClass("invalid").addClass("valid");
        } else {
            input.removeClass("valid").addClass("invalid");
        }
    });
    
    
    // Form validation after Submit button has been clicked
    $("#submit_button input").click(function(event){
        var form_data=$("#sign_up_form").serializeArray();
        var error_free=true;
        for (var input in form_data){
            var element=$("#sign_up_form_"+form_data[input]['name']);
            var valid=element.hasClass("valid");
            var error_element=$("span", element.parent());
            if (!valid){
                error_element.removeClass("error").addClass("error_show"); 
                error_free=false;
            } else {
                error_element.removeClass("error_show").addClass("error");
            }
        }
        if (!error_free) {
            event.preventDefault();
        } else {
            alert('All fields have been entered successfully and the form will be submitted. Thank you!');
        }
    });
    
    
    
    	$('#detailsTopic').on('shown.bs.modal', function(e) {

 	
    //get data-id attribute of the clicked element
   //var topicID = $(e.relatedTarget).attr('data-id');
    //populate the textbox
    $('label[for="detTopicID"]').text($(e.relatedTarget).attr('data-id'));
    $('label[for="detTopicName"]').text($(e.relatedTarget).attr('data-name'));
    $('label[for="detTopicDesc"]').text($(e.relatedTarget).attr('data-desc'));
    $('label[for="detTopicDate"]').text($(e.relatedTarget).attr('data-date'));
		});
		
		
//triggered when modal is about to be shown
		$('#deleteTopic').on('shown.bs.modal', function(e) {

 	
    //get data-id attribute of the clicked element

   var topicID = $(e.relatedTarget).attr('data-id');
	//alert(topicID);
    //populate the textbox
    $('label[for="alertTopic"]').text("Are you sure you want to delete the Topic \""+topicID+"\" ?");
    
		});
       
});

		
		
