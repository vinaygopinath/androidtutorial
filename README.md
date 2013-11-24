# How To 

Clone the git repo from heroku first. Ping Pocha for credentials. To add a concept lesson, follow the steps

> Want to do it the hacker way, check this file (app/views/concept\_lessons/\_how\_to.html.md) & you would know it :)

1. Create/Convert lesson in markdown format. Its relatively simple & straight forward to create markdown content. Refer [this link](http://www.darkcoding.net/software/markdown-quick-reference/) to get started with markdown.

2. Drop your images inside _app/assets/images_ folder. To show them on the lesson, use the format `![Alt text that will appear if image not found](/assets/<the_image_name.jpg>)`

3. All the **h1** tags are created as sections. The sections are also created as catalogue on the left sidebar. Choose h1 title with care.

4. Save the lesson file inside *app/views/concept_lessons* directory with prefix **\_** & suffix **.html.md**. Eg. *_this_is_lesson_one.html.md* .

5. Create the link of the lesson in *app/views/concept_lessons/index.html.erb* file. index.html.erb is a html file & not markdown. Copy paste the `<li>...</li>` content under **Android Concept Lessons** & put appropriate link & description inside `<p>...</p>`

6. Add the new file to git `git add app/views/concept_lessons/_name_of_your_file.html.md`, commit the new files `git commit app/views/concept_lessons/index.html.erb app/views/commit/concept_lessons/_name_of_your_file.html.md` & push it to heroku `git push heroku master`. The lesson is at `http://this_domain/android-tutorial/name-of-your-file` . The '-' in url gets converted to '\_' to get the file.
