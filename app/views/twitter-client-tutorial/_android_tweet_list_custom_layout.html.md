# Custom Layout for individual tweet

In last lesson, we learnt how to show up a basic ListView with one line data. We need the tweet list to look like as below 

![Tweet List Mockup](/assets/twitter-client/row-tweet-screenshot.png "Tweet List Mockup")
![Tweet List Layout Breakdown](/assets/twitter-client/row-tweet-layout-breakdown.png "Tweet List Layout Breakdown")

We used the Android in-built layout `android.R.layout.simple_list_item_1` to get the individual tweet row in the last lesson. This time, we will build our own layout for each tweet. In next lesson, we will hook it up with ListView to get the final output.

* Right click on `CodelearnTwitterApp` project in Eclipse package Explorer. Select New -> Other. In the popup window, select 'Android XML Layout File'. In the next window, you need to specify the name. Lets give it the name 'row_tweet.xml'. By default, 'LinearLayout' will be picked which is fine as the Outer layout is LinearLayout as per our plan. But this layout is Vertically oriented by default. We need to change the layout to be Horizontally aligned. Hit 'Finish'. Go to res -> layout -> row_tweet.xml. Make the changes as below.

`row_tweet.xml`
<pre>
&lt;?xml version="1.0" encoding="utf-8"?&gt;
&lt;LinearLayout xmlns:android="http://schemas.android.com/apk/res/android"
    android:layout_width="match_parent"
    android:layout_height="match_parent"
    android:orientation="<strike>vertical</strike><span class="highlight">horizontal</span>" &gt;
    
&lt;/LinearLayout&gt;
</pre>

* The LinearLayout element is what is 'Outer LinearLayout' in our planned view. It has its children aligned horizontally. Lets update the value. Also, it has two children - ImageView and LinearLayout. LinearLayout in-turn has three TextView as children.

We are adding ImageView first time here. We are going to use Graphical Layout this time. Get [user_profile.png](/assets/user_profile.png) image, right click & save it inside res -> drawable-ldpi folder. We need to provide the path to image when we add the ImageView.

Click on row_tweet.xml. Navigate to 'Graphical Layout' tab. Inside 'Palette' on the left hand side, go to 'Image & Media'. Drag 'ImageView' to the layout window. Choose 'user_profile' in the list of items & hit 'Ok'.

![Login screen Layout overview](/assets/twitter-client/image_selection.png)

You should see the image added in the layout. 

![Login screen Layout overview](/assets/twitter-client/image_view.png)

For adding LinearLayout, go to 'Layouts' tab, drag LinearLayout(Vertical) next to the image we added in the previous step. 
Now, go to 'Form Widgets', drag 'Large Text' for heading inside the LinearLayout, drag 'Medium Text' for body & 'Small Text' for date. Each of the element will be placed one below another. 

![Login screen Layout overview](/assets/twitter-client/vertical_text_align.png)

If you are not able to get it structure it properly, dont worry ! Just go to the other tab which says 'row_tweet.xml'. You will see the XML code. Instead of modifying/refining XML attributes in the Graphical Layout, we will be doing so directly in XML. Modify it as shown below 

`row_tweet.xml`
<pre>
&lt;?xml version="1.0" encoding="utf-8"?&gt;
&lt;LinearLayout xmlns:android="http://schemas.android.com/apk/res/android"
           android:layout_width="match_parent"
           android:layout_height="match_parent"
           android:orientation="<strike>vertical</strike><span class="highlight">horizontal</span>" &gt;

        &lt;ImageView
           android:id="@+id/imageView1"
           android:layout_width="<strike>wrap_content</strike><span class='highlight'>100dp</span>"
           android:layout_height="<strike>wrap_content</strike><span class='highlight'>100dp</span>"
           android:src="@drawable/user_profile"
		   <span class="highlight">android:layout_marginLeft="5dp"
           android:layout_marginTop="5dp"</span> /&gt;
		

	&lt;LinearLayout
           android:layout_width="wrap_content"
           android:layout_height="match_parent"
           android:orientation="vertical" 
           <span class="highlight">android:layout_marginLeft="10dp"
		   android:gravity="left"</span> &gt;
		

        &lt;TextView
            android:id="@+id/textView1"
            android:layout_width="<strike>wrap_content</strike><span class='highlight'>fill_parent</span>"
            android:layout_height="wrap_content"
            android:text=<strike>"Large Text"</strike><span class="highlight">"Header Text"</span>
            <strike>android:textAppearance="?android:attr/textAppearanceLarge"</strike>
			<span class="highlight">android:textSize="19sp"
            android:textColor="#222222"
            android:textStyle="bold"</span> /&gt;
	

        &lt;TextView
            android:id="@+id/textView2"
            android:layout_width="<strike>wrap_content</strike><span class='highlight'>fill_parent</span>"
            android:layout_height="wrap_content"
            android:text=<strike>"Medium Text"</strike><span class="highlight">"Tweet body text here"</span>
            <strike>android:textAppearance="?android:attr/textAppearanceMedium"</strike>
			<span class="highlight"> android:layout_marginTop="5dp"
            android:ellipsize="end"
            android:lines="3"
			android:textColor="#666666"                                                
            android:textSize="14sp"</span> /&gt;
	

        &lt;TextView
            android:id="@+id/textView3"
            android:layout_width="<strike>wrap_content</strike><span class='highlight'>fill_parent</span>"
            android:layout_height="wrap_content"
            android:text=<strike>"Small Text"</strike><span class="highlight">"20 Nov 2013"</span>
            <strike>android:textAppearance="?android:attr/textAppearanceSmall"</strike>
			<span class="highlight">android:layout_marginTop="5dp"
            android:textColor="#999999"
            android:textSize="12sp"</span> /&gt;
	

  &lt;/LinearLayout&gt;


&lt;/LinearLayout&gt;
</pre>

What we have done is to style the elements to look nice. We have provided the values but you can always fiddle with them to see how it looks. Going back to 'Graphical Layout' tab will show you the final view for the Layout. 


![Login screen Layout overview](/assets/twitter-client/twitter_tweet.png)

> We have not yet hooked the new layout with ListView. But you still need to run the app for our server to know that you have done this lesson right. Sorry for the inconvenience :)
