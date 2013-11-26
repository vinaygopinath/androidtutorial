#Hello World
In this tutorial we will go through various steps of creating a android app with wizard, once our application is ready, we will launch the application and see it working in emulator. We will then go through the folder structure and see various tools available with us in ADT. 

#Creating Project From Wizard 

The Android Developer Tool (ADT) or eclipse provides us a great way to create android applications using a wizard, unlike other languages where you need to write code to do a basic hello world. In Android you just need to follow some simple steps and with few clicks we get our first hello world project up and running. 

This tutorial will help you in understanding this process and various options in the wizard. 

> Watchout: If you have’t installed the ADT or eclipse plugin, please go to tutorial 2 and complete your setup. 

Lets Start 

IF ADT is not running, double click on ADT  to start the development environment once the ADT is launched follow this steps 

*	Click on File - > New and choose Android Application Project, you will see the first Screen 

###Screen 1

<br/>
![New Application](/assets/hello-android/screen1.png "New Application")

This is the first Screen for creating a new android project, lets go at each row 1 by 1 and try to understand what it is 

*	Application Name: application name is nothing but name of your application, this name will be visible on screen when some one will install your application. Application name is also shown in playstore when you will upload your application
*	Project Name: Project name is the name of your project that will be created, it is used only by eclipse and you can give any name for your project. 
*	Package Name:  this is very important, package name is use to uniquely identify your application on play store, you can follow java package convention for package name . Package name is not shown to user but should not change ever. 
*	Min Require SDK:  As you know android started with version 1.5 and current version is 4.4, android apps are always backward compatible, ie if you create an application for android 2.3 it will work on android 4.4. With Min Require SDK you can decide which version of android at minimum you want to support 
*	Target SDK: This settings tell android that even though your app will able to run on older version 	but it is explicitly tested with version specified here. 
*	Compile With: Which version of SDK you want to compile with, this is typically the highest version which is available in your ADT, this tells the system to compile application with latest code and optimizations. 
*	Theme:  If you are creating app for version 4,X and above you can have a application wide theme , this themes are nothing but some pre define color schemes which you can use to improve your apps User Interface 

> Watchout: Once you upload a application in play store with a package name, you will not able to change it ever, so choose your package name wisely 

Click on Next: 

###Screen 2

<br/>
![New Application project config](/assets/hello-android/screen2.png "New Application project config")

This screen is use to configure various project settings, lets go 1 by 1 to see all this options 

* Create Custom Launcher Icon : Do you remember how you launch an android app ?? by clicking on application icon, this icon is nothing but launcher icon, if this option is selected ADT will provide you a wizard to create a launcher icon. Keep this option selected 
*	Create Activity: With this option selected, ADT will create 1st activity for you, this will be your main activity and will have a reference in mainifest
*	Mark This project as Library: Any android project can be of 2 types, a library project or a non library project, a library project is reusable project which is used by other non library projects, library project cant be installed. 
*	Create Project in Workspace: when you use ADT for the first time, you choose a folder where all your projects will be saved, this is called as workspace, with this option selected you are telling ADT to save this project in the same location
*	Add Project to working sets : working set is nothing but grouping, when your number of projects in ADT stars increasing you can group them together into working sets to avoid clutter 
Click Next

###Screen 3

<br/>
![New Application Launcher icon](/assets/hello-android/screen3.png "New Application Launcher icon")

If you haven’t unchecked the create custom launcher check box, 3rd screen will be creation of launcher icon screen


On this screen, you can choose different option to create a launcher icon, you can choose your own image, you can use Text or you can use cliparts. In the Right pan you can see the demo of the icon. 

You can experiment with different options like background color shape etc and finalize a icon based on preview. 

Click on Next


###Screen 4

<br/>
![New Application Activity Template](/assets/hello-android/screen4.png "New Application Activity Template")

Screen 4 is a activity template screen, ADT comes pre bundle with some activity templates for you, this templates have predefine structure and automatically generates require code for you

*	Blank Activity:  this will create a blank activity with just 1 textview. 
*	Full Screen Activity: This is typically used by games, this activity hides the status bar and your activity takes all screen space
*	Master Detail Flow: This templates create advance navigation based on fragments,  which will work on both tablets and phones without any change 

Select Blank activity and Click Next

###Screen 5

<br/>
![New Application Activity Config](/assets/hello-android/screen5.png "New Application Activity Config")

This screen is Activity configuration screen, since you asked ADT to create a activity for you, this screen helps you in configuring that screen

*	Activity Name: this will be the name of you activity which will be created 
*	Layout Name: In further chapters you will read that an activity will always have User interface with it, since ADT is creating activity for you, it will also create a layout for you binding it with activity
*	Navigation Type: in future chapters you will read about different navigations which you can put it in your apps like tabs dropdown etc. this option let you choose the navigation type for your activity 
Click Finish

Once you click Finish ADT will create your new project and will open Java code and Layout code for you. 

#Running your Application

Once we have our application create via ADT, lets go ahead and deploy our application. Follow this process 

<br/>
![Run Application](/assets/hello-android/screen6.png "Run Application")

*	Right click on your project name in ADT and choose Run As = > Android Application
*	In new ADT you get a emulator image by default, in such case you will see android emulator gets launched 
*	In case you see a no emulator screen, follow the AVD creation process below to create a new Emulator, and repeat this process again.

> Watchout: emulator is slow to start, once you have your emulator running, don’t close till your work is over 

Here is how it will look 

<br/>
![Emulator](/assets/hello-android/emulator.png "Emulator")