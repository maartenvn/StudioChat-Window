FROM node:lts-alpine


# Make the 'app' folder the current working directory
WORKDIR /app

# Copy both 'package.json' and 'yarn.lock' (if available)
COPY package.json package-lock.json ./

# Install project dependencies
RUN npm i

# Copy project files and folders to the current working directory (i.e. 'app' folder)
COPY . .

# Build app for production with minification
RUN npm run build

EXPOSE 80
CMD [ "npm", "run", "start"]