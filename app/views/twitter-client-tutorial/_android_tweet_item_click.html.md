# Click Listener for individual tweet item

In previous lesson, we integrated the custom layout row_tweet.xml with the ListView. The next step is to view each tweet in detail when the tweet item is clicked. For detail, we would need a new Activity which we will be creating in subsequent lesson. In this lesson, we will see how to enable & capture click event for each item in a ListView. 

Android has a special class `ListActivity` which provides a function `onListItemClickListener(..)` that gets called when a ListView children is clicked. As for now, our TweetListActivity class is extending Activity class. We need to change it to ListActivity. 

Changing the class to ListActivity has some repercussions though. [This](http://developer.android.com/reference/android/app/ListActivity.html) Android Developer Guide page says

> ListActivity needs a ListView with id `@android:id/list` which it will populate through function `setListAdapater(..)`. Note, no fetching the ListView using findViewById(..) thing.

Lets go ahead & make the changes

* Change Activity to ListActivity in TweetListActivity.java .

`TweetListActivity.java`
<pre>
public TweetListActivity extends <strike>Activity</strike><span class="highlight">ListActivity</span

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

* Change `setAdapter(..)` to `setListAdapter(..)`. Also we do not need tweetListView & stringArray variables and code assocaited with it anymore. So we can remove it. 

`TweetListActivity.java`
<pre>
public class TweetActivity extends Activity {
    <strike>private ListView tweetListView;</strike>
    private String[] stringArray ;
    private ArrayAdapter tweetItemArrayAdapter;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
      super.onCreate(savedInstanceState);
      setContentView(R.layout.activity_tweet);

       stringArray = new String[10];
        for(int i=0; i < stringArray.length; i++){
            stringArray[i] = "String " + i;
        }
      tweetItemArrayAdapter = new ArrayAdapter(this, android.R.layout.simple_list_item_1, stringArray);
      tweetListView = (ListView) findViewById(R.id.tweetList);
      tweetListView.setAdapter(tweetItemArrayAdapter);
    }
}
</pre>
