# Use an official Node.js image as the base
FROM node:16-alpine

# Set the working directory in the container
WORKDIR /app

# Copy the package.json and package-lock.json files
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the application files
COPY . .

# Build the React app
RUN npm run build

# Expose port 3000 to the host
EXPOSE 3000

# Start the React app
CMD ["npx", "serve", "-s", "build", "-l", "3000"]
