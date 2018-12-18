<!--- This page allows for searching by subject, the course's effective year, and the course's prefix--->

<html>
	<head>
		<title>CIFM - Search for Course</title>
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
				<font size = "16">Search For Course</font>
			</p>
		</div>

		<div class = "form">
			<cfform action = "searchCourse.cfm" method = "post">
				<!--- DISTINCT key word used to avoid duplicate entires in the drop down--->
		    	<cfquery name="searchP" datasource= "cifm">
					SELECT DISTINCT coursePrefix
					FROM CourseInfoForms.dbo.courses
				</cfquery>
				<div class = "row">
					<div class = "prompt">
						Search By Course Prefix
					</div>

					<div class = "inputarea">
						<cfselect name = "searchTerm"
							query = "searchP"
							value = "coursePrefix"
							display = "coursePrefix"
							required = "Yes"
							multiple = "No"
							size = "1">
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
			<cfform action = "searchCourse.cfm" method = "post">
		    	<cfquery name="searchEQ" datasource= "cifm">
					SELECT DISTINCT effectiveQuarter
					FROM CourseInfoForms.dbo.courses
				</cfquery>
				<div class = "row">
					<div class = "prompt">
						Search By Effective Quarter
					</div>

					<div class = "inputarea">
						<cfselect name = "searchTerm"
							query = "searchEQ"
							value = "effectiveQuarter"
							display = "effectiveQuarter"
							required = "Yes"
							multiple = "No"
							size = "1">
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
			<cfform action = "searchCourse.cfm" method = "post">
		    	<cfquery name="searchS" datasource= "cifm">
					SELECT DISTINCT subject
					FROM CourseInfoForms.dbo.courses
				</cfquery>
				<div class = "row">
					<div class = "prompt">
						Search By Subject
					</div>

					<div class = "inputarea">
						<cfselect name = "searchTerm"
							query = "searchS"
							value = "subject"
							display = "subject"
							required = "Yes"
							multiple = "No"
							size = "1">
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