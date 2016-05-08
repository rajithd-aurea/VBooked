$(document).ready(function () {
  //getSubjectEvaluationResult(teacherid, subjectid, semesterid, schyear).show();

	
	$('#resultContainer').hide();
	$('#dlgEvalResult').hide();
	
	var teacherid = parseInt($('#teacherid').val());
	var subjectid = 0;
	var semesterid = 0;
	var schyear = "";
	
	getInstructorSubjects(teacherid);
	
	$('#drpSubjects').change(function () {
		subjectid = parseInt($('#drpSubjects').val());
	});
	
	$('#drpSem').change(function () {
		semesterid = parseInt($('#drpSem').val());
	});
	
	$('#drpSY').change(function () {
		schyear = $('#drpSY').val();
	});
	
	$('#btnShowResult').click(function () {
		getSubjectEvaluationResult(teacherid, subjectid, semesterid, schyear);
	});
	
	$('#lnkViewDetils').click(function () {
		$('#dlgEvalResult').show();
		
		getEvaluationAveragePerCategory(teacherid, subjectid, semesterid, schyear);
	});
});

function getInstructorSubjects(teacherId) {
	$.ajax({
		type: "GET",
		url: "GetInstructorSubjects.php",
		data: { teacherId: teacherId },
		dataType: "json",
		success: function (result) {
			$.each(result, function (index, value) {
				$('<option value="' + value.Subject_Id + '">' + value.Subject_Name + '</option>').appendTo('#drpSubjects');
			});
		},
		error: function (error) {
			console.log(error);
		}
	});
}

function getSubjectEvaluationResult(teacher_id, subject_id, semester_id, school_year) {
	$('#resultContainer').show();
	
	$.ajax({
		type: "GET",
		url: "GetTeachersEvaluationResult.php",
		data: { teacherId: teacher_id, subjectId: subject_id, semesterId: semester_id, schoolYear: school_year },
		dataType: "json",
		success: function (result) {
			$('#txtscore').text(result[0].Eval_Score);
			$('#txtremarks').text(result[0].Remarks);
		},
		error: function (error) {
			console.log(error);
		}
	});
}

function getEvaluationAveragePerCategory(facultyid, subjectid, semesterid, schyear) {
	$.ajax({
		type: "GET",
		url: "GetEvaluationAveragePerCategory.php",
		data: { facultyid: facultyid, subjectid: subjectid, semesterid: semesterid, schyear: schyear },
		dataType: "json",
		success: function (result) {
			var header = $('table#avgTable thead tr');
			
			$.each(result, function (index, value) {
				$('<th>' + value.Category + '</th>').appendTo(header);
			});
			
			var body = $('table#avgTable tbody tr');
			$.each(result, function (index, value) {
				$('<td>' + value.Average + '</td>').appendTo(body);
			});
		},
		error: function (error) {
			console.log(error);
		}
	});
}