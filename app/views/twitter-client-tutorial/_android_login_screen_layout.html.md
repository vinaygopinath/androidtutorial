# Login Screen Layout

So far, we already have a hello world application. In the earlier lesson, we have seen how the control starts from the `onCreate` function of the **MainActivity.java** file and how it renders the layout defined in **activity_main.xml** . 

In this lesson, we will start with designing the Login screen layout. A good way to start is by editing the **activity_main.xml** file. The onCreate function will still render the same XML file and hence we do not need to change any logic/code inside the **MainActivity.java** file. In the XML file, by default you see a **RelativeLayout** element with **TextView** element inside it as shown below.
 
    <RelativeLayout ...
	    .
		.>

		<TextView ..
		 .
		 .>

    </RelativeLayout>


The RelativeLayout element is the container for the UI element, where as TextView is a UI element. The TextView elements are placed relative to the parent or sibling element in Relative Layout. To read about Layouts in detail, head over to [this lesson]().

Now,we are going to modify the same **activity_main.xml** file . The final screenshot & the pictorial representation of the Graphical Layout is shown below.

![Login screen Layout overview](/assets/twitter-client/login-screenshot.png "Login screen Layout overview")
![Login screen Layout overview](/assets/twitter-client/login-screen-pictorial.png "Login screen Layout overview")

For this, we need to make two changes. First, lets make the text 'Hello World' span the complete screen width by changing layout_width to 'fill_parent'. Second, we update 'Hello World' to 'Hello Twitter' in strings.xml

`res/layout/activity_main.xml`

<pre>
&lt;RelativeLayout ...
  .
  .

  &lt;TextView
        android:layout_width="<strike>wrap_content</strike>fill_parent"
        android:layout_height="wrap_content"
        android:text="@string/hello_world" /&gt;
  .
&lt;/RelativeLayout&gt;
</pre>

`res/values/strings.xml`

<pre>
    &lt;string name="hello_world"&gt;Hello <strike>world!</strike>Twitter&lt;/string&gt;
</pre>

What we have done is a little sub-optimal. We still have the string field name as 'hello_world' but its value is now 'Hello Twitter'. Ideally, we should have changed the string field name to 'hello_twitter' too. You can go ahead & do the change if you like to. 

After doing the changes, save both the files by hitting 'Control S' on Windows or 'Command S' on Mac. Run the app & the app should look like as below.

![Login screen Layout overview](/assets/twitter-client/hello-twitter.png)
