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
		  @description = "Android Hello World chapter describes steps to create your first Android App. You also get to learn about various tools used in Android App Development. "
		  @title = "Android Hello World - Steps to build a simple Hello world App"
		  @disqus_identifier = "concept-lesson-3"
	  when "android-layout"
		  @description = "This Android Layout Tutorial describes layouts and its type such as grid layout, table layout,linear/relative android layout etc."
		  @title = "Android Layout"
		  @disqus_identifier = "concept-lesson-4"
	  when "android-activity"
		  @description = "This lesson covers Android activity and it's lifecycle. Learn Android activity concept through an example Android App."
		  @title = "Android Activity Lifecycle with Example"
		  @disqus_identifier = "concept-lesson-5"
	  when "android-intent"
		  @description = "Android Intent lets you navigate from one android activity to another. With examples, this tutorial also talks about various types of Android intents."
		  @title = "Android Intent Tutorial with Example"
		  @disqus_identifier = "concept-lesson-6"
	  when "android-views"
		  @description = "This Android Views tutorial explains elements such as gridview, imageview, scrollview, and textView in Android with example. Other widgets such as radio button, EditText and Checkbox are also covered in detail with sample examples for each android views element."
		  @title = "Android View Elements - Gridview, Scrollview, Imageview, Textview, Checkbox"
		  @disqus_identifier = "concept-lesson-7"
	  when "android-listview"
		  @description = "Android listView tutorial with real App example. All Android ListView concepts such as basic listview with ArrayAdapter and a custom listview with BaseAdapter are covered in details."
		  @title = "Android ListView | Everything you need to know about Android listview"
		  @disqus_identifier = "concept-lesson-8"
		  @keyword = "android listview,listview android,listview,android horizontal listview,android listview example,listview android example,android listview adapter,android custom listview,custom listview android,android listview header,listview in android,list view,android adapter,ArrayAdapter,BaseAdapter"
	  when "android-log"
		  @description = "Android log is a very important tool to for android development. Split across Beginner, Intermediate and Advanced sections, this lesson covers details with code examples."
		  @title = "Android Intent Tutorial with Example"
		  @disqus_identifier = "concept-lesson-6"

	  end

  end
end
