# Click Listener for individual tweet item

In previous lesson, we integrated the custom layout row_tweet.xml with the ListView. The next step is to view each tweet in detail when the tweet item is clicked. For detail, we would need a new Activity which we will be creating in subsequent lesson. In this lesson, we will see how to enable & capture click event for each item in a ListView. 

Android has a special class `ListActivity` which provides a function `onListItemClickListener(..)` that gets called when a ListView children is clicked. As for now, our TweetListActivity class is extending Activity class. We need to change it to ListActivity. 

Changing the class to ListActivity has some repercussions though. [This](http://developer.android.com/reference/android/app/ListActivity.html) Android Developer Guide page says

> ListActivity needs a ListView with id `@android:id/list` which it will populate through function `setListAdapater(..)`. Note, no fetching the ListView using findViewById(..) thing.

Lets go ahead & make the changes

* Change Activity to ListActivity in TweetListActivity.java .

`TweetListActivity.java`
<pre>
public TweetListActivity extends <strike>Activity</strike><span class="highlight">ListActivity</span>

</pre>

* Update id in activity_tweet_list.xml to '@android:id/list'

`activity_tweet_list.xml`
<pre>
&lt;ListView
        android:id="<strike>@+id/songsListView</strike><span class='highlight'>@android:id/list</span>"
        android:layout_width="fill_parent"
        android:layout_height="fill_parent"&gt;
    &lt;/ListView&gt;
</pre>

* Change `setAdapter(..)` to `setListAdapter(..)`. Also we do not need tweetListView variable and code assocaited with it anymore. So we can remove it. 

`TweetListActivity.java`
<pre>
public class TweetActivity extends Activity {
    <strike>private ListView tweetListView;</strike>
    private ArrayAdapter tweetItemArrayAdapter;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
      super.onCreate(savedInstanceState);
      setContentView(R.layout.activity_tweet);

      tweetItemArrayAdapter = new TweetAdapter(this, new String[10]);
      <strike>tweetListView = (ListView) findViewById(R.id.tweetList);
      tweetListView.setAdapter</strike><span class="highlight">setListAdapter</span>(tweetItemArrayAdapter);
    }
}
</pre>

* We need to bring up the new TweetDetailActivity (yet to be created) on click of the tweet. As for now, lets update the clicked tweet title to 'Tweet Clicked'. For that, lets provide a meaningful id to the header TextView in row_tweet.xml

`row_tweet.xml`
<pre>
&lt;LinearLayout ..&gt;

  &lt;ImageView ../&gt;

  &lt;LinearLayout&gt;

     &lt;TextView id="<strike>@+id/textView1</strike><span class='highlight'>@+id/tweetTitle</span>"
	 ./&gt;
	 &lt;TextView ../&gt;
	 &lt;TextView ../&gt;

  &lt;/LinearLayout&gt;

&lt;/LinearLayout&gt;
</pre>

* Add & override `onListItemClick(..)` function to TweetListActivity class. We will get the `tweetTitle` field of the tweet & change the text to 'Tweet Clicked' from 'Header Text'

`TweetListActivity.java`
<pre>
public class TweetListActivity extends ListActivity {
 .
 .
 public void onCreate() {
  .
  .
 }

 private class TweetAdapter ... {
  .
  .
 }

 <span class="highlight">@Override
 protected void onListItemClick(ListView l, View v, int position, long id) {
     TextView t = (TextView) v.findViewById(R.id.rowTitle);
	 t.setText("Tweet Clicked");
 }</span>
}
</pre>

The function onListItemClick gets parent ListView (l), child View which is clicked (v), position of the child View in the parent View (position) & id (not sure what that represents). The new function we introduced is `setText(..)`. The function sets the text of a TextView class object.  

* Run your app. Navigate past the login screen to view the Tweet List screen. Tapping on a tweet item will update the tweet header to 'Tweet Clicked'. 

[Insert Image]
