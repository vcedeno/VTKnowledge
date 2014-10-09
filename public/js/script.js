//triggered when modal is about to be shown
		$('#deleteTopic').on('shown.bs.modal', function(e) {

 	
    //get data-id attribute of the clicked element

   var topicID = $(e.relatedTarget).attr('data-id');
	//alert(topicID);
    //populate the textbox
    $('label[for="alertTopic"]').text("Are you sure you want to delete the Topic \""+topicID+"\" ?");
    
		});