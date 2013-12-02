# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
AppLesson.delete_all
AppLesson.create( number: 1, title: "this is lesson 1 title", token: "abcdef", file: "android_hello_world.html.md")
AppLesson.create( number: 2, title: "this is lesson 2 title", token: "bcdefg", file: "android_layouts.html.md")
AppLesson.create( number: 3, title: "this is lesson 3 title", token: "cdefgh", file: "test.html.md")

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
