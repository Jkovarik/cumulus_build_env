FROM node:10
RUN apt update && apt install -y netcat zip
RUN git clone https://github.com/nasa/cumulus && cd cumulus && npm run bootstrap
RUN find ./packages -maxdepth 2 -name node_modules && find ./tasks -maxdepth 2 -name node_modules && echo "./node_modules"  && echo "./example/node_modules/" | zip -ry /bootstrapped_deps.zip -@
