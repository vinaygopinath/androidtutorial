# Show tweets after AsyncTask

The AsyncTask we created in previous lesson is simply replicating network call to fetch new tweets. We should also be updating the tweet list screen as soon as the new tweets are fetched.

At first, the obvious thing to do is to call parent (TweetListActivity) functions at the end of **doInBackground()** function. But it will result in an error as you can not update View elements from a background thread. We are going to use `onPostExecute(..)` function to do the job. 

Once the background task is over, it can pass data to a member function `onPostExecute(result)`. The data passed **result** is object of type *Result*. Note **doInBackground()** should also have return data type as *Result*

<pre>
 private class MyAsyncClass extends AsyncTask&lt;<i>Params</i>,<i>Progress</i>,<i>Result</i>&gt; {

    protected <span class="highlight"><i>Result</i></span> doInBackground(<i>Params</i>... params) {
	  <span class="highlight"><i>Result</i> result;</i></span>
	  //do background job & populate result
	  <span class="highlight">return result;</span>
	}

	<span class="highlight">protected void onPostExecute(<i>Result</i> result) {
	  //pass result to main UI thread to show the final data
	}</span>
 }
</pre>



## Assignment - update tweets on UI screen from AsyncTask

We are going to call the tweet list update steps twice - one from inside of onCreate() in TweetListActivity & another from AsyncFetchTweets. To keep our code DRY (do not repeat yourself), we should NOT be writing the code, to show the tweets, twice. Rather, we should simply put it in a function & call the same function at the two places.

`TweetListActivity.java`
<pre>
   <span class="highlight">public void renderTweets(..) {
     //code to show tweets 
   }</span>

   protected onCreate(..) {
     //call AsyncFetchTweets
	 <span class="highlight"><strike>Remove the code to show tweets</strike>
	 renderTweets(..)</span>
   }
</pre>

You need to invoke renderTweets(..) from inside of AsyncFetchTweets as well. You should invoke it from inside onPostExecute() function.

Hint: You had reference to TweetListActivity passed as `parent` to the AsyncFetchTweets constructor. You can invoke renderTweets() as `parent.renderTweets()`.

To test if you get your code right, you should now have list of tweets showing up even on the very first load of your app after 5 sec delay.

**P.S. - Make sure to delete the app if you using your phone or restart AVD ** before you go ahead & deploy the new app else the cached file will be present.
