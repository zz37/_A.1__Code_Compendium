FROM rootproject/6.20.06-fedora32

WORKDIR /work
# RUN python3 -m pip install --upgrade pip # This causes error, skipping

RUN python3 -m pip install jupyter # install jupyter
RUN python3 -m pip install prompt-toolkit==1.0.15 # deal with prompt-toolkit issue (downgrade)

# this now overrides, and copies all files in the wrk dir to the current wrk dir inside the container. This can be used to avoid unncesarry rebuilds in images, and being capable to modify files and avoid unnecesarry rebuilds.
COPY ./ ./ 

# Run jupyter
CMD ["jupyter", "notebook", "--ip=0.0.0.0", "--port=8080", "--allow-root"]