## Command line basis

### 1. Navigating file system

Command line is a text interface for computer operation system. We use terminal to access the command line.
We can navigate through files and folders with those commands:

* `pwd` print-work-directory, gives the current working directory.

* `ls` list, list all files and directories in the working directory.

* `cd` change-directory, switches into other directory that specified. And we can go back using `cd ..`, `cd ../../`.

* `mkdir` make-directory, creates new directory in the current work directory.

* `touch` creates new file inside the current work directory.

### 2. Manipulation files

* `ls -a` list all contents of the directory including hidden files and directories.

* `ls -l` list in long format.

* `ls -t` list all contents and order by last modified time. We can combine those three options: `ls -alt`.

* `cp` copy files, `cp filename directory`.

* `mv` move files, `mv filename firectory`.

* `rm` remove files, option `-r` will remove all files recursively, means remove all files.

### 3. I/O redirection

The common redirection commands are

* `echo` as input

* `cat` as output

* `>` redirects standard output of a command to a file, OVERWRITE previous content.

* `>>` redirects standard output of a command to a file, appending new content to previous content.

* `<` redirects standard input to a command. Example: `cat < lakes.txt`

* `|` redirects standard output of a command to another command, like a pipe. Example: `cat volcanoes.txt | wc | cat > islands.txt`

* `sort`

* `uniq`

* `grep` searches for a text pattern and outputs it. Example: `grep Mount mountains.txt`, option `-i` enables the command to be case insensitive; option `-R` stands for recursively.

* `sed` searches for a text pattern, modifies it and outputs it. Example: `sed 's/snow/rain/' forests.txt` stands for search 'snow' and replace it as 'rain' in forests.txt.

### 4. Configurate environment



### Reference

https://www.codecademy.com/en/courses/learn-the-command-line/
