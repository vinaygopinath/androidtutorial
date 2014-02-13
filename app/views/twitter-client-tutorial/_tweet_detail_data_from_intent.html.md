# Passing data over Intent to Tweet Detail Screen

Earlier, we had written code to show different tweet data for each tweet item. But clicking on a tweet still shows the same old activity_tweet_detail.xml hardcoded data. 

In this lesson, we will learn how to pass data from one screen to another over Intent. We will be going to pass the Tweet model object associated with the tweet to the Tweet Detail Screen. It will use the data from the object to populate in the Tweet Detail XML view. 

## Intent with data

Passing data over intent is pretty straight-forward. 

<pre>
   Intent intent = new Intent(this,<i>Next Activity Name</i>.class)
   <span class="highlight">intent.putExtra("<i>key</i>", <i>value</i>)</span>
   startActivity(intent)
</pre>

While *key* can be any string, value can either be string, integer or even object of a class. 

To retrieve the data in the next Activity that gets loaded from the intent, the code below is needed

<pre><i>Data_Type</i> value = (<i>Data_Type</i>) getIntent().getSerializableExtra("<i>key</i>")</pre>

### Assignment - show data on Tweet Detail screen from appropriate tweet object

Earlier, we had put an onClickListener for each tweets which started the Tweet Detail Activity on the tweet item click. 

`TweetListActivity.java`

    @Override
	protected void onListItemClick(ListView l, View v, int position, long id) {
		Intent intent = new Intent(this, TweetDetailActivity.class);
	    startActivity(intent);
	}

** 1. Modify onListItemClick() function to pass the tweet object to TweetDetailActivity **

Hint: We declared `tweets` array as private member of TweetListActivity class & the array is available inside onListItemClick()

** 2. Use the tweet object to set title, body & date in TweetDetailActivity **

We already have the code to set title, body & date for individual tweets in the ListView. The code is inside getView() of TweetAdapater class. You should be smart programmer & simply re-use that ;).
