# Fetch tweets from server

At present, `TweetListActivity` simply presents the user with a set of generated dummy tweets. This process can be replaced by making a GET call to the server.

## Task 1: Add the getTweets method in CodelearnTwitterAPI

Our mock Twitter API returns an array of tweets when a GET request is received by the **/tweet** endpoint. To fetch tweets, let us define getTweets() method as follows

<pre>
@GET("/tweets")
void getTweets(Callback<List<Tweet>> tweetListCallback);
</pre>

## Task 2: Modify TweetListActivity to use HTTP GET call

When `TweetListActivity` is launched, a set of tweets are generated and added to the ArrayAdapter. This can be replaced by a getTweets network call through `CodelearnTwitterAPI`. A new helper method called `renderTweets` has been defined to easily add tweets into the ListView and update the UI.

<pre>
public class TweetListActivity extends ListActivity{

  private static final String TWEETS_CACHE_FILE = "tweet_cache.ser";
  <span class="highlight">private static final String SERVER_ADDRESS = "http://app-dev-challenge-endpoint.herokuapp.com";
  
  private ArrayAdapter<Tweet> _tweetAdapter;
  private List<Tweet> _tweetList = new ArrayList<Tweet>();</span>

  @Override
  protected void onCreate(Bundle savedInstanceState) {
    super.onCreate(savedInstanceState);
    setContentView(R.layout.activity_tweet_list);
    
<strike>
	for ( int i = 0; i < 30; i++ ) {
	  Tweet tweet = new Tweet();
	  tweet.setTitle("A nice header for Tweet # " +i);
  	  tweet.setBody("Some random body text for the tweet # " +i);
      tweets.add(tweet);
    }
</strike>

<span class="highlight">
    _tweetAdapter = new TweetAdapter(this, _tweetList);
    setListAdapter(_tweetAdapter);
</span>


    ObjectInputStream ois = null;
    List<Tweet> cachedTweetsList = new ArrayList<Tweet>();
    try {
      ois = new ObjectInputStream(openFileInput(TWEETS_CACHE_FILE));
      cachedTweetsList = (List<Tweet>) ois.readObject();
    } catch (Exception e) {
      e.printStackTrace();
    } finally {
      if (ois != null) {
        try {
          ois.close();
        } catch (IOException e) {
          e.printStackTrace();
        }
      }
    }
    
<span class="highlight">
    renderTweets(cachedTweetsList);
    
    /* Create an instance of CodelearnTwitterAPI */
    CodelearnTwitterAPI codelearnTwitterAPI =
        new RestAdapter.Builder().setEndpoint(SERVER_ADDRESS).build()
            .create(CodelearnTwitterAPI.class);

    codelearnTwitterAPI.getTweets(_tweetListCallback);
</span>
}

<span class="highlight">
  /**
   * Shows the given List of Tweets in the ListView. Note that this method appends the given list of
   * Tweets to the existing list of Tweets rather than overriding it.
   * The method {@code ArrayAdapter.notifyDataSetChanged()} is used to update the UI
   */ 
  public void renderTweets(List<Tweet> additionalTweetList) {
    for (Tweet tweet : additionalTweetList) {
      _tweetList.add(0, tweet);
    }
    _tweetAdapter.notifyDataSetChanged();
  }
</span>
</pre>

## Task 3: Define the callback to handle success or failure of fetching tweets

the `getTweets` method takes a Callback argument that handles the success or failure of the network call. If the call was successful, the fetched tweets are cached and then added to the ListView. In case of failure, a Toast message is displayed to the user.

<pre>
<span class="highlight">
  private Callback<List<Tweet>> _tweetListCallback = new Callback<List<Tweet>>() {

    @Override
    public void failure(RetrofitError err) {
      Toast.makeText(getApplicationContext(), "Unable to fetch tweets at this time",
          Toast.LENGTH_LONG).show();
    }

    @Override
    public void success(List<Tweet> fetchedTweetList, Response response) {
      AsyncWriteTweets writeTask = new AsyncWriteTweets(TweetListActivity.this);
      writeTask.execute(fetchedTweetList);

      renderTweets(fetchedTweetList);
    }
  };
</span>
</pre>