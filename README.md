# SYNOPSIS

Run [sparrow](https://github.com/melezhik/sparrow) tasks on docker containers

# USAGE


    cat ducky.json

    [
    
      {
        "task" : "install nginx",
        "plugin" : "package-generic",
        "data" : {
            "list" : "nginx"
        }
      },
      {
        "task" : "start nginx service",
        "plugin" : "service",
        "data" : {
            "action" : "start",
            "service" : "nginx"
        }
      },
      {
        "task" : "check nginx",
        "plugin" : "bash",
        "data" : {
          "command" : "curl -f -L 127.0.0.1"
        }
      }
    
    ]
        

    # run once and then exit
    docker pull jdeathe/centos-ssh
    ./ducky.bash jdeathe/centos-ssh

    # run against existed container
    docker run -d -v $PWD:/var/ducky --name ducky jdeathe/centos-ssh bash
    ./ducky.bash ducky
      

# Author 

Alexey Melezhik

    
