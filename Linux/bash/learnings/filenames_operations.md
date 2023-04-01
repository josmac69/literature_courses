# [Operations with filenames, extensions, folders](http://linux.freeideas.cz/subdom/linux/operations-with-filenames-extensions-folders/ "Permalink to Operations with filenames, extensions, folders")


| required operation                      | command                                                         | returned value |
| --------------------------------------- | --------------------------------------------------------------- | -------------- |
| extract all extensions                  | FILE="example.tar.gz"; echo "${FILE#*.}"                        | tar.gz         |
| extract last extension                  | FILE="example.tar.gz"; echo "${FILE##*.}"                       | gz             |
| extract filename without all extensions | FILE="example.tar.gz"; echo "${FILE%%.*}"                       | example        |
| extract filename without last extension | FILE="example.tar.gz"; echo "${FILE%.*}"                        | example.tar    |
| extract filename from whole path        | filename=$(basename "$fullfile")                              |                |
| extract path from full file name        | filename="/some/path/myfile.txt"; echo "$(dirname $filename)" | /some/path     |
| remove last backslash                   | path="/some/path/"; path=${path%/}                              | /some/path     |
