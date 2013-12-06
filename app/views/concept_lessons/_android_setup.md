#Android Setup and Installation

In the first chapter we have seen different concepts of an android app, from activities to services and broadcast receivers. This concepts are important building blocks and essential to learn if you want to make good android apps. 

In next few chapters we will be looking into each concepts in details and will be doing hands on coding. 

Before proceeding to next chapters, it is essential to prepare our development enviorment where we will be trying out the sample applications and concepts lessons. Lets Start


##Prerequisite 

Android development does not require any special hardware, the development enviorment is based on Eclipse and works on any platform. Here are prerequiste which can help you to decide which version to install

* OS: Android IDE works on windows xp, 7, 8, Linux and MAC OSX
* Minimum requirement is Java (JDK 6)


##Download Links

* For Java - [http://www.oracle.com/technetwork/java/javase/downloads/jdk7-downloads-1880260.html](http://www.oracle.com/technetwork/java/javase/downloads/jdk7-downloads-1880260.html)
* For ADT (Android Developer Tool) [http://developer.android.com/sdk/index.html](http://developer.android.com/sdk/index.html). Click on Right side Download the SDK button

> Watchout: Android required Java Development Toolkit JDK and will not work with JRE

##Setup Guide

Lets see the video for Windows 7 installation. Even though this is for windows 7 the steps are more or less same for all other platforms. 

<iframe width="560" height="315" src="//www.youtube.com/embed/SFGF3_r9YIA?list=UUbL5gei-5kK8hHf5q3andnw" frameborder="0" allowfullscreen></iframe>

<br/>

The above video helps you in downloading the JDK, installing it and ADT downloads and installation

Lets go step by step and see how to setup, we will be following video

### JDK Setup

> You can check if you already have JDK install on your machine or not. Go to Command line and type javac -version if you get a version code which is 1.6 or above then you can skip this step.


Go to [http://www.oracle.com/technetwork/java/javase/downloads/jdk7-downloads-1880260.html](http://www.oracle.com/technetwork/java/javase/downloads/jdk7-downloads-1880260.html) and select Java SE Development Kit based on your Operating System and wether it is 32 bit or 64 bit. For 32 bit file name will have X86 

Once the file is downloaded double click on it to start the installation, let the default options selected and follow the wizard to complete the installations. 

> Watchout: lot of times oracle bundle ASK toolbar with the java JDK installation, make sure you notice the wizard and uncheck the installation of ASK tool bar to save your slef from Boltwares. 


### ZIP utility

The ADT package which you downloads from developer.android.com is compressed, you need to have a uncompression software to extract the setup. If you are on linux or you are on MAc you can skip this section, if you are on windows machine and already have a zip utility like WinZIP WINRAR etc you can skip this section

If you do not have a unzip software and your are running a windows machine, follow this steps

* Go to [http://www.7-zip.org/download.html](http://www.7-zip.org/download.html) and download .msi file for your windows machine
* Double click on the msi and install 7zip software
* when asked for associating known extension let the default option selected and finish the installation

###ADT (Android Development Toolkit)

Now we have JDK and Unzip utility installed, lets go and install the ADT

*Go to the file which gets downloaded from developer.android.com. The file name will start from **adt-bundle-**
*Right click and unzip the zip packaged. In linux or MAC you can use unzip command on teminal
*You will get a new folder with name adt-bundle-xxxx created. The exact name will depend on your OS, PC configuration (32/64 bit) etc. 

> Watchout: In the above video you see the presenter doing a cut paste after the above step, you can skip that part if you do not want to change the location of your ADT installation. If you want to move your setup to a different location you can do cut and paste.

The ADT is installed and ready, you will notice that the installation is slef contained that means you just need to have the ADT folder to run the development enviorment

##Understading ADT Folders
Now we have unzipped the ADT from the file we downloaded, double click on the new folder to go inside, lets see what the 2 folders inside ADT are

###Eclipse Folder
As discussed earlier ADT is nothing but eclipse with Android plugin installed and configured for you, this folder contains the executable which we will use to run the program

If you double click on eclipse folder you will see various other folders, this are eclipse folders require to run it properly

Double click on Eclipse.exe or eclipse to start the ADT

###SDK Folder
SDK folder will contain all your android releated installation, this is the folder which has your Android SDK, tools and different Virtual device images. 

You will not be using this folder and it is internally reffered by eclipse to find the android SDK path. 

###SDK Tools 
If you notice there is a tool folder inside SDK, android SDK comes prebundle with some sets of useful tools which you can use to perform variety of things like log analysis, systrace, layout viewing etc. 

In some advance chapters we might look into how to use this tools, as of not just remember this folder. 


Now you have your Android IDE up and running, follow the video to understand other parts of IDE and how to use it. 

> You can skip the video after 8 minute


Proceed to next chapter to start creating your first hello world application


> Caution practically the installation instruction does't change for Windows 8, but some time you migh encoutner some problem in correctly running the ADT, this is mostly due to incorrect installation of JDK, make sure you install correct version of JDK and choose the correct version from 32-bit or 64 bit
