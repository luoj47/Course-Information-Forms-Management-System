<!--- This page displays the results from searching. Only displays most recent record --->
<html>
	<head>
		<title>CIFM - Search Results</title>
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
				<font size = "16">Search Results</font>
			</p>
		</div>

		<div class = "form">
			<cfform action = "viewCourse.cfm" method = "post">
				<!--- Save combinations of columns into a variable for the next page after submission.
				Logic to grab only the most recent record of a course --->
			<cfquery name="getBrief" datasource= "cifm">
					SELECT (coursePrefix + ' ' + catalogNumber + ' ' + courseName
							+ ' ' + effectiveQuarter + ' ' + CONVERT(VARCHAR, lastUpdated, 121))
							AS shortCourseinfo,
							(coursePrefix + ' ' + catalogNumber + ' ' + CONVERT(VARCHAR, lastUpdated, 121))
							AS courseIdentifier,
							t1.*
					FROM CourseInfoForms.dbo.courses t1
					WHERE t1.lastUpdated = (SELECT MAX(t2.lastUpdated)
                 		FROM CourseInfoForms.dbo.courses t2
						WHERE ((t2.coursePrefix = t1.coursePrefix) AND (t2.catalogNumber = t1.catalogNumber))
							AND ((coursePrefix LIKE '%#form.searchTerm#%')
						 	OR (effectiveQuarter LIKE '%#form.searchTerm#%')
						 	OR (subject LIKE '%#form.searchTerm#%')))

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