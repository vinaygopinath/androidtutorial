# Adding Username label & input field

In previous lesson, we got the header in place. This lesson we will put the input fields namely username & password. 

As per plan, we will be using horizontally aligned LinearLayout to hold the label 'Username' & the input field together & next to each other. Label is **TextView** element while input field is **TextEdit** in Android. 

Lets get to work. 

## Add the LinearLayout after 'Hello Twitter'. 

> See if adding through Graphical Layout is easier

`res/layout/activity_main.xml`

<pre>
&lt;RelativeLayout ...
  .
  .

  &lt;TextView
        android:layout_width="fill_parent"
        android:layout_height="wrap_content"
        android:text="@string/hello_world" /&gt;

  <span class="highlight">&lt;LinearLayout android:id="@+id/uname_block"
        android:layout_width="wrap_content"
        android:layout_height="wrap_content"
        android:layout_below="@id/header"
        android:orientation="horizontal"&gt;  
  &lt;/LinearLayout&gt;</span>
  .
&lt;/RelativeLayout&gt;
</pre>

The LinearLayout is given id **uname_block** & it is positioned below the 'Hello Twitter' header represented by id 'header' through the **layout_below** attribute. The **orientation** is kept horizontal as the child elements label & input field need to be arranged next to each other. **layout_width** & **layout_height** are given default values 'wrap_content'.

## Add Username label & text field

`res/layout/activity_main.xml`

<pre>
&lt;RelativeLayout
 .
 .
 .
	&lt;LinearLayout android:id="@+id/uname_block"
			android:layout_width="wrap_content"
			android:layout_height="wrap_content"
			android:layout_below="@id/header"
			android:orientation="horizontal"&gt;  

			<span class="highlight">&lt;TextView android:id="@+id/username"
				android:layout_width="wrap_content"
				android:layout_height="wrap_content"
				android:text="@string/lbl_username"
			 /&gt;

			&lt;EditText
				android:id="@+id/fld_username"
				android:layout_width="wrap_content"
				android:layout_height="wrap_content"
				android:hint="@string/lbl_enter_username"
			/&gt;</span>

	&lt;/LinearLayout&gt;
 .
 .
&lt;/RelativeLayout&gt;
</pre>

The Username has id 'username' & the text is rendered from the string 'lbl_username'. The input field has id 'fld_username' & the hint is rendered from string 'lbl_enter_username'. We need to add the strings entry too. 


`res/values/strings.xml`

<pre>
&lt;resource&gt;
 .
 .
 <span class="highlight">&lt;string name="username"&gt;Username&lt;/string&gt;
 &lt;string name="lbl_enter_username"&gt;Enter your username&lt;/string&gt;</span>
&lt;/resource&gt;
</pre>

Once done, run the app. It should look like below.

[Insert Image]

Ideally, we like the 'Username' label & input field to be *positioned/styled* better but let us first complete the basic structure first & then we will worry about positioning it to look nice.
