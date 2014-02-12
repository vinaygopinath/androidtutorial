# Storing login data in Shared Preference

In a Twitter client, once you are logged in, you will not see the login screen again. The app sends the username password information to the server, receives an authentication token & store it locally in the phone. The next time you open the app, it checks for the authentication token & directly takes to the tweet list screen.

We are introducing data handling in this module. The network calls will be introduced in the subsequent module. We make things a little sub-optmial. Instead of sending data to the server & getting an authentication token, we will simply be storing the username password from the login screen & store it locally. 

## Recap from module 1

Quick recap from module 1. The login screen is served by MainActivity.java . The login fields - username, password & login button - are defined in activity_main.xml . 

A login button listener gets called when login button is clicked. We had earlier put the intent code inside the listener to navigate to the tweet list screen on login button click 

	_loginBtn.setOnClickListener(new View.OnClickListener() {
			  @Override
			  public void onClick(View v) {
				.
				// processing after button click happens here
				.
			  }
	});

## Reading the login data

The username & password are stored inside appropriate **EditText** View elements. Each element has its own `android:id` attribute. The data can be read using `findViewById` function as

<pre>EditText username = ( EditText ) findViewById(R.id.<i>id_of_the_username_field</i>)</pre>

`username` field now holds the EditText object. To get the text value from the View, we will use `getText()` method of EditText View element. 

<pre>String usernameValue = username.getText().toString();</pre>

`toString()` function converts the text value to string. 

### Assignment - read username & password in java code

You should now write code inside `onClick()` function to get username & password in the java code. You can log the values & check them in LogCat by doing

     Log.d("Codelearn", "username caught - " + username)

To know more as to how to dump data & check it in LogCat, head over to [LogCat Concept Lesson]()


## Writing login data to Shared Preference

Shared Preference is a good place to store app specific data that exist in key value pair. It is the easiest form of local storage available in an Android app. 

We first obtain handle to the Shared Preference through the code snippet below 

    SharedPreferences prefs = getSharedPreferences("codelearn_twitter", MODE_PRIVATE)

`getSharedPreferences()` function takes two argument. The first is string & should be unique to the app. The second string `MODE_PRIVATE` specifies that the preferences are private.

To write or read from Shared Preferences, you first need to get handle to the Shared Preference Editor. 
 
    Editor edit = prefs.edit();

To write a key value pair to Shared Preference, use the code below

<pre>edit.putString("<i>key</i>","<i>value</i>");
edit.commit();</pre>

To read from Shared Preference, you can do this

<pre>edit.getString("<i>key</i>");</pre>

### Assignment - write username & password to Shared Preference

In the previous assignment, you grabbed the username & password field & dumped them in LogCat. Now go ahead & write the username & password to Shared Preference. 

### Assignment - modify app flow 

As discussed earlier, once the username & password is stored, the user should not see the login screen again. 

Hint: as soon as you get inside `onCreate()`, the first thing you should do is to check if Shared Preferences has username & password keys. If it has, fire the intent to move to the tweet list view. 

<code>Pseudo Code</code>
<pre>
public class MainActivity extends Activity {
	@Override
	protected void onCreate(Bundle savedInstanceState) {
		<span class="highlight">//check if Shared Preference has username/password keys
		//if keys found {
		    Intent intent = new Intent(MainActivity.this, TweetListActivity.class);
	        startActivity(intent);
		    finish();
		//}</span>
		super.onCreate(savedInstanceState);	
		.
		.
	}
	.
	.
}
</pre>
Replace comments (lines starting with **//**) with actual code to read from Shared Preferences.
