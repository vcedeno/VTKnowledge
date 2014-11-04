/*Our JS file*/
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

    // Reentered password must match password
    $('#reenterpass').on('input', function() {
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

    
    // VT email checking
    $('#email').on('input', function() {
        var input=$(this);
        re = /^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@vt.edu/;
        var is_email=re.test(input.val());
        if (is_email){
            input.removeClass("invalid").addClass("valid");
        } else {
            input.removeClass("valid").addClass("invalid");
        }
    });


    
    // Form validation after button for registration has been clicked
    $("#submit_button").click(function(event){
        var isInvalidPw = $('#pass').hasClass("invalid");
        var isReenterPwDiff = $('#reenterpass').hasClass("invalid");
        var isVTEmail = $('#email').hasClass("invalid");

        if (isInvalidPw) {
            event.preventDefault();
            alert("Password must be a valid one: at least one number, one lowercase and one uppercase letter, and at least eight characters. Please enter a new password.");
        } else if (isReenterPwDiff) {
            event.preventDefault();
            alert("Password does not match the confirm password.");
        } else if (isVTEmail){
            event.preventDefault();
            alert("Enter a valid VT email address.");
        }
    });
    

    
    //triggered when modal is about to be shown (my #detailsTopic modal)
    $('#detailsTopic').on('shown.bs.modal', function(e) {
    //get data attributes of the clicked element 
    //populate the textbox
    $('label[for="detTopicID"]').text($(e.relatedTarget).attr('data-id'));
    $('label[for="detTopicName"]').text($(e.relatedTarget).attr('data-name'));
    $('label[for="detTopicDesc"]').text($(e.relatedTarget).attr('data-desc'));
    $('label[for="detTopicDate"]').text($(e.relatedTarget).attr('data-date'));
		});
		
		
	//triggered when modal is about to be shown (my #deleteTopic modal)
	$('#deleteTopic').on('shown.bs.modal', function(e) {
    //get data-id attribute of the clicked element 
    var topicID = $(e.relatedTarget).attr('data-id');
    var topicName = $(e.relatedTarget).attr('data-name');
    $('#myid').val(topicID);
    //show warning message before delete specifying the topic ID
    $('label[for="alertTopic"]').text("Are you sure you want to delete the Topic \""+topicName+"\" with ID \""+topicID+"\"?");
		});
	
 	$('#updatingQuestion').on('show.bs.modal', function(e) {
    //get data-id attribute of the clicked element 
    alert("he");
    var qid = $(e.relatedTarget).attr('data-idq');
    var qt = $(e.relatedTarget).attr('data-q');
    
    $('#qid').val(qid);
    $('#q').val(qt);
	});

	
});
