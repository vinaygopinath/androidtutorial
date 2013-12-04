With that short introduction to `ListView`, let's dive in and create a basic `ListView` implementation
for displaying our list of tweets. 

The first thing we need to do is, revisit the `activity_tweets.xml` layout file, and add in the bit of
code required to display our `ListView`.  

    <?xml version="1.0" encoding="utf-8"?>
    <LinearLayout xmlns:android="http://schemas.android.com/apk/res/android"
        ...
        ...
        android:orientation="vertical" >
        
        <TextView android:id="@+id/lbl_no_data"
            ...
            ...
            android:visibility="gone"
        />
        
        <ListView android:id="@android:id/list"
            android:layout_width="fill_parent"
            android:layout_height="wrap_content"
            android:dividerHeight="10dp"
            android:divider="#e0e0e0"
        />
        
    </LinearLayout>

There are couple of things to note in this new bit of code we added to the layout XML file.  

* `android:visibility` &mdash; notice that we've added this attribute to the *No Data Label* `TextView`. 
The reason for this is that we don't really want to show that label, if there is some tweet data available.  
* `android:id="@android:id/list"` &mdash; while you might be privy about the `android:id` from one of our 
previous lessons, but what we are using here is a pre-defined id value that is provided by the Android SDK. 
We will find out its use shortly.

That should take care of the Tweet list layout for now. Further up, we will wire in the required code for each of
the *row items* and the backing `Activity`.