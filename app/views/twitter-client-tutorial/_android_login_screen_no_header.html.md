We will create a basic login screen. Our purpose for now will be to familiarise ourselves with
some basics of UI handling, and how to tie together the interaction between UI elements and
the `Activity` class.

It is going to look something like this&mdash;

![Login Screen Final](https://dl.dropboxusercontent.com/u/1166125/codelearn/Screen%20Shot%202013-10-21%20at%206.50.47%20PM.png "Login Screen Final")

But before we get to it, let's do a small styling change which will make the app look a lot better. We
will be removing that annoying and not-so-good-looking default header, that appears on the screen.
To do this, open your `AndroidManifest.xml` file, and add the following to the `activity` 
tag corresponding to your `MainActivty` &mdash; `android:theme="@android:style/Theme.NoTitleBar"`. 

>Styling*/*Theming* your app can be done in many ways. One of the ways is to apply pre-defined styles in the Manifest file, like we
just did. Other ways to accomplish it is to add style declarations in the `styles.xml` file placed in the `/res/values` folder. Of 
course, you can also achieve styling in a programmatic manner, but from performance and separation-of-concerns perspective, that is
generally frowned upon.
