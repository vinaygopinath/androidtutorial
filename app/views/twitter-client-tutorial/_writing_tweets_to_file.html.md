# Serializing & writing to local file

** Writing to a local file **

We can create any local file that we want in Android. You can give it any name as you please. Writing to a file is pretty straightforward process with `openFileOutput` class returned by `openFileOutput()`. 

	String FILENAME = "hello_file";
	String string = "hello world!";

	FileOutputStream fos = openFileOutput(FILENAME, MODE_PRIVATE);
	fos.write(string.getBytes());
	fos.close();

`MODE_PRIVATE` creates the file private to the Activity's context. It will be private to your application.

** Writing OBJECTS to local file **

In out case, we are going to dump the array of object. We need `ObjectOutputStream` class for that. It automatically takes care of serializing the data before writing to the file. But before that, we need to ensure that Tweet class is serializable. The class declaration need to implement Serializable

<pre>public class Tweet <span class="highlight">implements Serializable</span></pre>

Dont forget to `import java.io.Serializable` inside Tweet.java .

Also, just to be sure that Java doesn't run into trouble serializing and de-serializing objects of this class, it's generally a good idea to add a default serialization version UID member to the Tweet class.

    private static final long serialVersionUID = 1L;

The sample code now looks like as below.

<pre>
	FileOutputStream fos = openFileOutput(FILENAME, MODE_PRIVATE);
	<span class="highlight">ObjectOutputStream oos = new ObjectOutputStream(fos);
	oos.writeObject(tweets);
	oos.close();</span>
	fos.close();
</pre>

## Assignment - write dummy tweets to a local file

Put the above learning to use & modify TweetListActivity.java code to dump tweets array to a local file before it is passed to TweetAdapter & shown on the screen. 

As a good practice, you should put the name of the file in a private static final variable 

<pre>private static final String TWEETS_CACHE_FILE = "tweet_cache.ser";</pre>

Since it is serialized tweets, we hae put a **.ser** extension. You are free to put any extension that you like to. In your code, you should use TWEETS_CACHE_FILE variable to reference the tweets cached file. 

<p class="text-error">Make sure that you keep the name of the file as <b>tweet_cache.ser</b> else our tests will not be able to check if you are actually writing tweets to a file.</p>

Also note, to use `openFileOutput()` & `ObjectOutputStream()` you need to handle multiple kind of exceptions. You need to put a try catch exception around it. Also to check if you have successfully written to the file, you should put Log .

      try {
	  	//code to write into file
		Log.d("codelearn", "Successfully wrote tweets to the file.");
		//close operators
	  } catch (Exception e) {
	    Log.e("codelearn", "Error writing tweets", e);
	  }
		

after `writeObject()` call & check LogCat output for "Successfully wrote tweets to the file." as shown in the below screenshot.

<%= image_tag "twitter-client/logcat-successfully-written-file.png" %>

There is no change in the app behavior. You will still see the same list of tweets. Just that, now that you are writing the tweets to a file, there will be a marginal delay in the output to appear depending on your phone's processing power. In future lessons, we are going to move this bit to a asynchronous process to remove the delay.
