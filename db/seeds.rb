# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
AppLesson.delete_all
AppLesson.create( number: 1, title: "Install plugin to get started", token: "abcdef", file: "plugin_installation.html.md")
AppLesson.create( number: 2, title: "Create New Codelearn Project", token: "bcdefg", file: "new_codelearn_project.html.md")
AppLesson.create( number: 3, title: "Hello World", token: "cdefgh", file: "hello_world.html.md")
AppLesson.create( number: 4, title: "Planning the App", token: "cliteration1plan", file: "iteration_1_plan.html.md")
AppLesson.create( number: 5, title: "Login - Layout", token: "tw_app02", file: "android_login_screen_layout.html.md")
AppLesson.create( number: 6, title: "Login - Add Username", token: "tw_app03", file: "android_login_screen_add_username_password.html.md")
AppLesson.create( number: 7, title: "Login - Add Password & Login Button", token: "tw_app04", file: "android_login_password_and_button.html.md")
AppLesson.create( number: 8, title: "Login - Styling Elements", token: "tw_app05", file: "android_login_style_elements.html.md")
AppLesson.create( number: 9, title: "Login - Login Button Listener", token: "tw_app06", file: "android_login_button_listener.html.md")
AppLesson.create( number: 10, title: "'No Tweet Found' Activity after Login", token: "tw_app07", file: "no_tweet_activity_after_login.html.md")
AppLesson.create( number: 11, title: "Tweet List - Basic Design", token: "tw_app08", file: "android_list_view_intro.html.md")
AppLesson.create( number: 12, title: "Tweet List - Custom Layout", token: "tw_app09", file: "android_tweet_list_custom_layout.html.md")
AppLesson.create( number: 13, title: "Tweet List - Hooking Custom Layout", token: "tw_app10", file: "android_tweet_list_hooking_custom_layout.html.md")
AppLesson.create( number: 14, title: "Tweet List - Tweet Click Listener", token: "tw_app11", file: "android_tweet_item_click.html.md")
AppLesson.create( number: 15, title: "Tweet Detail Activity", token: "tw_app12", file: "android_tweet_detail_activity.html.md")
AppLesson.create( number: 16, title: "Module 2 - handling data", token: "tw_app13", file: "twitter_data_handling.html.md")
AppLesson.create( number: 17, title: "Module 2 - handling data", token: "tw_app13", file: "twitter_data_handling.html.md")
AppLesson.create( number: 18, title: "dummy", token: "dummy", file: "twitter_data_handling.html.md")

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
Progress.create( user_id: 1, lesson_number: 12)
Progress.create( user_id: 1, lesson_number: 13)
Progress.create( user_id: 1, lesson_number: 14)
Progress.create( user_id: 1, lesson_number: 15)
Progress.create( user_id: 1, lesson_number: 16)
Progress.create( user_id: 1, lesson_number: 17)
