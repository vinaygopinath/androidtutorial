Before we get on with the task of creating our list of Tweets, it would be a good idea to provide a brief introduction
to the way a list view is created in Android.

The primary purpose of a `ListView` is to render a collection of items, which are referred to as list view *items* or *rows*. 
This collection of items is typically represented as a `List` implementation like `ArrayList`, `LinkedList`, etc.
Each row item should itself be defined within a separate layout file. At the same time, the data to be displayed for every 
row item needs to be set explicitly by the backing `Activity` class. The `Activity` class in-turn manages to do this by 
associating the `List` instance with the `ListView`. This is done with the help of an `Adapter` class. 

All this might sound a bit loopy right now, but just hang in there. Things will be crystal clear within the next few lessons
that we undertake. But before that, take a moment to understand the relationship between the layout file's `ListView` and 
the `Adapter` and `ArrayList` (or any other `List` implementation) class' relationship with each other.

![ListView, Adapter, List relationship](https://dl.dropboxusercontent.com/u/1166125/codelearn/Screenshot%202013-12-02%2010.26.47.png 
"ListView, Adapter, List relationship")

The `Adapter` class is the bridge between a `ListView` and the data that backs the list. The `ListView` can display any data provided 
that it is wrapped in a `ListAdapter`. There are many sub-classes of the `ListAdapter` class, like the `ArrayAdapter`, `BaseAdapter`, 
`SimpleAdapter`, `CursorAdapter`, etc. Each of these adapter sub-classes serve a specialised case, and should be chosen accordingly.

For our purposes, we will be making use of an `ArrayAdapter` going forth. This is because we want to display simple list of objects,
which can easily be encapsulated within a `List` implementation like an `ArrayList`. 

>Just in case you haven't, a thorough, conceptual writeup is available [here](http://codelearn.org) for reference.  

