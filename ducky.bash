if test -z $DUCKYFILE; then
  duckyfile="/var/ducky/ducky.json"
else
  duckyfile="/var/ducky/$DUCKYFILE"
fi

workdir=$(dirname "$duckyfile")

echo run ducky from $duckyfile ...

if docker ps -f name=$1 | grep -q -w $1; then

  echo use docker container $1 ...

  if test -z $DUCKY_SKIP_BOOTSTRAP; then
    docker exec $1 \
    bash -c "curl -s -k -L -o - https://sparrowhub.org/bootstrap.sh | \
    bash && export OUTTHENTIC_CWD=$workdir && sparrow index update && sparrow box run $duckyfile"
  else
    docker exec $1 \
    bash -c " export OUTTHENTIC_CWD=$workdir && sparrow index update && sparrow box run $duckyfile"
  fi

else

  echo run docker container from $1 ...

  if test -z $DUCKY_SKIP_BOOTSTRAP; then
    docker run  -v $PWD:/var/ducky -it --entrypoint="" $1 \
    bash -c "curl -s -k -L -o - https://sparrowhub.org/bootstrap.sh | \
    bash &&  export OUTTHENTIC_CWD=$workdir && sparrow index update && sparrow box run $duckyfile"
  else
    docker run  -v $PWD:/var/ducky -it --entrypoint="" $1 \
    bash -c " export OUTTHENTIC_CWD=$workdir && sparrow index update && sparrow box run $duckyfile"  
  fi   

fi


