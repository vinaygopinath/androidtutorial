We will create a basic login screen. Our purpose for now will be to familiarise ourselves with
some basics of UI handling, and how to tie together the interaction between UI elements and
the `Activity` class.

To start with, let's remove that not-so-good-looking default header that is appearing at the top of
your screen. To do this, open your `AndroidManifest.xml` file, and add the following to the `activity` 
tag corresponding to your `MainActivty` &mdash; `android:theme="@android:style/Theme.NoTitleBar"`. 

*Styling*/*Theming* your app can be done in many ways. One of the ways is to apply pre-defined styles in the Manifest file, like we
just did. Other ways to accomplish it is to add style declarations in the `styles.xml` file placed in the `/res/values` folder. Of 
course, you can also achieve styling in a programmatic manner, but from performance and separation-of-concerns perspective, that is
generally frowned upon.

Now let's open the **layout XML** file for our activity class. If you chose the default setting to create your app, you'll find
the file `activity_main.xml` located in the `/res/layout` folder. The name of your layout file might be different depending on
what you chose to name it initially, but it will always be located within this folder.

By default, you'll find a `RelativeLayout` element, with a `TextView` element contained in it. At this point, it might be a good
idea for you to go brush up your knowledge about [Layouts](http://codelearn.org) and the [basic views](http://codelearn.org), like 
&ndash; text, edit, image and button.

The basic screen layout that we will be creating would look something like this &mdash;

<img src="https://dl.dropboxusercontent.com/u/1166125/codelearn/Screen%20Shot%202013-10-21%20at%206.50.47%20PM.png" 
    style="box-shadow: 1px 1px 1px #c2c2c2" alt="Android console">

As an Android developer, you should keep in mind that there are usually more than one way of creating the same UI. A bit like
the way it is with HTML. However, amongst the multiple ways, the *better* way is usually the one which is *less verbose* and is 
*less redundant*. While these guidelines can be applied to HTML as well, there are some Android specific design factors you 
need to bear in mind &mdash;

* Minimise the dependency of using absolute measurements like `dp` to specify dimensions. The more you use it, the more
are the chances of your app to render differently on different screen sizes.
* `LinearLayout`s generally render faster than `RelativeLayout`s. This is because Android needs to do additional computation to
figure out all the dependencies associated with a `RelativeLayout`. (Although you'll certainly encounter many situations where
a `RelativeLayout` is the only way out.)