#!/bin/sh

echo "\
    Hello $(whoami)!
    This script will decode any URI you'll pass as an input"

read uri

# ${stringZ//abc/xyz}

# decodedUri=${uri/\%0A/$'\r'}

echo "$uri" | sed -e "s/%\([0-9A-F][0-9A-F]\)/\\\\\x\1/g" | xargs -0 echo -e
