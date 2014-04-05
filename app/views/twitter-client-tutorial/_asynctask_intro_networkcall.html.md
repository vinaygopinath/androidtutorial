# AsyncTask intro

AsyncTask class lets us execute things in parallel. It is like spawning a new thread which does things in parallel & exits silently when the tasks are done. This is important not to *block* the main Activity thread. 

Doing time taking things in the main Activity thread will lead to a *hung app* experience to the user. If the user is expecting a new screen to load on a button click & you perform some time taking tasks which happens before the new screen is rendered, the app will go non-responsive for sometime depending on how *powerful* user's phone is. 

## Using AsyncTask 

The right way to use AsyncTask is by extending it with your own class & overriding the method `doInBackground()`.

<pre>
public class MyAsyncClass extends AsyncTask&lt;<i>Params</i>,<i>Progress</i>,<i>Result</i>&gt; {
	@Override
	protected void doInBackground(<i>Params</i>... <i>params</i>) {
	  //do your background job
	  return null;
	}
}
</pre>

To execute the task, we simply do

     new MyAsyncClass().execute(params)

from the main Activity thread. 

*Params* is the class for parameters passed to `doInBackground(..)`. 

*Progress* is the class for parameters passed to `onProgressUpdate(..)`. The method is over-ridden to pass progress data to main UI thread while the background task runs. It is called from **doInBackground()** with *Progress* class parameters through `publishProgress(progress_data)`.

*Result* is the class for parameters passed to `onPostExecute(..)`. If over-ridden, the method automatically gets called at the end of the background task. It can be used by the main Activity to either refresh the UI with new data, to hide the loading sign or showing a poup that background process is done.

<pre>
public class MyAsyncClass extends AsyncTask&lt;<i>Params</i>,<i>Progress</i>,<i>Result</i>&gt; {
	@Override
	protected <i>Result</i> doInBackground(<i>Params</i>... <i>params</i>) {
	  <i>Progress</i> progress_data;
	  <i>Result</i> result;

	  //while the long job getting done {
	     //update progress_data
		 //update result 
		 publishProgress(progress_data);
	  //}
	  
	  return result;
	}

	protected void onProgressUpdate(<i>Progress</i>... <i>progress_data</i>) {
		//use progress_data to show progress on the screen
	}

	protected void onPostExecute(<i>Result</i>... <i>result</i>) {
		//use result obtained at the end of 
	}
}
</pre>


For a very simple case where you are not passing any paramters to **doInBackground** & not over-riding any of the other methods, simply replace all the parameter classes with **Void** . 

Also note, any UI update should happen in the Activity/main thread. **Updating UI elements from doInBackground() will result in an error. Use onProgressUpdate() & onPostExecute() methods for that as they are executed by the main Activity thread**.


### Assignment - handle simulated network call through AsyncTask

As discussed earlier, a real Twitter app should start a network call in background whenever tweet list screen comes up. In this assignment, you are going to simulate a network call to fetch tweets using AsyncTask. 

Create a new class `AsyncFetchTweets` extending AsyncTask . The `doInBackground()` process in the class should have 

1. Delay of 5 sec to simulate network call using `Thread.sleep(5000)`. 
2. Should have the code to create random tweets.
3. It should write those random tweets to the file.

In other words, move all the code to create random tweets & writing to the file to the AsyncFetchTweets class.

**Gotcha:** `openFileOutput()` can only be called from the main Activity & not from a background thread. 

**Solution:** Pass reference of TweetListActivity as `this` to AsyncFetchTweets. You can either pass it in the constructor (you need to create one) or as `new AsyncFetchTweets().execute(this)`. To open file in AsyncFetchTweet, use `this.openFileOutput()`.

**Note: Our tests check for class name AsyncFetchTweets**. So make sure you name it exactly like that.

There will not be any change in app behavior. The first time tweet screen loads post app installation, it will be empty. From the second time, it will show the list of tweets. **If you have the log after tweets are written to the file, you will see the entry appear in LogCat after 5 sec.**
