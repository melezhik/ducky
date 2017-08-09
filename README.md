# SYNOPSIS

Run [sparrow](https://github.com/melezhik/sparrow) tasks on docker containers

# USAGE


    cat ducky.json

    [
    
      {
        "task" : "disk check",
        "plugin" : "df-check",
        "data" : {
            "threshold" : 95
        }
      },
      {
        "task" : "test plugin",
        "plugin" : "foo-generic",
        "data" : {
    
        }
      }
    
    ]
    
    docker pull jdeathe/centos-ssh
    ./ducky.bash jdeathe/centos-ssh


# Author 

Alexey Melezhik

    
