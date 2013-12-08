#Activity and It’s LifeCycle

In chapter 1 we saw that Activity is basic building block of Android Apps. A Activity always have a user interface and any android app will be made of 1 or more activity. Later we saw that to tell android which activity to open when the application is launched we define Main Activity in Mainifest. 

Now since you understand the concept of activity very well, lets start and understand more nity gritty of Activity.  All Activities have LifeCycle, just like human beings have lifecycle, activities also have lifecycle which helps the Developer of application to take certain decisions. 

##Why ?

The first question comes into mind when reading about activity lifecycle is why is it required ?? Lets take an example and understand. 

Assume you are playing a game on your phone, you are at level 2 and completed 50 % of the game and suddenly some one calls you, you being on phone don’t have any control on this. When you get a call, your games stop and you see the caller id screen, now you pick call talk and after your call ends, you want to go back to your game. Also you want to resume your game from same point where you left ie 50 % complete you don’t want to replay the game. 

Now assume yourself as the Game Developer, for you as developer there should be a way in which you know when your game will going to be Stopped  so that you can save the Game State?? right ?? How will this happen ?? To make Developers life easier, Android provides your with Activity life cycle. This lifecycles are nothing but sets of Method which will be called when ever something happens to your application / Activity. 

Let’s See this in more details. 

##Activity Lifecycle

<br/>
!["Activity Lifecycle"](/assets/activity_lifecycle/activity_lifecycle.png "Activity Lifecycle")


This is typically how your activity behaves at different points. Let see each lifecycle state one by one and why they are required. 


###On Create
On create is called when your activity is getting created for the first time. On Create is called only 1 time in entire lifecycle of activity. Usually this is the place where you will set the layout using (setContentView) to set the layout/UI to the activity.

Also you can use onCreate to initialize your variables.  In Any android application when ever you create any activity, the minimum method which you need to override is onCreate. If you don’t override on create method you will not able to set any UI to your activity and you will get an error when your app will run. 

    class MainActivity extends Activity
		@Override
		protected void onCreate(Bundle savedInstanceState) {
			super.onCreate(savedInstanceState);
			setContentView(R.layout.activity_main);
		}
	end

> Watchout: If you notice, OnCreate pass you something called as Bundle, this bundle is typically use to store the state of your activity, take example of rotating your phone, if you rotate your phone, your activity gets killed and OnCreate is called again, here Android frameworks helps your in determining using Bundle weather the same activity is killed and created again or it’s a new activity.

Why is this necessary, imagine you have a form and user field some of the information. Suddenly user rotates there phone, using this bundle android retains the values of this fields and re populate data after rotation automatically.  This bundle will always be null at 1st call. 

###OnStart:
OnStart is your immediate method, which gets called after activity is Created, onStart is called just before the activity becomes visible to the user, If you notice OnStart is called from 2 places, after onRestart and After OnCreate, onStart is always followed by OnResume or OnStop.  You can use OnStart to reset data which you use when the application is running, reinitialize variables etc. 

###OnResume:
OnResume is the place at which your activity comes into foreground, onResume is called when activity becomes visible to the user. At this point the activity is at top of activity stack and user can start interacting with the activity. On Resume is typically use to register listener, bind to service etc. 

OnResume is a good place to refresh your UI with any New Changes which might have occurred during period in which acitivity was not visible. For Example, if you are polling a service in background (like tweets), onResume is good place to update your screen with new results. 

###OnPause:
OnPause is Called just when System Starts to Resume Other Activity or when another activity comes on the top of your activity.  Typically  anything that steals your user away from your activity will result in onPause.

In OnPause we release the resources, or Save the application data, stopping background threads etc. 

There is always guaranteed that whenever your activity is becoming invisible or partially visible onPause will be called, but once onPause is called android reserves the rights to kill your activity process at any point. Hence you should not be relying upon receiving any further events. 

> Watchout: In our Example, OnPause will be method at which you can save the state of your game. 
OnStop: OnStop is called when your activity is no longer visible to the user, it is similar to onPause but here you will not see your activity entirely.  You can use this method as well to store the state of your application and shut down time intensive or CPU intensive operations. This method is guaranteed to be called as of API level 11.

<br/>

> Watchout: So What is the difference between onPause and OnStop ? If a activity comes into foreground and fills the screen such that your current activity is not at all visible, your current activity will be called with both onPause  and onStop . If, however an activity that comes to foreground does not fill the screen and your current activity is partially visible, your current activity will be called with only onPause. 

Typically whenever you see a dialog box which requires your attention like battery low, network connection your current activity becomes partially visible and popup box comes on the top, this is the point where only onPause will be called. 

###OnRestart:
Similar to onCreate but on restart gets called only after onStop, this is the method which you can use to know if your application is starting Fresh or getting restarted. 

In OnRestart you will get your application save state back and reinitialize all the variables followed then by onStart

> Watchout: in our game example, this is the method in which you will write code to restore the game state back to 50 %

###OnDestroy:
This is the method which will be called when your activity is getting killed. This is the final call the activity will receive in its lifecycle.

When user press back button on any activity the foreground activity will be destroyed and control will return to the previous activity in the user’s navigation flow. 

But remember the fact, there is no guarantee that onDestroy will be called, only when system is low in resource or user pressing back button or if you use finish() explicitly in your code onDestroy will be called. 

Even though you should always use onPause and OnStop to clean up resources release connections etc, onDestory is there to let your app have the final chance to clean things up before the activity does get destroyed. 


So we have seen all the activity lifecycle. Lets see what are the different states of your activity

##Activity States

The Android OS uses a priority queue to assist in managing activities running on the device. Based on the state a particular Android activity is in, it will be assigned a certain priority within the OS. This priority system helps Android identify activities that are no longer in use, allowing the OS to reclaim memory and resources. Following are the states an activity can go through, during its lifetime:

These states can be broken into 3 main groups as follows:

###Active or Running 
Activities are considered active or running if they are in the foreground, also known as the top of the activity stack. This is considered the highest priority activity in the Android Activity stack, and as such will only be killed by the OS in extreme situations, such as if the activity tries to use more memory than is available on the device as this could cause the UI to become unresponsive.

###Paused
When the device goes to sleep, or an activity is still visible but partially hidden by a new, non-full-sized or transparent activity, the activity is considered paused. Paused activities are still alive, that is, they maintain all state and member information, and remain attached to the window manager. This is considered to be the second highest priority activity in the Android Activity stack and, as such, will only be killed by the OS if killing this activity will satisfy the resource requirements needed to keep the Active/Running Activity stable and responsive.

###Stopped
Activities that are completely obscured by another activity are considered stopped or in the background. Stopped activities still try to retain their state and member information for as long as possible, but stopped activities are considered to be the lowest priority of the three states and, as such, the OS will kill activities in this state first to satisfy the resource requirements of higher priority activities.


Now we have seen various states of an activity and seen all the lifecycle methods, lets walkthrough a code example and see this lifecycle methods in action

**Download the CodeLearnActivityLifecycle Project from** https://github.com/pranayairan/Code-Learn-Android-Example/tree/master/CodeLearnActivityLifeCycle

*	Import the project into workspace, follow this tutorial if you don’t know how to import a existing android project
*	Once Imported run the application and start observing 

###First Run

When your application will be run for the first time, your will see onCreate, OnStart and onResume method gets call, notice the message which is displayed. 

###Stopping

Press the home button and exit the app. You will notice that when you press the home button, onPause is called first followed by onStop

###Restarting

Now open the application again by clicking on the application icon. Notice that you will see onRestart getting called followed by OnStart and OnResume

###Destroy

Now once you saw onRestart, just press the back button, this will exit your application but notice that onDestory is called when you exit. And before onDestory, on pause and onStop is called. 


Summarizing the chapter, now you understand why an activity lifecycle exist, what is its importance and what are the different lifecycle states which an activity goes through 

<br/>
