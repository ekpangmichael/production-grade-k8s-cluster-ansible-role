## Common Role

The common role  contains some general purpose tasks.
Some of these tasks includes the **delete_folder.yml** task and **create_folder.yml** task

To import this task into your playbook see example below  (e.g create_folder.yml)
```sh

- name: create folder
  include_role:
    name: common
    tasks_from: create_folder.yml
  tags: [create]
  
```
By default it creates a folder with the name terraform, you can override this by going into your vars folder and changing the `folder_name: name_of_your_folder` variable