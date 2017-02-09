# CS545_HW3

# Setup
# 1) c9 Enviroment
curl -fsSL c9setup.saasbook.info | bash --login && rvm use 2.3.0 --default

# 2) github Enviroment
bash at workspace level
$ ssh-keygen -t rsa -b 4096 -C "jcipoll1@binghamton.edu"
$ eval $(ssh-agent -s)
$ ssh-add ~/.ssh/id_rsa
$ cat ~/.ssh/id_rsa.pub

Copy and paste the output of cat and create new Key
https://github.com/settings/keys

Bash at workspace level First Time \n
$ echo "# Test" >> README.md \n
$ git init
$ git add README.md
$ git commit -m "first commit"
$ git remote add origin git@github.com:jcipoll1/Test.git
$ git push -u origin master

bash at workspace level to say what should be commit
$ git add -A
$ git commit -am "YOUR NOTE"
$ git remote add origin git@github.com:jcipoll1/Test.git
$ git push -u origin master

# 3) Heroku
First time
$ wget -O- https://toolbelt.heroku.com/install-ubuntu.sh | sh
$ heroku login
$ heroku create

Procfile
web: bundle exec rackup config.ru -p $PORT

First time and repeat
$ git add -A
$ git commit -am "YOUR NOTE"
$ git push -u origin master
$ git push heroku master
