<br/>
![Building Blocks of Android](/assets/android-introduction/picture-1.png "Building Blocks of Android")
#Android Widgets / View Elements

Any android app is made up of lot of activities and all the activities have User interface. Android provides us lot of prebuilt user interface elements, we can use this UI compontents to create a nice looking UI for our app

In the previous chapter you have seen how we have different layouts which can be use to give structure to your app user interface. This layouts are just empty placeholder for Android views, lets see some of the most user Android Layout widgets and some of there most use propery. 


##Common Properties

All UI are of type View and have some common properties which might be useful to understand. All the UI Elemets which we will see in next section will have this propeties

**android:id** :  id is use to uniquely identify this View in Java Code. When you assign an ID to a View it makes that view uniquely identifiable in that Layout. In later chpaters we will see the use of ID in more details. 

**android:layout_width** : layout_width property of view defines the width of that view, you should define width in px or dp.

**android:layout_height** : layout_height property of view defines the height of that view, you should define height in px or dp.

Whenever you drag and drop a UI element from Designer view, it automatically generates atleas this 3 property for that view

Since all UI elements are inherited from view, all have a onClick property, we will only be seeing onClick for some of the ui elements. 

##Common Attributes 
Here are some common attributes or terminology which will be good to understand before seeing ui elements in action

**wrap_content** : this is the value which you will be using in width or height, this tells android to make the UI element width or height just equal to the size of conent which the ui has.

For example: a text view with text "HELLO" with width as wrap_content will only be 5 character wide. 

**match_parent or fill_parent** Always use match_parent even though both means same. This value again used in width or height, this tell android to make the view height or width matching to its parent height or width. If parent is taking full size in screen, setting this value on any UI element will also make its height or width equal to the screen size

**dp** Dp is density independent pixle, as you know android device comes with different density of screen, this value can be used instead of PX (pixle), if you use dp android will automatically claculate px for you based on screen of the android device. 

For Example: On some device 1dp might be = to 1 px but on some device 1dp = 5px


##TextView

###What
Textview is most simple ui element, it is use to display STATIC Text which can not be changed by user. 

In HTML world TextView is nothing but a Label. 

###Properties
Lets see some of the useful properties of textview

**android:text** : this property defines the text which will come inside the TextView

**android:textColor**: this propery defines the color of text, this take HexaDecimal text color for example #ffff00 

**android:textSize**: this property defines the size of text, it takes value in sp, for example "15sp"


###Code
This is how a simple textview looks in code. 

		<TextView
		        android:id="@+id/textView1"
		        android:layout_width="match_parent"
		        android:layout_height="wrap_content"
		        android:text="Hello World" 
		        android:textColor="#ffff00"
		        android:textSize="15sp"/>

##EditText

###What
EditText is another most use UI elements in android, whenever you want to take some input from user you use edittext. 

In HTML world EditText is nothing but a <input>. 

###Properties
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
		android:layout_below="@+id/textView1"
		android:layout_centerHorizontal="true"
		android:layout_marginTop="74dp"
		android:background="#f23400"
		android:clickable="false"
		android:text="Button" />



