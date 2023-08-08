# Use the official Node.js image as base
FROM node:18

# Set the working directory inside the container
WORKDIR /app

# Copy package.json and package-lock.json to the container
COPY package*.json ./

# Install TypeScript and ts-node globally
RUN npm install -g typescript ts-node

# Install dependencies
RUN npm install

# Copy the rest of the application files to the container
COPY . .

# Build TypeScript code
RUN npx tsc

# Command to start the application using ts-node
CMD ["node", "./build/src/routes/app.js"]
