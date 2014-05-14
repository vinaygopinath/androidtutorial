#SharedPreferences

SharedPreferences is one of the simplest ways of data persistence in Android. SharedPreferences creates a file in the internal storage of the device to store and retrieve key-value pairs. While the key must be of the String datatype, the value can be of the following datatypes - int, float, boolean, long and String.

As its name suggests, SharedPreferences is meant to be used for storing simple data such as user preferences. A SharedPreferences instance can be obtained by two ways

* `getSharedPreferences(String name, int mode)`
* `PreferenceManager.getDefaultSharedPreferences(Context context)`

The first method is only available in classes that derive from the Context class (such as Activity and Service). While `getSharedPreferences()` allows you to specify the name of the preference file (in case your app uses multiple preference files) and the mode of access, `PreferenceManager.getDefaultSharedPreferences()` is a simplification of the former method, where the name of the app is used as the preference file name, and MODE_PRIVATE is used as the mode, thereby creating a single file shared privately across the application.

##Access modes

The mode argument determines whether other applications can access and/or modify the preference data of a particular application. Possible values are:

* MODE_PRIVATE
* MODE_MULTI_PROCESS
* MODE_WORLD_READABLE
* MODE_WORLD_WRITEABLE

**MODE_PRIVATE** is the most commonly used mode and it implies that only the application that created the preference file can read and write into it.

**MODE_MULTI_PROCESS** reloads the SharedPreferences instance every time it is accessed. This is only relevant for applications that have multiple processes concurrently accessing and updating the SharedPreferences data. Usage of this flag may lead to performance issues.

**MODE_WORLD_READABLE** and **MODE_WORLD_WRITEABLE** allow other applications to read and read+write, respectively, the SharedPreferences data of the application that created the file. As of API 17, these flags have been deprecated because usage of these modes can lead to security concerns.

<div class="alert alert-danger"><b>Note</b>: Even if you specify <b>MODE_PRIVATE</b> as the access mode, it is possible to access the contents of preference files on rooted phones. Therefore, it's not a good idea to save user credentials or any other valuable data in preference files, certainly not in plaintext format</div>

##Saving and updating data

To insert or update SharedPreferences, it is necessary to obtain an Editor instance.

<pre>
SharedPreferences prefs = getSharedPreferences("codelearn", MODE_PRIVATE);
Editor editor = prefs.edit();
editor.putString("KEY_USERNAME", "user123");
editor.apply();
</pre>

This can also be [chained](https://en.wikipedia.org/wiki/Method_chaining) as follows

<pre>
prefs.edit().putString("KEY_USERNAME","user123").apply();
</pre>

<div class="alert alert-warning"><p><b>Remember</b>: It is important to call <strong>apply()</strong> or <strong>commit()</strong> after adding, updating or removing preference data. The preference file stored on the disk is not actually modified until one of the two methods is invoked</p></div>

##Retrieving data

To retrieve data from SharedPreferences, the following methods are available

* `getInt(keyName, int defValue)`
* `getFloat(keyName, float defValue)`
* `getBoolean(keyName, boolean defValue)`
* `getLong(keyName, long defValue)`
* `getString(keyName, String defValue)`
* `getStringSet(keyName, Set<String> defValue)`

The first argument of these methods is the key whose value is to be retrieved. The second argument is the default value to be returned in case the requested key is not present in the preference file.

<pre>
SharedPreferences prefs = getSharedPreferences("codelearn", MODE_PRIVATE);
/* KEY_USERNAME is available in the pref file, so it returns "user123" */
String usernameStr = prefs.getString("KEY_USERNAME", null);
/* Unknown key KEY_AGE, so it returns the given default value -1 */
int age = prefs.getInt("KEY_AGE", -1);
</pre>

##Removing data

The `remove` method of the Editor object can be used to remove the preference value associated with a certain key.

<pre>
prefs.edit().remove("KEY_USERNAME").apply();
</pre>

Editor also has the `clear()` method which removes all values in the preference file.

<pre>
prefs.edit().clear().apply();
</pre>

##commit() and apply()

Changes made to SharedPreferences through an Editor instance are not automatically written to disk. This can be done by two methods of the Editor instance.

* `commit()` - Calling commit() writes any changes to storage **synchronously**. Depending on the number of key-value pairs in SharedPreferences, this can take a significant amount of time to complete. commit() returns a boolean indicating whether the changes were successfully written to storage. <br/>
* `apply()` - Unlike commit(), apply() simply updates the SharedPreferences loaded in memory with the changes and initiates an **asynchronous** write to storage. apply() does not provide a return value to indicate success or failure of the attempt.

<div class="alert alert-info"><p>When the success or failure status of the disk write is not important, using <b>apply()</b> is recommended because it is faster than <b>commit()</b>.</p></div>