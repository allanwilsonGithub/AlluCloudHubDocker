# AlluHomeHub - Docker

#from fresh AWS Ubuntu 18.04 instance
sudo apt-get update
sudo apt install docker.io -y
sudo systemctl start docker

#clone the repo
git clone https://github.com/allanwilsonGithub/AlluCloudHubDocker.git
cd AlluCloudHubDocker

#Build the docker image
<p>sudo ./run_docker.sh</p>

#ssh to Docker container
<p>docker run -it allu-cloud-hub bash</p>

#get the internal IP with ifconfig
<p>ifconfig</p>
#update package.json with internal IP
<p>vi package.json</p>
#start the server on port 3000
<p>npm run start</p>

#create a rule to allow Tcp 3000 into the private IP

#Test in public browser: http://<public_IP>:3000
