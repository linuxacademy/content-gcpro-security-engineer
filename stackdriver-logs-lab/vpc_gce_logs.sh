gcloud compute networks create la-network-1 --subnet-mode=custom

gcloud compute networks subnets create la-subnet-a --network=la-network-1 --region=us-west1 --range=10.0.1.0/24

gcloud compute networks create la-network-2 --subnet-mode=custom

gcloud compute networks subnets create la-subnet-b --network=la-network-2 --region=us-central1 --range=10.0.2.0/24

gcloud compute networks subnets create la-subnet-c --network=la-network-2 --region=us-east1 --range=10.0.3.0/24

gcloud compute firewall-rules create allow-ssh-icmp-la-network-1 --direction=INGRESS --priority=1000 --network=la-network-1 --action=ALLOW --rules=tcp:22,icmp --source-ranges=0.0.0.0/0

gcloud compute firewall-rules create allow-ssh-icmp-la-network-2 --direction=INGRESS --priority=1000 --network=la-network-2 --action=ALLOW --rules=tcp:22,icmp --source-ranges=0.0.0.0/0

gcloud beta compute instances create instance-1 --zone=us-west1-b --machine-type=g1-small --subnet=la-subnet-a --network-tier=PREMIUM --maintenance-policy=MIGRATE --image=debian-9-stretch-v20180911 --image-project=debian-cloud --boot-disk-size=10GB --boot-disk-type=pd-standard --boot-disk-device-name=instance-1

gcloud beta compute instances create instance-2 --zone=us-central1-c --machine-type=g1-small --subnet=la-subnet-b --network-tier=PREMIUM --maintenance-policy=MIGRATE --image=debian-9-stretch-v20180911 --image-project=debian-cloud --boot-disk-size=10GB --boot-disk-type=pd-standard --boot-disk-device-name=instance-2

gcloud beta compute instances create instance-3 --zone=us-east1-b --machine-type=g1-small --subnet=la-subnet-c --network-tier=PREMIUM --maintenance-policy=MIGRATE  --image=debian-9-stretch-v20180911 --image-project=debian-cloud --boot-disk-size=10GB --boot-disk-type=pd-standard --boot-disk-device-name=instance-3
