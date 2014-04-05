# Do not show login screen again

A real twitter app does not show login screen again once you are already logged in. It directly takes you to the tweet list screen as soon as you open the app.

The check to skip a screen completely should happen inside `onCreate()` method of the Activity.

<pre>
public class MainActivity extends Activity {
	@Override
	protected void onCreate(Bundle savedInstanceState) {
		<span class="highlight">//check if the Activity need to be skipped {
		    Intent intent = new Intent(this, <i>Next Activity where the user should go</i>.class);
	        startActivity(intent);
		    finish();
		//}</span>
		super.onCreate(savedInstanceState);	
		.
		.
	}
	.
	.
}
</pre>

## Assignment - skip login screen if login information is already present.

As discussed earlier, once the username & password is stored, the user should not see the login screen again. To check the app, on first app load post installation, you will see a login screen. Once you fill in login data, press login, exit the app & launch it again - you will directly land at tweet list screen.
