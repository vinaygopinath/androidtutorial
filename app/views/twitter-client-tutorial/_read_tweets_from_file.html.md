# Reading tweets from file

In last lesson, we created Tweet model & populated it with dummy data inside `onCreate()` of TweetListActivity. In this lesson, we are going to read the tweets from a local file. 

In the final app, the tweets will be stored in a local file. When the Tweet List screen comes up, the tweets are read from the file & shown instantaneously while another process starts & runs asynchronously to update the file with latest tweets. Usually some kind of 'loading' sign is shown on the screen to tell the user that tweets are getting loaded but the screen is not blank. 

In this lesson, we are simply going to write some dummy tweets into the file, read from it & show it to the user when the Tweet List screen loads. Going ahead, we will modify the writing tweets to happen when network call happens. 

## Serializing, writing to file & reading from it

To be able to read from the file, we need to write to the file first (else there is nothing in the file to read from). We are going to dump the tweets array that we created in the last lesson to a local file. For that, we will use simple **Java serialization**. 

** 1. Serializing Tweet model **

The class declaration need to implement Serializable

<pre>public class Tweet <span class="highlight">implements Serializable</span></pre>

Also, just to be sure that Java doesn't run into trouble serializing and de-serializing objects of this class, it's generally a good idea to add a default serialization version UID member to the Tweet class.

    private static final long serialVersionUID = 1L;

** 2. Writing to a local file **

We can create any local file that we want in Android. You can give it any name as you please. 

To write to a file in Android, we need objects of `FileOutputStream` & `ObjectOutputStream` class. An example code for file handling is below. 

<pre>
	FileOutputStream fos = null;
    ObjectOutputStream oos = null;
    
    try {
    	fos = openFileOutput(<i>Name of the file</i>, MODE_PRIVATE);
    	oos = new ObjectOutputStream(fos);
    	oos.writeObject(tweets);
    } 
	catch ( Exception e ) {

    	Log.e("codelearn", "Failed to write to serialised file.", e);

	} finally {
		
		try {
			fos.close();
		} catch (Exception e) {
			Log.e("codelearn", "Error closing file stream", e);
		}
		
		try {
			oos.close();
		} catch (Exception e) {
			Log.e("codelearn", "Error closing output stream", e);
		}
	}
</pre>

The MODE_PRIVATE is a flag passed to the SDK to indicate that we do not want this file to be publicly accessible to any app other than ours.

Note that we can directly write tweets array to the file & it will automatically gets serialized.

While serializing objects seem to be a relatively simple set of operations, bear in mind that you need to follow certain guidelines to make the best use of it —

* Remember to close() all streams that you open for reading and writing.
* Be sure that size of the object you're serializing isn't very large, because when the data gets deserialized, the app's process might easily throw up a OutOfMemory error.


** 3. Reading from local file **

There are only three lines that are different while reading from a local file as against writing. 

<pre>
fos = openFileInput(<i>Name of the file</i>);
oos = new <span class="highlight">ObjectInputStream</span>(fos);
tweets = ( List<Tweet> ) oos.<span class="highlight">readObject</span>();
</pre>

### Assignment - serialize Tweet model, write it to file & read from it 

In the earlier lesson, we had put dummy data into `tweets` inside **onCreate()** function of TweetListActivity.java . In this assignment, you are going to change the flow. Follow the steps below.

* Add Serialization to Tweet model inside Tweet.java file

* Lets keep a static name for the local file to which we are going to read & write data from. Since the file is needed by TweetListActivity class, lets declare it as a member object of TweetListActivity class


<pre>private static final String TWEETS_CACHE_FILE = "tweet_cache.ser";</pre>


Since it is serialized tweets, we hae put a **.ser** extension. You are free to put any extension that you like to. In the code ahead, you should use TWEETS_CACHE_FILE variable to reference the tweets cached file. 

<span class="text-error">Make sure you provide the exact same name of the file as it is the file we will check for data written & read from.</span>

* We need to write tweets first to file. Lets create a function for that - **writeTweets()**. We are going to pass tweets array to the function which will eventually write to the file 

`TweetListActivity.java`

<pre>
	private void writeTweets(List&lt;Tweet&gt; tweets) {
		//Add code to write tweets array to file tweets_cache.ser
	}
</pre>

* We now need to read the tweets from the file. Create another function **readTweets()** for that. The function should return array of Tweet object. 

`TweetListActivity.java`

    private List<Tweet> readTweets() {
	   //Add code to read from tweets_cache.ser file 
	}

* Last bit now. Insert **writeTweets()** & **readTweets()** functions at appropriate place in TweetListActivity.java . The idea is to write tweets to the file & then read from it when Tweet List screen shows up.  
