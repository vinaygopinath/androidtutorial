# Reading/Writing tweets with AsyncTask

Reading/writing tweets from/to file is relatively time consuming task. These tasks should not be handled in the main thread so not to give a *hung app* experience to the user.

You can always compensate the delay by showing a loading/spinner but that is a bad app design. It is like blocking the app flow. The code should be written in such a way that blocking of the app flow should only happen if user's next action is dependent on current action. The choice is personal on the part of programmer too. For example - fetching tweets from network should never be blocking but publishing a tweet can be. The user might or might not want to wait till the tweet is published. If you do not block the app, you should show some kind of notification which will let user come back to publish tweet screen to publish it again. 

In last lesson, we had reading & writing the tweets happening in the same thread. In this lesson, we are going to move the steps of creating new tweets & overwriting the cached file into a separate thread using **AsyncTask**.

1. <%= link_to "AsyncTask intro. Simulate network call through AsyncTask", app_tutorial_lesson_with_token_path(@app_name, AppLesson.find_by_number(@current_lesson.number + 1).token) %> - There is a quick AsyncTask intro. As assignment, we are going to use AsyncTask to simulate network call which is suppose to get us tweets & then overwrite the cache file. 

2. <%= link_to "Showing tweets after network call", app_tutorial_lesson_with_token_path(@app_name, AppLesson.find_by_number(@current_lesson.number + 2).token) %> - The assignment here needs you to refactor the code to call tweet rendering code after the network call. 

3. <%= link_to "Writing of tweets in new AsyncTask", app_tutorial_lesson_with_token_path(@app_name, AppLesson.find_by_number(@current_lesson.number + 3).token) %> - The primary purpose of network call is to fetch tweets & show to the user ASAP. It means we can move writing of tweets to a new AsyncTask. This is what you do in this assignment.

