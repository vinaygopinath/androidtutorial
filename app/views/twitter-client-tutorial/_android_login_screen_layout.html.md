Now let's open the **layout XML** file for our activity class. If you chose the default setting to create your app, you'll find
the file `activity_main.xml` located in the `/res/layout` folder. The name of your layout file might be different depending on
what you chose to name it initially, but it will always be located within this folder.

By default, you'll find a `RelativeLayout` (explained in a bit) element, with a `TextView` element contained in it. 

Every screen in the app will invariably have one or more `Layout` elements. The most prevalent amongst them are `LinearLayout`, `RelativeLayout`
and the `GridLayout`. The purpose of these layout elements is to provide a container within which other elements corresponding to text labels, 
text boxes, buttons, etc, can be contained. In our app, we will primarily be making use of the `LinearLayout` and `RelativeLayout` elements. 

>At this point, it might be a good idea for you to go brush up your knowledge about [Layouts](http://codelearn.org) and the [basic views](http://codelearn.org), like &ndash; text, edit, image and button.

An important consideration when dealing with layout elements is when is it good to use which layout element. The `LinearLayout` is optimized for
situations where child elements need to be rendered one after the other from top to bottom, or left to right. That is why the `LinearLayout` has
an attribute called `orientation`, which instructs the platform to render the child elements either in `horizontal` or `vertical` fashion. 

A `RelativeLayout` on the other hand, allows for a more random arrangement of child elements. Child elements can be arranged *relative* to each other.
This allows you to have a more flexible design layout approach. 

The following figure should give you an understanding when to choose between either of them &nbsp;

![Relative and Linear Layout Difference](https://dl.dropboxusercontent.com/u/1166125/codelearn/Screenshot%202013-12-01%2018.55.47.png "Relative and Linear Layout Difference")

One important point to note is that in almost every circumstance, `RelativeLayout` and `LinearLayout` can be used to replace the other. However, in
general, it is usually much more verbose to do it. In some cases, if the layout is fairly simple, it really doesn't matter which one you choose.

Our login screen is something that is quite simple, and thus, you'll see that we're making use of `RelativeLayout` even when we could have used a 
`LinearLayout`. The basic screen layout that we will be creating would look something like this &mdash;

![Login screen Layout overview](https://dl.dropboxusercontent.com/u/1166125/codelearn/Screenshot%202013-12-01%2018.42.12.png "Login screen Layout overview")

The XML code for the layout file is as follows &mdash;

    <RelativeLayout xmlns:android="http://schemas.android.com/apk/res/android"
        xmlns:tools="http://schemas.android.com/tools"
        android:layout_width="match_parent"
        android:layout_height="match_parent"
        android:background="@android:color/white">
        
        <TextView android:id="@+id/header"
            android:layout_width="fill_parent"
            android:layout_height="wrap_content"
            android:text="@string/hdr_title" 
         />
        
        <LinearLayout android:id="@+id/uname_block"
            android:layout_width="wrap_content"
            android:layout_height="wrap_content"
            android:layout_below="@id/header"
            android:orientation="horizontal">


            <TextView android:id="@+id/username"
                android:layout_width="wrap_content"
                android:layout_height="wrap_content"
                android:text="@string/lbl_username"
             />
            
            <EditText
                android:id="@+id/fld_username"
                android:layout_width="200dp"
                android:layout_height="wrap_content"
                android:hint="@string/lbl_enter_username"
            />
            
        </LinearLayout>
        
        <LinearLayout android:id="@+id/pwd_block"
            android:layout_width="wrap_content"
            android:layout_height="wrap_content"
            android:layout_below="@id/uname_block"
            android:orientation="horizontal">
        
            <TextView android:id="@+id/pwd"
                android:layout_width="wrap_content"
                android:layout_height="wrap_content"
                android:text="@string/lbl_pwd"
             />
            
            <EditText
                android:id="@+id/fld_pwd"
                android:layout_width="200dp"
                android:layout_height="wrap_content"
                android:hint="@string/lbl_enter_pwd"
             />
            
        </LinearLayout>
        
        <Button
            android:id="@+id/btn_login"
            android:layout_width="290dp"
            android:layout_height="wrap_content"
            android:layout_below="@id/pwd_block"
            android:text="@string/lbl_login"
         />

    </RelativeLayout>



