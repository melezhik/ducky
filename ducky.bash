if test -z $DUCKYFILE;
  duckyfile=/var/ducky/ducky.json
then
  duckyfile="/var/ducky/${DUCKYFILE}"
fi

echo run ducky from $duckyfile ...

if docker ps -f name=$1 | grep -q -w $1; then
  docker exec $1 \
  bash -c "curl -k -L -o - https://sparrowhub.org/bootstrap.sh | \
  bash && sparrow index update && sparrow box run $duckyfile"
else
  docker run  -v $PWD:/var/ducky -it $1 \
  bash -c "curl -k -L -o - https://sparrowhub.org/bootstrap.sh | \
  bash && sparrow index update && sparrow box run $duckyfile"
fi


