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
        "task" : "stop nginx service",
        "plugin" : "bash",
        "data" : {
          "command" : "if test -f /run/nginx.pid; then kill `cat /run/nginx.pid`; fi",
          "debug" : true
        }
      },
      {
        "task" : "start nginx service",
        "plugin" : "bash",
        "data" : {
          "command" : "nginx"
        }
      },
      {
        "task" : "check nginx",
        "plugin" : "bash",
        "data" : {
          "command" : "curl -D - -f -L 127.0.0.1 -o /dev/null"
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

    
