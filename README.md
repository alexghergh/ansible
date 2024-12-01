# Ansible bootstrapping

Ansible config for easy hopping between computers.

The repo contains the install script and the ansible playbook for cloning the
dotfiles and bootstrapping a fresh system.

Supported and tested systems are:
- Arch Linux
- Ubuntu 20.04
- Ubuntu 22.04
- Asahi Linux (Fedora Remix 40) on MacBook Pro

All relevant variables that should change over time or between systems are
contained inside `HOSTS_VARS`.

## Running the script

Make sure the initial install steps are already taken care of (setting up the
system, creating the user/home etc.). **Only run the script as the user who is
intended to use the system, not as root.**

```
wget https://raw.githubusercontent.com/alexghergh/ansible/stable/ansible.sh
sh ansible.sh
```

### Ubuntu

Run the script immediately after setting up the system. No additional steps
needed.

### Arch Linux

After following the initial [Arch install
guide](https://wiki.archlinux.org/title/Installation_guide), there are a couple
of packages that need to be installed.

```
pacman -S wget sudo which
```

After installing those, run the script as usual.

### Asahi Linux

Run the script immediately after setting up the system. No additional steps
needed, depending on whether you installed a minimal Fedora or a Fedora desktop.
If a minimal Fedora was installed, follow the install instructions similar to
Arch before launching the script.
