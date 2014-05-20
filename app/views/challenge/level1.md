##Level 1 - Setting up the login mechanism using an HTTP POST call

Before you begin, please download the Codelearn Challenge [Starter App](http://www.codelearn.org/link-to-be-defined/starter-app.zip) - This contains all the source code you need to get started and focus on the challenge. **MainActivity.java** is the entry point of the app.

The starter app displays EditTexts for username and password, and simply proceeds to the next screen regardless of the credentials entered by the user. A real Twitter app would send the data to an [API](https://en.wikipedia.org/wiki/Application_programming_interface) and decide its action based on the response.

In this level, your task is to send the username and password data to the Codelearn Test API in the form of a JSON request object, handle the response and control the flow of the app to **TweetListActivity**. 

###API
The Codelearn Twitter API endpoint for login is available at this address.

<pre>
http://app-dev-challenge-endpoint.herokuapp.com/login
</pre>

###Request
The JSON request object for the HTTP **POST** request can be as follows.
<pre>
{
"username" : "abcdefg",
"password" : "secret-password"
}
</pre>

Note that the field names must be **username** and **password**

###Response
The API will provide you a token as a JSON response

<pre>
{
"token" : "37dgdu37ehbdhyd73cccdh"
}
</pre>

###Tasks
* Modify the app to send the user data to the API endpoint when the user clicks the login button using an HTTP POST call.
* Once you receive a successful response, store the received token in SharedPreference, specifying the name of the preference file as **codelearn_twitter**
* Modify the app to skip showing the login screen when the token is already available in SharedPreference.

###Restrictions
* You must make a POST call to /login
* The JSON request object must contain "username" and "password" fields
* The received token must be stored in a SharedPreference file named "codelearn_twitter"
* You must use one of the natively available techniques to perform HTTP operations, like **HttpClient** or **HTTPUrlConnection**. External libraries are not supported.
* You must use natively available techniques to perform JSON-to-POJO and POJO-to-JSON conversion, or use [Jackson](jackson.codehaus.org) or [GSON](https://code.google.com/p/google-gson/)