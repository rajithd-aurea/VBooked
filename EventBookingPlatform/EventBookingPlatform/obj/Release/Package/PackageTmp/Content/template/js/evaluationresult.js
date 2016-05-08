$(document).ready(function () {
	$('#resultContainer').hide();
	
	// Call to getListOfInstructors() function
	getListOfInstructors();
});

/* FUNCTIONS */
// Function to get list of instructors
function getListOfInstructors() {
	$.ajax({
		type: "GET",
		url: "GetListOfInstructors.php",
		dataType: "json",
		success: function (result) {
			$.each(result, function (index, value) {
				$('<option value=' + value.Teacher_Id + '>' + value.Teacher_Name + '</option>').appendTo('#drpTeacher');
			});
		},
		error: function (error) {
			console.log(error);
		}
	});
}
/* END */