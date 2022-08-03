# ansible

Ansible config for easy hopping between computers.

So far, the script setup is only tested on Arch Linux and Ubuntu, however it
might work on other distros as well with some tweaking.

All the variables that need changing and updating in time should be included in
the `HOSTS_VARS` file. This includes all the package versions, paths and so on.
Changing this file should warrant a minor release.

Changing the task files should warrant a new (major) release candidate, as that
usually means there are additional steps or programs to be installed, not just
'version bumps'.
