# SYNOPSIS

Run [sparrow](https://github.com/melezhik/sparrow) tasks on docker containers.

# INSTALL

    git clone https://github.com/melezhik/ducky.git
    PATH=$PWD/ducky:$PATH # add ducky.bash to the system PATH

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
    ducky.bash jdeathe/centos-ssh

    # run against existed container
    docker run -d -v $PWD:/var/ducky --name ducky jdeathe/centos-ssh bash
    ducky.bash ducky

# Examples

Find more examples at `./examples` directory. To run example use `DUCKYFILE` variable:

    DUCKYFILE=examples/rvm/ducky.json ducky.bash ${image_id}


# Author 

Alexey Melezhik

    
