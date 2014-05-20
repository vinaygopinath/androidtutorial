##Level 2 - Fetching tweets using HTTP GET calls and submitting new tweets


After completing the login mechanism task in Level 1, this level focuses on fetching tweets from the Codelearn Twitter API using a GET call and displaying it in the list in **TweetListActivity**, as well as the creation of a new Activity to compose a new tweet and submit it using a POST call.

###API

**GET** call to fetch tweets and **POST** call to submit a new tweet
<pre>
http://app-dev-challenge-endpoint.herokuapp.com/tweets
</pre>

###Request

**Fetching tweets**: A simple GET request without any request parameters is sufficient to get a response.

**Submitting a new tweet**: The JSON request object must be as follows.
<pre>
{
"body" : "If only Bradley's arm was longer. Best photo ever. #oscars pic.twitter.com/C9U5NOtGap"
}
</pre>

###Response

**Fetching tweets**: The tweets endpoint will provide an array of tweets as a JSON response when a GET call is received

<pre>
[ { "body" : "Content of Tweet 1",
    "id" : 1399538725,
    "title" : "Victoria"
  },
  { "body" : "Content of Tweet 2",
    "id" : 1399538726,
    "title" : "Judith"
  },
  { "body" : "Content of Tweet 3",
    "id" : 1399538727,
    "title" : "Ann"
  },
  .....
  { "body" : "Content of Tweet N",
    "id" : 1399538745,
    "title" : "Edgar"
  }
]
</pre>

**Submitting a new tweet**: The tweets endpoint will provide the newly created tweet as a JSON response when a POST call is received

<pre>
{
id: 1399539235
title: "TheEllenShow"
body: "If only Bradley's arm was longer. Best photo ever. #oscars pic.twitter.com/C9U5NOtGap"
}
</pre>

###Tasks

* Improve the login process by showing a **RelativeLayout containing a ProgressBar** while the login HTTP call is in progress
* Modify TweetListActivity to make an HTTP POST call when the Activity is created
* Handle the received Tweet objects and render them in the ListView
* Create a new Activity called **ComposeTweetActivity** containing an EditText for writing a new tweet and a Button for submitting it.
* When the button in ComposeTweetActivity is clicked, submit the new tweet to the server through an HTTP POST call and display a Toast message explaining the success or failure of the HTTP attempt.
* Modify **tweet_list.xml** to have two menu items - One for opening ComposeTweetActivity and the other to refresh tweets (fetch tweets again)
* You must use one of the natively available techniques to perform HTTP operations, like **HttpClient** or **HTTPUrlConnection**. External libraries are not supported.
* You must use natively available techniques to perform JSON-to-POJO and POJO-to-JSON conversion, or use [Jackson](jackson.codehaus.org) or [GSON](https://code.google.com/p/google-gson/)


