The next thing to handle in our **Login Screen** is to wire in the logic of capturing the click of the **Login** button. 
As of now, we will *not* be adding any validation or processing at the code level after capturing the click of a button. 
We will simply take the user to the next screen to display the list of tweets.

To get started on this, we will register a [`ClickListener`](http://codelearn.org) with the login button. 

A `ClickListener` is a callback facility provided by the Android framework to allow you to write in the logic to handle events
that happen on the *main UI thread* in an asynchronous manner. Almost every view element in an app's screen can have a callback
`ClickListener` associated with it. The general approach is to implement an [**Anonymous Inner Class**](http://docs.oracle.com/javase/tutorial/java/javaOO/anonymousclasses.html) implementation for the `ClickListener` and pass it to the callback method.

>It is best that you take a dig in our concept lessons to understand the flow around the **Main UI thread** and how views can
be set up to handle user clicks. There's really not a lot going on in there, but it is best to wrap your head around the basics
at this point.

Now coming back to your `MainActivity` class, you'll need to obtain a reference to the button you defined in the layout file. 
This is where the `android:id` attribute assigned to your button in the layout XML file will come in handy. The basic code to otain the 
reference is as follows &mdash;

    Button _loginBtn = ( Button ) findViewById(R.id.btn_login);

Here the `Button` class is provided by the framework &ndash; android.widget.Button &ndash; and you can use it to invoke a bunch of 
methods that can modify the behaviour or state of the button. The `findViewById` method is like a lookup function that looks into your
layout file, and retrieves the `View` instance associated with the ID you pass. You need to cast &ndash; `( Button )` &ndash; into a `Button` 
reference. Here the `R.id.btn_login` is an auto-generated encapsulation that the Android framework provides for all view IDs at a code level. 
Basically, whenever you compile your Android application, it generates a file called the `R.java`. This file contains all the IDs that 
you've defined in all your Layout files, and associates a Hex value with them. At runtime, these Hex values are used to provide a binding 
between the Java code and the XML elements.

Finally, the code to bind the click listener with your `Button` reference is as follows &mdash;

    _loginBtn.setOnClickListener(new View.OnClickListener() {

            @Override
            public void onClick(View v) {
                // Your logic goes in here
            }
            
        });
