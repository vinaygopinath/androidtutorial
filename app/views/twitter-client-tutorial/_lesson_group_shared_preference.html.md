# Storing login data in Shared Preference

In the real Twitter client, once you log in successfully, you will not see the login screen again. The app sends the username password information to the server, receives an authentication token & stores it locally in the phone. The next time you open the app, it checks for the authentication token & directly takes you to the tweet list screen.

We are introducing data handling in this module. The network calls will be introduced in the subsequent module. We make things a little sub-optmial. Instead of sending data to the server & getting an authentication token, we will simply store the username password from the login screen. 

<div class="alert alert-warning"><b>Warning</b>: It is never a good idea to store passwords locally, plaintext or otherwise. But for the sake of this module, we overlook best practices to get a better understanding of SharedPreferences</div>

1. <%= link_to "Reading login data", app_tutorial_lesson_with_token_path("twitter", AppLesson.find_by_number(@current_lesson.number + 1).token ) %>
2. <%= link_to "Writing login data to Shared Preference", app_tutorial_lesson_with_token_path("twitter", AppLesson.find_by_number(@current_lesson.number + 2).token ) %>
3. <%= link_to "Modify flow to not show login screen if login data exists", app_tutorial_lesson_with_token_path("twitter", AppLesson.find_by_number(@current_lesson.number + 1).token ) %>
