#!/usr/bin/env sh
set -x
npx serve -s build -l 3000
sleep 1
echo $! > .pidfile
set +x

echo 'Now...'
echo 'Visit http://localhost:3000 to see your Node.js/React application in action.'
