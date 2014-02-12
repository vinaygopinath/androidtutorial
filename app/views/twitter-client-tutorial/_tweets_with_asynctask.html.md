# Reading/Writing tweets with AsyncTask

In last lesson, we first wrote tweets to a file & later read from file to display it on Tweet List screen. In real scenario, this is how it happens.

1. When the screen loads, network call to fetch tweets is initiated. **The network call to fetch is asynchronous so that the Activity process is not blocked.** The user sees some kind of loading sign on the screen. 

2. Activity process reads the locally stored (stale) tweets & show them on the screen.

3. When the network call ends & new tweets are fetched, a fresh tweet array is created & the tweet list on the screen is re-created. The loading sign is hidden.

4. The new set of tweets are written to the file asynchronously so that the new tweets can be shown to the user ASAP. 

In this lesson, we will write tweets to the file & read from file asynchronously using **AsyncTask**. We will not be doing network calls.

## AsyncTask intro & usage

As mentioned, AsyncTask class lets us execute things in parallel. It is like spawning a new thread which does things in parallel & exits silently when the tasks are done. This is important not to *block* the main Activity thread. Doing time taking things in the main Activity thread will lead to a *hung app*. If the user is expecting a new screen to load on a button click, the app will go non-responsive for sometime. 

The right way to use AsyncTask is by extending it. It has a function `doInBackground()` which does the real job for you. 

<pre>
private class MyAsyncClass extends AsyncTask {
		@Override
		protected Void doInBackground() {
		  //do your background job
		  return null;
		}
}
</pre>

To execute the task, we simply do

     MyAsyncClass().execute()

In case you need to pass parameters to the class, you can do it as below
<pre>
private class MyAsyncClass extends AsyncTask<span class="highlight">&lt; <i>parameter 1 type</i>, <i>parameter 2 type</i> &gt;</span> {
		@Override
		protected Void doInBackground(<span class="highlight">param1, param2</span>) {
		  //do your background job
		  return null;
		}
}

<span class="highlight">MyAsyncClass().execute(param1, param2)</span>

</pre>



### Assignment 1 - Modify TweetListActivity.java to use AsyncTask

This is going to be a long assignment. So get yourself a cup of coffee before you get started. 

** 1. Create renderTweets() function ** 

To keep things modular. Let us first create a member function in TweetListActivity class **renderTweets()** as 

`TweetListActivity.java`

     public void renderTweets() {
	 	tweets = readTweets()
	 	//render them on the screen
	 }

The onCreate() function needs to be modified to use renderTweets() by moving all the rendering code inside the function. We have created this function because it will be used at two places - inside onCreate() as well as by AsyncTask class which will write new tweets & then call the function to recreate the tweet list. 

** 2. Call writeTweets() through AsyncTask **

Modify writeTweets() function that we created in previous lesson which wrote random tweets to the file. We need to execute this function asynchronously. Time to extend AsyncTask.

Create a new class in the project. Name it AsyncCacheUpdate.java . Its content will look as below.

     public class AsyncCacheUpdate extends AsyncTask {
	    
		 @Override 
		 protected Void doInBackground() {
		   //introduce a 5 sec sleep to simulate network call
		   //move the code to create dummy tweets from TweetListActivity here
		   writeTweets(tweets)
		   renderTweets()
		 }
	 }

** 3. Modify onCreate() in TweetListActivity to use renderTweets() & AsyncCacheUpdate

`TweetListActivity.java`

<pre>
protected Void onCreate(..) {
  //remove code to create dummy tweets as it is already moved to doInBackground()
  AsyncCacheUpdate().execute();

  //remove the code to create tweets as it is already moved to renderTweets()
  renderTweets();
  .
  .
}
</pre>

** 4. Handle first load scenario

When the first time the app loads, there will not be any tweets in the file & readTweets() will return empty. 
