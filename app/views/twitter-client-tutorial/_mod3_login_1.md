# Import libraries and create POJOs for login

Although it is possible to use classes provided by Android such as [HttpClient](http://developer.android.com/reference/org/apache/http/client/HttpClient.html) or [HttPURLConnection](http://developer.android.com/reference/java/net/HttpURLConnection.html) to make network calls, there are several libraries available that simplify the task. In this module, we will use the [Retrofit](http://square.github.io/retrofit/) library, made by [Square](https://squareup.com/). Retrofit is a REST client library that can make HTTP calls synchronously or asynchronously and provide the server response, if any, as a Java object (using JSON converters).

##Task 1: Download libraries

To begin, let's download the required library JARs. To do so, download [Retrofit](http://square.github.io/retrofit/) from
<div class="alert alert-info"><a href="http://repo1.maven.org/maven2/com/squareup/retrofit/retrofit/1.5.1/retrofit-1.5.1.jar">http://repo1.maven.org/maven2/com/squareup/retrofit/retrofit/1.5.1/retrofit-1.5.1.jar</a></div> and download [GSON](https://code.google.com/p/google-gson/) from <div class="alert alert-info"><a href="https://code.google.com/p/google-gson/downloads/detail?name=google-gson-2.2.4-release.zip">https://code.google.com/p/google-gson/downloads/detail?name=google-gson-2.2.4-release.zip</a></div>GSON is a supporting library for Retrofit and it is used to convert JSON data to Java objects and vice versa.

##Task 2: Import libraries into Eclipse project

Once you've downloaded the JAR files, move them into the CodelearnTwitterApp Eclipse project's `libs` directory. To include the JAR files, right-click the project (or use the Project menu) and select **Properties** → **Java build path** → **Libraries** → **Add JARs** → navigate to CodelearnTwitterApp's libs folder and select the two new JARs. When you're done, it will look like this.
<p><%= image_tag "twitter-client/import-libs.png", alt: "Library JARs in Project Explorer", title: "Library JARs in Project Explorer" %></p>

##Task 3: Create login request POJO

To make a login request, the server expects a JSON object of the following format

<pre>
{
 "username": "abcd",
 "password": "pqrs"
}
</pre>

Let's create an equivalent Java object under the `org.codelearn.twitter.models` package with the name **LoginRequest.java**

<pre>
public class LoginRequest {

  private String username;

  private String password;

  public String getUsername() {
    return username;
  }

  public void setUsername(String username) {
    this.username = username;
  }

  public String getPassword() {
    return password;
  }

  public void setPassword(String password) {
    this.password = password;
  }
}
</pre>

##Task 4: Create login response POJO

When a successful login request is made, the server responds with a JSON object of the following format

<pre>
{
 "token": "x7hegdu3yth4kdu8ij3gd8jjj"
}
</pre>

Create an equivalent Java object under the `org.codelearn.twitter.models` package with the name **LoginResponse.java**. Refer the LoginRequest POJO and create LoginResponse.
