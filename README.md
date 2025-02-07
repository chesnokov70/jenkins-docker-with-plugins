# jenkins-docker-with-plugins
#-----------------------------------
tf init
tf plan
tf apply
cd ../ansible
ansible-playbook  playbook.yaml 
#-----------------------------------------------------------------
cd ../infra-terraform
tf destroy
#-----------------------------------