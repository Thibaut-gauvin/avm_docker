# Ansible Version Manager
=====================

Based on [https://github.com/ahelal/avm](https://github.com/ahelal/avm)


### Pre-installed Ansible version ready to use :

- :heavy_check_mark: v2.1.6
- :heavy_check_mark: v2.2.3
- :heavy_check_mark: v2.3.3
- :heavy_check_mark: v2.4.3

### Install


    # Setup & configure .env files
    $ cp .env.dist .env
    $ vim .env

    # Build image
    $ docker-compose build

    # Configure ansible inventories (for test playbook)
    $ vim .ansible/inventories/inventory_test
    
    # Add your required ssh keys to the agent
    $ ssh-add ...
    
done!


### Usage

    # Start bash session inside avm container
    $ docker-compose run --rm avm bash

    # List available Ansible install
    ~> avm list
    
    # Run test playbook
    ~> ansible-playbook .ansible/project.yml -i .ansible/inventories/inventory_test --ask-sudo-pass


### Ansible versions:

- 1.8, 1.8.1, 1.8.2, 1.8.3, 1.8.4, 1.9.0.1, 1.9.1, 1.9.2, 1.9.3, 1.9.4, 1.9.5, 1.9.6 
- 2.0.0.0, 2.0.0.1, 2.0.0.2, 2.0.1.0, 2.0.2.0
- 2.1.0.0, 2.1.1.0, 2.1.2.0, 2.1.3.0, 2.1.4.0, 2.1.5.0, 2.1.6.0 
- 2.2.0.0, 2.2.1.0, 2.2.2.0, 2.2.3.0 
- 2.3.0.0, 2.3.1.0, 2.3.2.0, 2.3.3.0 
- 2.4.0.0, 2.4.1.0, 2.4.2.0, 2.4.3.0
- 2.5.0a1, 2.5.0b1, 2.5.0b2, 2.5.0rc1, 2.5.0rc2, 2.5.0rc3, 2.5.0


### TODO

- Write a Makefile
- Complete doc
- Improve docker / compose to manage multiple Ansible version pre-install
