$(document).ready(function(){
    
    // Password must be a valid one: at least one number, one lowercase and 
    // one uppercase letter, and at least eight characters.
    $('#pass').on('change', function() {
        var input=$(this);
        var re = /(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}/;
        var is_pwd=re.test(input.val());
        if (is_pwd){
            input.removeClass("invalid").addClass("valid");
        } else {
            input.removeClass("valid").addClass("invalid");
        }
    });

    // Reentered password must match password
    $('#reenterpass').on('change', function() {
        var input=$(this);
        var enteredPass = $('#pass').val();

        var re = /(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}/;
        var is_pwd=re.test(input.val());

        if ((input.val() != enteredPass) || !is_pwd){
            input.removeClass("valid").addClass("invalid");
        } else {
            input.removeClass("invalid").addClass("valid");
        }
    });
    
    
    // Form validation after button for registration has been clicked
    $("#submit_button").click(function(event){
        var isInvalidPw = $('#pass').hasClass("invalid");
        var isReenterPwDiff = $('#reenterpass').hasClass("invalid");

        if (isInvalidPw) {
            event.preventDefault();
            alert("Password must be a valid one: at least one number, one lowercase and one uppercase letter, and at least eight characters. Please enter a new password.");
        } else if (isReenterPwDiff) {
            event.preventDefault();
            alert("Password does not match the confirm password.");
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
