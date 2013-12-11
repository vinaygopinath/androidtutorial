#Android ListView

ListView is a view group that displays a list of scrollable items. When ever you have a data which is repeating and comes as a collection or list, list view is best User Interface element to use. ListView helps you in displaying repeating data in form of a scrollable list, users can then select any list item by clicking on it. 

ListView is widely used in android applications, a most simple example of list view is your contact book, where you have list of you contacts displayed in a listview. 


Let's Take an Example: 

If you see this screenshot of twitter app

![Twitter Home](/assets/list_view/twitter_home.png "Twitter Home")

All the rows are similar and only thing which change is tweet content, when ever you have such pattern you should use listview.

##Using List In Android

Android provides ListView or ExpandableListView. ExpandableListView conntains list items which can be expanded. To use a list view in Android you can drag and drop listview control from the palete to your UI. 

Here is how listview code looks: 

		<ListView
		    android:id="@+id/listView1"
		    android:layout_width="match_parent"
		    android:layout_height="wrap_content" >
		</ListView>


##ListItem

A listview is made from group of listitems, list items are individual rows in listview where data will be displayed. Any data in listview is displayed only via listItem. Consider Listview as scrollable group of listitems. 

Listitems are just layouts in a seprate layout file. Let's see the example below: 

See this Image: 
![Twitter tweet](/assets/list_view/twitter_tweet.png "Twitter tweet")

In the above image, we see the lisitem for the twitter application, this list Item is a Relative layout with images and multiple text view arranged one after other. This is how we design a list view.

Once we have the listitem, we bind the listview with the adapter and then use listitems to bind and display data in listview. 

Let's see this example image of a list item: 
![List Item](/assets/list_view/list_item.png "List Item")

This is how the list item looks into code

		<RelativeLayout xmlns:android="http://schemas.android.com/apk/res/android"
		    android:layout_width="fill_parent"
		    android:layout_height="wrap_content"
		     >

		    <ImageView
		        android:id="@+id/imageView1"
		        android:layout_width="wrap_content"
		        android:layout_height="wrap_content"
		        android:layout_alignParentLeft="true"
		        android:layout_alignParentTop="true"
		        
		        android:src="@drawable/ic_launcher" />

		    <TextView
		        android:id="@+id/textView1"
		        android:layout_width="wrap_content"
		        android:layout_height="wrap_content"
		        android:layout_marginLeft="23dp"
		        android:layout_marginTop="10dp"
		        android:layout_toRightOf="@+id/imageView1"
		        android:text="CodeLearn Chapter 1"
		        android:textSize="16sp" />

		    <TextView
		        android:id="@+id/textView2"
		        android:layout_width="wrap_content"
		        android:layout_height="wrap_content"
		        android:layout_alignBottom="@+id/imageView1"
		        android:layout_alignLeft="@+id/textView1"
		        android:text="Description" />

		</RelativeLayout> 



##Adapter

Adapters are a bridge between the View (e.g. ListView) and the underlying data for that view. An adapters manages the data and adapts the data to the individual rows (listItems) in the list view.

Adpaters are bind with list view by *setAdapter* method. 
Let's See How adapter Works 

![Adapters](/assets/list_view/Adapter.png "Adapters")

Let's understand the working with reference to above image. 

As states earlier, adapters act as a bridge between views, To interact with adapter view, adapters call the getView() method which returns a view for each item within the adapter view. This is the list item which we have seen earlier, the layout format and the corresponding data for an item within the adapter view is set in the getView() method.  

Once We have the reference to the view we can get the data from the data source either a Array list or cursor and bind this data to the view items. All this is done in getView Method. In coming section we will look how we achieve this in code. 

>Watchout: Typically as you scroll the list view to improve the performance and save time in creating new view android recycles the views that goes out of foucs. 


Typically you don't directly deal with Adapter class, Android provides you with some sets of commonly require Adapters like :

*Array Adapter
*Cursor Adapter
*Simple Cursor Adatper

Most of the time we will write our own Adapter by extending *Base Adapter*

>Watchout: Always remember that any adapter will always be expecting a Layout to be bind, ie the listitem 

Let's see Adapters in Action 

##Array Adapter

When ever you have a list of single items which is backed by an array for example list of countries or names you can use Array Adapter. Array Adapter is backed by an array of objects.

By Default ArrayAdapter expects a Layout with single TextView. If you want to use more complex view please avoid arrayadapter and use custom adapter which we will see in next section.

###Code
Download our Example App from this link 

open ListViewWithSimpleAdapter Class

For Array Adapter to work you need to have an array of data, let's create a Array of Code Learn Tutorial Chapter: 

		String[] codeLearnChapters = new String[] { "Android Introduction","Android Setup/Installation","Android Hello World",
		    		"Android Layouts/Viewgroups","Android Activity & Lifecycle","Intents in Android"};

Now we have the data let's Create a new Object of Array Adapter. 

		ArrayAdapter<String> codeLearnArrayAdapter = new ArrayAdapter<String>(this, android.R.layout.simple_list_item_1, codeLearnChapters);

If you notice the parameters for Array Adapter: 

1. First Parameter is context
2. Second Parameter is the Layout which this array adapter will use to bind the data from codeLearnChapters array, Android comes prebundle with some common layout which you can refer with android.R.layout. Here we are using the  simple_list_item_1 which is just 1 text view. 
3. Third parameter is the data, in this case the array. 

Now we have the arrayadapter created let's bind the Adapter with the list view.

Let's get the reference of list view 

		ListView codeLearnLessons = (ListView)findViewById(R.id.listView1);

Once you have reference of listview you can just call *setAdapter* method passing the arrayadapter to bind. 

		codeLearnLessons.setAdapter(codeLearnArrayAdapter);

With this simple 4 lines of code you created your first listview. If you run the application downloaded from this link and click on simpleAdapter button you will see the array adapter in action. This is how it will look: 

![Array Adapters](/assets/list_view/Array_adapter.png "Array Adapters")

We have seen the Array Adapter, but most of the time you need more than 1 data in list item. Let's look how we can use base adapter to achieve what we want. 

##BaseAdapter