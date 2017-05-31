## Git basis

Git is a tool for version control. With git, you will be able to save all works you have done. Also useful in collaboration.

### 1. Basic workflow

Say we turn some directory into a git project. First we initilize:

`git init`

A git project can be viewed as three parts: a working directory, a staging area, a repository. We make changes at working directory, and then bring the changes into the staging area, finally save changes to the repository as 'commit'.

You can check the changes with

`git status`

The files with red color in the output are untracked files. In order to get start tracking files, we add the files to the staging area:

`git add filename`

then we can check the status again with `git status` and find that the filename will in green color. 

Next, if we have some changes in the file, since the file is tracked, we can check the differences

`git diff (same) filename`

and add the changes to the staging area by `git add filename`.

The last step is commit. A commit permanently stores changes from the staging area inside repository. We use `git commit`. In practice, we will also add a message

`git commit -m "add a line in the file"`

And we can check the commit history by

`git log`

### 2. Backtrack

When we want to get rid of the new changes, we need back track. 

In git, the commit we are currently on is know as `HEAD` commit. To see the `HEAD` commit, use

`git show HEAD`

If we want to discard the change, we can use

`git checkout HEAD filename`

it will restore the file in the working directory.

What if before commit, we accidently delete something from other irrevelent files? Absolutely you don't want this to be included in the commit. We can unstage that file from the staging area using

`git reset HEAD filename`

This command resets the file in the staging area to be the same as the `HEAD` commit. It doesn't discard file changes from the working directory, just remove it from staging area.

Then we can rewind by doing 

`git reset SHA`

we can use the first 7 characters of the SHA of a previous commit.

### 3. Branching

Up to this point, we've worked as a single git branch called `master`. Git allows us to create branches to experiment with versions of a project.
Check which branch am I on?

`git branch`

To create a new branch, use

`git branch new_branch`

note that `new_branch` and `new-branch` are both valid names but `new branch` isn't.

After we create a new branch, we switch to it:

`git checkout branch_name`

What if you wanted include all the changes made to the new branch on the `master` branch, we can merge them

`git merge branch_name`

In git, branches are usually a means to an end. The end goal is to merge it into the `master` branch. After the branch has been integrated into `master`, it can be deleted

`git branch -d branch_name`

### 4. Collaboration

In order to get your own replica of repository, you'll need to clone it with

`git clone remote_location clone_name`

where remote_location could be a web address, or a file path. Then you can go to that directory, see a list of git project's remotes with

`git remote -v`

Results includes (fetch) and (psuh).
Now what if you want to make your clone up-to-date, which means you can view the changes when others commit? You can go to the directory and

`git fetch`

The next problem is, the commits are on the `origin/master` branch rather than your local `master` branch. You need to integrate `origin/master` into local `master` branch.

`git merge origin/master`

Finally, after we do some contribution, we share it with our friends:

`git push origin your_branch_name`

### Reference
https://www.codecademy.com/learn/learn-git
