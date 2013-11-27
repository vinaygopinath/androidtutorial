# Introduction to Android

Android has came long since its inception in 2009, from Donut to KitKat there are lot of things, which have changed. We have not only seen Great Android Phones but a mature operation system and beautiful App experience. 

Though a lot has changed since the launch of android what have not change is the basic building blocks of android app, lets look through some of the basic building blocks of a android app in details. And later we will see how all this components comes together to create a application, we will see example of a twitter application. 

Android Application are written in java and gets compiled into a single distribution package called as APK  by android SDK.  Lets walk through various building blocks of android application. 
<br/>
![Building Blocks of Android](/assets/android-introduction/picture-1.png "Building Blocks of Android")

<p class="ac"><b>Building Blocks of Android</b></p>
<br/>
These are the basic building blocks of any android application, you can find the first three components Activities, Views and Intents in all the android application, this are must in any android app.

Services, Content Provider and Broadcast are some of the advance features which adds more functionality to your app

Lets go 1 by 1 into each of these components and get more details about them.

## Activity

This is the most basic block of any android app, every android application will have at least 1 activity
*	Activity is what You See on Screen, it every screen in any android application is an Activity
*	Activity will always have User Interface, it is not possible to have an activity without a UI
*	Any android application will have 1 or more Activity, out of this 1 activity will act as entry point (from where always the application starts). 
*	This activity from where the application always starts is called as MainActivity
*	Every activity will have it’s own lifecycle which we will see in more details in this chapter

> Watch out Facts:  AndroidMainifest is the file where all activities should be defined and where 1 activity will be marked as Main, most common errors while starting up is not defining new activities in Mainifest. 

So now you know what an activity is, and each activity will have user interface let’s go to our next essential building block. 

## User Interface / Views

As you know every activity has user interface they are nothing but Views in Android, Views are basic ui elements available with you do design any android application, you can extend this views to create your own custom view. 

### Views
*	Views are reusable UI components available for creating android apps
*	Views are arranged in tree like structure and always be associated with a Layout/ViewGroup
*	Views are created using drag and drop editor,  views are represented by XML in android
*	Example: TextView, ImageView, Button, ListView etc

### ViewGroup/Layouts
*	A viewgroup is a simple way of arranging views
*	Viewgroups are often reffered as layouts in Android
*	This layouts will be used to form a UI structure for any application
*	Example: Linearlayout, Relativelayout, GridLayout etc

> Watch out Facts:  Layouts can be nested into each other. Typically any android application will have complex UI with many layouts and views tied and nested together to form a great looking interface.  

Now we have activities, and activities has User interface but every application you use perform some actions and move from 1 screen to other, lets see how we can move from one screen to another. 

## Intents

Intents are most simple and robust concept of android, intent serves variety of purpose in any android application, lets look into what intent can do for us. 

*	Intents are Messages or way to move from 1 Activity to Another. 
*	Intents can be use to pass data from 1 activity to another activity. Have you ever used a dialer application ?? You type number in 1 screen and it appears in other screen, this is done via intent
*	Another interesting use case of intent is to open 1 application from other, what happen when you click on a phone number in a SMS ?? your dialer application opens up, how ?? using Intent. 

> Watch out Facts:  Intents can not only be use to launch activities but also services, you can start a service using intents.   

With this 3 concepts of Activity, Views and Intent, you can create basic android apps, lot of apps can be made by only using this 3 concepts. But if you want to add more complex functionality into your app android do provide some feature that can be used to enhance your application. 

Let’s look into some more concepts which android has. 

## Services

Have you ever listened to Music on your phone ?? Have you observed what happens when you come out of music app ?? the music still runs in the background right ?

This is achieved using Services. Services are basically use to run anything into background.  

*	When you need to have long running tasks like Playing Music, Downloading Data, uploading photos, you use Services

*	Services are use to perform long running tasks in background.
 
*	Services don’t have any User Interface, you can use notifications to display information about service to user. 

> Watch out Facts:  There are 2 ways in which you can create service, one is tying the service with Activity in this case service will end if activity stops, and other independent service which runs in background even after application is stop   

Lot of time it so happens that you want to store some data into your application, if you have done web/desktop programming you must be aware of database which can be use to store data. Android also provides simple relational database for every application. Lets look into our next concept 

## SQLLite 

*	Android comes with a Simple RDBMS database called as SQLLite

*	Every android application gets its own private SQLLite DB which it can use to store data for offline reference 

## Content Providers

*	Content providers manages access to a structured set of data

*	Content provider acts as a wrapper or interface on the top of you database making it easy to manage and share

*	If you want to share your application data with other application you use Content Provider

*	A simple example of content provider which you would have see is the Contacts, you can get contacts in multiple application like your SMS application, Dialer Application etc. 

> Watch out Facts:  you can always use Sqllite without going through content provider, content provider is  a way of abstracting the data store with implementation 

Now we have the application with activities and ui, we know how to go from 1 activity to another and what to use if we have long running tasks, we also know where we can store our data for our application in Android, now lets see notifications. 

We know that services don’t have any user interface, then how do we know what state a service is or weather the long running task is over ??


## Notifications

Notifications are simple messages, which are shown to user accessed by sliding down from top. 

*	Notifications are simple messages which are use to display information to user which doesn’t require user’s immediate attention 
*	Typically notification comes with Text and Small icon, but newer version of android support richer notification with buttons and images
*	User can tap on notification and can interact with it

Notifications are most widely use functionality in android, from SMS to Miss Call, from Wifi networks to Twitter notifications are used everywhere. 


So far we have seen all the concepts which is required to make a application which can go from simple to complex, let’s end our lesson with understanding 1 more concept of android. 

## Broadcast Receivers

Broadcast receiver is simple way to listen to system wide events happening in your phone or tablets. Using broadcast receivers we can create some great applications like Call Number finder, SMS blocker etc,  which works when some events happen in your phone. 

Many system wide events broadcast their information for example 

*	When SMS / Call is received 
*	Battery low
*	Network state Changed
*	Photo captured from camera
*	Phone Starts

We can also generate custom broadcast from inside our application. Whenever you want to create any application which works with system events use broadcast receiver 

> Watch out Facts:  Broadcast  receivers works even if your application is not running, that means you can create functionality in your application which can be invoked automatically by android if something happens without actually running any service or application in the background. 

So we have seen how different components are available with us to create any application in android, now lets look into an application like twitter and see all this components in action. 


## Android Concepts in Twitter App 


<br/>
![Twitter Android](/assets/android-introduction/twitter_android.png "Twitter Android")
<br/>

You can see various component and how it is used in twitter Application. Lets see what happens when you use Twitter. 

###Starting up###
<br/>
![Android Home Screen](/assets/android-introduction/startingup.png "Android Home Screen") 
<br/>

You clicked on the twitter blue icon to launch the twitter app, this icon is called as Launcher icon, as name suggest it is use to launch and application. 

Once the application is started, it checks if you are logged in or not, if not you are presented with login screen, if you are already login you are redirected to your twitter stream. 

The login screen is the Main Activity defined in manifest. 


###Login Screen###
<br/>
 ![Twitter Login](/assets/android-introduction/login.png "Twitter Login")
<br/>

Once you are at login screen, you are presented to key in your user name and password, after entering the user name password you click on login.  

Once the login is clicked twitter app do a network call to verify this user name and password, this is done using Async Task that helps you to run operations in parallel to avoid screen freeze. 

After the user name and password is verified you are moved to your twitter stream, this is done using Intent that helps you to move from one activity to another. 


###Twitter Stream Home Screen###
<br/>
 ![Twitter Home](/assets/android-introduction/twitter_home.png "Twitter Home")
<br/>

This is your home screen for twitter, on the top what you see is Action Bar, action bar is a new UI pattern for android apps. 

The list of tweets that you see on this screen is ListView, list view helps you to display “Repeatable” content in form of list. You can click on this tweet to go to details screen, this moving from list view to details is done via Intent, notice that detail screen looks same only content is changing, this content is passed via intent when you clicked on the tweet

Each item of the list view is list item, as you can see this item has different layout elements and made of different composite layouts. 
At the top of this screen you see different image buttons, clicking on this buttons will take you to different screen via again Intents. 

###Services in home screen###
<br/>
 ![Twitter Pull to Refresh](/assets/android-introduction/twitter_services.png "Twitter Pull to Refresh")
<br/>

Just pull the list view to down and you can see pull to refresh, pulling screen to down will invoke Service which runs in background to update the activity with new tweets. 

Though services don’t have user interface it can be tied with broadcast receivers to update the screen. 

###Offline behavior###

You might notice this behavior of twitter application, even if you are not connected with Internet, once the tweets are loaded you can access them even if you are offline. 

This offline behavior is achieved via storing this data in SQLLITE, sqllite is local database for storing data for later use. 

Typically you never access database directly, instead twitter app might be using Content Provider, content provider helps to provide abstraction over how data is store and accessed in application. 

###Notifications###
<br/>
 ![Twitter Android App](/assets/android-introduction/notifications.png "Twitter Android")
<br/>

Come out out of twitter application and a service runs in background, this service occasionally checks for updates in your twitter account, and displays a notification if there is any new mention or other events on your twitter account. 

Service is one way but to prevent application from draining battery, twitter application might be using Push Notification. Push notification are way to push data to application even if application is not running. 

