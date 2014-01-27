# Creating A New Codelearn Twitter Project

In the previous lesson, we installed Codelearn Eclipse Plugin. Instead of following the regular process of creating a New Android project, the plugin comes with a **Codelearn Twitter App** project pre-bundled. **When you create a new Android project, it asks for quite a few parameters which is confusing for a newbie. We have condensed all those steps by providing default values.** 

Follow steps below to create the new Codelearn Twitter App.

## 1. Create New Codelearn Project 

<div class="row-fluid">
	<div class="span6">
		You should have Eclipse open. Hit on <strong>File -> New -> Other</strong>
	</div>
	<div class="span6">
		Navigate to <strong>Codelearn Android Project -> Twitter App</strong>. Hit 'Ok'.
	</div>
</div>
<div class="row-fluid">
	<div class="span6">
		<p><%= image_tag "twitter-client/plugin-newproject-menu.png", alt: "Create new Project", title: "Create new Project" %></p>
	</div>
	<div class="span6">
		<p><%= image_tag "twitter-client/plugin-newproject-wizard.png", alt: "New Project Wizard", title: "New Project Wizard" %></p>
	</div>
</div>

<div class="row-fluid">
	<div class="span6">
		<p>If this is your first time with Eclipse, you need to minimize the Android IDE screen by clicking on the minimize button on top right to get to package Explorer.</p>
		<p><%= image_tag "twitter-client/eclipse-open-first-time.png", alt: "Package Explorer Screenshot", title: "Package Explorer Screenshot" %></p>
	</div>
	<div class="span6">
		<p>You should see an app with name <strong>CodelearnTwitterApp</strong> in the package Explorer Window (the project navigation window on the left). Screenshot below.</p>
		<p><%= image_tag "twitter-client/project-package-explorer.png", alt: "Package Explorer Screenshot", title: "Package Explorer Screenshot" %></p>
	</div>
</div>



## 2. Running the app

* If this is your first time with Android/Eclipse, <%= link_to "go through the steps to run an Android application", android_concept_lesson_path("android-hello-world") + "#Running-your-Application", target: "_blank" %> to quickly view the process.

* You can either choose to **[right click on CodelearnTwitterApp] -> Run As -> Android App Codelearn ** or simply hit the **Run button** on the top of Eclipse which will show the popup below. *Remember to choose 'Android App Codelearn' option as against 'Android Application'*
<p>
<%= image_tag "twitter-client/plugin-newproject-run-menu.png", alt: "Codelearn Run Configuration", title: "Codelearn Run Configuration" %>
</p>

* If you have an Android phone, you should keep it jacked in through USB with your computer. Else you need to create an AVD device. Details <%= link_to "here", android_concept_lesson_path("android-hello-world") + "#Running-your-Application-3-Get-Create-an-Android-Device", target: "_blank" %> 

* This is how the App Output on your phone or AVD should look like 

<%= image_tag "twitter-client/hello-world.png", alt: "Codelearn Hello World", title: "Codelearn Hello World" %>

## Possible Errors

**1. Unable to resolve 'android-19'** - The CodelearnTwitterApp project takes the latest Android API by default. Most probably, you are seeing this as your Android SDK is old. Quick fix is - checkout the Android API version in [Android SDK Directory] -> sdk -> platforms directory & modify `target=19` in **project.properties** file to your Android API version. 
