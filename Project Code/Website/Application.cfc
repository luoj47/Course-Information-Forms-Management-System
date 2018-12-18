<cfcomponent displayname="CIFMApplication" output="false">

	<cfset this.name = "Course Information Forms Management Sysatem">
	<cfset this.applicationTimeout = CreateTimeSpan(1,0,0,0)>
	<cfset this.sessionManagement = true>
	<cfset this.sessionTimeout = CreateTimeSpan(0,0,10,0)>
	<cfset this.datasource = "cifCourses">

</cfcomponent>