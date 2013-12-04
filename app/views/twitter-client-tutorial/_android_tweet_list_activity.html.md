We will now shift our focus to the backing `Activity` class that will handle the population of
the `ListView`. From the previous lesson on creating the `LoginActivity` class, you might remember
that we had extended the `Activity` class. In fact, in our lesson about taking the user from the 
Login screen to the Tweet list screen, we had defined a new activity class &mdash; `TweetList.java` &mdash; 
which too we had extended from the `Activity` class.  

Now let's make a simple change to that, so as to make our lives (when working with a `ListView`) much simpler.
Change the super class from `Activity` to `ListActivity` &mdash;

    public class TweetList extends ListActivity

*And why exactly should we want to do this?*  
Well, there's no compulsion to do this. However, the Android platform provides this utility super class with a 
bunch of useful methods, which are required when working with a `ListView`. It also automagically binds the `ListView`
created in our layout file, without us having to create an explicit reference to the `ListView`. 

While we are at it, let us also create a dummy `ArrayList` populated with some random strings, which we will use to
populate our `ListView`. 

    public class TweetList extends ListActivity {
    
        private List<String> _tweets;
        
        @Override
        protected void onCreate(Bundle savedInstanceState) {
            super.onCreate(savedInstanceState);
            setContentView(R.layout.activity_tweets);
            
            // retrieve the tweets
            _tweets = new ArrayList<String>();
            // adding some random strings to the list
            _tweets.add("this is the first row");
            _tweets.add("this is the second row");
            _tweets.add("this is the third row");
            _tweets.add("this is the fourth row");
            _tweets.add("this is the fifth row");
            _tweets.add("this is the sixth row");
            _tweets.add("this is the seventh row");
            _tweets.add("this is the eighth row");
            _tweets.add("this is the ninth row");
            _tweets.add("this is the tenth row");
        }
    }

As of now, this `ListActivty` class doesn't do much, let alone display a proper `ListView`. But we will be fixing all that very soon.
In our next lesson, we will look at the next building block of a `ListView` &mdash; the `Adapter` class &mdash; which binds
this `List` of strings to our `ListView`. That would take us a signficant step closer to getting our `ListView` to work.