# Getting Started with Android App
In this tutorial we will go through various steps of creating a android app with wizard, once our application is ready, we will launch the application and see it working in emulator. We will then go through the folder structure and see various tools available with us in ADT. 

## Creating Project From Wizard 

The Android Developer Tool (ADT) or eclipse provides us a great way to create android applications using a wizard, unlike other languages where you need to write code to do a basic hello world. In Android you just need to follow some simple steps and with few clicks we get our first hello world project up and running. 

This tutorial will help you in understanding this process and various options in the wizard. 

> If you have’t installed the ADT or eclipse plugin, please go to tutorial 2 and complete your setup. 

Lets Start 

IF ADT is not running, double click on ADT  to start the development environment once the ADT is launched follow this steps 

*	Click on File - > New and choose Android Application Project, you will see the first Screen 

### Screen 1

<br/>
![New Application](/assets/hello-android/screen1.png "New Application")

This is the first Screen for creating a new android project, lets go at each row 1 by 1 and try to understand what it is 

*	**Application Name:** application name is nothing but name of your application, this name will be visible on screen when some one will install your application. Application name is also shown in playstore when you will upload your application
*	**Project Name:** Project name is the name of your project that will be created, it is used only by eclipse and you can give any name for your project. 
*	**Package Name:**  this is very important, package name is use to uniquely identify your application on play store, you can follow java package convention for package name . Package name is not shown to user but should not change ever. 
*	**Min Require SDK:**  As you know android started with version 1.5 and current version is 4.4, android apps are always backward compatible, ie if you create an application for android 2.3 it will work on android 4.4. With Min Require SDK you can decide which version of android at minimum you want to support 
*	**Target SDK:** This settings tell android that even though your app will able to run on older version 	but it is explicitly tested with version specified here. 
*	**Compile With:** Which version of SDK you want to compile with, this is typically the highest version which is available in your ADT, this tells the system to compile application with latest code and optimizations. 
*	**Theme:**  If you are creating app for version 4,X and above you can have a application wide theme , this themes are nothing but some pre define color schemes which you can use to improve your apps User Interface 

> Watchout: Once you upload a application in play store with a package name, you will not able to change it ever, so choose your package name wisely 

Click on Next: 

### Screen 2

<br/>
![New Application project config](/assets/hello-android/screen2.png "New Application project config")

This screen is use to configure various project settings, lets go 1 by 1 to see all this options 

* **Create Custom Launcher Icon:** Do you remember how you launch an android app ?? by clicking on application icon, this icon is nothing but launcher icon, if this option is selected ADT will provide you a wizard to create a launcher icon. Keep this option selected 
*	**Create Activity:** With this option selected, ADT will create 1st activity for you, this will be your main activity and will have a reference in mainifest
*	**Mark This project as Library:** Any android project can be of 2 types, a library project or a non library project, a library project is reusable project which is used by other non library projects, library project cant be installed. 
*	**Create Project in Workspace:** when you use ADT for the first time, you choose a folder where all your projects will be saved, this is called as workspace, with this option selected you are telling ADT to save this project in the same location
*	**Add Project to working sets:** working set is nothing but grouping, when your number of projects in ADT stars increasing you can group them together into working sets to avoid clutter 
Click Next

### Screen 3

<br/>
![New Application Launcher icon](/assets/hello-android/screen3.png "New Application Launcher icon")

If you haven’t unchecked the create custom launcher check box, 3rd screen will be creation of launcher icon screen


On this screen, you can choose different option to create a launcher icon, you can choose your own image, you can use Text or you can use cliparts. In the Right pan you can see the demo of the icon. 

You can experiment with different options like background color shape etc and finalize a icon based on preview. 

Click on Next


### Screen 4

<br/>
![New Application Activity Template](/assets/hello-android/screen4.png "New Application Activity Template")

Screen 4 is a activity template screen, ADT comes pre bundle with some activity templates for you, this templates have predefine structure and automatically generates require code for you

*	Blank Activity:  this will create a blank activity with just 1 textview. 
*	Full Screen Activity: This is typically used by games, this activity hides the status bar and your activity takes all screen space
*	Master Detail Flow: This templates create advance navigation based on fragments,  which will work on both tablets and phones without any change 

Select Blank activity and Click Next

### Screen 5

<br/>
![New Application Activity Config](/assets/hello-android/screen5.png "New Application Activity Config")

This screen is Activity configuration screen, since you asked ADT to create a activity for you, this screen helps you in configuring that screen

*	**Activity Name:** this will be the name of you activity which will be created 
*	**Layout Name:** In further chapters you will read that an activity will always have User interface with it, since ADT is creating activity for you, it will also create a layout for you binding it with activity
*	**Navigation Type:** in future chapters you will read about different navigations which you can put it in your apps like tabs dropdown etc. this option let you choose the navigation type for your activity 
Click Finish

Once you click Finish ADT will create your new project and will open Java code and Layout code for you. 

## Running your Application

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


## Creating Android Virtual Device(AVD)

Android gives you an option to test your application against any version of android,  without depending on phone, this is done via AVD. AVD is nothing but a emulator which emulates the actual device on your machine. 

Lets see how we can create a emulator. 

*	Click on Windows in menu option, and choose Android Virtual Device Manager. 

AVD manager dialog will open, in newer version of ADT you get 1 avd pre bundled, in case of old ADT you might not have any AVD. 

<br/>
![AVD Manager](/assets/hello-android/avd_manager.png "AVD Manager")

Lets create a new AVD of our own, Click on New in AVD Manager, New AVD Creation dialog will open. 

<br/>
![Create AVD](/assets/hello-android/create_avd.png "Create AVD")

Let’s go through elements of this dialog 

*	**AVD Name:** is name of your emulator 
*	**Device:** this is the Size of screen which you want, in case your emulator is not opening up reduce the size to make it work
*	**Target:** What version of Android you want in your emulator, choose the latest version, don’t choose Google API version
*	Leave all other options to default, 
*	You can give size of SD card if you want 

Click on OK to create the AVD

> Watchout: Make sure your RAM size in AVD does not go beyond a limit, you will see a error in the empty box above the ok cancel button, the size of ram can be ¼ th of your system ram but should not increase beyond a set limit. 

Once the AVD is created, you will see your newly created AVD in the AVD manager. Now you can go and launch your application to run in your new AVD


## Android Folder Structure

Till not we have seen how to create a hello world application and create a new emulator and test our application there, now lets see how android folder structure looks like

<br/>
![Android App Folder Structure](/assets/hello-android/folder_structure.png "Android App Folder Structure")

Lets go via each folder and see what each one is use for 

*	**src:** src is your main folder in which all your JAVA code will go, all your android application logic will go into SRC folder as java class files 
*	**gen:** gen is a system folder which you should not touch, Android SDK uses this folder to generate mapping of resource files.  
*	**R.java:** you see a R.java file in gen folder, this file is mapping of your resources into code. This is system generated file and you should not modify or delete it 
*	**assets:** asset folder is use to keep files which you want to pre bundle with your application like sound, mp3, fonts etc 
*	**bin:** this is the standard java bin folder where all your compile classes will go 
*	**libs:**  In android you can use libraries build by others to make process of developing application faster, all your libraries(.jar) files goes into lib folders
*	**res:** res is very important folder for your android app, all your images, styles and layouts goes into resource folder. Lets go 1 by 1 into each folder and see what it is used for 
*	**drawable-xxxdpi** all this folders represent different screen sizes for android devices, this folder will contains all your images which you want to use into your android app, the reason to have multiple folder is to get same image in different size so proper image can be used based on screen size 
*	**layout:** layout will contain all your UI for any application, this will have XML files in which your ui is defined 
*	**menu:** this folder will contains menu xml, menus are simple hidden information for any app which appears when user press menu button on there phone
*	**values-xxx:** values folder contains all your strings, dimensions and style for any application, the reason to have multiple folder is based on screen size and android version you can change this values. 
*	**Manifest.xml:** Mainifest is the settings file of your android app, as you have read earlier, each application can have only 1 mainifest file and contains all your application settings like name, permissions etc

Ignore all other files 

> Watchout: Lot of time during your project work you might get R.java error, the best way to resolve that is to do a clean build and make sure correct R is imported in your activity

## Other Tools: 

Lets see some other tools which are available in ADT 

### Console
console gives your all the information about events happening in ADT, when you launch an application , generates apk, create new application, resources etc all information is printed in the console. 

<br/>
![Console](/assets/hello-android/console.png "Console")

Console helps in knowing what is happening in your development environment 

### LogCAT
<br/>
![LogCat](/assets/hello-android/logcat.png "LogCat")

A excellent tool which comes with ADT is logcat, logcats gives you all information about what is happening in your Android Emulator or Phone if you are using a android phone for testing your applications

LogCat displays filterable messages that shows you what is happening in your android device. You can filter messages with verbose, warnings, errors etc. 

Logcat is the place where all your errors in application will be printed, when ever you launch your application you can refer logcat to see what is happening, in case of any error or force close all your error message will be printed on logcat.  

### DDMS
<br/>
![DDMS](/assets/hello-android/ddms.png "DDMS")

Ddms is a very powerful prespective which comes with ADT, it lets you control and access different information from a device or emulator

*	get heap dump
*	Know threads and there information 
*	Change Network to do performance and load testing 
*	Explore files via file explorer 
*	Get system information like CPU load, memory usage etc 

DDMS also comes with a nice tool of emulator control, this options lets you control the emulator behavior, here are few things which you can do with this

*	Send a Voice call mimicking a specific number 
*	Send SMS to emulator, this comes in handy when you want to test some capabilities based on SMS 
*	Mock GPS location to test your application if it is using GPS 


So lets wrap up this chapter, in this chapter we have learnt how to create a hello world application, create a virtual device, launch this application and test it in emulator, then we saw how the android project folder structure looks like and in the end we have seen what are the different tools available with us and how they help us in developing faster. 


