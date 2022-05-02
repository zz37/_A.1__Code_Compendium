# specify base image
FROM node:alpine
# adding the directory of storage inside the container
WORKDIR /usr/nodeApp

# install a dependencies

# only copy the necesary files and then everything else

# the only time npm intall is going to run is when the step current step(RUN) is modified or above it
# so here it copies only the package.json to the work dir.
COPY ./package.json ./ 
RUN npm install

# this now overrides, and copies all files in the wrk dir to the current wrk dir inside the container. This can be used to avoid unncesarry rebuilds in images, and being capable to modify files and avoid unnecesarry rebuilds.
COPY ./ ./ 

# default command
CMD ["npm", "start"]

