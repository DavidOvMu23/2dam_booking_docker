FROM node:24-alpine
LABEL maintainer="Keymetrics <contact@keymetrics.io>"

# Install pm2
RUN npm install pm2 -g

# Set working directory
WORKDIR /web

# Copy package.json and package-lock.json (if available)
COPY 2dam_booking/package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the application code
COPY 2dam_booking/ ./

# Build the application
RUN npm run build

# Expose ports needed to use Keymetrics.io
EXPOSE 80 443 43554 3000

# Start pm2.json process file
CMD ["pm2-runtime", "start", "pm2.json"]