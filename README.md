# Ansible bootstrapping

Ansible config for easy hopping between computers.

The repo contains the install script and the ansible playbook for cloning the
dotfiles and executing all the initial steps necessary on a fresh system (like
installing the plugins, moving every configuration in the right directory etc.).

So far, the script setup is only tested on Arch Linux and Ubuntu (20.04 and
22.04), however it might work on other distros as well with some tweaking (most
importantly, the operating system should adhere as best as possible to the XDG
standard, and the ansible rules should be modified for the package manager of
the operating system in question).

All the variables that need changing and updating in time should be included in
the `HOSTS_VARS` file. This includes all the package versions, paths and so on.
Changing this file should warrant a minor release.

Changing the task files should warrant a new (major) release candidate, as that
usually means there are additional steps or programs to be installed, features
introduced, not just 'version bumps' of certain packages.

## Running the script

The script can either be executed on the same user that the ansible script is
creating, or a different user. Note however that executing on the same user will
leave the user password unchanged, even though there is a password prompt (see
`tasks/user.yml` for more details).

### Ubuntu

Ideally, after booting into the system from a fresh install, the script can
just be run, without needing to set up anything else.

Download the install script and run it:

```
wget -O ansible.sh https://raw.githubusercontent.com/<github_user>/ansible/<repo_branch_or_tag>/ansible.sh
```

On a stable release, this would be:

```
wget -O ansible.sh https://raw.githubusercontent.com/alexghergh/ansible/stable/ansible.sh
```

Then simply:

```
sh ansible.sh
```

### Arch Linux

The Arch Linux setup is slightly more complicated, as the initial install is not
covered by the script. Booting the system from the live environment and having
the initial setup (which includes disk partitioning, formatting with a
file system, installing a bootloader and other basic packages etc.) still needs
to be done manually (follow [the Arch Linux install guide](https://wiki.archlinux.org/title/Installation_guide)).

Some packages need to be installed on the system before running the script:

```
pacman -S wget sudo which
```

With that being said, after having these initial steps done, the script can
normally be run on the fresh system.

Download the install script and run it:

```
wget -O ansible.sh https://raw.githubusercontent.com/<github_user>/ansible/<repo_branch_or_tag>/ansible.sh
```

On a stable release, this would be:

```
wget -O ansible.sh https://raw.githubusercontent.com/alexghergh/ansible/stable/ansible.sh
```

Then simply:

```
sh ansible.sh
```
