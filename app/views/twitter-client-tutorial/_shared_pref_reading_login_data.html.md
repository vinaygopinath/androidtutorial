# Reading Login data from the View 

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

Hint: Make sure you read username & password before the Activity from intent is started else findViewById(..) will not be able to find the elements you are expecting.
