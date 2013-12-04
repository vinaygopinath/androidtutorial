Let us now shift our focus to each of the single *row items* that would make up our Tweets `ListView`. 

>Just in case you feel you need to refresh your understanding of how a `ListView` is structured in Android, 
feel free to take your time to refer the [short introduction to `ListView`](http://androidconceptlessons.herokuapp.com/android-app-tutorial/twitter/tw_app06) we covered before.  

Alright, now assuming you are familiar with how a `ListView` is comprised of individual *row items*, which 
in-turn are defined in their own layouts, we need to go about creating the layout file. Thankfully, we only
need to create one single layout file for a row item, which the Android SDK will keep on reusing for rendering
every single row in the `ListView`. This feature allows us a good deal of flexibility and modularity in keeping
the complexity of defining each row's layout separate from the main `ListView`. We will do a good deal with this
flexibility as our app shapes up.

But for now, let us create a basic layout file &ndash; `row_tweets.xml` &ndash; to display simple text in each row &mdash;

    <?xml version="1.0" encoding="utf-8"?>
    <LinearLayout xmlns:android     ="http://schemas.android.com/apk/res/android"
        android:layout_width        ="match_parent"
        android:layout_height       ="match_parent"
        android:orientation         ="horizontal"
        android:padding             ="10dp" >

        <TextView android:id            ="@+id/row_title"
            android:layout_width        ="fill_parent"
            android:layout_height       ="fill_parent"
            android:textSize            ="16sp"
            android:padding             ="10dp"
            android:layout_gravity      ="center_vertical"
            android:layout_marginLeft   ="10dp"

    </LinearLayout>


That should be all that is required for each of the *row items* for now.


