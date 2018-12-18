<!--- This page display a form that allows users to input course information. The form uses
CF's built in required and error checking. Once information is inputted, the user will click submit
to bring them to a page which will confirm the page is inserted. --->

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
				<font size = "16">Add Course</font>
			</p>
		</div>
		<div class = "form">
			<cfform action = "insertCourse.cfm" method = "post">

				<div class = "row">
					<div class = "prompt">
						Institution
					</div>

					<div class = "inputarea">
						<cfinput type = "text" name = "institution" value = "WA220" required = "true"
									message = "Please enter the Institution the course belongs to.">
					</div>
		    	</div>

				<div class = "row">
					<div class = "prompt">
						Campus
					</div>

					<div class = "inputarea">
						<cfinput type = "text" name = "campus" value = "Main" required = "true"
								message = "Please enter the Campus the course belongs to.">
					</div>
		    	</div>

				<cfquery name="distinctAC" datasource= "cifm">
					SELECT DISTINCT academicCareer
					FROM CourseInfoForms.dbo.courses
				</cfquery>

				<div class = "row">
					<div class = "prompt">
						Academic Career
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
						Academic Groups
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
						Admin Unit
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
						Academic Organizations
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
						Effective Quarter
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
						Subject
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
						Course Prefix
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
						<cfinput type="number" name="catalogNumber" required="true"
										message = "Please enter the Course Catalog Number.">
					</div>
		    	</div>

		    	<div class = "row">
					<div class = "prompt">
						Course Name
					</div>

					<div class = "inputarea">
						<cfinput type="text" name="courseName" required="true"
									message = "Please enter the Course Name.">
					</div>
		    	</div>

		    	<div class = "row">
					<div class = "prompt">
						Course Description
					</div>

					<div class = "inputarea">
						<textarea name = "courseDesc" placeholder = "Describe the Course.." style = "height:200px"
						required></textarea>
					</div>
				</div>

		    	<div class = "row">
					<div class = "prompt">
						Grading Scheme
					</div>

					<div class = "inputarea">
						<cfinput type="radio" name="gradingScheme" value="Decimal" checked>Decimal
						<br>
						<cfinput type="radio" name="gradingScheme" value="passFail">Pass/Fail
					</div>
		    	</div>

		    	<div class = "row">
					<div class = "prompt">
						Components - Lecture?
					</div>

					<div class = "inputarea">
						<cfinput type="radio" name="componentsLecture" value=1 checked>Yes
						<br>
						<cfinput type="radio" name="componentsLecture" value=0>No
					</div>
		    	</div>

		    	<div class = "row">
					<div class = "prompt">
						Components - Lab?
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
						Lecture: <cfinput type="number" name="componentHoursLecture" value = 0 required ="true"
									message = "Please enter the number of lab hours required by this course (0 if none)">
									<br>
								 	Lab: <cfinput type="number" name="componentHoursLab" value = 0 required="true"
								 	message = "Please enter the number of lab hours required by this course (0 if none)">
					</div>
		    	</div>

		    	<div class = "row">
					<div class = "prompt">
						Units
					</div>

					<div class = "inputarea">
						<cfinput type="number" name="units" required="true"
								message = "Please enter the Units for this course">
					</div>
		    	</div>

		    	<div class = "row">
					<div class = "prompt">
						FA Progress Units
					</div>

					<div class = "inputarea">
						<cfinput type="number" name="faUnits" required="true"
											message = "Please enter the FA Progress Units for this course">
					</div>
		    	</div>

		    	<div class = "row">
					<div class = "prompt">
						Course Challenge
					</div>

					<div class = "inputarea">
						<cfinput type="radio" name="courseChallenge" value=1 checked>Yes
						<br>
						<cfinput type="radio" name="courseChallenge" value=0>No
					</div>
		    	</div>

		    	<div class = "row">
					<div class = "prompt">
						Repeatable for Credit
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
						<cfinput type="float" name="CIP" required="true" validate="float"
							message = "Please enter a valid CIP for thise course">
					</div>
		    	</div>


		    	<div class = "row">
					<div class = "prompt">
						Attributes
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
						<textarea name = "enrollReq" placeholder = "..." style = "height:200px"
						required></textarea>
					</div>
				</div>

				<div class = "row">
					<div class = "prompt">
						Course Topic
					</div>

					<div class = "inputarea">
						<textarea name = "courseTopic" placeholder = "..." style = "height:200px"
						required></textarea>
					</div>
				</div>

				<div class = "row">
					<div class = "prompt">
						Course Fee
					</div>

					<div class = "inputarea">
							<cfinput type="number" name="courseFee" step = "0.01" required="true" validate="float"
									message = "Please enter a valid Course Fee for this course (0 if none).">
					</div>
				</div>


				<div class = "row">
					<div class = "prompt">
						Student Learning Objectives
					</div>

					<div class = "inputarea">
						<textarea name = "studentLrnObj" placeholder = "..." style = "height:200px"
						required></textarea>
					</div>
				</div>


				<div class = "row">
					<div class = "prompt">
						Core Learning Objectives
					</div>

					<div class = "inputarea">
						<textarea name = "coreLrnObj" placeholder = "..." style = "height:200px"
						required></textarea>
					</div>
				</div>


				<div class = "row">
					<div class = "prompt">
						Program Specific Outcomes
					</div>

					<div class = "inputarea">
						<textarea name = "prgrmSpecOutcomes" placeholder = "..." style = "height:200px"
						required></textarea>
					</div>
				</div>

				<div class = "row">
					<!--- Reset button. --->
					<input type="Reset" value="Clear Form">
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