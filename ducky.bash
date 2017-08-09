if test -z $DUCKYFILE; then
  duckyfile="/var/ducky/ducky.json"
else
  duckyfile="/var/ducky/$DUCKYFILE"
fi

echo run ducky from $duckyfile ...

if docker ps -f name=$1 | grep -q -w $1; then
  echo use docker container $1 ...
  docker exec $1 \
  bash -c "curl -s -k -L -o - https://sparrowhub.org/bootstrap.sh | \
  bash && sparrow index update && sparrow box run $duckyfile"
else
  echo run docker container from $1 ...
  #set -x
  docker run  -v $PWD:/var/ducky -it --entrypoint="" $1 \
  bash -c "curl -s -k -L -o - https://sparrowhub.org/bootstrap.sh | \
  bash && sparrow index update && sparrow box run $duckyfile"
fi


