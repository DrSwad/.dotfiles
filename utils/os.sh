# Detect OS, only Debian based Linux and macOS supported

if command apt &> /dev/null; then
  echo 'debian'
elif [[ `uname` == "Darwin" ]]; then
  echo 'mac'
else
  echo 'Unknown OS!'
  exit 1
fi
