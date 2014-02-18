# Dynamic Data for Tweet List Screen

Cool, so we are done storing login data. It is time to handle data for Tweet List Screen. 

In this lesson, each tweet item will have different data. We will have a Tweet model which store the data corresponding to each tweet. In subsequent lessons, we will learn how to serialize & read/write the Tweet model object array to a local file. 

##Recap from module 1

In module 1, each tweet item has dummy data from row_tweet.xml. We had public class TweetListAdapter with a getView() function which simply inflated the resource xml

`TweetAdapter.java`

	public class TweetAdapter extends ArrayAdapter {
		.
		.     
		 @Override
		 public View getView(int position, View convertView, ViewGroup parent){
			 return inflater.inflate(R.layout.row_tweet, parent, false);
		 }

	}

Because of the above step, all tweet items looked the same. In real life, each tweet item will hold a different value that comes from the twitter server. Since we are not doing network calls yet, we will populate some dummy but different data & then populate each tweet item with the data. 

The steps we are going to follow :-

**1. New Tweet model to hold data ** 

Good programming practice in java mandates that any kind of data should be held in a class. It is also referred as Model of Model View Controller architecture. Consider the Activity classes as Controllers & XML as Views. We will create a new class Tweet.java which will hold the tweet data.

**2. Populating the Tweet model **

In actual app, we fetch the data from network & popuplate the Tweet data. Since we are not doing network call here, we are just going to put some dummy data in our Tweet model. 

**3. Using Tweet model to show data on screen **

We are then going to pass the tweet model array to TweetAdapter & change the code to use the model data to show on the screen. 

## Step 1 - Creating Tweet Model

When we will do network calls to fetch tweets, all the tweets will have uniform structure. Each tweet will have an image, twitter handle, body, date etc. In Java, it is a good practice to create a Java class for this. We can store multiple tweets as array of the Tweet object. Such an object is also known as PoJo in Java.


### Assignment - create Tweet model

** 1. Create Tweet.java **

The file needs to be in src -> org -> codelearn -> twitter -> models directory. You can either manually create it or follow the Eclipse steps below.

* Create new folder

<div class="row-fluid">
	<div class="span6">
		<%= image_tag "twitter-client/new-folder-src.png" %>
	</div>
	<div class="span6">
		<%= image_tag "twitter-client/create-folder-src.png" %>
	</div>
</div>

* Create Tweet.java inside org.codelearn.twitter.models

<div class="row-fluid">
	<div class="span6">
		<%= image_tag "twitter-client/new-class-folder-src.png" %>
	</div>
	<div class="span6">
		<%= image_tag "twitter-client/create-class-folder-src.png" %>
	</div>
</div>

* This is how the newly created Tweet.java will look

<%= image_tag "twitter-client/tweet.java.png" %>

**2. Copy contents to Tweet.java **

`Tweet.java`

    package org.codelearn.twitter.models;
	
	public class Tweet {
		private String id;
		private String title;
		private String body;
		
		public String getId() {
			return id;
		}
		
		public String getTitle() {
			return title;
		}
		
		public void setTitle(String title) {
			this.title = title;
		}
		
		public String getBody() {
			return body;
		}
		
		public void setBody(String body) {
			this.body = body;
		}
    }

Like a regular PoJo , the class has functions to get/set different instance variables of the object of Tweet class. 

## Step 2 - Using Tweet model in TweetListActivity class

We will be holding a lot of tweets at a given time. So we need an array of Tweet model objects. 

	List<Tweet> tweets = new ArrayList<Tweet>();

While `List` is a generic array class in java (also called interface), `ArrayList` is simply an array implementation of List interface. Putting a `<Tweet>` typecasts it to an array of our Tweet class.

When the user comes to Tweet List Screen, right now, we are putting random data inside getView(). We are suppose to iterate through Tweet model array, get each element value like header, date, body etc & set the appropriate field in the inflated View. 

But we have a problem. `tweets` is essentially empty now. Lets write some code to populate tweets with some random data.

    for ( int i = 0; i < 20; i++ ) {
		Tweet tweet = new Tweet();
		tweet.setTitle("A nice header for Tweet # " +i);
		tweet.setBody("Some random body text for the tweet # " +i);
		tweets.add(tweet);
	}

The code above will put 20 Tweet object in tweets array.

### Assignment - create & populate tweets array

We saw the steps above. Go ahead & implement them. 

You would need to access tweets array at multiple places inside TweetListActivity class. So you should declare it as member of the TweetListActivity class.

Hint:  onCreate() in TweetListActivity.java is the place you should initialize the array with random tweets

P.S. - Make sure you 

     import org.codelearn.twitter.models.Tweet 

in TweetListActivity.java else Eclipse will not be able to understand that 'Tweet' actually stands for Tweet class defined elsewhere.


## Step 3 - Showing dynamic data through Tweet model object

Now that we have tweets array populated, we now need to show the data it hold on the screen. 

A quick recap. Data is passed to the ListView through an Adapter. We had the below code in TweetListActivity.java .

<pre>tweetItemArrayAdapter = new TweetAdapter(this, new String[10]);</pre>

We were not actually passing any data to the Adapter. Just the size of the String array is used by the Adapter to create 10 tweet entries. Now we will be passing `tweets` array to TweetAdapter which will be in-turn used in getView() function to set the title, body & date in inflated View.

`TweetListActivity.java`

<pre>tweetItemArrayAdapter = new TweetAdapter(this, <span class="highlight"><strike>new String[10]</strike> tweets</span>);</pre>

Also TweetAdapter.java need to be modified appropriately to accept array of Tweet model as argument. The array is then used in getView(..) to set title, date & body inside the inflated View. 

`TweetAdapter.java`

<pre>public class TweetAdapter extends ArrayAdapter<span class="highlight">&lt;Tweet&gt;</span>  {
	  .

      public TweetAdapter(Activity activity, <span class="highlight"><strike>String[] items</strike> List&lt;Tweet&gt;tweets</span>) {
	    .
	    .
	  }
</pre>

We also need to modify getView() function to use the tweets array. The function `getView()` returns an object of type View. Before returning the View, the content of the inflated View can be modified by accessing elements of the View using `findViewById()` function and setting the text using `setText(..)`. 

Example, the code below will inflate row_tweet.xml, look for a TextView with id title_id, sets its text with 'this is different title' before returning the inflated View.

`TweetAdapter.java`
<pre>
	<strike>return inflater.inflate(R.layout.row_tweet, parent, false);</strike>
    View row = inflater.inflate(R.layout.row_tweet, parent, false);

	TextView title = (TextView) row.findViewById(R.id.title_id);
	title.setText("this is different title");
	return row;
</pre>


### Assignment - populate data in TweetAdapter's getView() from tweets array

Follow the three steps. Create Tweet.java, create a tweets array in TweetListActivity.java, populate it with dummy data & then pass it to TweetAdapter. Modify TweetAdapter to use the tweets array to show its data on the screen.

<%= image_tag "twitter-client/different-tweets.png" %>

** Hint: Store `tweets` passed to `public TweetAdapter(..)` in a TweetAdapter member variable ** 

You will be needing tweets array in getView(..) but it is passed in the constructor function. See how **inflater** variable is initialized in the constructor & used in getView(..) & derive inspiration from it.


