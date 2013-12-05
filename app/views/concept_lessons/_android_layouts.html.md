# Android Layouts

Android layouts manages & arranges the way its children appear on the screen.A layout defines the visual structure for a user interface, such as the UI for an activity or app widget. The ViewGroup subclass is the base class for layouts, which are invisible containers that hold other Views (or other ViewGroups) and define their layout properties. In this tutorial we will see learn below layouts -

* LinearLayout
* RelativeLayout
* GridLayout

## LinearLayout

It is one of the fundamental layout which is available for developers to implement their UI’s. So, as the name itself indicates this layout is “linear” in the sense that is puts its children in a linear fashion.LinearLayout is a view group that aligns all children in a single direction, vertically or horizontally.

So, the available orientation for LinearLayout are :

* Vertical
* Horizontal

**Note : By default orientation is always Horizontal.**

### Create Linear Layout

Go to layout folder of the project and create a new xml file. ( By default there will be activity_mail.xml). You can use this xml as well.

### Declaring Linear Layout

    <LinearLayout xmlns:android="http://schemas.android.com/apk/res/android"
       xmlns:tools="http://schemas.android.com/tools"
       android:layout_width="match_parent"
       android:layout_height="match_parent">
       
	   <!-- Other views -->
    
    </LinearLayout>

For any view/viewgroup we need to specify its width & height. If not specified, it will cause error. In the above declaration we have made both width and height attribute to “match_parent” (Also same as “fill_parent”. You can use any one). This means, we are telling the android system that this layout’s width and height is same as that of its parent. As this layout is the root view of our activity, it will take entire screen as its area.


### Orientation

As discussed, LinearLayout can be used in vertical or horizontal fashion. We can set the orientation of the layout by setting the “android:orientation” attribute.

#### Horizontal:

    <LinearLayout xmlns:android="http://schemas.android.com/apk/res/android"
       xmlns:tools="http://schemas.android.com/tools"
       android:layout_width="match_parent"
       android:layout_height="match_parent"
       android:orientation="horizontal" >
       <Button
           android:layout_width="wrap_content"
           android:layout_height="wrap_content"
           android:text="Button 1" />
       <Button
           android:layout_width="wrap_content"
           android:layout_height="wrap_content"
           android:text="Button 2" />
       <Button
           android:layout_width="wrap_content"
           android:layout_height="wrap_content"
           android:text="Button 3" />
    </LinearLayout>

[Insert Image]

Note : By default orientation is Horizontal.

#### Vertical:

In the vertical “orientation” all the children are put one below the other.

    <LinearLayout xmlns:android="http://schemas.android.com/apk/res/android"
		.
		.
       android:orientation="vertical" >
    	.
		.
	</LinearLayout>

[Insert Image]

## Relative Layout

Relative layout is also one of the basic layout available to design UI. It arranges its views with reference to the view siblings or with parent. That is, using Relative layout you can mention a view to be **onLeft, onRight, onBottom or toTop** of its siblings. You can also mention/position a view with respect to its parent.

### Create Layout

Go to layout folder of the project and create a new xml file. ( By default there will be activity_mail.xml). You can use this xml as well. In the below screenshot, I have renamed it.

[Insert Image]

### Declaring Layout

    <RelativeLayout xmlns:android="http://schemas.android.com/apk/res/android"
       xmlns:tools="http://schemas.android.com/tools"
       android:layout_width="match_parent"
       android:layout_height="match_parent" >
    
      <!-- child views -->
    
    </RelativeLayout>

#### Positioning child views in layout 

In this layout, you can specify the child layouts w.r.t its sibling or parent. To specify the same, one of the below mentioned attribute is assigned. 

##### Relative to container/parent 

[Insert Image]

**layout_alignParentxxx** - This attribute is used to **absolutely** position the child element relative to the parent. It can have four possible values - `layout_alignParentLeft`, `layout_alignParentRight`, `layout_alignParentTop` and `layout_alignParentBottom`. 

For eg. putting attribute `android:layoutalignParentLeft="true"` to a button element will align the button left edge of the button to that of parent layout.

Apart from above four variations, there are two more variations present - **layout_alignParentStart & layout_alignParentEnd**. layout_alignParentStart is equivalent to setting layout_alignParentTop & layout_alignParentLeft true for the element. You can guess what layout_alignParentEnd would do.

To position element at the horizontal center, `layout_centerHorizontal` is used. To set vertical position, you can either use absolute position attribute like layout_alignParentTop or layout_alignParentBottom or use the positioning relative to the sibling (mostly previous) element. This part is introduced later.

Similarly, `layout_centerVertical` positions the element vertically at the center. `layout_centerInParent` is layout_centerVertical & layout_centerHorizontal combined.

##### Relative to Sibling element

You can position an element relative to another element in the layout. Every element has an `android:id` attribute. The attribute can be used to reference the child element against which the positioning needs to be done. More about ids are discussed in the later part of this article. 

Most common attribute are the kind of **layout_toXXXOf**. XXX can take Left, Right, Start & End. Eg. `android:layout_toLeftOf=@+id/some_element` will position the element to the left of an element whose `android:id` is `@+id/some_element`.

Apart from it, there is `layout_above` & `layout_below`. The names are self explainatory. 

#### Relative Layout Example 

Download the [Relative Layout Android Project](), import it in Eclipse & run it. You should see the screenshot below. 

[Insert Image]

In the above example, we have put many views. An image, left to that are two textviews and also a date text view. Let us examine how this view can be put together using RelativeLayout. Consider below layout -  ( Replace the existing code in activity_relative_layout.xml )

In [activity_relative_layout.xml](http://github/project/link), look out for `ImageView` code. There is only one image in the layout.

    <ImageView
           android:id="@+id/pic"
           .
		   .
		   android:layout_alignParentLeft="true"
		   .
		   .
           />

The image is aligned to the left border of the parent.

The **Night Storm** text is a TextView element which is aligned to the top & right of the image `@+id/pic`

    <TextView
           android:id="@+id/title"
    	   .
    	   .
           android:layout_alignTop="@+id/pic"
           android:layout_toRightOf="@+id/pic"
           android:text="Night Storm"
           . 
    	   />

The date field '26 Nov 2013' is again a TextView element aligned to the right of the parent & to the top of image '@+id/pic'

    <TextView
           android:id="@+id/date"
    	   .
    	   .
           android:layout_alignParentRight="true"
           android:layout_alignTop="@+id/pic"
           android:text="26 NOV 2013"
           . 
    	   />

## Grid Layout

A layout that places its children in a rectangular grid.GridLayout uses a grid of infinitely-thin lines to separate its drawing area into: rows, columns, and cells. It supports both row and column spanning, which together allow a widget to occupy a rectangular range of cells that are next to each other. 

### Create Layout

[Download the project], import it in Eclipse & navigate to grid_layout.xml file inside layout directory as shown in the image

[INSERT Image]

### Declaring Layout

`GridLayout` has fields `android:columnCount` & `android:rowCount` which specify the columns & rows in the layout specifically. Each child element can then be positioned to occupy one of the blocks. 

    <?xml version="1.0" encoding="utf-8"?>

    <GridLayout xmlns:android="http://schemas.android.com/apk/res/android"
       android:layout_width="match_parent"
       android:layout_height="match_parent"
       android:columnCount="4"
       android:orientation="horizontal"
       android:rowCount="4" >
    
       <!-- Child views -->
    
    </GridLayout>

Above is example of 4x4 grid layout with horizontal orientation. The orientation specifies the order in which child element gets populated in the blocks. `orientation="horizontal"` implies that the first row will be filled first & then the second row & then the next. "vertical" orientation implies the first column will be filled first & then the next column. 

**Orientation : Horizontal**

    <?xml version="1.0" encoding="utf-8"?>
    <GridLayout xmlns:android="http://schemas.android.com/apk/res/android"
       android:layout_width="match_parent"
       android:layout_height="match_parent"
       android:columnCount="4"
       android:orientation="horizontal"
       android:rowCount="4" >
    
       <TextView android:text="A 1" android:padding="5dp"/>
       <TextView android:text="A 2" android:padding="5dp"/>
       <TextView android:text="A 3" android:padding="5dp"/>
       <TextView android:text="A 4" android:padding="5dp"/>
       <TextView android:text="B 1" android:padding="5dp"/>
       <TextView android:text="B 2" android:padding="5dp"/>
       <TextView android:text="B 3" android:padding="5dp"/>
       <TextView android:text="B 4" android:padding="5dp"/>
       <TextView android:text="C 1" android:padding="5dp"/>
       <TextView android:text="C 2" android:padding="5dp"/>
       <TextView android:text="C 3" android:padding="5dp"/>
       <TextView android:text="C 4" android:padding="5dp"/>
       <TextView android:text="D 1" android:padding="5dp"/>
       <TextView android:text="D 2" android:padding="5dp"/>
       <TextView android:text="D 3" android:padding="5dp"/>
       <TextView android:text="D 4" android:padding="5dp"/>
    
    </GridLayout>

In the above layout, we have put Textviews in the form of a grid. As the orientation is horizontal, it starts filling the 4X4 grid horizontally and populates all the views. If we change the orientation to vertical, the layout will be traced in a vertical fashion. Below are the screenshots for both orientations.

[Insert Image]

In Grid layout, the size of each cell is dependent on layout_gravity of its siblings. So if we change, some of the data in above views, only those views will get the width corresponding to new text.

layout_gravity specifies how a component should be placed in its group of cells. The default value set to layout_gravity is LEFT | BASELINE.

    <?xml version="1.0" encoding="utf-8"?>

    <GridLayout xmlns:android="http://schemas.android.com/apk/res/android"
       android:layout_width="match_parent"
       android:layout_height="match_parent"
       android:columnCount="4"
       android:orientation="vertical"
       android:rowCount="4" >
    
       <TextView android:text="A 1 Extra text" android:padding="5dp"/>
       <TextView android:text="A 2" android:padding="5dp"/>
       <TextView android:text="A 3 Extra text" android:padding="5dp"/>
       <TextView android:text="A 4" android:padding="5dp"/>
       <TextView android:text="B 1" android:padding="5dp"/>
       <TextView android:text="B 2 Extra text" android:padding="5dp"/>
       <TextView android:text="B 3" android:padding="5dp"/>
       <TextView android:text="B 4" android:padding="5dp"/>
       <TextView android:text="C 1" android:padding="5dp"/>
       <TextView android:text="C 2" android:padding="5dp"/>
       <TextView android:text="C 3" android:padding="5dp"/>
       <TextView android:text="C 4" android:padding="5dp"/>
       <TextView android:text="D 1" android:padding="5dp"/>
       <TextView android:text="D 2 Extra text" android:padding="5dp"/>
       <TextView android:text="D 3" android:padding="5dp"/>
       <TextView android:text="D 4 Extra text" android:padding="5dp"/>
    
    </GridLayout>

[Insert Image]

## Invoking Layout from Activity

In each demo we have created a layout and now let us see how this can be used in the Activity. All the files/images/etc which we put in our res folder are considered as resource in Android. The Android framework creates a unique id for each resource and this exact id can be used to refer these resources.

### setContentView

Open the MainActivity.java/RelativeLayoutActivity.java/GridLayout.java file in src folder and below is the code that you will see. By default Android creates this code snippet for you.

   @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main); // for LinearLayout
        setContentView(R.layout.activity_relative_layout); //for RelativeLayout
        setContentView(R.layout.grid_layout); // For GridLayout
    }

Now `setContentView(..)` method tells the Activity which layout it has to use for its UI. As we have created a layout resource, we can easily refer to this as R.layout.{name_of_xml_file}. Android automatically creates this constant for you.

### android:id

Any View object may have an integer ID associated with it, to uniquely identify the View within the tree. When the application is compiled, this ID is referenced as an integer, but the ID is typically assigned in the layout XML file as a string, in the id attribute. The syntax for an ID, inside an XML tag is:

`Specifying element id`

     android:id="@+id/{name_of_id}"

The at-symbol (@) at the beginning of the string indicates that the XML parser should parse and expand the rest of the ID string and identify it as an ID resource. The plus-symbol (+) means that this is a new resource name that must be created and added to our resources (in the R.java file). When referencing an Android resource ID, you do not need the plus-symbol, but must add the android package namespace, like so:

`Referencing an element`

     android:layout_toLeftOf="@android:id/{id_of_reference_element}"

An ID need not be unique throughout the entire tree, but it should be unique within the part of the tree you are searching (which may often be the entire tree, so it is best to be completely unique when possible).

So whenever an Activity( a screen in android) is about to be shown to the user, its onCreate() method is called. And exactly here we are telling which UI (layout) to use before becoming visible to user. This is how we create a layout (UI) and use(bind) it to the corresponding Activity 

## Other Layout XML attributes

XML layout attributes named layout_{something} define layout parameters for the View that are appropriate for the ViewGroup in which it resides. All view groups include a width and height (`layout_width` and `layout_height`), and each view is required to define them. Many LayoutParams also include optional margins and borders.

You can specify width and height with exact measurements, though you probably would not want to do this often. More often, you will use one of these constants to set the width or height:

* wrap_content tells your view to size itself to the dimensions required by its content
* fill_parent (renamed match_parent in API Level 8) tells your view to become as big as its parent view group will allow.

In general, specifying a layout width and height using absolute units such as pixels is not recommended. Instead, using relative measurements such as density-independent pixel units (dp), wrap_content, or fill_parent, is a better approach, because it helps ensure that your application will display properly across a variety of device screen sizes. 
