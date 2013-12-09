# Welcome to our first Android Tutorial

As part of the tutorial, you will build a Twitter client. The development process followed is how developers actually develop an app from scratch. 

To make it newbie friendly, we have tweaked the process a bit to keep the easier concepts (User Interface elements) earlier in the roadmap & deferred advanced concepts (models, network calls etc) later. We have refrained ourselves from using difficult words (also jargons). So it may happen that you would already know an Android concept, but you would not know the technical name of the concept. 
As a mobile app developer, it should not matter to you. But if discover this fact later, please do not blame us. 

## Target Audience

If you belong to one of these categories, you are the kind of audience we looking for.

* Hacker kind of people. Those who are impatient & do not care 
* People who have prior java knowledge
* People having no/little knowledge of Android (including the guys who have never made an Android app earlier)

## Getting Started

To assist you better during the development cycle, we have created an Eclipse plugin that tests your app at every step to ensure you are doing it right. Our intent is to be able to show you very relevant error message (& possible solution). But this is a pretty tricky problem to address & we are hoping that we will be getting better with time. 

Follow the steps below to get started

* Install Android SDK (ignore if you already have it installed) from [Official Android page](http://developer.android.com/sdk/index.html#download). It is a zip file that you need to download & unzip. 
* Download the [plugin zip](). Unzip it. You will see a bunch of jar files, twit.zip file & a config.properties file. 
* Copy all the extracted files from the plugin.zip to **[Unzipped Android SDK Directory] -> [Eclipse Home Folder] -> dropins** directory. The dropins directory exists for you to manually 'drop' an Eclipse plugin there. In the example below, the SDK Directory is 'adt-bundle-mac-x86_64-20131030', inside it there is 'eclipse' directory with 'Eclipse' executable & 'dropins' directory. All the extracted files are already copied inside the dropins directory.

!["Dropins with all the jars copied"](/assets/twitter-client/dropins-location.png "Dropins with all the jars copied")

* Open your Eclipse by double clicking the Eclipse executable in your Android SDK. You might encounter a prompt for the installation of Java runtime. In that case, please refer to [Java SDK installation](http://androidconceptlessons.herokuapp.com/android-tutorial/android-setup#JDK-Setup). If you had Eclipse running already, you need to restart it. There is a workspace selection popup first. Specify a workspace directory (if it is your first time with Eclipse). Hit ok. You should see a welcome popup. Great, you are all set now.

!["Workspace selection popup"](/assets/twitter-client/plugin-installation-workspace.png "Workspace selection popup")

!["Welcome screen after plugin installation"](/assets/twitter-client/plugin-installation-welcome-popup.png "Welcome screen after plugin installation")
