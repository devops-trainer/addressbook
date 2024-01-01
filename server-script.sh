sudo amazon-linux-extras install java-openjdk11 -y
sudo yum install git -y
sudo yum install maven -y
git clone https://github.com/sandeep-kandukuri/addressbook.git
cd /home/ec2-user/addressbook
mvn test