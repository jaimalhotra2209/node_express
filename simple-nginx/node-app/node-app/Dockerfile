# Use the official Node.js image from Docker Hub
FROM node:16

# Install system dependencies (for native builds)
RUN apt-get update && apt-get install -y \
    python3 \
    make \
    g++ \
    && rm -rf /var/lib/apt/lists/*

# Set the working directory in the container
WORKDIR /usr/src/app

# Copy package.json and package-lock.json if available
COPY package*.json ./

# Clean npm cache (optional, helps prevent strange issues)
RUN npm cache clean --force

# Install dependencies, show full logs on error
RUN npm install --verbose

# Copy the rest of the app files
COPY . .

# Expose the port the app will run on
EXPOSE 3000

# Command to run the app
CMD ["node", "app.js"]

