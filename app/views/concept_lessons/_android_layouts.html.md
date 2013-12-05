# Android Layouts

Layout is the View element container in Android. It is also known as **Viewgroup**. All view elements like textbox, label, buttons etc need to be contained inside the layout. 

The Layout is in-turn contained in a layout file location inside **res/layout** directory of the Android app. An Android Activity uses the Layout & shows output on the screen. 

The three most important kind of Layout elements are

* LinearLayout
* RelativeLayout
* GridLayout


## LinearLayout

It is one of the fundamental layout which is available for developers to implement their UI’s. So, as the name itself indicates this layout is “linear” in the sense that is puts its children in a linear fashion.LinearLayout is a view group that aligns all children in a single direction, vertically or horizontally.

So, the available orientation for LinearLayout are :

* Vertical
* Horizontal

**Note : By default orientation is always Horizontal.**


[Download this sample project](https://github.com/codelearn-org/android-linear-layout-example) , import in Eclipse & navigate to activity_main.xml file as shown in the screenshot below.
<br/>
![Linear Layout XML file](/assets/android-layouts/linear-layout-file-location.png "Linear Layout XML file")
<p class="ac"><b>Linear Layout XML file</b></p>
<br/>

 Double click the file to view its content.

`activity_main.xml`

    <LinearLayout xmlns:android="http://schemas.android.com/apk/res/android"
       xmlns:tools="http://schemas.android.com/tools"
       android:layout_width="match_parent"
       android:layout_height="match_parent">
       
	   <!-- Other views -->
    
    </LinearLayout>

**LinearLayout** is the XML element name for this layout. **xmlns:android** initializes the namespace 'android'. The attributes layout_width & layout_height are part of android namespace. If you are new to XML & namespace, you do not have to worry much about it.

For any view/viewgroup we need to specify its width & height. If not specified, it will cause error. In the above declaration we have made both width and height attribute to “match_parent” (Also same as “fill_parent”. You can use any one of them). This means, we are telling the android system that this layout’s width and height is same as that of its parent. As this layout is the root view of our activity, it will take entire screen as its area.

LinearLayout can be used in vertical or horizontal fashion. We can set the orientation of the layout by setting the “android:orientation” attribute.

### Horizontal Orientation

`Horizontal`

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

<br/>
![Linear Layout horizontal alignment Screenshot](/assets/android-layouts/linear-layout-horizontal-screenshot.png "Linear Layout horizontal alignment Screenshot")
<p class="ac"><b>Linear Layout horizontal alignment screenshot</b></p>
<br/>

Note : By default orientation is Horizontal.

### Vertical Orientation

In the vertical “orientation” all the children are put one below the other. Edit activity_main.xml. Change android_orientation field from horizontal to vertical.

`activity_main.xml`

<pre>
    &lt;LinearLayout xmlns:android="http://schemas.android.com/apk/res/android"
		.
		.
       android:orientation="<strike>horizontal</strike>vertical" &gt;
    	.
		.
	&lt;/LinearLayout&gt;
</pre>

Save the file & deploy your Android app. You will see the screenshot as shown below. 

<br/>
![Linear Layout vertical alignment Screenshot](/assets/android-layouts/linear-layout-vertical-screenshot.png "Linear Layout vertical alignment Screenshot")
<p class="ac"><b>Linear Layout vertical alignment screenshot</b></p>
<br/>


## Relative Layout

Relative layout is also one of the basic layout available to design UI. It arranges its views with reference to the view siblings or with parent. That is, using Relative layout you can mention a view to be **onLeft, onRight, onBottom or toTop** of its siblings. You can also mention/position a view with respect to its parent.



In this layout, you can specify the child layouts w.r.t its sibling or parent. To specify the same, one of the below mentioned attribute is assigned. 

### Position relative to container/parent 

<br/>
![Relative Layout position options](/assets/android-layouts/relative-layout-position-options.png "Relative Layout position options")
![Relative Layout position options](/assets/android-layouts/relative-layout-position-options-2.png "Relative Layout position options")
<p class="ac"><b>Relative Layout position options</b></p>
<br/>

**layout_alignParentxxx** - This attribute is used to **absolutely** position the child element relative to the parent. It can have four possible values - **layout_alignParentLeft, layout_alignParentRight, layout_alignParentTop and layout_alignParentBottom**. 

For eg. putting attribute `android:layoutalignParentLeft="true"` to a button element will align the button left edge of the button to that of parent layout.

Apart from above four variations, there are two more variations present - **layout_alignParentStart & layout_alignParentEnd**. layout_alignParentStart is equivalent to setting layout_alignParentTop & layout_alignParentLeft true for the element. You can guess what layout_alignParentEnd would do.

To position element at the horizontal center, **layout_centerHorizontal** is used. To set vertical position, you can either use absolute position attribute like layout_alignParentTop or layout_alignParentBottom or use the positioning relative to the sibling element. This part is introduced later.

Similarly, **layout_centerVertical** positions the element vertically at the center. **layout_centerInParent** is layout_centerVertical & layout_centerHorizontal combined.

### Position relative to sibling

You can position an element relative to another element in the layout. Every element has an **android:id** attribute. The attribute can be used to reference the child element against which the positioning needs to be done. More about ids are discussed in the later part of this article. 

Most common attribute are the kind of **layout_toXXXOf**. XXX can take Left, Right, Start & End. Eg. `android:layout_toLeftOf=@+id/some_element` will position the element to the left of an element with `android:id="@+id/some_element"`.

Apart from it, there is **layout_above & layout_below**. The names are self explainatory. 

### Relative Layout Example 

[Download this sample project](https://github.com/codelearn-org/android-relative-layout-example) , import in Eclipse & navigate to [activity_relative_layout.xml](https://github.com/codelearn-org/android-relative-layout-example/tree/master/res/layout) file as shown in the screenshot below.

<br/>
![Relative Layout XML file](/assets/android-layouts/relative-layout-file-location.png "Relative Layout XML file")
<p class="ac"><b>Relative Layout XML file</b></p>
<br/>

Run the project & you will see screenshot as below.

<br/>
![Relative Layout Screenshot](/assets/android-layouts/relative-layout-screenshot.png "Relative Layout Screenshot")
<p class="ac"><b>Relative Layout Screenshot</b></p>
<br/>


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

## Choosing between Linear & Relative Layout

An important consideration when dealing with layout elements is when is it good to use which layout element. The **LinearLayout** is optimized for
situations where child elements need to be rendered one after the other from top to bottom, or left to right. That is why the LinearLayout has
an attribute called **orientation**, which instructs the platform to render the child elements either in **horizontal** or **vertical** fashion. 

A **RelativeLayout** on the other hand, allows for a more random arrangement of child elements. Child elements can be arranged *relative* to each other or the parent layout itself. This allows you to have a more flexible design layout approach. 

The following figure should give you an understanding when to choose between either of them &nbsp;

![Relative and Linear Layout Difference](/assets/android-layouts/linear-vs-relative.png "Relative and Linear Layout Difference")

One important point to note is that in almost every circumstance, `RelativeLayout` and `LinearLayout` can be used to replace the other. However, in
general, it is usually much more verbose to do it. In some cases, if the layout is fairly simple, it really doesn't matter which one you choose.


## Grid Layout

A layout that places its children in a rectangular grid.GridLayout uses a grid of infinitely-thin lines to separate its drawing area into: rows, columns, and cells. It supports both row and column spanning, which together allow a widget to occupy a rectangular range of cells that are next to each other. 


[Download the sample project](https://github.com/pocha/android-grid-layout-example), import it in Eclipse & navigate to [grid_layout.xml](https://github.com/pocha/android-grid-layout-example/blob/master/res/layout/grid_layout.xml) file inside layout directory as shown in the image

<br/>
![Grid Layout XML file](/assets/android-layouts/grid-layout-file-location.png "Grid Layout XML file")
<p class="ac"><b>Grid Layout XML file</b></p>
<br/>


**GridLayout** has fields **android:columnCount** & **android:rowCount** which specify the columns & rows in the layout specifically. Each child element can then be positioned to occupy one of the blocks. 

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

<br/>
![Grid Layout Screenshot](/assets/android-layouts/grid-layout-screenshot.png "Grid Layout Screenshot")
<p class="ac"><b>Grid Layout Screenshot</b></p>
<br/>


In Grid layout, the size of each cell depends on the text content of every other sibling element in its row & column. So if the text changes in one of the element, the column or row will stretch to keep the alignment intact.

layout_gravity specifies how a component should be placed in its own cell. The default value set to layout_gravity is LEFT | BASELINE. Consider it to be positioning of the actual text in the cell if the cell is *too wide* for the text. This could be due to the fact that any of the sibling element in the row or column has a lot bigger text.

This behavior is similar to how HTML table behaves. 

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

<br/>
![Grid Layout Table Like Behavior](/assets/android-layouts/grid-layout-table-like-behavior.png "Grid Layout Table Like Behavior")
<p class="ac"><b>Grid Layout Table Like Behavior</b></p>
<br/>


## Invoking Layout from Activity

In each demo we have created a layout and now let us see how this can be used in the Activity. All the files/images/etc which we put in our res folder are considered as resource in Android. The Android framework creates a unique id for each resource and this exact id can be used to refer these resources.

### setContentView

Open the MainActivity.java/RelativeLayoutActivity.java/GridLayout.java file in src folder of any of the above projects and below is the code that you will see. By default Android creates this code snippet for you.

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main); // for LinearLayout
        setContentView(R.layout.activity_relative_layout); //for RelativeLayout
        setContentView(R.layout.grid_layout); // For GridLayout
    }

Now `setContentView(..)` method tells the Activity which layout it has to use for its UI. As we have created a layout resource, we can easily refer to this as R.layout.{name_of_xml_file}. Android automatically creates this constant for you.

## android:id

Any View object may have an integer ID associated with it, to uniquely identify the View within the tree. When the application is compiled, this ID is referenced as an integer, but the ID is typically assigned in the layout XML file as a string, in the id attribute. The syntax for an ID, inside an XML tag is:

`Specifying element id`

     android:id="@+id/{name_of_id}"

The at-symbol (@) at the beginning of the string indicates that the XML parser should parse and expand the rest of the ID string and identify it as an ID resource. The plus-symbol (+) means that this is a new resource name that must be created and added to our resources (in the R.java file). When referencing an Android resource ID, you do not need the plus-symbol, but must add the android package namespace, like so:

`Referencing an element`

     android:layout_toLeftOf="@android:id/{id_of_reference_element}"

An ID need not be unique throughout the entire tree, but it should be unique within the part of the tree you are searching (which may often be the entire tree, so it is best to be completely unique when possible).

So whenever an Activity( a screen in android) is about to be shown to the user, its onCreate() method is called. And exactly here we are telling which UI (layout) to use before becoming visible to user. This is how we create a layout (UI) and use(bind) it to the corresponding Activity 

## layout_height layout_width & other attributes

XML layout attributes named layout_{something} define layout parameters for the View that are appropriate for the ViewGroup in which it resides. All view groups include a width and height (`layout_width` and `layout_height`), and each view is required to define them. Many LayoutParams also include optional margins and borders.

You can specify width and height with exact measurements, though you probably would not want to do this often. More often, you will use one of these constants to set the width or height:

* wrap_content tells your view to size itself to the dimensions required by its content
* fill_parent (renamed match_parent in API Level 8) tells your view to become as big as its parent view group will allow.

In general, specifying a layout width and height using absolute units such as pixels is not recommended. Instead, using relative measurements such as density-independent pixel units (dp), wrap_content, or fill_parent, is a better approach, because it helps ensure that your application will display properly across a variety of device screen sizes. 
