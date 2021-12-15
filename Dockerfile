FROM node:alpine

COPY . .
RUN npm install --production

CMD [ "npm", "start" ]
EXPOSE 3000

# Install development packages if NODE_ENV is set to "development"
ARG NODE_ENV
ENV NODE_ENV $NODE_ENV
RUN if [ "$NODE_ENV" == "development" ]; then npm install ; fi