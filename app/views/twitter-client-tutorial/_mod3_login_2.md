# Make HTTP POST call for login

Now that the required libraries have been included and the POJOs defined, it's time to modify the login process to use a real network call

##Task 1: Create an interface for HTTP operations

Retrofit uses interfaces to handle the structure of HTTP APIs. To create a new interface,  select the `org.codelearn.twitter.models` package, right-click → New → Interface and specify the name as **CodelearnTwitterAPI**

<pre>
public interface CodelearnTwitterAPI {
}
</pre>

##Task 2: Define the login method in CodelearnTwitterAPI

<pre>
  @POST("/login")
  void login(@Body LoginRequest loginRequest, Callback<LoginResponse> loginCallback);
</pre>

##Task 3: Modify MainActivity to use CodelearnTwitterAPI

At present, `MainActivity` simply saves the username and password information in `SharedPreferences` and proceeds to `TweetListActivity`. This process can be replaced by using our newly created `CodelearnTwitterAPI` class. An instance of this interface can be built through Retrofit by specifying the server address (endpoint). When the user clicks the login button, a `LoginRequest` object is created and the `login()` method is invoked, with a callback as the argument. The code to go to the next activity has been extracted into the `goToNextActivity()` method, for easy re-use.

<pre>
public class MainActivity extends Activity { 

  private Button _loginBtn;
<span class="highlight">
  private SharedPreferences _prefs; 	

  private static final String KEY_AUTHTOKEN = "key_authtoken";
  private static final String SERVER_ADDRESS = "http://app-dev-challenge-endpoint.herokuapp.com";
</span>

  @Override
  protected void onCreate(Bundle savedInstanceState) {
    super.onCreate(savedInstanceState);
    setContentView(R.layout.activity_main);
    
    _loginBtn = (Button) findViewById(R.id.btn_login);
<span class="highlight">
    _prefs = getSharedPreferences("codelearn_twitter", MODE_PRIVATE);
</span>
<strike>
    String username = _prefs.getString("username", null);
    String password = _prefs.getString("password", null);
    
    if ( username != null && password != null ) {
      Intent intent = new Intent(MainActivity.this, TweetListActivity.class);
      startActivity(intent);
    }
</strike>
<span class="highlight">
    String storedAuthToken = _prefs.getString(KEY_AUTHTOKEN, null); 	
    if ( storeAuthToken != null ) {
      goToNextActivity();
    }
</span>
    _loginBtn.setOnClickListener(new View.OnClickListener() { 	
    
    @Override
    public void onClick(View v) {
      EditText usernameEdit = (EditText) findViewById(R.id.fld_username);
      EditText passwordEdit = (EditText) findViewById(R.id.fld_pwd);
      
      <strike>
      SharedPreferences prefs = getSharedPreferences("codelearn_twitter", MODE_PRIVATE);
      Editor edit = prefs.edit();
      edit.putString("user",username.getText().toString());
      edit.putString("pass",password.getText().toString());
      edit.commit();
					 
      Intent intent = new Intent(MainActivity.this, TweetListActivity.class);
	  startActivity(intent);
      </strike>
      
      <span class="highlight">
      /* Check to ensure that the username and password fields are not empty */
      if (usernameEdit.getText() != null && passwordEdit.getText() != null) {

      String username = usernameEdit.getText().toString();
      String password = passwordEdit.getText().toString();

      /* Create an instance of CodelearnTwitterAPI */
      CodelearnTwitterAPI codelearnTwitterAPI =
              new RestAdapter.Builder().setEndpoint(SERVER_ADDRESS).build()
                  .create(CodelearnTwitterAPI.class);

      LoginRequest request = new LoginRequest();
      request.setUsername(username);
      request.setPassword(password);

      /*
       * Call the login POST method of the API and provide a callback to be invoked
       * asynchronously when the network call is completed (resulting in success or failure)
       */

      codelearnTwitterAPI.login(user, _loginCallback);
      </span>
      }
    }
    
    <span class="highlight">
    private void goToNextActivity() {
      Intent intent = new Intent(MainActivity.this, TweetListActivity.class);
      startActivity(intent);
    }
    </span>
  }
</pre>

## Task 4: Define the callback to handle success or failure of login

The `login()` method takes a Callback argument that handles the success or failure of the login network call. If the call was successful, the auth token obtained is saved in `SharedPreferences`, and the user is taken to `TweetListActivity`. In case of failure, a Toast message is displayed to the user.

<pre>
_loginBtn.setOnClickListener(new OnClickListener() {
....
}

private Callback<LoginResponse> _loginCallback = new Callback<LoginResponse>() {

  @Override
  public void failure(RetrofitError err) {
    Toast.makeText(getApplicationContext(), "Unable to login. Please try again",
          Toast.LENGTH_LONG).show();
  }

  @Override
  public void success(LoginResponse loginResp, Response response) {
    if (loginResp != null) {
      Editor editor = _prefs.edit();
      editor.putString(KEY_AUTHTOKEN, loginResp.getToken());
      editor.commit();
        
      goToNextActivity();
    }
  }
};
</pre>
  