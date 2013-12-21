# Welcome to our first Android Tutorial


## Getting Started

To assist you better during the development cycle, we have created an Eclipse plugin that tests your app at every step to ensure you are doing it right. Our intent is to be able to show you very relevant error message (& possible solution). But this is a pretty tricky problem to address & we are hoping that we will be getting better with time. 

Follow the steps below to get started

* Install Android SDK (ignore if you already have it installed) from [Official Android page](http://developer.android.com/sdk/index.html#download). It is a zip file that you need to download & unzip. 
* Download the [plugin zip](). Unzip it. You will see a bunch of jar files, twit.zip file & a config.properties file. 
* Copy all the extracted files from the plugin.zip to **[Unzipped Android SDK Directory] -> [Eclipse Home Folder] -> dropins** directory. The dropins directory exists for you to manually 'drop' an Eclipse plugin there. In the example below, the SDK Directory is 'adt-bundle-mac-x86_64-20131030', inside it there is 'eclipse' directory with 'Eclipse' executable & 'dropins' directory. All the extracted files are already copied inside the dropins directory.

<%= image_tag "twitter-client/dropins-location.png", alt: "Dropins with all the jars copied", title: "Dropins with all the jars copied" %>

* Open your Eclipse by double clicking the Eclipse executable in your Android SDK. You might encounter a prompt for the installation of Java runtime. In that case, please refer to <%= link_to "Java SDK Installation", android_concept_lesson_path("android-setup") + "#Setup-Guide-JDK-Setup" %> . If you had Eclipse running already, you need to restart it. There is a workspace selection popup first. Specify a workspace directory (if it is your first time with Eclipse). Hit ok. You should see a welcome popup. Great, you are all set now.

<%= image_tag "twitter-client/plugin-installation-workspace.png", alt: "Workspace selection popup", title: "Workspace selection popup" %>

<%= image_tag "twitter-client/plugin-installation-welcome-popup.png", alt: "Welcome screen after plugin installation", title: "Welcome screen after plugin installation" %>
