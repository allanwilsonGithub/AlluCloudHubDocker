terraform destroy -auto-approve
terraform apply -auto-approve

# Set www3.allanwilson.net:3000 to the new public IP address using Dynamic DNS
ALLUCLOUD_IP_OUTPUT=$(terraform output)
ALLUCLOUD_IP=${ALLUCLOUD_IP_OUTPUT:5}
wget http://directnic.com/dns/gateway/37892b84c11234183990cad367c4dc18914901d5560c75e56bc9f809e671fcb2/?data=$ALLUCLOUD_IP