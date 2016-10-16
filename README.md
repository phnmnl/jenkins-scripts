JENKINS SCRIPTS
===============

This repository is made for writing scripts to be used in the [Jenkins PhenoMeNal](http://phenomenal-h2020.eu/jenkins/) instance.

## make-versions-file

This script parses the `Dockerfile` file of a container tool project and writes the `PhenoMeNal_Versions.txt` containing container version information. This file is then parsed by the EnvInject task of a Jenkins project in order to define environment variables usable by the container building task.
