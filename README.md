# sdtd-project-archi

## Outils nécessaires 
Pour pouvoir faire fonctionner ce projet, il vous faudra installer l'outil [Terraform](https://www.terraform.io/ "Installer Terraform"), si ce n'est pas déjà fait.

## Fonctionnement 
1) Il faut tout d'abord créer un fichier `terraform.tfvars` *avec vos propres identifiants* pour pouvoir vous connecter au provider AWS comme suit :
```
AWS_ACCESS_KEY = ""
AWS_SECRET_KEY = ""
AWS_SESSION_TOKEN = ""
```
2) Ensuite, il faut exécuter les commandes suivantes pour créer l'infrastructure configurée avec Terraform sur AWS :
- `terraform init` pour initialiser Terraform dans votre projet.
- `terraform plan` pour avoir une idée sur les ressources qui seront approvisionnées.
- `terraform apply` ou `terraform apply --auto-approve` pour exécuter l'approvisionnement et la création de l'infrastructure. 
- `terraform destroy` ou `terraform destroy --auto-approve` à la fin de la démonstration pour détruire toutes les ressources approvisionnées.


## Description
Terraform nous a permis d'automatiser notre infrastructure (IaC = Infrastructure As Code) en décrivant avec du code les ressources dont nous avons besoin pour notre application distribuée.

Terraform permet de préciser le fournisseur cloud `provider` et plusieurs variables si besoin avec le mot-clé `variable`. 

Parmi les ressources AWS utilisées, nous retrouvons : 
- `aws_instance` pour créer des instances EC2 en précisant l'Amazon Machine Image ( nous avons utilisé celle de Ubuntu 18.04 en région us-east-1 ), le type de l'instance, l'adresse IP pour faciliter les configurations, les groupes de sécurité pour ouvrir les ports nécessaires, le script d'approvisionnement et son exécution pour run le conteneur Docker dans la VM.
- `aws_key_pair` pour que Terraform puisse se connecter en ssh aux différentes machines créées et exécuter des commandes à distance.
- `aws_default_security_group` et `aws_security_group` pour créer des pare-feu virtuels pour les différentes instances afin de contrôler le trafic entrant et sortant.
- `aws_default_vpc` nous utilisons le VPC par défaut de AWS us-east-1 et ses différents sous-réseaux.

### Remarques 
Étant donné que nous travaillons avec des images docker comprenant l'environnement adéquat pour le bon fonctionnement de chacun des éléments de notre pile logicielle, nous n'avions pas eu besoin d'un outil tel que [Ansible](https://www.ansible.com/) pour la configuration et la gestion de nos machines EC2.
Au lieu de cela, nous avons opté pour des scripts shell ( que vous pouvez retrouver dans le dossier `script/` ), voici un exemple du script du cluster Kafka : 
```
#!/bin/bash
sudo apt update -y &&
sudo apt install docker.io -y &&
sudo docker pull phedri/sdtd-kafka:v0.2 &&
sudo docker run -p 9092:9092 phedri/sdtd-kafka:v0.2
```
