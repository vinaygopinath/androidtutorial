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

## Modifying getView() to show different data

The function `getView()` returns an object of type View. `inflater.inflate(..)` inflates row_tweet.xml as View & returns it. Before returning the View, the content of the inflated View can be modified by accessing elements of the View using `findViewById()` function. 

Example, the code below will inflate row_tweet.xml, look for a TextView with id title_id, sets its text with 'this is different title' before returning the inflated View.

<pre>
	<strike>return inflater.inflate(R.layout.row_tweet, parent, false);</strike>
    View row = inflater.inflate(R.layout.row_tweet, parent, false);

	TextView title = (TextView) row.findViewById(R.id.title_id);
	title.setText("this is different title");
	return row;
</pre>

We have used `setText()` function available for View elements who have a text field, to set the text field value. 

### Assignment - random title, body & date for each tweet item

The first tweet should have title "1. title" & body "1. body". Second tweet should have "2. title" & "2. body". 

Hint: use `position` variable that gets passed to getView().


## Creating Tweet Model

When we will do network calls to fetch tweets, all the tweets will have uniform structure. Each tweet will have an image, twitter handle, body, date etc. In Java, it is a good practice to create a Java class for this. We can store multiple tweets as array of the Tweet object. Such an object is also known as PoJo in Java.

As a good practice, we should put this java file inside a model directory & give the package name `org.codelearn.twitter.model`. It will be imported as

    import org.codelearn.twitter.model.Tweet

wherever required.

### Assignment - create src -> org.codelearn.twitter -> models -> Tweet.java

1. Create a new directory model inside src -> org.codelearn.twitter by right clicking & selecting 'New Directory'

2. Create a file Tweet.java as shown below

		package org.codelearn.twitter.model;
		
		import java.util.Date;
		
		public class Tweet {
			private String id;
			private String header;
			private String body;
			private Date date;
			
			public String getId() {
				return id;
			}
			
			public void setId(String id) {
				this.id = id;
			}
			
			public String getHeader() {
				return header;
			}
			
			public void setHeader(String header) {
				this.header = header;
			}
			
			public String getBody() {
				return body;
			}
			
			public void setBody(String body) {
				this.body = body;
			}
			
			public Date getDate() {
				return date;
			}
			
			public void setDate(Date date) {
				this.date = date;
			}
		}

Like a regular PoJo , the class has functions to get/set different instance variables of the object of Tweet class. 

## Populating tweet items through Tweet model

We will be holding a lot of tweets at a given time. So we need an array of Tweet model objects. 

	List<Tweet> tweets = new ArrayList<Tweet>();

When the user comes to Tweet List Screen, right now, we are putting random data inside getView(). We are suppose to iterate through Tweet model array, get each element value like header, date, body etc & set the appropriate field in the inflated View. 

But we have a problem. `tweets` is essentially empty now. Lets write some code to populate tweets with some random data.

    for ( int i = 0; i < 20; i++ ) {
		Tweet tweet = new Tweet();
		tweet.setId("" + i);
		tweet.setHeader("A nice header for Tweet # " +i);
		tweet.setBody("Some random body text for the tweet # " +i);
		tweet.setDate(new Date());
		tweets.add(tweet);
	}

The code above will put 20 Tweet object in tweets array. 

## Modify TweetAdapter class

So far, we were passing a String Array to TweetAdapter class. Now we will be passing the array of Tweet object to TweetAdapter which will be in-turn used in getView() function to set the inflated View elements.

`TweetListActivity.java`

<pre>tweetItemArrayAdapter = new TweetAdapter(this, <span class="highlight"><strike>new String[10]</strike> tweets</span>);</pre>

`TweetAdapter.java`

<pre>public class TweetAdapter extends ArrayAdapter<span class="highlight">&lt;Tweet&gt;</span>  {
	  .
	  //variable to store reference to the tweets array
	  <span class="highlight">List<Tweet> tweetsLocal = new ArrayList&lt;Tweet&gt;();</span>

      public TweetAdapter(Activity activity, <span class="highlight"><strike>String[] items</strike> List&lt;Tweet&gt;</span> tweets) {
	    //initialize tweetsLocal with tweets which gets passed as argument. 
		//This is constructor function which gets called during new TweetAdapter() function call
		<span class="highlight">tweetsLocal = tweets;</span>
		.
	  }
	  public View getView(int position, View convertView, ViewGroup parent) {
	    View row = inflater.inflate(...);

	  	<span class="highlight">//Assignment - use data from tweetsLocal to set View elements in row</span>
	  }
	  
	}
</pre>

`tweets` is now passed to `TweetAdapter` class during initialization. `tweetsLocal` variable now holds the reference to tweets. It is a private variable & available inside getView() function. 

### Assignment - populate data in tweet list from tweets array

If you understood the flow till now, go ahead & try the assignment. If you are lost, try to follow the steps below. It is assumed that you have done the above assignments & you have Tweet model ready (Tweet.java inside src -> org.codelearn.twitter -> models directory)

1. TweetListActivity.java is the place where you need to declare `tweets` array. It can be declared as private object to TweetListActivity class as well. Dont forget to `import org.codelearn.twitter.model.Tweet` on top of TweetListActivity.java.

2. The initialization of tweets with dummy data should happen inside `onCreate()` function of TweetListActivity.java . 

3. Change call to TweetAdapater to accept tweets array instead of String array. Also, you need to modify TweetAdapter.java as shown in the section 'Modify TweetAdapter class'

4. Modify `getView()` function of TweetAdapter to get data from tweets array & modify data in inflated View.

Hint: Use `tweetsLocal.get(position)` inside getView() to get the Tweet object at `position` from tweetsLocal array

TODO - insert image
