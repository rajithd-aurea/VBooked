$(document).ready(function () {
	$('#popupCategory').hide();
	$('#popupQuestion').hide();
	
	// Adding category
	$('#btnAddCategory').click(function () {
		
		// Category dialog
		$('#popupCategory').dialog({
			autoOpen: true,
			resizable: false,
			width: 400,
			height: 200,
			title: "Add Category",
			buttons: [
				{
					text: "Add",
					click: function() {
						// Get category name
						var cat_name = $('#txtCat').val();
						
						// Check if category name is null
						if (cat_name == null || cat_name == "") {
							alert("Category cannot be null.");
						}
						else {
							// Call to addCategory() function
							addCategory(cat_name);						
						}
					}
				},
				{
					text: "Cancel",
					click: function() {
						$(this).dialog( "close" );
					}
				}
			]
		});
	});
	
	// Adding question
	$('#btnAddQuestion').click(function () {
		getCategories();
		
		// Question dialog
		$('#popupQuestion').dialog({
			autoOpen: true,
			resizable: false,
			width: 400,
			height:400,
			title: "Add Question",
			buttons: [
				{
					text: "Add",
					click: function() {
						// Get question category and question
						var ques_cat = $('#selCategory option:selected').text();
						var ques_question = $('#txtQuestion').val();
						
						// Check if question is null
						if (ques_question == null || ques_question == "") {
							alert("Must provide question.");
						}
						else {
							// Call to addQuestion() function
							addQuestion(ques_cat, ques_question);
						}
					}
				},
				{
					text: "Cancel",
					click: function() {
						$(this).dialog( "close" );
					}
				}
			]
		});
	});
});

/* FUNCTIONS */
// Function for adding category
function addCategory(category) {
	var status = 0;
	var message = "";
	
	$.ajax({
		type: "POST",
		url: "AddCategory.php",
		data: { category: category },
		dataType: "json",
		success: function (result) {
			if (result[0].status == 1) {
				alert(result[0].message);
				
				window.location.href = "http://localhost/capstone/questions.php";
			}
		},
		error: function (error) {
			console.log(error);
		}
	});
}

// Function for adding question
function addQuestion(category, question) {
	var status = 0;
	var message = "";
	
	$.ajax({
		type: "POST",
		url: "AddQuestion.php",
		data: { category: category, question: question },
		dataType: "json",
		success: function (result) {
			if (result[0].status == 1) {
				alert(result[0].message);
				
				window.location.href = "http://localhost/capstone/questions.php";
			}
		},
		error: function (error) {
			console.log(error);
		}
	});
}

// Function for getting categories
function getCategories() {
	$('#selCategory').empty();
	$('#selCategory').append('<option value="Select">' + 'Select...' + '</option>');
	
	$.ajax({
		type: "GET",
		url: "GetCategories.php",
		dataType: "json",
		success: function (result) {
			$.each(result, function (index, value) {
				$('<option value=' + value.Category_Name + '>' + value.Category_Name + '</option>').appendTo('#selCategory');
			});
		},
		error: function (error) {
			console.log(error);
		}
	});
}
/* END */