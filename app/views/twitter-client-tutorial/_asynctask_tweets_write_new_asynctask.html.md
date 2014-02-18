# Moving writing of tweets to new AsyncTask

We already have 5 second delay in AsyncFetchTweets **doInBackground()** function to simulate network call . As it is mentioned earlier, reading & writing from files are a little more involved process & should be done in a separate thread unless it affects the main Activity flow. 

In this case, the primary purpose of AsyncFetchTweets is to fetch tweets & show to the users. It is a good idea to move the code, to writes the tweets to the cache file, to a separate AsyncTask outside AsyncFetchTweets.

## Assignment - write tweets to cached file in new AsyncTask

Just to see the AsyncTask in action, we are going to make a little change for the assignment which we will undo later. 

* Introduce a 5 sec delay in AsyncFetchTweets **before renderTweets()**

`AsyncFetchTweets.java`
<pre>
    protected void doInBackground(..) {
	  //5 sec sleep
	  //dummy tweet creation
	  <span class="highlight">//5 sec sleep</span>
	  //writing tweets to file
	  // call to renderTweets()
	}
</pre>

Remove the app from your phone & re-deploy. **You will see 10 seconds delay in tweets to show-up.**

* Create a new class **AsyncWriteTweets** extending AsyncTask . Move the code to write to file & 5 sec sleep to the class.

`AsyncFetchTweets.java`
<pre>
    protected void doInBackground(..) {
	  //5 sec sleep
	  //dummy tweet creation
	  <span class="highlight"><strike>//5 sec sleep
	  //writing tweets to file</strike>
	  new AsyncWriteTweets().execute(tweets);</span>
	  // call to renderTweets()
	}
</pre>

`AsyncWriteTweets.java`
<pre>
   protected void doInBackground(..) {
      <span class="highlight">//5 sec sleep
	  //writing tweets to file</span>
   }
</pre>

Remove the app on the phone & deploy again. **This time, the tweet list will show up in 5 seconds straight.**

**Make sure you keep the name of the class as AsyncWriteTweets** else our tests will fail & we won't know if you have got the assignment solution correct. 

* Once done, **you should remove the additional 5 sec delay from AsyncWriteTweets**.

