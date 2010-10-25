# Shotgun configuration:
#\ -s thin -p 4567

$LOAD_PATH.unshift(".") unless $LOAD_PATH.include?(".")
require 'app'

run App