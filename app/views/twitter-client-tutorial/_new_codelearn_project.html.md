# Creating A New Project

In the previous lesson, we installed Codelearn Eclipse Plugin. Instead of following the regular process of creating a New Android project, the plugin comes with a 'Codelearn Twitter App' project pre-bundled. When you create a new Android project, it asks for quite a few parameters which is confusing for a newbie. We have condensed all those steps by providing default values. 

## Installation Steps

Follow steps below to create the new Codelearn Twitter App.

* You should have Eclipse open. Hit on File -> New -> Other

!["Create new Project"](/assets/twitter-client/plugin-newproject-menu.png "Create new Project")

* You will see a window popup as shown below. It is a 'New Project wizard' of Eclipse. Under 'Codelearn Android Project', select 'Twitter App'. Hit Finish. 

!["New Project Wizard"](/assets/twitter-client/plugin-newproject-wizard.png "New Project Wizard")

You should see an app with name 'CodelearnTwitterApp' in the package Explorer Window (the project navigation window on the left). Screenshot below. 

!["Package Explorer Screenshot"](/assets/twitter-client/project-package-explorer.png "Package Explorer Screenshot")

* Before checking the content of the app, lets get it running first. Before you run your app, we suggest you to keep your Android phone jacked into the PC through a USB cable. The Android app will get deployed to your phone & this is how most of the Android app developers do it too. If you do not have an Android phone, you will get a popup which says that no Android device is found & it will suggest you to create AVD (Android Virtual Device). Follow steps [here](/android-tutorial/android-hello-world#Creating-Android-Virtual-Device-AVD-) to configure AVD for your SDK. 

* Hit the **Run button** at the top (the green play button). A selection window shows up. This is 'Run Configuration Selector' window of Eclipse. A project can have multiple **Run Configurations**. The default Run Configuration for an Android app is 'Android Application' but in our case, you should select 'Android App Codelearn'. This configuration does the default Android App deployment & also test your application to show you logical errors & possible remedies. It also lets us keep track of your tutorial completion progress.

!["Codelearn Run Configuration"](/assets/twitter-client/plugin-newproject-run-menu.png "Codelearn Run Configuration")

* This is how the App Output on your phone or AVD should look like 

!["Codelearn Hello World"](/assets/twitter-client/hello-world.png "Codelearn Hello World")