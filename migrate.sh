#/bin/bash
echo "1st parameter = $DB_FILE "
echo "2nd Parameter = $MIGRATION_URL "

#if [ -f "$1" ]; then
#  echo "SQLite data file exists"
#else
#  if [ -n "$2" ]; then
    wget -O "$DB_FILE" "$MIGRATION_URL"
    echo "Downloaded data file"
#  fi
#fi
