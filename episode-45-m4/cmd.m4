define(command,`$ $1
esyscmd($1)')dnl
command(`ping -c 3 8.8.8.8')dnl
