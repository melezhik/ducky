docker run  -v $PWD:/var/ducky -it $1 \
bash -c 'curl -k -L -o - https://sparrowhub.org/bootstrap.sh | \
bash && sparrow index update && sparrow box run /var/ducky/ducky.json'
