# Hooking up Login to 'No Tweet Found' Activity

We created a login button listener which simply updated the button label to 'I am Clicked' from 'Login'. Ideally, post login, the user should be able to see the tweets. We need to create a new Activity for that. Let us just create an empty Activity which showed 'No Tweets found'. 

## Creating new Activity 

* Inside Eclipse, right click on the 'CodelearnTwitterApp' project,navigate to New -> Other ->Expand 'Android' dropdown -> Select 'Android Activity'. Click Next.

* Select 'Blank Activity'. Click Next.

* Specify Activity Name as 'TweetListActivity' (the Activity is supposed to show the tweets hence the name), Layout Name will automatically gets populated as 'activity_tweet_list' which is good. Click Finish.

* The new Activity is created. We need to create a string value. Navigate to res -> values -> strings.xml . Inside 'Resources' tab, click on 'Add', select 'String', on the right side under 'Attribute for String', put Name as 'no_tweet_found' & Value as 'No Tweet Found'. Hit 'Control S' to save the file.

* Now the new string field need to be added in the activity_tweet_list.xml . Go to res -> layout -> activity_tweet_list.xml . It is by default showing 'Hello World' through `@string/hello_world`. Change it to @string/no_tweet_found . Save file & click on 'Graphical Layout' tab. You should see 'No Tweet Found' in the output preview.

![Login screen Layout overview](/assets/twitter-client/no_tweet_found.png)

## Hooking new Activity to Login

Now that we are done creating new Activity, we need to show the activity on the click of Login button. We need to use **Intent** for this. Intent is a way of navigating app flow from one Activity to another. Read more about Intents [here]()

* We need to hook up the TweetActivity to show up after MainActivity once the Login button is clicked. We do so using Intent. We need to change a bit of code here.

`MainActivity.java`
<pre>
loginBtn.setOnClickListener(new View.OnClickListener() {
      @Override
      public void onClick(View v) {
	  	<strike>_loginBtn.setText("I am Clicked");</strike>
		<span class="highlight">//Add following lines
		Intent intent = new Intent(MainActivity.this, TweetListActivity.class);
		startActivity(intent);</span>
      }
  });
</pre>

Please import the package **android.content.Intent** for using Intent class in your java code.

Great. You are all set now. Run the app. You should see the Login screen. Hit on the Login button & you should see 'No Tweet Found' screen that you built before. 

You just learnt to use Intents in Android. Take a break & celebrate. 
