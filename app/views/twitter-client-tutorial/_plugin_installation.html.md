# Get started in 5 minutes

To assist you better during the development cycle, we have created an Eclipse plugin that tests your app at every step to ensure you are doing it right. Our intent is to be able to show you very relevant error messages (& possible solution).

Please follow our step by step process to get started. 

<h2> 1. Download & Unzip Android SDK <small><a href="http://developer.android.com/sdk/index.html#download", target="_blank", style="color:#57A3E8">download link</a></small></h2>
Download Android SDK (ignore if you already have it installed) from [official Android SDK download page](http://developer.android.com/sdk/index.html#download). **You just need to download & unzip the SDK. No installation required.**

> You need to have the latest Android SDK installed on your computer. Ignore this step if you already have the latest SDK.

<h2> 2. Download Virtual Assistant <small><a href="", target="_blank", style="color:#57A3E8">download link</a></small></h2>
<ol style="text-align:left">
	<li> <strong>Unzip the downloaded dropin-dependencies.zip file</strong>. You will see 4 files inside it.</li>
	<li>
		<p><strong>Copy the extracted files to the dropins directory</strong> under <strong>[Unzipped Android SDK Directory] -> [eclipse directory] -> [dropins directory]</strong>. The dropins directory exists for you to manually 'drop' an Eclipse plugin there.
		<p><%= image_tag "twitter-client/dropins-location.png", alt: "Dropins with all the jars copied", title: "Dropins with all the jars copied" %></p>
		</p>
	</li>
	<li> <strong>Start Eclipse</strong> (restart if already running) by double clicking Eclipse executable <strong>[Unzipped Android SDK Directory] -> [eclipse directory] -> [Eclipse]</strong>. In the above image, it is the file with green icon below dropins directory. 
		<small><ul>
			<li>You should see an <%= link_to "Eclipse popup to select workspace", image_path("twitter-client/plugin-installation-workspace.png"), target: "_blank" %>.</li> 
			<li>Once done, you will see <%= link_to "Codelearn welcome message", image_path("twitter-client/plugin-installation-welcome-popup.png"), target: "_blank" %> in your Eclipse. Come back here & you will see a popup intimating this lesson is done.</li>
		</ul></small>
</ol>

> <small>The plugin tracks your progress. Your error or success message will be shown here in the browser. The plugin will inform you whenever it has sent your progress data to our server & ask you to switch back to this website to see the error/success. It will take around 5-10 seconds for the error/success to show here.</small>

## Possible Issues

**1. Java Runtime not found while launching Eclipse.** Android SDK needs Java SDK to run. You will see this error while launching Eclipse first time. Please refer <%= link_to "Java SDK Installation Guide", android_concept_lesson_path("android-setup") + "#Setup-Guide-JDK-Setup", target: "_blank" %>

**2. Welcome message did not show in Eclipse.** Make sure that you copied the plugin files directly under dropins directory. Do not create any intermediate folder between dropins & the files.

**3. No success popup on the website.** Refresh this webpage & if our server has received information from your plugin, you will see a green notification on top of this page telling you that this lesson is completed.
