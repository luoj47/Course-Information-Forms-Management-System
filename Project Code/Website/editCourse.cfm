<!--- This page display a form that allows users to edit course information. The form uses
CF's built in required and error checking. The form's fields are pre-populated with
the selected course's information' --->
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

		<div class = "intro">
			<p>
				<font size = "16">Edit Course</font>
			</p>
			<p>
				A field may look like Academic Career (current: xxx). Current signifies the current value in the database.<br>
				If you do not wish to change that value, select the same value from the drop down list / radio button<br>
				A 1 signfies YES, a 0 signifies NO.
			</p>
		</div>

		<div class = "form">
			<cfform action = "insertCourse.cfm" method = "post">
			<cfquery name="getCourseInfo" datasource= "cifm">
					SELECT * FROM CourseInfoForms.dbo.courses
					WHERE (coursePrefix + ' ' + catalogNumber
					+ ' ' + courseName + ' ' + effectiveQuarter + ' ' + CONVERT(VARCHAR, lastUpdated, 121))
					LIKE '%#form.toEdit#%'
			</cfquery>

				<cfoutput query = "getCourseInfo">
				<div class = "row">
					<div class = "prompt">
						Institution
					</div>

					<div class = "inputarea">
						<cfinput type = "text" name = "institution" value = "#institution#" required = "true"
									message = "Please enter the Institution the course belongs to.">
					</div>
		    	</div>

				<div class = "row">
					<div class = "prompt">
						Campus
					</div>

					<div class = "inputarea">
						<cfinput type = "text" name = "campus" value = "#campus#" required = "true"
								message = "Please enter the Campus the course belongs to.">
					</div>
		    	</div>

				<cfquery name="distinctAC" datasource= "cifm">
					SELECT DISTINCT academicCareer
					FROM CourseInfoForms.dbo.courses
				</cfquery>

				<div class = "row">
					<div class = "prompt">
						Academic Career<br>
						(current: #academicCareer#)
					</div>

					<div class = "inputarea">
						<cfselect name = "academicCareer"
							query = "distinctAC"
							value = "academicCareer"
							display = "academicCareer"
							required = "Yes"
							multiple = "No"
							size = "1">
						</cfselect>
					</div>
		    	</div>

				<cfquery name="distinctAG" datasource= "cifm">
					SELECT DISTINCT academicGroups
					FROM CourseInfoForms.dbo.courses
				</cfquery>

				<div class = "row">
					<div class = "prompt">
						Academic Groups<br>
						(current: #academicGroups#)
					</div>
					<div class = "inputarea">
						<cfselect name = "academicGroups"
							query = "distinctAG"
							value = "academicGroups"
							display = "academicGroups"
							required = "Yes"
							multiple = "No"
							size = "1">
						</cfselect>
					</div>
		    	</div>

				<cfquery name="distinctAU" datasource= "cifm">
					SELECT DISTINCT adminUnit
					FROM CourseInfoForms.dbo.courses
				</cfquery>
				<div class = "row">
					<div class = "prompt">
						Admin Unit<br>
						(current: #adminUnit#)
					</div>

					<div class = "inputarea">
						<cfselect name = "adminUnit"
							query = "distinctAU"
							value = "adminUnit"
							display = "adminUnit"
							required = "Yes"
							multiple = "No"
							size = "1">
						</cfselect>
					</div>
		    	</div>

				<cfquery name="distinctAO" datasource= "cifm">
					SELECT DISTINCT academicOrg
					FROM CourseInfoForms.dbo.courses
				</cfquery>
				<div class = "row">
					<div class = "prompt">
						Academic Organizations<br>
						(current: #academicOrg#)
					</div>

					<div class = "inputarea">
						<cfselect name = "academicOrg"
							query = "distinctAO"
							value = "academicOrg"
							display = "academicOrg"
							required = "Yes"
							multiple = "No"
							size = "1">
						</cfselect>
					</div>
		    	</div>

				<cfquery name="distinctEQ" datasource= "cifm">
					SELECT DISTINCT effectiveQuarter
					FROM CourseInfoForms.dbo.courses
				</cfquery>
				<div class = "row">
					<div class = "prompt">
						Effective Quarter<br>
						(current: #effectiveQuarter#)
					</div>

					<div class = "inputarea">
						<cfselect name = "effectiveQuarter"
							query = "distinctEQ"
							value = "effectiveQuarter"
							display = "effectiveQuarter"
							required = "Yes"
							multiple = "No"
							size = "1">
						</cfselect>
					</div>
		    	</div>

				<cfquery name="distinctS" datasource= "cifm">
					SELECT DISTINCT subject
					FROM CourseInfoForms.dbo.courses
				</cfquery>
				<div class = "row">
					<div class = "prompt">
						Subject<br>
						(current: #subject#)
					</div>

					<div class = "inputarea">
						<cfselect name = "subject"
							query = "distinctS"
							value = "subject"
							display = "subject"
							required = "Yes"
							multiple = "No"
							size = "1">
						</cfselect>
					</div>
		    	</div>

				<cfquery name="distinctCP" datasource= "cifm">
					SELECT DISTINCT coursePrefix
					FROM CourseInfoForms.dbo.courses
				</cfquery>
				<div class = "row">
					<div class = "prompt">
						Course Prefix<br>
						(current: #coursePrefix#)
					</div>

					<div class = "inputarea">
						<cfselect name = "coursePrefix"
							query = "distinctCP"
							value = "coursePrefix"
							display = "coursePrefix"
							required = "Yes"
							multiple = "No"
							size = "1">
						</cfselect>
					</div>
		    	</div>

		    	<div class = "row">
					<div class = "prompt">
						Catalog Number
					</div>

					<div class = "inputarea">
						<cfinput type="number" name="catalogNumber" value = "#catalogNumber#" required="true"
										message = "Please enter the Course Catalog Number.">
					</div>
		    	</div>

		    	<div class = "row">
					<div class = "prompt">
						Course Name
					</div>

					<div class = "inputarea">
						<cfinput type="text" name="courseName" value = "#courseName#" required="true"
									message = "Please enter the Course Name.">
					</div>
		    	</div>

		    	<div class = "row">
					<div class = "prompt">
						Course Description
					</div>

					<div class = "inputarea">
						<textarea name = "courseDesc" style = "height:200px"
						required>#courseDesc#</textarea>
					</div>
				</div>

		    	<div class = "row">
					<div class = "prompt">
						Grading Scheme<br>
						(current: #gradingScheme#)
					</div>

					<div class = "inputarea">
						<cfinput type="radio" name="gradingScheme" value="Decimal" checked>Decimal
						<br>
						<cfinput type="radio" name="gradingScheme" value="Pass/Fail">Pass/Fail
					</div>
		    	</div>

		    	<div class = "row">
					<div class = "prompt">
						Components - Lecture?<br>
						(current: #componentsLecture#)
					</div>

					<div class = "inputarea">
						<cfinput type="radio" name="componentsLecture" value=1 checked>Yes
						<br>
						<cfinput type="radio" name="componentsLecture" value=0>No
					</div>
		    	</div>

		    	<div class = "row">
					<div class = "prompt">
						Components - Lab?<br>
						(current: #componentsLab#)
					</div>

					<div class = "inputarea">
						<cfinput type="radio" name="componentsLab" value=1 checked>Yes
						<br>
						<cfinput type="radio" name="componentsLab" value=0>No
					</div>
		    	</div>

		    	<div class = "row">
					<div class = "prompt">
						Component Hours
					</div>

					<div class = "inputarea">
						Lecture: <cfinput type="number" name="componentHoursLecture" value = "#componentHoursLecture#" required ="true"
									message = "Please enter the number of lab hours required by this course (0 if none)">
									<br>
								 	Lab: <cfinput type="number" name="componentHoursLab" value = "#componentHoursLab#" required="true"
								 	message = "Please enter the number of lab hours required by this course (0 if none)">
					</div>
		    	</div>

		    	<div class = "row">
					<div class = "prompt">
						Units<br>
						(current: #Units#)
					</div>

					<div class = "inputarea">
						<cfinput type="number" name="units" value = "#units#" required="true"
								message = "Please enter the Units for this course">
					</div>
		    	</div>

		    	<div class = "row">
					<div class = "prompt">
						FA Progress Units<br>
						(current: #faUnits#)
					</div>

					<div class = "inputarea">
						<cfinput type="number" name="faUnits" value = "#faUnits#" required="true"
											message = "Please enter the FA Progress Units for this course">
					</div>
		    	</div>

		    	<div class = "row">
					<div class = "prompt">
						Course Challenge<br>
						(current: #courseChallenge#)
					</div>

					<div class = "inputarea">
						<cfinput type="radio" name="courseChallenge" value=1 checked>Yes
						<br>
						<cfinput type="radio" name="courseChallenge" value=0>No
					</div>
		    	</div>

		    	<div class = "row">
					<div class = "prompt">
						Repeatable for Credit<br>
						(current: #repeatableCredit#)
					</div>

					<div class = "inputarea">
						<cfinput type="radio" name="repeatableCredit" value=1 checked>Yes
						<br>
						<cfinput type="radio" name="repeatableCredit" value=0>No
					</div>
		    	</div>

		    	<div class = "row">
					<div class = "prompt">
						CIP
					</div>

					<div class = "inputarea">
						<cfinput type="float" name="CIP" value = "#CIP#"required="true" validate="float"
							message = "Please enter a valid CIP for thise course">
					</div>
		    	</div>


		    	<div class = "row">
					<div class = "prompt">
						Attributes<br>
						(current: #attributes#)
		      		</div>

		      		<div class = "inputarea">
		        		<cfselect name = "attributes">
			          		<option value = "1">1</option>
			          		<option value = "2">2</option>
			          		<option value = "3">3</option>
			          		<option value = "4">4</option>
			          		<option value = "5">5</option>
		        		</cfselect>
		      		</div>
		    	</div>

				<div class = "row">
					<div class = "prompt">
						Enrollment Requirements
					</div>

					<div class = "inputarea">
						<textarea name = "enrollReq" style = "height:200px"
						required>#enrollReq#</textarea>
					</div>
				</div>

				<div class = "row">
					<div class = "prompt">
						Course Topic
					</div>

					<div class = "inputarea">
						<textarea name = "courseTopic" style = "height:200px"
						required>#courseTopic#</textarea>
					</div>
				</div>

				<div class = "row">
					<div class = "prompt">
						Course Fee
					</div>

					<div class = "inputarea">
							<cfinput type="number" name="courseFee" step = "0.01" value = "#courseFee#"
							required="true" validate="float" message = "Please enter a valid Course Fee for this course (0 if none).">
					</div>
				</div>


				<div class = "row">
					<div class = "prompt">
						Student Learning Objectives
					</div>

					<div class = "inputarea">
						<textarea name = "studentLrnObj" style = "height:200px"
						required>#studentLrnObj#</textarea>
					</div>
				</div>


				<div class = "row">
					<div class = "prompt">
						Core Learning Objectives
					</div>

					<div class = "inputarea">
						<textarea name = "coreLrnObj" style = "height:200px"
						required>#coreLrnObj#</textarea>
					</div>
				</div>


				<div class = "row">
					<div class = "prompt">
						Program Specific Outcomes
					</div>

					<div class = "inputarea">
						<textarea name = "prgrmSpecOutcomes" style = "height:200px"
						required>#prgrmSpecOutcomes#</textarea>
					</div>
				</div>
				</cfoutput>

				<div class = "row">
					<!--- submit button --->
					<input type="Submit" value="Submit">

				</div>
			</cfform>
		</div>

		<div class = "footer">
			<p>Everett Community College</p>
		</div>
	</body>
</html>