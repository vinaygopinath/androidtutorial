We will now proceed towards creating the next screen of our app &mdash; the Tweet List screen.  
For now, we will not concentrate on building the list. Our first concern is to show the new screen. For that, let's create a new
layout file and name it &ndash; `activity_tweet.xml`. In this laout file, create a `LinearLayout` and put a simple `TextView` in it.
Something like this &mdash;

    <?xml version="1.0" encoding="utf-8"?>
    <LinearLayout xmlns:android="http://schemas.android.com/apk/res/android"
        android:layout_width="match_parent"
        android:layout_height="match_parent"
        android:orientation="vertical" >
        
        <TextView android:id="@+id/lbl_no_data"
            android:layout_width="wrap_content" 
            android:layout_height="wrap_content"
            android:padding="5dp"
            android:text="@string/lbl_no_data"
            android:textStyle="bold"
            android:textColor="#ff0000"
            android:textSize="14sp"
            android:layout_marginTop="20dp"
            android:layout_gravity="center_horizontal"
        />
        
    </LinearLayout>


This might be a good time to explain to you a bit about those weird looking dimensions that we are using &ndash; `dp`, `sp`, etc.  
We make use of the `sp` unit for declaring text sizes. `sp` stands for *Scale (independent) Pixels*. This is similar to `dp`,
but also takes into consideration the user's default font settings.   
`dp` on the other hand stands for *Density (independent) Pixels* and used to define the dimensions, padding and margins of views.

---

You can also use `px` to denote the absolute pixel measurements, but it is *strongly* advised that you don't. This is because Android
devices can have a whole variety of resolutions. A pixel on one device can be very different on another. To protect your screens
getting all distorted when viewed on different devices, it is best to allow the Android framework to do its bit of magic in scaling
the dimensions you provide as per the device. And to do so, you should use the `dp` or `sp` units for your dimensions.

---


After the layout file, go ahead and create a new `Activty` class, and name it &mdash; `TweetList.java`. Remember to extend the 
`android.app.Activity` class and also add the following entry to your `AndroidManifest.xml` file &mdash;

    <activity android:name=".TweetList" android:theme="@android:style/Theme.NoTitleBar"></activity>

Once you're done with this, we will need to add some code to the `onClickListener` we had defined in our previous lesson. The purpose
of this code will be to take the user from current Login screen to the next screen. The code for that looks something like this &mdash;

    Intent intent = new Intent(MainActivity.this, TweetList.class);
    startActivity(intent);
    finish();

These 3 lines are all it takes, and here's what they do. The `Intent` class provided by the framework is responsible for encapsulating 
the request of one `Activity` from another. If you've worked with any web based technology stack, you can think of it a bit like 
the *HTTP Request*. When instantiating the `Intent`, you need to mention the current class from which you are navigating, and the destination
class to which you want to navigate to. The source class reference is passed as `CurrClassName.this` and the destination class as `DestClassName.class`.

Now you might be asking why is it that one has a `.this` and the other a `.class`?  
The logic for that goes something like this &mdash; since the `Activity` you are on currently has already been instantiated by the Android
platform, you only need to pass a reference to its current instance. Whereas, the framework needs to create a *new instance* of the destination
`Activity` class, so you need to send in only the *type* information, as there is no existing instance of it.  

Once you've put in that logic, it's time to take your app for spin. Go ahead and deploy it to your device/emulator and verify that clicking
on the *Login Button* takes you to the next screen, which should look something like this &mdash;

![No Tweets Screen](https://dl.dropboxusercontent.com/u/1166125/codelearn/tweet-list-no-tweets.png "No tweets screen")
