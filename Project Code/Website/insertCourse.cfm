<!--- This is a confirmation page after you add a course --->


<html>
	<head>
		<title>CIFM - Home</title>
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

		<cfinsert datasource = "cifm" tablename = "CourseInfoForms.dbo.courses">

		<div class = "intro">
			<p>
				<font size = "16">Course Inserted!</font>
			</p>
		</div>

		<div class = "footer">
			<p>Everett Community College</p>
		</div>
	</body>
</html>