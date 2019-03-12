# Openshift Backup ETCD, Master, Nodes and Projects

Partially forked from: https://github.com/openlab-red/openshift-management
Thank you so much Mattia :)

## Description
This playbook will create a backup of ectd, master, nodes or projects. 

Backup will be stored under *<backup_root>/<hostname>*
It is assumed that the storage is a HA storage, somewhere external (i.e. NFS).

### Available tags
 * master & nodes: tag = node
 * etcd: tag = etcd
 * projects: tag = projects


### Tested versions:

| Tested    Version   |
|---------------------|
|       3.11          |

### Variables

|    Extra Vars          |  Description                                          |  Default  |
|------------------------|-------------------------------------------------------|-----------|
| backup_root            |   Where to save the backup content                    |           |



## Usage

### Backup All

```
ansible-playbook -i inventory playbooks/ocp-backup/config.yaml
```

### Backup Nodes

#### Nodes

```
ansible-playbook -i inventory playbooks/ocp-backup/config.yaml -t node
```

#### Master Only

```
ansible-playbook -i inventory playbooks/ocp-backup/config.yaml -t node -l masters
```

### Backup etcd

```
ansible-playbook -i inventory playbooks/ocp-backup/config.yml -t etcd
```

### Backup ALL Projects

```
ansible-playbook -i inventory playbooks/ocp-backup/config.yaml -t projects -l backproject
```

## Backup Single Project
```
ansible-playbook -i inventory playbooks/ocp-backup/config.yaml -t projects -l backproject -e "project_name=PROJECTNAME"
```
