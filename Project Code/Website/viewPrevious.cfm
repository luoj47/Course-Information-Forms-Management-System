<!--- Displays all previous versions of a course information page --->

<html>
	<head>
		<title>CIFM - View Past Versions</title>
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
				<font size = "16">Past Versions</font>
			</p>
		</div>

		<div class = "form">
			<cfform action = "viewCourse.cfm" method = "post">
			<cfquery name="getBrief" datasource= "cifm">
					SELECT (coursePrefix + ' ' + catalogNumber + ' ' + courseName
							+ ' ' + effectiveQuarter + ' ' + CONVERT(VARCHAR, lastUpdated, 121))
							AS shortCourseinfo,
							(coursePrefix + ' ' + catalogNumber + ' ' + CONVERT(VARCHAR, lastUpdated, 121))
							AS courseIdentifier
					FROM CourseInfoForms.dbo.courses
					WHERE (coursePrefix + ' ' + catalogNumber) LIKE '%#form.toEdit#%'

			</cfquery>
				<div class = "row">
					<div class = "prompt">
						Highlight course and click submit to view.
					</div>

					<div class = "inputarea">
						<cfselect name = "toEdit"
							query = "getBrief"
							value = "courseIdentifier"
							display = "shortCourseInfo"
							required = "Yes"
							multiple = "No"
							size = "25">
						</cfselect>
					</div>
		    	</div>

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