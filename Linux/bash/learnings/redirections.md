# [Redirections](http://linux.freeideas.cz/subdom/linux/redirections/ "Permalink to Redirections")




In Bash, there are several types of redirections available, including:

1. Input redirection (using "<") - This allows you to redirect input to a command from a file instead of from standard input.
2. Output redirection (using ">" or ">>") - This allows you to redirect the output of a command to a file instead of to the screen.
3. Error redirection (using "2>" or "2>>") - This allows you to redirect error messages from a command to a file instead of to the screen.
4. Pipe (using "|") - This allows you to redirect the output of one command to the input of another command.
5. Here documents (using "<<") - This allows you to redirect input to a command from a here document (a block of text).
6. Append output redirection (using ">>") - This allows you to append output to a file instead of overwriting it.
7. Combined output and error redirection (using "&>") - This allows you to redirect both the standard output and standard error of a command to a file.
8. Operator "<<<" which looks like redirection, but means sending string into command
9. ```
   command <<< "This is
   a multi-line
   string."
   ```
10. sending multiple commands into one command using "<< EOF" construct:

    ```
    mysql -u username -p password dbname << EOF
    SELECT * FROM table1;
    SELECT * FROM table2;
    EOF
    ```
11. storing multiple lines in variable:

    ```
    variable=$(cat <<-EOF
    here
    is
    some text
    EOF
    )
    ```

Basic redirections:

* command > file  = send output of command to file and overwrite previous content of the file
* command >> file = append output of command to file
* command < file = content of the file is send as input into command

Multiple redirections:

* command 2>file = redirects standard error to file, standard output is not changed ( be avare “2>file” must be written without spaces)
* command 2>&1 = redirects standard error to standard output
* command > file1 2>file2 = redirects standard output to file1 and standard error to file2
* command > file 2>&1 = redirects standard output to file and standard error to standard output – i.e. also to file (this can be written also as “command >& file” or “command &>file” )
