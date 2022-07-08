# use an existing docker image as a base 
# CAPITAL words are instructions telling docker server what to do
FROM alpine

# download and install a dependency
# the order of operations alter the flow of the dockerfile 
# A then B is different from B then A

RUN apk add --update gcc
RUN apk add --update redis

# tell the image waht to do when it starts as a container
CMD ["redis-server"]

