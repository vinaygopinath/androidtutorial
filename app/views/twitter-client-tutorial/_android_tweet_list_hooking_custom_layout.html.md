# Hooking Custom Layout to Tweet List View

In last lesson we got the custom Layout done but our Tweet List still show up as the basic List with one entries per line.

In our java code, we provided ArrayAdapter with the build-in Android Layout - android.R.layout_simple_list_item_1 . You would be compelled to replace the layout value with layout.R.row_tweet & thought it would be done. But things are not that straight forward. 

> If you are not convinced, go ahead & try the above change. Deploy your app & see it crash on your phone. 

## Steps to hook up Custom Layout

* To hook a Custom Layout, we need to extend ArrayAdapter class. The extended class need to have a `getView()` function which is responsible to populate the ListView rows with our custom layout. Lets create a new Java class for this purpose. Right click on **org.codelearn.twitter** and then navigate to **New** -> **Class**. Specify the name as **TweetAdapter** and click on Finish.

`TweetAdapter.java`
<pre>

<span class="highlight">		
package org.codelearn.twitter;

import org.codelearn.twitter.R;
import android.app.Activity;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ArrayAdapter;

public class TweetAdapter extends ArrayAdapter<String>{

	public TweetAdapter(Activity activity, String[] items){
	}

	@Override
	public View getView(int position, View convertView, ViewGroup parent){
	}

}</span>
</pre>

* We also need to use our custom TweetAdapter instead of the earlier used ArrayAdapter.

`TweetListActivity.java`
<pre>
.
.
public TweetListActivity extends Activity {
  .
  .
   protected void onCreate(..){
     .
     .
     <strike>tweetItemArrayAdapter = new ArrayAdapter(this, android.R.layout.simple_list_item_1, stringArray);</strike>
     <span class="highlight">tweetItemArrayAdapter = new TweetAdapter(this, stringArray);</span>
     .
   }
  .
  . 
</pre>
* Earlier we just defined the skeleton of our custom TweetAdapter class. Let us fill it with some logic. The function getView() gets called everytime a row is added to the ListView element. There are three parameters that get passed to getView() - row item position count (position), custom layout view object (convertView) & parent ListView object (parent). For getView() function to be able to *inflate* our custom layout & create a View class out of it, we need an instance of `LayoutInflater` class. We will call it `inflater`.

`TweetAdapter.java`
<pre>

   public class TweetAdapter extends ArrayAdapter<String>{
	    <span class="highlight">private LayoutInflater inflater;</span>

		public TweetAdapter(Activity activity, String[] items){
		   <span class="highlight">super(activity, R.layout.row_tweet, items);
		   inflater = activity.getWindow().getLayoutInflater();</span>
		}
		
		@Override
		public View getView(int position, View convertView, ViewGroup parent){
		  <span class="highlight">return inflater.inflate(R.layout.row_tweet, parent, false);</span>
		}

   }
</pre>

* We instantiated inflater in the class & initializing it inside `public TweetAdapter(...)` function (This function is called Constructor in Java). The function gets called when we are creating new object of TweetAdapter class by doing `tweetItemArrayAdapter = new TweetAdapter(..)` inside onCreate() method of TweetListActivity.java. The `super(..)` function simply initializes the base class (ArrayAdapter). We have also initialized inflater at the same place.  

* `inflater.inflate(..)` is responsible for inflating our layout R.layout.row_tweet, creating a View class & returning it to be appended to the parent ListView. 

* We are not using the stringArray content anymore. The array length is used to decide on the number of rows. So we can simply remove the variable & simply use new String[10] while passing parameter to TweetAdapter class initialization.

`TweetListActivity.java`
<pre>
.
.
public TweetListActivity extends Activity {
  .
  <strike>private String[] stringArray;</strike>
  .
   protected void onCreate(..){
     .
     <strike>stringArray = new String[10];
     for(int i=0; i < songsArray.length; i++){
        songsArray[i] = "Song " + i;
     }</strike>
     .
     tweetItemArrayAdapter = new TweetAdapter(this, <strike>stringArray</strike><span class="highlight">new String[10]</span>);
     .
   }

</pre>

* Done with above steps ? Deploy your app, navigate from the login screen to Tweet List screen to see our shiny new interface live :).

<%= image_tag "twitter-client/final_tweet_list.png", alt: "Login screen Layout overview", title: "Login screen Layout overview" %>
