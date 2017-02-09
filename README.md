# Masters Vagrant for ROS

SJSU CMPE295

This repo is intended to keep our work enviroments the same across our machines to avoid any "it works on my machine" problems.

## Instructions

### Setup Vagrant on your Machine 
> assumes you have brew installed and are using a Mac (since we're all using Mac right now)

Install Virtualbox:
```
brew cask install virtualbox
brew cask install virtualbox-extension-pack
```

Then install Vagrant: 

```
brew cask install vagrant
```

Install the Vagrant plugin to keep Virtualbox Guest Additions in sync:
```
vagrant gem install vagrant-vbguest
```

### Installing this box

Clone this repository to your drive 
```
git clone https://github.com/voandrew/masters-v-ros.git
cd masters-v-ros
vagrant up
```

After running `vagrant up` the machine will be setup and provisioned (set up) properly with the ROS development environment for the masters project. 

### Using the Vagrant box

#### Starting up and connecting

Whenever you want to start the Vagrant box, run the command: `vagrant up` when *inside the repository*. (E.g. be in the directory of the folder structure shown in the next section)

Once the vagrant box is running you can `ssh` to it using `vagrant ssh`.

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

In the section of the `Vagrantfile` shown below, just uncomment the last 3 lines (`v.gui` and `v.customize`). Add comments to them to go back to `headless` mode.

```ruby
  config.vm.provider "virtualbox" do |v|
    v.memory = "2048"
    # v.gui = true
    # v.customize ["modifyvm", :id, "--options", "parameter"]
    # v.customize ["modifyvm", :id, "--vram", "128"]
    # v.customize ["modifyvm", :id, "--accelerate3d", "on"]
  end
```

#### Sharing folders
The **share** directory will be shared between the your host and guest. This folder will be mapped to the following directory on the **guest**: 

```
/home/vagrant/share
```

This means whatever you put on your host machine in the `share/` folder will also appear in the **guest's** `/home/vagrant/share/` folder and vice versa. Useful for editing files on your host machine.