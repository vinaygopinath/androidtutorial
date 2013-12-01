# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
AppLesson.delete_all
AppLesson.create( number: 1, title: "Oh yeah, Hello World!", token: "abcdef", file: "android_hello_world.html.md")
AppLesson.create( number: 2, title: "About Layouts", token: "bcdefg", file: "android_layouts.html.md")
AppLesson.create( number: 3, title: "this is lesson 3 title", token: "cdefgh", file: "test.html.md")
AppLesson.create( number: 4, title: "Login — Basic Styling", token: "tw_app01", file: "android_login_screen_no_header.html.md")
AppLesson.create( number: 5, title: "Login — Layout", token: "tw_app02", file: "android_login_screen_layout.html.md")
AppLesson.create( number: 6, title: "Login — Layout Styling", token: "tw_app03", file: "android_login_screen_styling.html.md")
AppLesson.create( number: 7, title: "Dummy", token: "tw_appXX", file: "dummy.md")

CurrentUserLesson.delete_all
CurrentUserLesson.create( user_id: 1, lesson_number: 1, completed: true)

Progress.delete_all
Progress.create( user_id: 1, lesson_number: 1)

