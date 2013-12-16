#Android ListView

![Twitter Home](/assets/list_view/twitter_home.png "Twitter Home")


ListView is a view group that displays a list of scrollable items. Whenever you have a date which is repeated and comes as a collection or list, the list view is best User Interface element to use. ListView helps you in displaying repeating data in the form of a scrollable list, users can then select any list item by clicking on it. 

ListView is widely used in android applications, a simpler example of list view is your contact book, where you have a list of your contacts displayed in a listview. 


Let's Take an Example: 

See the screenshot of a twitter app above


All the rows are similar and only thing which change is tweet content, whenever you have such pattern you should use listview.

##Using List In Android

Android provides ListView or ExpandableListView. ExpandableListView contains list items which can be expanded. To use a list view in Android you can drag and drop the listview control from the palette to your UI. 

Here is how listview code looks: 

		<ListView
		    android:id="@+id/listView1"
		    android:layout_width="match_parent"
		    android:layout_height="wrap_content" >
		</ListView>


##ListItem

A listview is made from group of list items, list items are individual rows in listview where data will be displayed. Any data in listview is displayed only via listItem. Consider Listview as scrollable group of listitems. 

List items are just layouts in a separate layout file. Let's see the example below: 

See this Image: 

![Twitter tweet](/assets/list_view/twitter_tweet.png "Twitter tweet")

In the above image, we see the lisitem for the twitter application, this list Item is a Relative layout with images and multiple text view arranged one after another. This is how we design a list view.

Once we have the listitem, we bind the listview with the adapter and then use listitems to bind and display data in listview. 

In the coming sections we will learn more about how we create complex list items and tie them to adapter. 

##Adapter

Adapters are a bridge between the View (e.g. ListView) and the underlying data for that view. An adapters manages the data and adapts the data to the individual rows (listItems) in the list view.

Adpaters are bind with list view by *setAdapter* method. 
Let's See How adapter Works 

![Adapters](/assets/list_view/Adapter.png "Adapters")

Let's understand the working with reference to above image. 

As states earlier, adapters act as a bridge between views, To interact with adapter view, adapters call the getView() method which returns a view for each item within the adapter view. This is the list item which we have seen earlier, the layout format and the corresponding data for an item within the adapter view is set in the getView() method.  

Once We have the reference to the view we can get the data from the data source either a Array list or cursor and bind this data to the view items. All this is done in getView Method. In coming section we will look how we achieve this in code. 

>Watchout: Typically as you scroll the list view to improve the performance and save time in creating a new view android recycles the views that goes out of focus. 


Typically you don't directly deal with Adapter class, Android provides you with some sets of commonly require Adapters like :

*Array Adapter
*Cursor Adapter
*Simple Cursor Adatper

Most of the time we will write our own Adapter by extending *Base Adapter*

>Watchout: Always remember that any adapter will always be expecting a Layout to be bind to them, ie the listitem 

Let's see Adapters in Action 

##Basic List view with Array Adapter

###Array Adapter

Whenever you have a list of single items which is backed by an array for example list of countries or names you can use Array Adapter. Array Adapter is backed by an array of objects.

By Default ArrayAdapter expects a Layout with single TextView. If you want to use more complex view please avoid arrayadapter and use custom adapter which we will see in the next section.

###Code
Download our Example App from https://github.com/pranayairan/Code-Learn-Android-Example/tree/master/CodeLearnListExample

Open ListViewWithSimpleAdapter Class

For Array Adapter to work you need to have an array of data, let's create a Array of Code Learn Tutorial Chapter: 

		String[] codeLearnChapters = new String[] { "Android Introduction","Android Setup/Installation","Android Hello World","Android Layouts/Viewgroups","Android Activity & Lifecycle","Intents in Android"};

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

With this simple 4 lines of code you created your first listview. If you run the application downloaded from https://github.com/pranayairan/Code-Learn-Android-Example/tree/master/CodeLearnListExample and click on simpleAdapter button you will see the array adapter in action. This is how it will look: 

![Array Adapters](/assets/list_view/Array_adapter.png "Array Adapters")

We have seen the Array Adapter, but most of the time you need more than 1 data in the list item. Let's look how we can use a base adapter to achieve what we want. 

If you notice in the above example we have used Android. R. Layout item these are inbuilt layout resources which android provides you to make your development faster. Here are some more examples of Listview items which android provides :

* simple_list_item_1 : A list Item with single TextView
* simple_list_item_2 : A List Item  with 2 texviews in 2 different line
* simple_expandable_list_item_1 : A List Item with Expandable View. List Items in list view can be of 2 types, 1 which just displays all content this is the simple list view item.Second is expandable list item which contains few of the data hidden. This hidden data can be viewed if user clicks on expand/collapse button. 
* simple_list_item_single_choice : A List Item with a radio button after textView, you can use this when you want to get a choice from user.
* simple_list_item_multiple_choice: A List Item with a Check Box after textview, you can use this when you want to get multuple choices from user. 


##Complex List View with Base Adapter

We have seen above what we can do with ArrayAdapter but for most use cases you will have a complex layout for list items Something like this : 
<br/>
![List Item](/assets/list_view/list_item.png "List Item")

This kind of complex list items can be bind with Base Adapter, with base adapter you can practically achieve any layout which you want in your list view. 

###BaseAdapter
Base Adapter is a common base class of general implementation for an Adapter that can be used in ListView. BaseAdapter can be extend to create a custom Adapter to suits out complex list item list.

Array Adapter is also an implementation of Base Adapter


###Creating Custom Adapter

Now we understand the concepts of base adapter Let's Create our own Custom Adapter. 

To create a custom adapter all you need to do is create a new class then extends baseadapter, for example 

 		public class CodeLearnAdapter extends BaseAdapter


With this simple line of code you can create your own adapter. Once you extend the Base Adapter it will automatically ask you to implement the required method, just use eclipse Add unimplimneted methods and it will create code for you. 

This is how your Custom Adapter will look like 

		public class CodeLearnAdapter extends BaseAdapter {

			@Override
			public int getCount() {
				// TODO Auto-generated method stub
				return 0;
			}

			@Override
			public Object getItem(int arg0) {
				// TODO Auto-generated method stub
				return null;
			}

			@Override
			public long getItemId(int arg0) {
				// TODO Auto-generated method stub
				return arg0;
			}

			@Override
			public View getView(int arg0, View arg1, ViewGroup arg2) {
				// TODO Auto-generated method stub
				return null;
			}

		} 

###Understading Custom Adapter Methods

Let's Go 1 by 1 and understand each method of custom adapter. 

* getCount() : This method tells the list view the number of row it will require. The count can come from your data source. It can be size of your Data Source. If you have your data source as List of object, this value will be size of list. 
* Object getItem(int arg0): We have 2 methods with getItem, this method returns an object, this method helps listview to get data for each row. The parameter passed is the row number stating from 0. in our List of Object this method will return the object at the passed index
* long getItemId(int arg0) : You can ignore this method, just return the same value as passed. This is in general helps listview to map its rows to the data set elements. 
* getView : This is the most important method, this method will be called to get the View for each row. This is the method where we can use our complex list item and bind it with the data. The fist argument pass to getview is the list view item position ie row number. The second parameter is recycled view reference, as we know list view recycles view you can check through this parameter. Third parameter is the parent to which this view will get attached to.

Now we understand all the methods of a custom adapter. Let's create our own Complex List View 

###Complex List Item

First Step to have a complex lisview is to have a complex list item, let's create a complex list item like this 
<br/>
![List Item](/assets/list_view/list_item.png "List Item")

This is similar to 1 use in twitter app.

This is the code for list item. Look into *listitem.xml* in the sample project. 

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

###Data Source
Now we have the complex list item, we need data, for this example project we will just use a List of codeLeanChapter Objects which will have a chapter name and chapter description. Here is how the datastructure of codeLeanChapter object look like 

		public class codeLeanChapter {
				String chapterName;
				String chapterDescription;
			}

In the sample code, we have created a simple method getDataForListView which returns a populated list of codeLeanChapter objects. This is how the method looks

		public List<codeLeanChapter> getDataForListView()
		{
			List<codeLeanChapter> codeLeanChaptersList = new ArrayList<codeLeanChapter>();
			
			for(int i=0;i<10;i++)
			{
				
				codeLeanChapter chapter = new codeLeanChapter();
				chapter.chapterName = "Chapter "+i;
				chapter.chapterDescription = "This is description for chapter "+i;
				codeLeanChaptersList.add(chapter);
			}
			
			return codeLeanChaptersList;
			
		}

### Custom Adapter
We have the list item and we have the data. Let's Create our own adapter, we have already created and seen a custom adapter in the above section, let's make some changes and put code in the methods.

*Getting the Data* 
Let's get the data into our custom Adapter by calling getDataForListView method we will create a new varaible inside our custom adapter. 

		List<codeLeanChapter> codeLeanChapterList = getDataForListView();

*getCount*
Now we have the data, let's add code in getCout method, as discussed earlier, this method tells listview how many rows it will have. In our case this is the size of codeLeanChapterList. So let's return this size. 
		
		return codeLeanChapterList.size();

*Object getItem* 
This method returns the object of the datasource at specified position. In our case the object is of type codeLeanChapter. Let's modify the return type, and add a return statement. 

		@Override
			public codeLeanChapter getItem(int arg0) {
				// TODO Auto-generated method stub
				return codeLeanChapterList.get(arg0);
			}

*long getItemId*
Leave this method as it is, just make sure it is returning the same value that is passed. 
		
		return arg0;

*getView*

Now this is our main method where we will bind the list item to the listview, since we want to use our own list item let's get the reference of our complex list item. To add any new layout to an existing layout you need to inflate the other layout. To inflate a layout you need to get the reference of LayoutInflater. 

		LayoutInflater inflater = (LayoutInflater) ListViewWithBaseAdapter.this.getSystemService(Context.LAYOUT_INFLATER_SERVICE);

In the above code, you just call getSystemService passing Context.LAYOUT_INFLATER_SERVICE. Getsystem service method is present in context. To get the reference of context, you can call .this method on activity,

Once you gave the layout inflater object you just need to call inflate method on it. 

 		View rowView = inflater.inflate(R.layout.listitem, arg2,false);

This inflates method takes 3 parameters, the layout which you want to add, the parent where the layout is being added and third a boolean to attach the root to it's parent.  

Now we have the reference of list item layout. but we know that list view recycles the views, lets check the second parameter of getView to see if we already have te reference of list item 

		if(arg1==null)
		{
			LayoutInflater inflater = (LayoutInflater) ListViewWithBaseAdapter.this.getSystemService(Context.LAYOUT_INFLATER_SERVICE);
			arg1 = inflater.inflate(R.layout.listitem, arg2,false);
		}

With this simple check we save the overhead of inflating a new view for each row. This will make our list view faster. 

Now we have the list item, let's bind the data with the listview item.

*First let's get the reference of list item elements*, in this case we want the reference of both the text view

		TextView chapterName = (TextView)arg1.findViewById(R.id.textView1);
		TextView chapterDesc = (TextView)arg1.findViewById(R.id.textView2);

*Now Let's get the Data*, we have the list of codeLeanChapterList, let's call a get method on the list passing the row id which is coming as 1st parameter of getView. 

		codeLeanChapter chapter = codeLeanChapterList.get(arg0);

*Binding Data* Now let's get data from chapter object and bind it to the textview. 

		chapterName.setText(chapter.chapterName);
		chapterDesc.setText(chapter.chapterDescription);


Now we have done everything just return the view 

		return arg1;

With this we have our custom Adapter ready to get bind to the list view. 

This is how the complete custom adapter looks : 

		public class CodeLearnAdapter extends BaseAdapter {

			List<codeLeanChapter> codeLeanChapterList = getDataForListView();
			@Override
			public int getCount() {
				// TODO Auto-generated method stub
				return codeLeanChapterList.size();
			}

			@Override
			public codeLeanChapter getItem(int arg0) {
				// TODO Auto-generated method stub
				return codeLeanChapterList.get(arg0);
			}

			@Override
			public long getItemId(int arg0) {
				// TODO Auto-generated method stub
				return arg0;
			}

			@Override
			public View getView(int arg0, View arg1, ViewGroup arg2) {
				
				if(arg1==null)
				{
					LayoutInflater inflater = (LayoutInflater) ListViewWithBaseAdapter.this.getSystemService(Context.LAYOUT_INFLATER_SERVICE);
					arg1 = inflater.inflate(R.layout.listitem, arg2,false);
				}
				
				TextView chapterName = (TextView)arg1.findViewById(R.id.textView1);
				TextView chapterDesc = (TextView)arg1.findViewById(R.id.textView2);
				
				codeLeanChapter chapter = codeLeanChapterList.get(arg0);
				
				chapterName.setText(chapter.chapterName);
				chapterDesc.setText(chapter.chapterDescription);
				
				return arg1;
			}

		}

###Binding Adapter with List View

Firs't Let's create the object of our custom adapter. 

		CodeLearnAdapter chapterListAdapter = new CodeLearnAdapter();

Now let's take reference of list view 

		ListView codeLearnLessons = (ListView)findViewById(R.id.listView1);

Now Let's Bind the adapter with listview by calling setAdapter Method. 

		codeLearnLessons.setAdapter(chapterListAdapter);

This is how the listview will look when you run it: 

![Custom Adapter](/assets/list_view/Custom_Base_adapter.png "Custom Adapter")


You can download the code from here and check the custom Adapter code in ListViewWithBaseAdapter.java file.


##List View Click Listner

One important topic before we finish the listview chapter is handling the click event. Whenever a listview item is clicked listview onItemClicked method is called. Let's see how this method looks: 

		public void onItemClick(AdapterView<?> arg0, View arg1, int arg2, long arg3) 

This method takes 4 parameters, 1st parameter is the Adapterview where the click happened, second is the view within the adapter that was clicked. Third is the position of the view and the last parameter is the rowid of the item that is clicked. 

In this method, you can get the Object from the codeLeanChapterList. Let's Add 1 more method in our Base Adapter which gives us this data. 

		public codeLeanChapter getCodeLearnChapter(int position)
		{
			return codeLeanChapterList.get(position);
		}

This method returns us the data at that row of list view. Call this method inside the OnItemClick to get the data, now you can perform any Business logic on this Data. In our example app we will just display a Toast. 

This is how our click listner looks

		codeLearnLessons.setOnItemClickListener(new OnItemClickListener() {

				@Override
				public void onItemClick(AdapterView<?> arg0, View arg1, int arg2,
						long arg3) {
					
					codeLeanChapter chapter = chapterListAdapter.getCodeLearnChapter(arg2);
					
					Toast.makeText(ListViewWithBaseAdapter.this, chapter.chapterName,Toast.LENGTH_LONG).show();
					
				}
			});

Now you get a fair understanding of how listview works in Android. Let's See Some more tricks which can help you


##ListActivity 

In our both examples, we have extended the activity class and bind the list view, though this is simple way in which you do most of your work in android, android also comes with specialize activities which can help you do reduce the overall code. This specialize activities gives you lot of shortcut method which can make your development easier and faster. 

ListActivity is 1 such example of specialized activity which android offers, ListActivity is a subclass of activity which makes creating, binding and using listview simple. Before going deep into ListActivity here are some of the advantages of using listActivity. 

* List Activity Binds with a list view by default, no need to explicitly get the ListView object
* ListActvity holds a List View object which can be bind just by calling setAdapter anywhere in the code. 
* Since it holds the reference of the list view, you can directly add the click listener. 

Let's See how we can use ListActivity in our CustomAdapter Example. To do this we will create a new Activity which will extend a listActivity. 

**XML**

The first thing that will be changed if we use the listactivity is the list view id in layout. ListActivity always expect the layout which you bind it with to have a list view with id *@android:id/list*. 

Why is this required ? if you recall we stated above that listactivity automatically holds the reference of a listview. This is achieved via a common naming convention of the listview whose object is instantiated in list activity automatically.

Go to list_view_list_activity.xml in our example project to see the list view with a new id. 


**Extends**

To use listactiviy just extends it in your class instead of activity. This will make the most of the boilerplate code available for you to use. 

**Binding Data**

In Case of listactivity you have the advantage of binding the adapter directly by calling *setListAdapter* method. This helps you to write faster code. 

Here is how you bind data in normal case, where you get the list view object and then call setAdapter on it.  

		ListView codeLearnLessons = (ListView)findViewById(R.id.listView1);
		codeLearnLessons.setAdapter(chapterListAdapter);

In case of ListActivity you just need to call setListAdapter passing the adapter: 
		
		setListAdapter(chapterListAdapter);


**Click Listener**

ListActivity provides you a default method onListItemClick which will be invoked every time someone clicks on a list view row. With this method you don't need to set an explicit listener on your listview. 

You can view the listactivity example in action in the sample project that you downloaded. Refer to ListViewWithListActivity.java

>Watchout: ListActivity works well if you have only single listview, in case you have more than 1 list view you need to put extra code for the other listview to work. 

You Download the sample app from https://github.com/pranayairan/Code-Learn-Android-Example/tree/master/CodeLearnListExample