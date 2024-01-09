sudo amazon-linux-extras install java-openjdk11 -y
sudo yum install git -y
sudo yum install maven -y
if [ -d "addressbook" ]
then
  echo "repo is cloned and exists"
  cd /home/ec2-user/addressbook
  git pull origin docker-cicd
else
  echo "repo is not there"
  git clone https://github.com/sandeep-kandukuri/addressbook.git
  cd /home/ec2-user/addressbook
fi
mvn package
sudo yum install docker -y
sudo systemctl start docker