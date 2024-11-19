# Stage 1: Build stage
FROM node:18 AS build-stage

# Set the working directory
WORKDIR /app

# Copy package.json and package-lock.json
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the application code
COPY . .

# Build the application
RUN npm run build

# Stage 2: Production stage
FROM node:18-alpine AS production-stage

# Set the working directory
WORKDIR /app

# Copy the build output and installed dependencies from the build stage
COPY --from=build-stage /app /app

# Install only production dependencies
RUN npm install --production

# Expose the port the app runs on
EXPOSE 8080

# Command to run the application
CMD ["npm", "run", "preview"]