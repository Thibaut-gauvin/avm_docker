# Ansible Version Manager
=====================

Based on [https://github.com/ahelal/avm](https://github.com/ahelal/avm)

### Install


    # Setup & configure .env files
    $ cp .env.dist .env
    $ vim .env

    # Configure ansible inventories
    $ vim .ansible/inventories/inventory_test

    # Build image
    $ docker-compose build
    
    # Add your required ssh keys to the agent
    $ ssh-add ...
    
done!



### Usage

    $ docker-compose run --rm avm bash
    ~> ansible-playbook .ansible/project.yml -i .ansible/inventories/inventory_test --ask-sudo-pass



### TODO

- Write a Makefile
- Complete doc
- Improve docker / compose to manage multiple Ansible version pre-install
