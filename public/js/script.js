
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
		
		
