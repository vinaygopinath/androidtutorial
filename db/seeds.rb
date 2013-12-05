# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
AppLesson.delete_all
AppLesson.create( number: 1, title: "Install plugin to get started", token: "abcdef", file: "plugin_installation.html.md")
AppLesson.create( number: 2, title: "About Layouts", token: "bcdefg", file: "android_layouts.html.md")
AppLesson.create( number: 3, title: "this is lesson 3 title", token: "cdefgh", file: "test.html.md")
AppLesson.create( number: 4, title: "Login - Basic Styling", token: "tw_app01", file: "android_login_screen_no_header.html.md")
AppLesson.create( number: 5, title: "Login - Layout", token: "tw_app02", file: "android_login_screen_layout.html.md")
AppLesson.create( number: 6, title: "Login - Layout Styling", token: "tw_app03", file: "android_login_screen_styling.html.md")
AppLesson.create( number: 7, title: "Login - Button click", token: "tw_app04", file: "android_login_button_click.html.md")
AppLesson.create( number: 8, title: "Showing Next Screen", token: "tw_app05", file: "android_new_activity_with_intent.html.md")
AppLesson.create( number: 9, title: "List View Intro", token: "tw_app06", file: "android_list_view_intro.html.md")
AppLesson.create( number: 10, title: "Tweet List - Layout", token: "tw_app07", file: "android_tweet_list_layout.html.md")
AppLesson.create( number: 11, title: "Tweet List - Row Item Layout", token: "tw_app08", file: "android_tweet_row_item_layout.html.md")
AppLesson.create( number: 12, title: "Tweet List - List Activity", token: "tw_app09", file: "android_tweet_list_activity.html.md")
AppLesson.create( number: 13, title: "Dummy", token: "tw_appXX", file: "dummy.md")

CurrentUserLesson.delete_all
CurrentUserLesson.create( user_id: 1, lesson_number: 1, completed: true)

Progress.delete_all
Progress.create( user_id: 1, lesson_number: 1)
Progress.create( user_id: 1, lesson_number: 2)
Progress.create( user_id: 1, lesson_number: 3)
Progress.create( user_id: 1, lesson_number: 4)
Progress.create( user_id: 1, lesson_number: 5)
Progress.create( user_id: 1, lesson_number: 6)
Progress.create( user_id: 1, lesson_number: 7)
Progress.create( user_id: 1, lesson_number: 8)
Progress.create( user_id: 1, lesson_number: 9)
Progress.create( user_id: 1, lesson_number: 10)
Progress.create( user_id: 1, lesson_number: 11)
