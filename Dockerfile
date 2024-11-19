FROM node:18
ENV CI=true

# Set the working directory inside the container
WORKDIR /usr/src/app

# Copy package.json and package-lock.json
COPY package*.json ./

# Install dependencies
RUN npm i --force

# Copy the rest of the application code
COPY . .

ENV NODE_ENV=production
ENV HOST=0.0.0.0
# construir aplicacion
RUN npm run build

# Set default value for PORT environment variable
# Expose the port the app runs on
EXPOSE $PORT 8080

# Command to run the application
CMD ["npm", "run", "start:prod"]