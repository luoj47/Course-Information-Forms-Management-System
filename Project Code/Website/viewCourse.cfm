<!--- Displays the course information. Can navigate to edit page and view previous versions of this
course.--->

<html>
	<head>
		<title>CIFM - Add Course</title>
		<link rel = "stylesheet" href= "layout.css">
	</head>

	<body>
		<h1>
			EVERETT
		</h1>
		<h2>
			COMMUNITY COLLEGE
		</h2>

		<div class = "navbar">
			<a href="index.cfm">Home</a>
			<a href="addCourse.cfm">Add Course</a>
			<a href="search.cfm">Search</a>
		</div>

		<!--- The date of the course from the previous page will be used here to grab the relevant data
		It will either be most recent from searchCourse, or whichever entry clicked on in viewPrevious --->

		<cfquery name="getCourseInfo" datasource= "cifm">

					SELECT t1.*
					FROM CourseInfoForms.dbo.courses t1
					WHERE t1.lastUpdated = (SELECT MAX(t2.lastUpdated)
                 		FROM CourseInfoForms.dbo.courses t2
						WHERE ((t2.coursePrefix = t1.coursePrefix)
								AND (t2.catalogNumber = t1.catalogNumber))
								AND (coursePrefix + ' ' + catalogNumber + ' '
								+ CONVERT(VARCHAR, lastUpdated, 121)) LIKE '%#form.toEdit#%')


		</cfquery>

		<cfoutput query = "getCourseInfo">

		<div class = "intro">
			<p>
				<i><font size = "16">#coursePrefix# #catalogNumber# - #courseName#, #effectiveQuarter#</font></i>
			</p>

			<table>

				<tr>
					<td><b>Institution<b></td>
					<td>#institution#</td>
					<td><b>Campus<b></td>
					<td>#campus#</td>
				</tr>
				<tr>
					<td><b>Academic Career</b></td>
					<td>#academicCareer#</td>
					<td><b>Academic Groups</b></td>
					<td>#academicGroups#</td>
				</tr>

				<tr>
					<td><b>Course Prefix</b></td>
					<td>#coursePrefix#</td>
					<td><b>Catalog Number</b></td>
					<td>#catalogNumber#</td>
					<td><b>Subject</b></td>
					<td>#subject#</td>
				</tr>

				<tr>
					<td><b>Effective Quarter</b></td>
					<td>#effectiveQuarter#</td>
				</tr>

				<tr>
					<td><b>Course Name</b></td>
					<td>#courseName#</td>
					<td><b>Grading Scheme</b></td>
					<td>#gradingScheme#</td>
					<td><b>Course Description</b></td>
					<td>#courseDesc#</td>
				</tr>

				<tr>
					<td><b>Course Fee</b></td>
					<td>#courseFee#</td>
				</tr>

				<tr>
					<td><b>Lecture? (1 for Yes, 0 for No)</b></td>
					<td>#componentsLecture#</td>
					<td><b>Lab? (1 for Yes, 0 for No)</b></td>
					<td>#componentsLab#</td>
				</tr>
				<tr>
					<td><b>Lecture Hours</b></td>
					<td>#componentHoursLecture#</td>
					<td><b>Lab Hours</b></td>
					<td>#componentHoursLab#</td>
					<td><b>Faculty Workload</b></td>
					<td>#facultyWorkload#</td>
				</tr>

				<tr>
					<td><b>Units</b></td>
					<td>#units#</td>
					<td><b>FA Progress Units</b></td>
					<td>#faUnits#</td>
				</tr>

				<tr>
					<td><b>Course Challenge? (1 for Yes, 0 for No)</b></td>
					<td>#courseChallenge#</td>
					<td><b>Repeat For Credit (1 for Yes, 0 for No)</b></td>
					<td>#repeatableCredit#</td>
					<td><b>CIP</b></td>
					<td>#CIP#</td>
				</tr>

				<tr>
					<td><b>Attributes</b></td>
					<td>#attributes#</td>
				</tr>

				<tr>
					<td><b>Enrollment Requirements</b></td>
					<td>#enrollReq#</td>
				</tr>
				<tr>
					<td><b>Course Topic</b></td>
					<td>#courseTopic#</td>
				</tr>

				<tr>
					<td><b>Student Learning Objectives</b></td>
					<td>#studentLrnObj#</td>
				</tr>
				<tr>
					<td><b>Core Learning Objectives</b></td>
					<td>#coreLrnObj#</td>
				</tr>
				<tr>
					<td><b>Program Specific Outcomes</b></td>
					<td>#prgrmSpecOutcomes#</td>
				</tr>
			</table>
		</div>



		<div class = "form">
			<cfform action = "editCourse.cfm" method = "post">


				<div class = "row">
					<div class = "prompt">
						Course To Be Edited<br>
						Click Submit to Edit
					</div>

					<div class = "inputarea">
						<cfselect name = "toEdit">
						<option value = "#coursePrefix# #catalogNumber# #courseName# #effectiveQuarter# #lastUpdated#">
							#coursePrefix# #catalogNumber# #courseName# #effectiveQuarter#
						</option>
						</cfselect>
					</div>
		    	</div>
				<div class = "row">
					<!--- submit button --->
					<input type="Submit" value="Submit">

				</div>
			</cfform>
		</div>

		<div class = "form">
			<cfform action = "viewPrevious.cfm" method = "post">


				<div class = "row">
					<div class = "prompt">
						Course to View Past Versions<br>
						Click Submit to Edit
					</div>

					<div class = "inputarea">
						<cfselect name = "toEdit">
						<option value = "#coursePrefix# #catalogNumber#">
							#coursePrefix# #catalogNumber# #courseName# #effectiveQuarter#
						</option>
						</cfselect>
					</div>
		    	</div>
				<div class = "row">
					<!--- submit button --->
					<input type="Submit" value="Submit">

				</div>
			</cfform>
		</div>

		</cfoutput>
		<div class = "footer">
			<p>Everett Community College</p>
		</div>
	</body>
</html>