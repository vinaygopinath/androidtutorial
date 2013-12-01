Now that we've got the basic layout in place, it's time to concentrate on making our screen look
the way it should.  

In Android, there are some very basic attributes that can be applied on views and layouts to control
the placement and styling of elements. Let's briefly go through them &mdash;

`android:padding` &ndash; this provides an internal spacing between the edge of the element on which
it is applied, and the outer edge of the child elements.  
`android:margin` &ndash; quite similar to padding, but it applies the spacing between the edge of the 
element it is applied on and the edge of its container.  
`android:background` &ndash; a colour or some image that you want to apply as the background of the 
view.  
`android:textStyle`, `textSize`, `textColor` &ndash; basic styling of text written in views.  
`android:gravity` &ndash; for positioning all child elements within a containing view (usually a `Layout`).
Using this, the child element can be positioned to be at the top, bottom, center, etc.  
`android:layout_gravity` &ndash; similar to gravity, but this is applied to child elements for positioning
them within the parent container. It overrides the gravity attribute if it is set on the parent.  
`android:layout_centerHorizontal` &ndash; child elements of a `RelativeLayout` can use this to position
themselves along some predefined alignments. There are other similar attributes like `centerVertical`,
`centerInParent`, etc.  
`android:hint` &ndash; this is only applied to `EditText` views. It provides a placeholder text for the 
textbox.  
`android:inputType` &ndash; again applied only to `EditText` views. It provides an indication to the Android
platform for customising the in-screen keyboard that shows up to customise itself. For example, in case of 
numerical input, only the numbers will show up. Then there's a layout for email IDs.  

>What you see here are but a handful of attributes that you'll need to deal with. However, going forward, it
is strongly urged that you refer our concept lessons about views. In them, you will find a detailed explanation
about a much wider set of attributes that can be applied to views.

But besides all these, one attribute that deserves special mention is the `android:id` attribute. It is 
typically used in 2 ways &mdash;  

* *Unique Identification* &ndash; when an element in the layout file needs to be uniquely identified, the
`id` attribute has a form of - `"@+id/some_id"`. This element can then be accessed using `some_id` within
the layout file and the corresponding `Activity` class (covered later).  
* *Binding to Android Support Classes* &ndash; the Android framework provides some special classes, like 
`ListActivity`, which can automatically bind to a list element defined in a layout file (We will be covering
this later). In such cases, the `id` attribute has a form - `"@android:id/some_id"`.  

In addition to all this, there are times when an element having a unique ID needs to be referenced from another
element within that layout file. This typically occurs when using `RelativeLayout`, where you need to position
one element in reference to another. In that case, the referred ID is usually mentioned as `"@id/some_id"` (Notice
that we do NOT use the `+` symbol here). 

Alright, so coming back to the layout file for the login screen&mdash;we should now go ahead and *decorate* it a bit.
Use the following snippet to style your bare-bones layout file, and admire the difference.  

    <RelativeLayout xmlns:android="http://schemas.android.com/apk/res/android"
        xmlns:tools="http://schemas.android.com/tools"
        android:layout_width="match_parent"
        android:layout_height="match_parent"
        android:background="@android:color/white">
        
        <TextView android:id="@+id/header"
            android:layout_width="fill_parent"
            android:layout_height="wrap_content"
            android:padding="10dp"
            android:text="@string/hdr_title" 
            android:textSize="20sp"
            android:textColor="@android:color/white"
            android:textStyle="bold"
            android:background="#963FD5"
         />
        
        <LinearLayout android:id="@+id/uname_block"
            android:layout_width="wrap_content"
            android:layout_height="wrap_content"
            android:layout_centerHorizontal="true"
            android:layout_below="@id/header"
            android:layout_marginTop="25dp"        
            android:orientation="horizontal">


            <TextView android:id="@+id/username"
                android:layout_width="wrap_content"
                android:layout_height="wrap_content"
                android:text="@string/lbl_username"
                android:textSize="16sp"
                android:textColor="@android:color/black"
                android:layout_gravity="center_vertical"
             />
            
            <EditText
                android:id="@+id/fld_username"
                android:layout_width="200dp"
                android:layout_height="wrap_content"
                android:hint="@string/lbl_enter_username"
                android:layout_marginLeft="8dp"
                android:inputType="textEmailAddress"
                android:paddingLeft="5dp"
                android:textSize="13sp"
                android:layout_gravity="center_vertical" />
            
        </LinearLayout>
        
        <LinearLayout android:id="@+id/pwd_block"
            android:layout_width="wrap_content"
            android:layout_height="wrap_content"
            android:layout_below="@id/uname_block"
            android:layout_centerHorizontal="true"
            android:layout_marginTop="25dp"        
            android:orientation="horizontal">
        
            <TextView android:id="@+id/pwd"
                android:layout_width="wrap_content"
                android:layout_height="wrap_content"
                android:text="@string/lbl_pwd"
                android:textSize="16sp"
                android:textColor="@android:color/black"
                android:layout_gravity="center_vertical"
             />
            
            <EditText
                android:id="@+id/fld_pwd"
                android:layout_width="200dp"
                android:layout_height="wrap_content"
                android:hint="@string/lbl_enter_pwd"
                android:layout_marginLeft="8dp"
                android:inputType="textPassword"
                android:paddingLeft="5dp"
                android:textSize="13sp"
                android:layout_gravity="center_vertical" />
            
        </LinearLayout>
        
        <Button
            android:id="@+id/btn_login"
            android:layout_width="290dp"
            android:layout_height="wrap_content"
            android:layout_below="@id/pwd_block"
            android:layout_centerHorizontal="true"
            android:gravity="center"
            android:layout_marginTop="15dp"
            android:text="@string/lbl_login"
            android:textSize="13sp"
            android:textStyle="bold" />

    </RelativeLayout>
