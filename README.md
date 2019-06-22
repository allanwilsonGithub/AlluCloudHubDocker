# AlluHomeHub - Docker

#Build the docker image
<p>./run_docker.sh</p>

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
