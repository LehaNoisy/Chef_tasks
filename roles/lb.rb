name "lb"
description "The base role for systems that installs JBoss Server and deploy wars"
run_list "recipe[nginx]"
env_run_lists "knife-env" => ["recipe[nginx]"], "_default" => ["recipe[nginx]"]
