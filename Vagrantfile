VAGRANTFILE_API_VERSION = "2"
PROJECT_NAME = Dir.pwd.split("/")[-1][7..-1]
GIT_EDITOR = `git config --global core.editor`.strip
GIT_USER = `git config --global user.name`.strip
GIT_EMAIL = `git config --global user.email`.strip
SSH_PUBKEY = `cat  ~/.ssh/id_rsa.pub`.strip
SSH_KEY = `cat  ~/.ssh/id_rsa`.strip
SSH_HOSTS = `cat ~/.ssh/known_hosts`.strip

BOOTSTRAP = <<SCRIPT
HOME=/home/vagrant
ln -s /vagrant ~/#{PROJECT_NAME}
apt-get update
apt-get install -y build-essential libpcre3-dev git #{GIT_EDITOR}

#HOME=/home/vagrant
sudo -u vagrant git config --global core.editor "#{GIT_EDITOR}"
sudo -u vagrant git config --global user.name "#{GIT_USER}"
sudo -u vagrant git config --global user.email "#{GIT_EMAIL}"

sudo -u vagrant mkdir -p ~/.ssh
echo "#{SSH_PUBKEY}" >> ~/.ssh/id_rsa.pub
echo "#{SSH_KEY}" >> ~/.ssh/id_rsa
echo "#{SSH_HOSTS}" >> ~/.ssh/known_hosts
sudo -u vagrant git clone git@github.com:agoragames/debian-packages.git ~/debian-packages

echo "export EDITOR=#{GIT_EDITOR}" >> /home/vagrant/.bashrc
gem install fpm --no-ri --no-rdoc
SCRIPT

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "precise64"
  config.vm.box_url = "http://files.vagrantup.com/precise64.box"
  config.vm.provision "shell", inline: BOOTSTRAP
end
