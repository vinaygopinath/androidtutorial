#Android Widgets / View Elements

Any android app is made up of lot of activities and all the activities have User interface. Android provides us lot of prebuilt user interface elements, we can use this UI compontents to create a nice looking UI for our app

In the previous chapter you have seen how we have different layouts which can be use to give structure to your app user interface. This layouts are just empty placeholder for Android views, lets see some of the most user Android Layout widgets and some of there most use propery. 

In Android All layouts are XML based, even though you get a nice graphical editor, ultimately the elements are nothing but XML code, lets take a brief look about both

##Graphical Layout
If you open any Layout XML in ADT you will see 2 tabs like the 1 in this image 
<br/>
![Layout Tabs](/assets/android_widgets/tabs.png "Layout Tabs")

To open Drag and Drop Graphical Layout just click on the Graphical Layout tab.

This is how the Graphical Layout Editor looks like
<br/>
![Layout Editor](/assets/android_widgets/layout_editor.png "Layout Editor")

Lets see what are this sections 

###Palette
Palette section will have all your basic UI elements available to you categorized into different sections, like Form Widgets, TextFields, Layouts etc. You can just choose any Elements and Drag and Drop it to the right on the Screen. That UI element will be added to your Layout. 

###Control Bar 
The top bar which you see with options like Nexus one, App Theme etc is control bar, it has different options to test the UI against different conditions. You can control the size of screen, orientation theme etc from this bar. You can also change Zoom level check lint warnings etc from this bar. 

###Design Area
the remaining Right part of palette is where your UI is coming, you can drag and drop elements to this part, rearrange already put elements, reorder them change there properties by right clicking. 


##Common Attributes and Properties

All UI are of type View and have some common properties which might be useful to understand. All the UI Elemets which we will see in next section will have this propeties

###android:id 
Id is use to uniquely identify this View in Java Code. When you assign an ID to a View it makes that view uniquely identifiable in that Layout. In later chpaters we will see the use of ID in more details. 

Here is how it will look like in code
		android:id="@+id/textView1"

###android:layout_width 
layout_width property of view defines the width of that view, you should define width in px or dp.

###android:layout_height
layout_height property of view defines the height of that view, you should define height in px or dp.

Whenever you drag and drop a UI element from Designer view, it automatically generates atleas this 3 property for that view

Here is how Height and Width will look into code

		android:layout_width="match_parent"
		android:layout_height="wrap_content"

Since all UI elements are inherited from view, all have a onClick property, we will only be seeing onClick for some of the ui elements. 

Here are some common attributes or terminology which will be good to understand before seeing ui elements in action

###wrap_content
This is the value which you will be using in width or height, this tells android to make the UI element width or height just equal to the size of conent which the ui has.

For example: a text view with text "HELLO" with width as wrap_content will only be 5 character wide. 

###match_parent or fill_parent 
Always use match_parent even though both means same. This value again used in width or height, this tell android to make the view height or width matching to its parent height or width. If parent is taking full size in screen, setting this value on any UI element will also make its height or width equal to the screen size

###dp 
Dp is density independent pixle, as you know android device comes with different density of screen, this value can be used instead of PX (pixle), if you use dp android will automatically claculate px for you based on screen of the android device. 

For Example: On some device 1dp might be equal to 1 px but on some device 1dp = 5px

###Padding 
Padding is the space inside the border, between the border and the actual view's content. Padding is always inside the view and goes completely around content. You can set padding on all 4 sides or on individual side. 

For Example: If you set padding in EditText, the cursor inside the edit text will move. 

Here is how Padding looks in code: 

For all sides 

		android:padding="2dp"

For Individual Sides

		android:paddingLeft="2dp"
		android:paddingRight="3dp"
		android:paddingTop="5dp"
		android:paddingBottom="8dp

###Margin
Margins are the spaces outside the border, between the border and the other elements next to this view, ie margin is outside view, it is space between 2 views, whenever you want to give space between 2 views you can use Margine. 

For Example: If you set Margin in EditText, the EditText will move from it's parent view by that value.

Here is how Margin will Look in code: 

For all sides 

		android:layout_margin="2dp"

For Individual Sides

		android:layout_marginLeft="2dp"
		android:layout_marginRight="3dp"
		android:layout_marginTop="5dp"
		android:layout_marginBottom="8dp


You might wonder what is the difference between margin and padding. Let's See an Image to Understand better. 

<br/>
![Padding and Margin](/assets/android_widgets/padding_Margin.jpg "Padding and Margin")

In the image, the margin is the grey area outside the entire object. Border is point where your view is ending. 

Margin and Padding is same concept as in CSS

###Gravity
When ever you want to allign content inside the view use gravity, android:gravity sets the gravity of the content of the View its used on. Android Gravity when applied on a view specify the direction it's content should be alligned. 

For Example: In A Linear Layout when you set Gravity To Center, all its View will come in Center.

This is how you set gravity of layout 
		android:gravity="center"

###Layout Gravity
Layout Gravity is the Outside gravity of the View. That means, layout gravity sets the gravity of the View or Layout in its parent.

Here is how you set layout gravity
		android:layout_gravity="right"

HTML/CSS Equivalents:

android:layout_gravity = float in CSS

android:gravity = text-align in CSS


> Note: you might wonder whay all the propertry is starting with android ?? If you notice the first line of any XML file there is a namespace define xmlns:android="http://schemas.android.com/apk/res/android". Notice the attribute android here it is reffering to Android Schema with android. This Schema has all reference to values like id, text other attirbutes. You can read more about XML Schema from this link http://en.wikipedia.org/wiki/XML_schema 

###'android:' namespace

You might wonder whay all the propertry is starting with `android:`. If you notice the first line of any XML file there is a namespace definition 

      xmlns:android="http://schemas.android.com/apk/res/android"
   
Notice the attribute android here it is reffering to Android Schema with android. This Schema has all reference to values like id, text other attirbutes. You can read more about XML Schema from this link [http://en.wikipedia.org/wiki/XML_schema](http://en.wikipedia.org/wiki/XML_schema)

##TextView

Textview is most simple ui element, it is use to display static text which can not be changed by user. 

In HTML world TextView is nothing but a Label. 

Lets see some of the useful properties of textview

###android:text 
This property defines the text which will come inside the TextView

###android:textColor

This propery defines the color of text, this take HexaDecimal text color for example #ffff00 

###android:textSize

This property defines the size of text, it takes value in sp, for example "15sp"


###Example 
This is how a simple textview looks in code. 

		<TextView
		        android:id="@+id/textView1"
		        android:layout_width="match_parent"
		        android:layout_height="wrap_content"
		        android:text="Hello World" 
		        android:textColor="#ffff00"
		        android:textSize="15sp"/>

Lot of time you require to set the text of TextView Dynamically via code, let's see how we can change the text of text view via code.

First Step is to get reference of TextView or any other view in code. 

		TextView txtView = (TextView)findViewById(R.id.textView1);

Notice the above code, you create a button object and then call findViewByID method passing the android:id of the TextView. 

Since all the UI elements are view, findViewbyId returns a view object which we need to typecase into correct subview, in this case TextView 

Now to change the text just call settext method on the txtView object 
		
		txtView.setText("Set your Text Here"); 

With this simple 2 lines of code you can change the text of textview dynamically

##EditText

EditText is another most used UI elements in android, whenever you want to take some input from user you use EditText. 

In HTML world EditText is nothing but a input tag. 

Lets see some of the useful properties of EditText

**android:text** : this property defines the text which will come inside the EditText, or the text which user will enter. Typically in Javacode once you have the reference of edittext object, this is the property which you call to get the value which user might have key in

**android:hint**: this propery defines the hint which you want to give to user, this hint appear inside the edittext but gets disappear once user start typing anything inside the edit text

**android:ems**: this propery defines how many character long the edit text should be, since there is no text inside the edit text, making it wrap_content will not help, this property helps you in defining the exact width for edit text. 

**android:background**: this property defines the background of the edit text, you can either choose a color or set a image as background of the edit text

**android:inputType**: this property defines what kind of content the edit text will contain, like in html you can define type this propery helps you in defining type of content for edit text. 

For Example: textPassword will make the text automatically converted into * as user start typing, number will change the keyoboard layout to numeric helping user to type 
number faster.

This is very powerful property of Edit text and if you know what kind of content your edit text need, make sure to define that using inputType. 


###Code
This is how a simple editText will look like

		<EditText
		        android:id="@+id/editText1"
		        android:layout_width="wrap_content"
		        android:layout_height="wrap_content"
		        android:ems="10" 
		        android:text="Pranay"
		        android:hint="Enter User Name"
		        android:background="#ff0000"
		        android:inputType="text">

Most of the time you want to get the value of EditText or preppulate edit text value dynamically, let's see how we can do this in code.

Firs't let get the reference of the EditText 

		EditText edtText = (EditText)findViewById(R.id.editText1);

As discussed earlier, we just call findViewById to get reference of view in code.

Now to get the content of the edit text, just call getText method, like this 

		edtText.getText()

To set the text of the edit text similar to textview you can call 

		edtText.setText("Set your value")

##Button

###What
Button is the most used UI elements in Android, for every action you want to do, you want user to click on a button. 

###Properties
Lets see some of the useful properties of Button

**android:text** : this property defines the text which will come on the top of button, you can change the text dynamically through code

**android:textColor**: this propery defines the color of text on the button, this take HexaDecimal text color for example #ffff00 

**android:background**: this property defines the background of the button, you can either choose a color or set a image as background of the button

**android:clickable** : this property makes the button enable or disable, this takes boolean, for example false

###Click Listner
Button is made to be clicked, lets see how we can add a click listner to button. Even though you can dierectly define method which should be called when click in UI through android:onClick property, the best way to do it is using code.

Get the object of button in code. 

		Button b = (Button) findViewById(R.id.button1);

if you notice the above code, you create a button object and then call findViewByID method passing the android:id of the button. 

Since all the UI elements are view, findViewbyId returns a view object which we need to typecase into correct subview. 

Add listner

		b.setOnClickListener(new OnClickListener() {
			
			@Override
			public void onClick(View v) {
				
				// Do what you want after button click here
			}
		});
In above code you add a click listner to the button, whenever button is click ,the onclick method of button will be called. 

###Code
This is how a button will look in XML code

		<Button
		android:id="@+id/button1"
		android:layout_width="wrap_content"
		android:layout_height="wrap_content"
		android:background="#f23400"
		android:clickable="false"
		android:text="Button" />

Similar to editText and textView you can call **setText** method on button object to change the text on button dynamically

##ImageView

###What
Any android app is incomplete without use of an image, Image View is the UI control which you can use to display image in your android app. 

In html image view is img tag. 

###Properties
Lets see some of the useful properties of Image View

**android:src** : The most important property of ImageView is src, this property helps you in defining the image which will be displayed in the image view. You can pass android drawable or your own drawable. Let's see an example

		 android:src="@drawable/ic_launcher" 

Here "@drawable" refers to your drawable folder which is present inside res folder. After that you put the image name without the extension. 

**android:contentDescription** : This is not a required property but it is recommended to set the content Description. Content Description is text description of the image which you have set as src. This property helps in accessibility, if this propery is set users with diffuclty in seeing the image can use Screen Reader which will read out the text from content description. 

###Code
This is how a image view will look in XML code

		<ImageView
		        android:id="@+id/imageView1"
		        android:layout_width="wrap_content"
		        android:layout_height="wrap_content"
		        android:contentDescription="Image Description"
		        android:src="@drawable/ic_launcher" />

Lot of time you want to change the image of ImageView dynamically from code, Let's see how we can do that from code.

Let's get the reference of image view 
		ImageView imView = (ImageView)findViewById(R.id.imageView1);

Once we have the image view object we can call setImageResource method to change the image, you can pass the drawable which you want to set to the imageview .

		imView.setImageResource(R.drawable.new_image);


##RadioButton

###What
If you want to give option to your user to select one option from a set use Radio button. 

In HTML the input type="radio" is radio button. 

###Properties
Let's see what are the properties of radio button

**RadioGroup** : Radio button don't resides on there own, a radio button will always be inside a Radio Group, Radio Group can have multiple radiobutton. All the radio buttons inside the radio group will have 1 Click event which will be invoked when user selects the radio button. 

For example : 

		<RadioGroup
		    android:layout_width="fill_parent"
		    android:layout_height="wrap_content"
		    android:orientation="vertical">

the orientation propery of radio group helps you in alligning radio button in vertical or horizontal format. 

**android:text** : Android text property of radio button is use for putting text in radio button. 

**android:checked** : Checked property of radio button let you define preselected/default selected option in a radio group. For example: if you have 3 radio button you can use this propery in any 1 to make it default selected.

		android:checked="true"

###Click Listner
Radio buttons are created to be clicked, in a radio group, all the radio button will have 1 click listner. This click Listner will be invoked when the user will click on any of the radio button from that radio group. There are multiple way to add a click listner, but simple way is to do in code using android:onClick property of radio button. 

Lets see an example 

		 <RadioButton
		            android:id="@+id/radio_code"
		            android:layout_width="wrap_content"
		            android:layout_height="wrap_content"
		            android:onClick="onRadioButtonClicked"
		            android:text="Code" />

		 <RadioButton
		            android:id="@+id/radio_learn"
		            android:layout_width="wrap_content"
		            android:layout_height="wrap_content"
		            android:onClick="onRadioButtonClicked"
		            android:text="Learn" 
		            android:checked="true"
		            />

In the above example notice the propery onClick, since this 2 radio buttons resides in same radio group, both has same click listners. 

Here is how the click method looks

		public void onRadioButtonClicked(View view) {
		    // Is the button now checked?
		    boolean checked = ((RadioButton) view).isChecked();
		    
		    // Check which radio button was clicked
		    switch(view.getId()) {
		        case R.id.radio_code:
		            if (checked)
		                // Code option selected
		            break;
		        case R.id.radio_learn:
		            if (checked)
		                // Learn Option Selected
		            break;
		    }
		}

you can create a method in your code which you define in onClick of radio button. In this meethod, you can get the id of the radio via  **view.getId()** once you have the id, you can use a switch case statement to determine which radio button was clicked by checking **view.isChecked()** 

With this smple code you can know which radio button selection was made

### Code
Here is how the complete Radio button delcaration will look inside the XML

		 <RadioGroup
		        android:layout_width="fill_parent"
		        android:layout_height="wrap_content"
		        android:orientation="vertical" >
				 
				 <RadioButton
						            android:id="@+id/radio_code"
						            android:layout_width="wrap_content"
						            android:layout_height="wrap_content"
						            android:onClick="onRadioButtonClicked"
						            android:text="Code" />

				<RadioButton
						            android:id="@+id/radio_learn"
						            android:layout_width="wrap_content"
						            android:layout_height="wrap_content"
						            android:onClick="onRadioButtonClicked"
						            android:text="Learn" 
						            android:checked="true"
						            />
		</RadioGroup>


##CheckBox

###What
If you want to give option to your user to select one or more option from a set use Check Box. 

In HTML the input type="checkbox" is checkbox. 

###Properties
Let's see what are the properties of checkbox. Mostly the checkbox and radio button properties are similar

**android:text** : Android text property of checkbox is use for putting text in radio button. 

**android:checked** : Checked property of checbox let you have the checkbox checked by default. 

		android:checked="true"

###Click Listner
All the checkbox will have click listner. You can have a common click listner or different click listners. This click Listner will be invoked when the user will select or unselect any checkbox. There are multiple way to add a click listner, but simple way is to do in code using android:onClick property of checkbox. 

Lets see an example 

		<CheckBox android:id="@+id/feedback"
		        android:layout_width="wrap_content"
		        android:layout_height="wrap_content"
		        android:text="Feeback"
		        android:onClick="onCheckboxClicked"/>
		    
		    <CheckBox android:id="@+id/collectdata"
		        android:layout_width="wrap_content"
		        android:layout_height="wrap_content"
		        android:text="Collect Data"
		        android:onClick="onCheckboxClicked"/>

In the above example notice the propery onClick, you can either have 1 common click listner for all the checkbox or can have there individual clicklistenr. 

Here is how a common click method looks

		public void onCheckboxClicked(View view) {
		    // Is the view now checked?
		    boolean checked = ((CheckBox) view).isChecked();
		    
		    // Check which checkbox was clicked
		    switch(view.getId()) {
		        case R.id.feedback:
		            if (checked)
		                // send feedback
		            else
		                // don't send feedback
		            break;
		        case R.id.collectdata:
		            if (checked)
		                // Collect Data
		            else
		                // Don't collect data
		            break;
		    }
		}

you can create a method in your code which you define in onClick of Checkbox. Similar to radio button in this meethod, you can get the id of the checbox via  **view.getId()**once you have the id, you can use a switch case statement to determine which checbox was clicked and is that check on uncheck by checking **view.isChecked()** 

With this smple code you can know check box selection and it's state


##ListView

###What
Whene ever you have a data which is repeating and comes as a collection or list, list view is best User Interface element to use. ListView helps you in displaying repeating data in form of a scrollable list, users can then select any list item by clicking on it. 

ListView is widely used in android applications, a most simple example of list view is your contact book, where you have list of you contacts displayed in a listview. 

> Listview is a complex UI pattern and we have a seprate section about listview. You can read more about list view in ListView Section


##GridView

###What
Similar to list view when you have data which you want to display as gird of row and columns you use gridview. GridView displays item in 2 dimensional scrollable grid. 

The most simple example of gridview is your Picture Gallery, In Picture Gallery all the picture are arranged in a grid like format.

> You can read more about gridview at http://developer.android.com/guide/topics/ui/layout/gridview.html

##ScrollView

###What
ScollView helps you in making any Layout scrollable automatically when the content inside scrollview increases and can't be fit entierly on the screen. When you are not using listview and have content which is going beyond the screen size, you can use scroll view to make this content scollable. 

###Properties

The most important property of Scroll View is it's children. ScrollView can only have 1 children, that means you need to have all your layouts nested under 1 layout which acts as a children of your list view. 

Let's see an Example: 

Let's assume we have 2 edit Text in our layouts like this 

		 <EditText
				        android:id="@+id/editText1"
				        android:layout_width="wrap_content"
				        android:layout_height="wrap_content"
				        android:ems="10" 
				        android:text="Pranay"
				        android:hint="Enter User Name"
				        android:background="#ff0000"
				        android:inputType="text">

		<EditText
				        android:id="@+id/editText2"
				        android:layout_width="wrap_content"
				        android:layout_height="wrap_content"
				        android:ems="10" 
				        android:text="Airan"
				        android:hint="Enter Password"
				        android:background="#ff0000"
				        android:inputType="text">

Now if we want to make our UI with this 2 Edit Text Scrollable we need to put them into a parent layout. ScollView cant have 2 child so we can't put this edit text into a scroll view directly. 

Let's add a Linear layout as parent of this edit text. 


		 <LinearLayout
		        android:layout_width="wrap_content"
		        android:layout_height="wrap_content"
		        android:orientation="vertical" >

		         <EditText
						        android:id="@+id/editText1"
						        android:layout_width="wrap_content"
						        android:layout_height="wrap_content"
						        android:ems="10" 
						        android:text="Pranay"
						        android:hint="Enter User Name"
						        android:background="#ff0000"
						        android:inputType="text">

				<EditText
						        android:id="@+id/editText2"
						        android:layout_width="wrap_content"
						        android:layout_height="wrap_content"
						        android:ems="10" 
						        android:text="Airan"
						        android:hint="Enter Password"
						        android:background="#ff0000"
						        android:inputType="text">

		</LinearLayout>

Now we have both the edit Text into 1 layout we can put this Linear layout as child of ScollView. You can then go on and add more complex elements inside this layout and all will be scrollable if the content becomes larger than the display. 

###code
This is how our complete scroll view will look

		<ScrollView
		  android:layout_height="wrap_content" 
		  android:layout_width="wrap_content">

		 <LinearLayout
				        android:layout_width="wrap_content"
				        android:layout_height="wrap_content"
				        android:orientation="vertical" >

				         <EditText
								        android:id="@+id/editText1"
								        android:layout_width="wrap_content"
								        android:layout_height="wrap_content"
								        android:ems="10" 
								        android:text="Pranay"
								        android:hint="Enter User Name"
								        android:background="#ff0000"
								        android:inputType="text">

						<EditText
								        android:id="@+id/editText2"
								        android:layout_width="wrap_content"
								        android:layout_height="wrap_content"
								        android:ems="10" 
								        android:text="Airan"
								        android:hint="Enter Password"
								        android:background="#ff0000"
								        android:inputType="text">

				</LinearLayout>
		</ScrollView>

Android has lot of ui elements which are designed for specific purposes, in this chapter we tried to cover some of the most used UI elements. If you want to read more about other ui controls you can go to this link http://developer.android.com/guide/topics/ui/index.html


