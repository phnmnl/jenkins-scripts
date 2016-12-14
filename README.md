JENKINS SCRIPTS
===============

This repository is made for writing scripts to be used in the [Jenkins PhenoMeNal](http://phenomenal-h2020.eu/jenkins/) instance.

## make-versions-file

This script parses the `Dockerfile` file of a container tool project and writes the `PhenoMeNal_Versions.txt` containing container version information. This file is then parsed by the EnvInject task of a Jenkins project in order to define environment variables usable by the container building task.

## test-built-container

This script tests a container image by running it with different entry points and arguments specified by the author of the container.

By default `test-built-container` will run the container image with the default entry point and the argument "-h".
However if a file `test_cmds.txt` is present, it will read it and takes entry points and arguments from it. The format of `test_cmds.txt` is as following:
```
first_entry_point --my-arg
second_entry_point --my-other-arg
```
You can write as many lines as you want. For each line, `test-built-container` will run the container image with the specified entry point and the specified args.
