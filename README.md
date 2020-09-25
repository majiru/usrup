## Usrup

Usrup is a small script for managing your $HOME/src directory.
I find it often that in addition to packages installed with
my package manager I have programs I clone and use that
I would like to keep up to date. The script usrup.sh will do
the following:

* Define some helpful functions
* Change directories in to the parent source dir
* Source a user defined file for defining what repos exist and building them

The actions defined in the user supplied file will run the build commands.
Each build is executed in parallel, when finished the script will print
'done'. It's important to note that Usrup is not a build system for your
project, but rather a system for updating and invoking the different
build systems of various objects.

### Config

The example.sh contains example of some various different repo
configurations. `git_repo_do` and `usrup_do` are defined as the action functions.
There are also utility functions provided as a short hand alias for common
build systems. The comments in `usrup.sh` contain some more detailed information.


### Running

`sh usrup.sh /home/moody/src /home/moody/lib/usrupconfig.sh`

This defines `/home/moody/src` as the parent dir with with the projects
underneeth it and uses `/home/moody/lib/usrupconfig.sh` for defining the build
methods for each project.
