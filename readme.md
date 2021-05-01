### STEP ###
Open OSX `System Preferences` and leave it open for later use
Create code directory
`mkdir ~/code`

### STEP ###
Move `osx_setup` repository contents into `~/code/macos`

### STEP ###
Install basic tools
`source basic_tools.sh`

### STEP ###
(Optional) Enable full disk access permissions for `iTerm` in `System Preferences -> Security & Privacy` (http://biercoff.com/how-to-fix-docker-machine-installation-on-mac-os-x/). This may come in handy when uninstalling programs like virtualbox if something goes wrong during installation. This will also eliminate one-time pop-up permission requests when accessing some directories for the first time via iTerm.

### STEP ###
Install applications
`source applications.sh`

TODO:

Automatically add favourites in finder bar
Automatically set default finder view to List type