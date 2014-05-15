#AsyncTask

Performing time-consuming operations asynchronously is a necessity of any modern application. In traditional Java programs, the [Thread](http://docs.oracle.com/javase/7/docs/api/java/lang/Thread.html) framework is commonly used to perform asynchronous operations. On Android, only the UI thread is allowed to manipulate UI elements - such as changing the text of a TextView, launching a new Activity and showing a Toast message. Because of this limitation, usage of Threads becomes complicated - A separate thread executed by an Activity to fetch some data from the Internet cannot directly update the UI elements of the Activity with the retrieved data. AsyncTask is a helper class that resolves this problem.

## Important methods

AsyncTask has four important methods

* **Before the background operation begins** - **`onPreExecute()`** - This method is executed on the **UI thread**. It can be used to set up UI elements before the background operation begins, like showing a "Loading" screen or a Toast message.

* **Background operation** - **`doInBackground()`** - This method is the core of an AsyncTask and it can be used to perform potentially heavy operations, like downloading an image or submitting an HTTP request. As the name suggests, this method is executed on a **separate thread**.

* **Updates during background operation** - **`onProgressUpdate()`** - It is not possible to update UI elements, such as a progress bar indicating the progress of a download or a TextView indicating the amount of data transferred so far, directly from `doInBackground()`. However, doInBackground can trigger an update by calling `publishProgress()`. `onProgressUpdate` is called to handle the published progress, and this executes on the **UI thread**.

* **After the background operation is completed** - **`onPostExecute()`** - This method is executed on the **UI thread**. It is called after `doInBackground()` completes execution. This method is commonly used to handle the result obtained after the background operation and update appropriate UI elements, like showing a "Login failed" Toast message after a login attempt, or display the image downloaded in `doInBackground()`

To create an AsyncTask, you must extend the AsyncTask class, and override one or more of the following methods.

## Arguments

Extending the AsyncTask class requires three type arguments. Consider the example of ImageProcessorTask, an AsyncTask that downloads images and performs a certain type of image processing on each of them.
<pre>
   public class ImageProcessorTask extends AsyncTask&lt;?,?,?&gt;
</pre>

### Input parameters
The first generic type represents the input parameters provided to the AsyncTask. This type of data is passed to `doInBackground` as a [variable argument](http://docs.oracle.com/javase/tutorial/java/javaOO/arguments.html). In the case of ImageProcessorTask, **String** is the generic type because the arguments are the URLs of files to be downloaded and processed. The `doInBackground()` method would look like this
<pre>
   protected Integer doInBackground(String... urls) {
     // Download file and perform image processing here
     return null;
  }
</pre>
Arguments of this type can be provided when the AsyncTask is executed
<pre>
   ImageProcessorTask task = new ImageProcessorTask();
   task.execute("http://path-to-file-one.jpg","http://path-to-file-two.png");
</pre>

### Progress updates
The second generic type represents the type of the progress updates. This type of data is passed to `onProgressUpdate` as a variable argument. In ImageProcessorTask, to notify the user that a file was downloaded and its processing is about to begin, a **String** message update can be published in doInBackground. The `onProgressUpdate()` method would look like this
<pre>
   protected void onProgressUpdate(String... progressMsg) {
     // Display a toast message with progressMsg[0]
  }
</pre>
Arguments of this type are provided when `doInBackground()` calls the `publishProgress()` method
<pre>
  @Override
  protected Integer doInBackground(String... urls) {
    for (String url : urls) {
      // Download file
      publishProgress("Downloaded file from " + url + ". Beginning image processing");
      // Process image
    }
    return null;
  }
</pre>

### Result
The third generic type represents the type of the result. This type of data is passed to `onPostExecute`. It is the return type of the `doInBackground` method. In ImageProcessorTask, to count the number of files that were successfully downloaded and processed, an **Integer** value can be returned and a message displayed about the success or failure of the AsyncTask. The `onPostExecute()` method would look like this
<pre>
  @Override
  protected void onPostExecute(Integer result) {
    if (result == 0) {
      // Display a Toast message - "Task failed - no files were processed"
    } else {
      // Display a Toast message - "Task successful - "+result+" files were processed"
    }
  }
</pre>
The result value is returned when `doInBackground()` completes execution
<pre>
  @Override
  protected Integer doInBackground(String... urls) {
    Integer imageCount = 0;
    for (String url : urls) {
      // Download file
      publishProgress("Downloaded file from " + url + ". Beginning image processing");
      // Process image

      // if ( image was successfully downloaded and processed)
      // imageCount++;
    }
    return imageCount;
  }
</pre>

### Complete example
<iframe style="width: 100%; height: 300px"
        src="http://embed.plnkr.co/TLgkec/ImageProcessorTask.java" frameborder="0"
        allowfullscreen="allowfullscreen">
  Loading code...
</iframe>

## Executing an AsyncTask
We saw a glimpse of AsyncTask execution in the input parameters section. 

To execute an AsyncTask, create an instance of the AsyncTask
<pre>
   ImageDownloaderTask task = new ImageDownloaderTask();
</pre>
Call the `execute()` method, optionally with arguments
<pre>
   task.execute("http://imgur.com/picture.png");
</pre>

On Android API 11 (Android 3.0 aka Honeycomb) and above, Android executes AsyncTasks sequentially. If you'd like to execute AsyncTasks in parallel, use the `executeOnExecutor()` method
<pre>
   task.executeOnExecutor(AsyncTask.THREAD_POOL_EXECUTOR, "http://imgur.com/picture.png");
</pre>

<div class="alert alert-warning"><p>Executing AsyncTasks in parallel is not recommended. Reconsider the structure of your AsyncTasks if parallel execution seems necessary. Executing several AsyncTasks that access common resources (reading or writing to a file, for example) in parallel can be a recipe for concurrency issues. If you really want to execute AsyncTasks in parallel, make sure that they address potential concurrency conflicts and/or synchronize the access of common resources</p></div>

It is important to note that an AsyncTask instance can be run **only once**. Any attempt to run a previously executed AsyncTask will result in an Exception. If you'd like to run the AsyncTask again or with different arguments, create a new instance and call its `execute()` method.

## Cancelling an AsyncTask

To try a currently running AsyncTask, use the `cancel()` method.

<pre>
   ImageDownloaderTask task = new ImageDownloaderTask();
   task.execute("http://imgur.com/picture.png");
   ...
   task.cancel(true);
</pre>

The **`cancel()`** method has a boolean argument, indicating whether the AsyncTask thread should be interrupted to try to stop the AsyncTask.

Note that the cancel() method does not guarantee that the task will stop running immediately. It only ensures that the `onPostExecute()` of a running AsyncTask is never called. Instead, the `onCancelled()` method is called on the UI thread, so that special measures can be taken to handle the cancellation of the AsyncTask.

## AsyncTask Status

To check the status of an AsyncTask instance, use the `getStatus()` method.

<pre>
ImageDownloaderTask task = new ImageDownloaderTask();
Status asyncStatus = task.getStatus();
</pre>

The possible Status values are

* **PENDING** - The execution of the AsyncTask has not yet begun.
* **RUNNING** - The task is currently running
* **FINISHED** - The task has completed its execution (`onPostExecute()` has returned)