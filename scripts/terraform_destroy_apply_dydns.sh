terraform destroy -auto-approve
terraform apply -auto-approve

# Set www3.allanwilson.net:3000 to the new public IP address using Dynamic DNS
ALLUCLOUD_IP_OUTPUT=$(terraform output)
ALLUCLOUD_IP=${ALLUCLOUD_IP_OUTPUT:5}
wget http://directnic.com/dns/gateway/68825a3ee333d4426d68d0f9eb0c9ee6de6a26cee8fc90d26e0acb2219f64c58/?data=$ALLUCLOUD_IP