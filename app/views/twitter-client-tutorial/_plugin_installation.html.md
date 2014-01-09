# Welcome to our first Android Tutorial


## Getting Started

To assist you better during the development cycle, we have created an Eclipse plugin that tests your app at every step to ensure you are doing it right. Our intent is to be able to show you very relevant error messages (& possible solution).

Please follow our step by step process to get started. 

First and foremost, let us download all the files needed to proceed.

### 1. Install Android SDK
Install Android SDK (ignore if you already have it installed) from [Official Android page](http://developer.android.com/sdk/index.html#download). Depending on your OS version, you should see only one option to download the file. In case you see multiple options, please download ADT bundle for your respective OS version.

### 2. Download Codelearn plugin
Download the [plugin zip](). This is a custom Eclipse plugin which we created for you. The file size is around 62 MB. When done, Unzip it. You will see a bunch of jar files, twit.zip file & a config.properties file. 


We realize that downloading process might be slow for you. While you wait, let us analyse what we are going to build through this tutorial. Following image contains screenshots of how our twitter app will look like. This is just a basic version of our android application. Once you are familiar with all the underlying concepts, we are going to add a lot of exciting features to make it even more robust. 

<%= image_tag "twitter-client/collage.png", alt: "Login screen Layout overview", title: "Login screen Layout overview" %>

Our app will consists of 3 screens as shown above. After the login screen, we have the infrastructure for displaying list of tweets. Clicking on any tweet will give you more information, which is shown as a seperate screen. 


### 3. Unzip plugin & copy in dropins
Unzip the downloaded plugin.zip and Copy all the extracted files from the zip to the dropins directory under **[Unzipped Android SDK Directory] -> [Eclipse Home Folder] -> dropins**. The dropins directory exists for you to manually 'drop' an Eclipse plugin there. 

> Ensure to put the extracted content directly under dropins directory. Please do not paste the content inside a new folder/directory under dropins, else the plugin will fail to work for you.

In the example below, the SDK Directory is 'adt-bundle-mac-x86_64-20131030', inside it there is 'eclipse' directory with 'Eclipse' executable & 'dropins' directory. All the extracted files are already copied inside the dropins directory.

<%= image_tag "twitter-client/dropins-location.png", alt: "Dropins with all the jars copied", title: "Dropins with all the jars copied" %>

### 4. Start your Eclipse
Open your Eclipse by double clicking the Eclipse executable in your Android SDK. You might encounter a prompt for the installation of Java runtime. In that case, please refer to <%= link_to "Java SDK Installation", android_concept_lesson_path("android-setup") + "#Setup-Guide-JDK-Setup" %> . If you had Eclipse running already, you need to restart it. There is a workspace selection popup first. Specify a workspace directory (if it is your first time with Eclipse). Hit ok. You should see a welcome popup. Great, you are all set now.

<%= image_tag "twitter-client/plugin-installation-workspace.png", alt: "Workspace selection popup", title: "Workspace selection popup" %>

<%= image_tag "twitter-client/plugin-installation-welcome-popup.png", alt: "Welcome screen after plugin installation", title: "Welcome screen after plugin installation" %>
