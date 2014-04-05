# Writing login data to Shared Preference

Shared Preference is a good place to store app specific data that exist in key value pair. It is the easiest form of local storage available in an Android app. 

We first obtain handle to the Shared Preference through the code snippet below 

    SharedPreferences prefs = getSharedPreferences("codelearn_twitter", MODE_PRIVATE)

`getSharedPreferences()` method takes two arguments. The first string denotes preference name. It should be different for different apps. The second string `MODE_PRIVATE` specifies that the preferences are private & other apps can not access these values.

To write or read from Shared Preferences, you first need to get handle to the Shared Preference Editor. 
 
    Editor edit = prefs.edit();

To write a key value pair to Shared Preference, use the code below

<pre>edit.putString("<i>key</i>","<i>value</i>");
edit.commit();</pre>

To read from Shared Preference, you can do this

<pre>prefs.getString("<i>key</i>", null);</pre>

The second argument 'null' specifies what to return if no entry with *key* found. It makes sense to keep it null.

### Assignment - write username & password to Shared Preference

In the previous assignment, you grabbed the username & password field & dumped them in LogCat. Now go ahead & write the username & password to Shared Preference.

<p class="text-error">You need to provide preference name as 'codelearn_twitter' else our tests will be unable to access SharedPreference & figure out if you are actually writing username & password to it</p>

