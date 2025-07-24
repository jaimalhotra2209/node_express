FROM node:16

# Install system dependencies for native module builds
RUN apt-get update && apt-get install -y \
    python3 \
    make \
    g++ \
    && rm -rf /var/lib/apt/lists/*

# Set the working directory
WORKDIR /usr/src/app

# Copy package.json and package-lock.json
COPY package*.json ./

# Install dependencies with debugging output and unsafe permissions
RUN npm install --verbose --unsafe-perm || cat npm-debug.log

# Copy the rest of the app
COPY . .

# Expose the app port
EXPOSE 3000

# Run the app
CMD ["node", "app.js"]
