#setup rails production env in ubuntu VPS

#Adding User:
sudo adduser deploy
sudo adduser deploy sudo
su deploy
#In mac terminal:
brew install ssh-copy-id
ssh-copy-id deploy@IPADDRESS

#now you can access with

ssh deploy@IPADDRESS




# Install Phusion's PGP key to verify packages
gpg --keyserver keyserver.ubuntu.com --recv-keys 561F9B9CAC40B2F7
gpg --armor --export 561F9B9CAC40B2F7 | sudo apt-key add -

# Add HTTPS support to APT
sudo apt-get install apt-transport-https



# Add the passenger repository
sudo sh -c "echo 'deb https://oss-binaries.phusionpassenger.com/apt/passenger trusty main' &gt;&gt; /etc/apt/sources.list.d/passenger.list"
sudo chown root: /etc/apt/sources.list.d/passenger.list
sudo chmod 600 /etc/apt/sources.list.d/passenger.list
sudo apt-get update

# Install nginx and passenger
export rvmsudo_secure_path=1
gem install passenger
rvmsudo passenger-install-nginx-module


#config ngix:
#read:  https://www.digitalocean.com/community/tutorials/how-to-automate-ruby-on-rails-application-deployments-using-capistrano

#capifiy the app
#1.  install gem
#2:  bundle exec cap install

#install postgres
sudo apt-get install postgresql postgresql-contrib
sudo apt-get install libpq-dev
sudo -i -u postgres
psql
create role myod WITH PASSWORD 'xxx' CREATEDB LOGIN;

export MYOD_DATABASE_PASSWORD=xxxx


#install nodejs
sudo apt-get install nodejs

sudo chown deploy:deploy /data/snaker
#deploy from local machine
cap production deploy   


#after first deploy:
change the database.yml and secrets.yml with secret key
#symbol link in deploy.rb
set :linked_files, %w{config/database.yml, config/secrets.yml}


#if get an "permission denied (publickey error)" run the following
$ ssh-add -D   #remove existing identities
$ ssh-agent    #copy the lines & run them
$ ssh-add      #uses the output from above



#set env in ~/.profile
export ADMIN_EMAIL=harrygao.oz@gmail.com
export ADMIN_NAME=harry
export ADMIN_PASSWORD=harry
export AWS_ACCESS_KEY_ID=fsakfsa
export AWS_SECRET_ACCESS_KEY=fdsafds
export DOMAIN_NAME=test.com
export GMAIL_PASSWORD=kdfsa
export GMAIL_USERNAME=harrygao.oz@gmail.com
export LANG=en_US.UTF-8
export LOG_LEVEL=DEBUG
export RACK_ENV=production
export RAILS_ENV=production
export RAILS_SERVE_STATIC_FILES=enabled
export SECRET_KEY_BASE=fdsafdsa