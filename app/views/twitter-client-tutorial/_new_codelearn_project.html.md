# Creating A New Project

In the previous lesson, we installed Codelearn Eclipse Plugin. Instead of following the regular process of creating a New Android project, the plugin comes with a 'Codelearn Twitter App' project pre-bundled. When you create a new Android project, it asks for quite a few parameters which is confusing for a newbie. We have condensed all those steps by providing default values. 

## Installation Steps

Follow steps below to create the new Codelearn Twitter App.

* You should have Eclipse open. Hit on File -> New -> Other

<%= image_tag "twitter-client/plugin-newproject-menu.png", alt: "Create new Project", title: "Create new Project" %>

* You will see a window popup as shown below. It is a 'New Project wizard' of Eclipse. Under 'Codelearn Android Project', select 'Twitter App'. Hit Finish. 

<%= image_tag "twitter-client/plugin-newproject-wizard.png", alt: "New Project Wizard", title: "New Project Wizard" %>

You should see an app with name 'CodelearnTwitterApp' in the package Explorer Window (the project navigation window on the left). Screenshot below. 

<%= image_tag "twitter-client/project-package-explorer.png", alt: "Package Explorer Screenshot", title: "Package Explorer Screenshot" %>

* Before checking the content of the app, lets get it running first. Before you run your app, we suggest you to keep your Android phone jacked into the PC through a USB cable. If not already, you would also need to <%= link_to "turn on USB Debugging in your phone", android_concept_lesson_path("android-setup") + "#Setup-Guide-USB-Debugging" %> .  The Android app will get deployed to your phone & this is how most of the Android app developers do it too. If you do not have an Android phone, you will get a popup which says that no Android device is found & it will suggest you to create AVD (Android Virtual Device). Follow steps <%= link_to "by clicking here", android_concept_lesson_path("android-hello-world") + "#Creating-Android-Virtual-Device-AVD-" %> to configure AVD for your SDK. 

* Hit the **Run button** at the top (the green play button). A selection window shows up. This is 'Run Configuration Selector' window of Eclipse. A project can have multiple **Run Configurations**. The default Run Configuration for an Android app is 'Android Application' but in our case, you should select 'Android App Codelearn'. This configuration does the default Android App deployment & also test your application to show you logical errors & possible remedies. It also lets us keep track of your tutorial completion progress.

<%= image_tag "twitter-client/plugin-newproject-run-menu.png", alt: "Codelearn Run Configuration", title: "Codelearn Run Configuration" %>

* This is how the App Output on your phone or AVD should look like 

<%= image_tag "twitter-client/hello-world.png", alt: "Codelearn Hello World", title: "Codelearn Hello World" %>
