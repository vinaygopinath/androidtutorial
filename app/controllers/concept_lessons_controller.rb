class ConceptLessonsController < ApplicationController
  layout "syndicate"

  def index
  end

  def view
	  @template = "concept_lessons/#{params[:template].gsub('-','_')}"




	  case params[:template]
	  when "android-introduction"
		  @description = "Wondering what is Android development ? Check this lesson to know about Activity, View, Intent, Service, Broadcast Receivers, Notification and sqlite database in Android."
		  @title = "What is Android ? All you need to know for learning Android Development"
		  @keyword = "Android, Introduction, Beginner, Sqlite, Database, Activity, View, Intent, Service, Broadcast, Receivers"
		  @disqus_identifier = "concept-lesson-1"
	  when "android-setup"
		  @description = "Learn how to setup Android SDK after you download on your PC. It includes screencast for setting up the Android development kit and steps to setup USB Debugging tools in Android."
		  @title="Android Development Environment Setup"
		  @disqus_identifier = "concept-lesson-2"
	  when "android-hello-world"
		  @description = "Android App Development Example of Hello World. Learn about tools like Android Emulator to get started while building your own Android App."
		  @title = "Android App Development Example | A simple Hello World App"
		  @disqus_identifier = "concept-lesson-3"
	  when "android-layout"
		  @description = "This Android Layout Tutorial describes layouts and its type such as grid layout(table like layout in android), linear/relative layout etc."
		  @title = "Layouts in Android Tutorial"
		  @disqus_identifier = "concept-lesson-4"
	  when "android-activity"
		  @description = "This lesson covers Android activity and it's lifecycle. Learn Android activity concept through an example Android App."
		  @title = "Android Activity Lifecycle with Example"
		  @disqus_identifier = "concept-lesson-5"
	  when "android-intents"
		  @description = "An Android Intent lets you navigate from one android activity to another. With an example, this tutorial talks about various types of intents."
		  @title = "Android Intent Tutorial with Example"
		  @disqus_identifier = "concept-lesson-6"
	  when "android-views"
		  @description = "This Android tutorial describes standard View elements such as gridview, imageview, scrollview, and textView in Android with example. Other widgets such as radio button, EditText and Checkbox are also covered in detail with sample examples for each android view element."
		  @title = "Android View Elements - Gridview, Scrollview, Imageview, Textview, Checkbox"
		  @disqus_identifier = "concept-lesson-7"
	  when "android-listview"
		  @description = "Android listView tutorial with real App example. All Android ListView concepts such as basic listview with ArrayAdapter and a custom listview with BaseAdapter are covered in details."
		  @title = "Android ListView | Everything you need to know about Android listview"
		  @disqus_identifier = "concept-lesson-8"
		  @keyword = "android listview,listview android,listview,android horizontal listview,android listview example,listview android example,android listview adapter,android custom listview,custom listview android,android listview header,listview in android,list view,android adapter,ArrayAdapter,BaseAdapter"
	  end

  end
end
