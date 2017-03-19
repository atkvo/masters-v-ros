# Masters Vagrant for ROS

SJSU CMPE295

This repo is intended to keep our work enviroments the same across our machines to avoid any "it works on my machine" problems.

Note the tips on using Vagrant aren't the

## Instructions

### Setup Vagrant on your Machine 
> assumes you have brew installed and are using a Mac (since we're all using Mac right now)

Install Virtualbox:
```
brew update
brew cask install virtualbox
brew cask install virtualbox-extension-pack
```

Then install Vagrant: 

```
brew cask install vagrant
```

Install the Vagrant plugin to keep Virtualbox Guest Additions in sync:
```
vagrant plugin install vagrant-vbguest
```

### Installing this box

Clone this repository to your drive 
```
git clone https://github.com/atkvo/masters-v-ros.git
cd masters-v-ros
vagrant up
```

After running `vagrant up` the machine will be setup and provisioned (set up) properly with the ROS development environment for the masters project. 

> **Note** - The first time running `vagrant up` it will take a long time as everything gets set up.

### Using the Vagrant box
#### Quick commands
These are the more common commands that would be used here.

* `vagrant up` - bring the box up
* `vagrant ssh` - shell into the box
* `vagrant halt` - shutdown the box
* `vagrant suspend` - suspend the box
* `vagrant resume` - resume the box

#### Starting up and shutting down

#### Getting online
Whenever you want to start the Vagrant box, run the command: `vagrant up` when *inside the repository*. 

Once the vagrant box is running you can `ssh` to it using `vagrant ssh`.

Example:
```
# pretend you're in your home directory and the vagrant repo is cloned at ~/workspace/master-v-ros
cd workspace/master-v-ros
vagrant up
vagrant ssh
```

#### Suspending the v-box
You can also "pause" your vagrant box to save resources with the `vagrant suspend` command and using `vagrant resume` to bring it back online. This should save some battery life without losing your session.

```
vagrant suspend
# state is saved and box is suspended
vagrant resume
# now it's back online
```

#### Shutting down
If you're `ssh`'d into the box (via `vagrant ssh`) you can power off the machine using `sudo poweroff`. Or if you're not in the machine you can run the command `vagrant halt`

```
vagrant halt
# box is offline now
```


#### Folder structure
The repo directory contents is as follows:

```
masters-v-ros/
    Vagrantfile
    provision/
        configs/
            .tmux.conf
            .vim
            .vimrc
        install.sh
        ros.sh
    share/
```

#### GUI Mode
If you prefer to not work from the commandline (`headless` mode) and want the UI of Ubuntu then you must modify the `Vagrantfile` shown above.

In the section of the `Vagrantfile` shown below, just uncomment the 3 lines shown below to get into GUI mode. Add comments to them to go back to `headless` mode.

```ruby
  config.vm.provider "virtualbox" do |v|
    v.memory = "2048"
    # v.gui = true                                          # uncomment for GUI
    # v.customize ["modifyvm", :id, "--vram", "128"]        # uncomment for GUI
    # v.customize ["modifyvm", :id, "--accelerate3d", "on"] # uncomment for GUI
    # v.customize ["modifyvm", :id, "--options", "parameter"]
  end
```

#### Sharing folders
The **share** directory will be shared between the your host and guest. This folder will be mapped to the following directory on the **guest**: 

```
/home/ubuntu/share
```

This means whatever you put on your host machine in the `share/` folder will also appear in the **guest's** `/home/ubuntu/share/` folder and vice versa. Useful for editing files on your host machine.
