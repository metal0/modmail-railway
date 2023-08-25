#/bin/bash
echo "1st parameter = $1 "
echo "2nd Parameter = $2 "

#if [ -f "$1" ]; then
#  echo "SQLite data file exists"
#else
#  if [ -n "$2" ]; then
    wget -O "$1" "$2"
    echo "Downloaded data file"
#  fi
#fi
