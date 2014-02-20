#!/bin/bash

port=$1
port=${port:-8080}

echo "Running server at localhost:$port";
echo "If you hope shutdown of server then press key at ^C.";
echo "$$" > server.pid;

trap "kill -9 `cat server.pid`" SIGINT;

while true; do 
  { 
    echo -e 'HTTP/1.1 200 OK\r\n'; 
    cat message.txt; 
    echo $(uname -a); 
    echo "<hr/>"; 
    echo $(date +"%Y-%m-%d %I:%M:%S"); 
  } | nc -l ${port:-8080}; 
done
