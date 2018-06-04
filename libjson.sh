# libjson.sh  -- treat with json format
#
# ver: 0.0.1
# tags: standard
# desc: kind of wrapper of jq
#
# copyright (c) 2018 Cj-bc
# This software is released under MIT License.

import standard

# set given key to gien value in the file.
# @param <string file-path> <string key> <string value>
# @return $EX_OK(0) success
# @return $EX_OSFILE(72) file not found
function json.set {
  local target=$1
  local key=$2
  local value=$3
  [ -f "$target" ] || error $EX_OSFILE "file not found"

  cat $target | jq ".$key = \"$value\"" > $target
}


# get given key value from the file.
# @param <string file-path> <string key>
# @return $EX_OK(0) success
# @return $EX_OSFILE(72) file not found
function json.get {
  local target=$1
  local key=$2
  local value=""
  [ -f "$target" ] || error $EX_OSFILE "file not found"

  value=$(cat $target | jp ".$key")
  echo $value
  return $EX_OK
}


