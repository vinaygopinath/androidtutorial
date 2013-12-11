# Hooking Custom Layout to Tweet List View

In last lesson we got the custom Layout done but our Tweet List still show up as the basic List with one entries per line.

In our java code, we provided ArrayAdapter with the build-in Android Layout - android.R.layout_simple_list_item_1 . You would be compelled to replace the layout value with layout.R.row_tweet & thought it would be done. But things are not that straight forward. 

> If you are not convinced, go ahead & try the above change. Deploy your app & see it crash on your phone. 

## Steps to hook up Custom Layout

To hook a Custom Layout, we need to extend ArrayAdapter class & provide a `getView()` function which gets called when a ListView row is rendered. We will declare a private TweetAdapter class as the class will not be going to be used anywhere else.

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
     <strike>tweetItemArrayAdapter = new ArrayAdapter(this, android.R.layout.simple_list_item_1, stringArray);</strike>
     <span class="highlight">tweetItemAdapter = new TweetAdapter(this, new String[10]);</span>
     .
   }

   <span class="highlight">private class TweetAdapter extends ArrayAdapter<String>{
       private LayoutInflater inflater;
				
		public TweetAdapter(Activity activity, String[] items){
			super(activity, R.layout.row_tweet, items);
			inflater = activity.getWindow().getLayoutInflater();
		}
		
		@Override
		public View getView(int position, View convertView, ViewGroup parent){
			return inflater.inflate(R.layout.row_tweet, parent, false);
		}

   }</span>
}
.
.
</pre>

We have done quite a few things in that code snippet

* A new class `TweetAdapter` is defined extending ArrayAdapter. The call to ArrayAdapter has been removed & instead a new object of TweetAdapter class is instantiated.

* The `public TweetAdapter(..)` initialization function is called when `new TweetAdapter(..)` code gets executed. The `super(..)` code executes the initialization function of the parent class ArrayAdapter. `inflater` is an object of type `LayoutInflater`. It is initialized in this function.

* When `tweetListView.setAdapter(tweetItemArrayAdapter)` code is executed, a call to TweetAdapter's getView(..) function is done to populate each ListView row. `inflater.inflate(...)` function inflates our custom layout (row_tweet.xml) as a View class & returns it. This is the important step which inserts our custom layout into the ListView parent. There are three parameters that get passed to getView - row item position count (position), custom layout view object (convertView) & parent ListView object (parent). Right now, we do not have any data to populate in our custom layout, but in subsequent lessons we will modify the function to populate the custom layout with individual tweet data.

* The stringArray variable is not needed anymore. Hence its declaration & initialization is removed. Instead we are now passing `new String[10]` to `new TweetAdapter(..)` call. The empty array will be used by ArrayAdapter class to decide how many child items need to create. In this case, it will create 10 tweet items. The content of the string array is not used.

* Done with above steps ? Deploy your app, navigate from the login screen to Tweet List screen to see our shiny new interface live :).

[Insert Screenshot]
