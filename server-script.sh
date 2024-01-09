sudo amazon-linux-extras install java-openjdk11 -y
sudo yum install git -y
sudo yum install maven -y
if [ -d "addressbook"]
then
  echo "repo is cloned and created"
  cd /home/ec2-user/addressbook
  git pull origin docker-cicd
else
  echo "new repo is creating"
  git clone https://github.com/sandeep9985/addressbook.git
  cd /home/ec2-user/addressbook
fi
mvn test