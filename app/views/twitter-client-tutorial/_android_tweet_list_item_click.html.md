# Attaching click listener to individual tweets

In previous lesson, we are able to get the kind of layout we designed for the list of tweet screen. Clicking on a tweet item should show the tweet detail in a new Activity. In this lesson, we will put the click listener on each tweet item. 

So far, our TweetListActivity class is extending the normal Activity class. There is a special `ListActivity` class which provides `onListItemClick(..)` function that the Android developer need to over-ride to handle the click event on each List item. 

Lets get to work now.

* Change the parent class to ListActivty from Activity

`TweetListActivity.java`
<pre>
.
.
public class TweetListActivity extends <strike>Activity</strike><span class="highlight">ListActivity</span> {
.
.
</pre>

* Append onListItemClick function anywhere inside TweetListActivity class definition

`TweetListActivity.java`
<pre>
public TweetListActivity extends ListActivity {
	.
	.
	@Override 
	protected void onCreate(..) {
	  .
	  .
	 }

	<span class="highlight">@Override
	protected void onListItemClick(ListView l, View v, int position, long id) {
		//Update list element content to show it is clicked
	}</span>
}
</pre>
