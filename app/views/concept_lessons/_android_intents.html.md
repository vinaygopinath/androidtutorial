#Intents 

Now we have seen how activities work in android and activity lifecycle, lets see another component which is very useful when you start creating android apps. 

In our previous tutorial we have seen how every application is made up of multiple activities and we define our main activity in mainifest, now you might wonder how we communicate from one activity to another and how we share data between different activities. 

Lets see intents in action


Intents can be defined as simple message objects which are use to communicate from 1 activity to another. 

Intents define intention to of what a application want and can be use to pass data between activities. 

Intents can be use to perform following 3 tasks 

1.	Open One Activity from another or open Service from activity etc
2.	Intents are also use to pass data between activities and services
3.	Intents can also be use to open other application from our application to delegate responsibility, for example you can use intent to open browser to display a URL

Broadly Intents are classified into 2 categories. There are no keywords for this categories and just a broad classification on how intents are used. 

##Explicit Intents

Explicit Intents are Intents in which you explicitly defines the component that needs to be called by Android System, for example using the java class name as identifier 

When you open 1 activity from another activity in same android app you will be using Explicit Intents. Let’s see an example 

		Intent CodeLearnFirstIntent = new Intent (getApplicationContext(), SecondActivity.class)

If you notice here, you are passing the SecondActivity class name as identifier for this intent. 

##Implicit Intents

Implicit Intents are intents where instead of defining exact components you define the action, which you want to perform, and leave the decision to handle this action to the operating system and let it decide which component is best to run for that intent. 

Whenever you use Intent to Open other application from 1 application to delegate responsibility you will be using Implicit Intent. 

Lets see an example

		Intent sendIntent = new Intent();
		sendIntent.setAction(Intent.ACTION_SEND);

This is a simple Example of Share Intent, this is typically use when you want to share the data from 1 application to another, for example, you want to share data over email or sms or facebook. 


Now we have seen what intent is lets see couple of example on how this Intent works, how you pass data and how you use Implicit intent to delegate responsibilities to other apps. 

##Intent Example

**Please download the example code from ** https://github.com/pranayairan/Code-Learn-Android-Example/tree/master/CodeLearnHelloIntents and import it in your Workspace. 

###Open Another Activity

If you see the openActivity method in the above example you can see how we use intent to open another activity, lets see this code sample and then understand it

		Intent openNewActivity = new Intent(getApplicationContext(), Activity2.class);
		startActivity(openNewActivity);

With this 2 lines of code, you can open 1 activity from another in your app. 

If you see the Intent object require just 2 parameters

**Application Context**: we need to pass in what content this intent is use, this can be done in multiple way, you can use getapplicationContent method, or use this qualifier. 

**Activity Class**: The second parameter which his required for an Intent is the activity class which you want to open using this intent. This is followed by .class extension 

Once we have the intent object ready we can do lot of things with it, we will see in next section how we can pass data using this intent object. 

Once you have the intent object you can use startActivity method to start an activity whenever you want. 

In our example we are doing at the button click.  

###Pass Data

Again see the same method openActivity and notice the next line after the intent object is created.  

There are multiple way to store data in intent, you can use a explicit bundle and set bundle using putExtra, or you can directly use putExtra. 

**putExtra** is the method which is use to store data in intent object. You can store variety of data  be it string, char, Boolean, Bundle etc. This data is set as key value pair which you can retrieve in the called activity. 

Lets see this example: 

		openNewActivity.putExtra("UserName", "Pranay");
		openNewActivity.putExtra("isRegistered", true);

After we have create the intent object, we just call the putExtra method on the object. In the first line we are setting String data with key “UserName” and in second line we are setting Boolean data. We will see in next section on how we can retrieve this data which we put in intent object. 

###Alternate Method to put data

In above steps we were setting data directly into the intent object, one alternate people that lot of developers take is to set the data in Bundle and then put this data into intent object. 

Bundle in android is a parcable object which is use to pass data between activities. Android internally use bundle even when you use putExtra directly to intent. 

Lets see the example code

		Bundle dataBundle = new Bundle();
		dataBundle.putString("BundleUserName", "Pranay");
		openNewActivity.putExtra("data",dataBundle);

Here we create the bundle object and put our data using various methods like putString, putBoolean etc. 

Once we have the bundle object we can then set it to the intent object using setExtra method. 


###Retrieving Data

In the above example we have seen how we pass data from 1 activity to another, but once data is passed it also needs to be collected back into other activity. 

Open Activity2 from the sample. 

You can see in this activity how we are getting back the data from the intent. Lets see the sample code

		Intent intentObject = getIntent();
		String userName = intentObject.getStringExtra("UserName");
		boolean isRegistered = intentObject.getBooleanExtra("isRegistered", true);


The first step to get data from intent is to get the intent object, which is used to open the Activity. The getIntent() method gives you the intent object reference which is used to open this activity. 

Once you get hold of this intent object you can call different methods to get the data back for example getStringExtra to get the string data. In case there is no Data you will get null or the default value which you set for example in case of getBooleanExtra, the second parameter is the default value which will be given if there is no value with that key. 

> Watchout in case you put string extra and try to get it as int you will get a class cast exception, so please make sure your keys are correct for the correct type.


###Opening Other App

Now we have seen how to open 1 activity from another and how we can pass and consume data.  Lets see a example on how to open other apps from 1 app.

See the Activity1 code. 

**Opening Webpage**

If you see openWebPage method in activity 1 you can see the code that is use to open webpage. Lets see the example code

		Intent webIntent = new Intent(Intent.ACTION_VIEW, Uri.parse("http://www.codelearn.org"));
		startActivity(webIntent);

In the first line we create a new intent object, but this time instead of creating intent object with activity class we use action. The intent Action_View says to android operating system that we want to display data to user, based on the content pass android automatically decide which application to user. 

In case user have multiple applications which can be used for this action, android will display a list of all and ask user to choose the one that they want 


**Sharing Data**

Similar to opening webpage we have shareData method in which you can see how we use ACTION_SEND to share data over email or any social network. 

With this chapter, we have seen how we can use intents to communicate between different activities or pass data. Also we have seen how intents can be use to open other applications

<br/>
