# Openshift: upgrade OS of hosts

Forked from: https://github.com/Sifa91/helpershift
extended to make restarts only when an actual update happened.

## Description
This playbook performs an update of the operating system of the host which is provided during the execution.
It is recommended to do one host after each other, to be sure that not the whole cluster goes down by
accident.
Before the update the node will be marked as unschedulable and evacuated.
When an update has been done the machine will be restarted.

After the restart the playbook waits 60 seconds until it tries to mark the node as schedulable again. 
If this fails because the node requires more time to restart, it is possible to execute the task to activate
the node separately.

### Available tags
 * unschedulable: simply mark one node as unschedulable
 * evacuate: evacuate a single node
 * yum: peform yum update
 * restart: restart a single node
 * schedulable: simply mark one node as schedulable again. This might be required when the restart takes too long


### Tested versions:

| Tested    Version   |
|---------------------|
|       3.11          |

### Variables

|    Extra Vars          |  Description                                             |  Default  |
|------------------------|----------------------------------------------------------|-----------|
| host                   |  asked on execution, defines which host shall be updated |           |


## Usage

### Update OS

```
ansible-playbook -i nonprod playbooks/os-update-ocp/config.yml
```
