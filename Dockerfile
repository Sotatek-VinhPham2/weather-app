    # Build environment
    FROM node:18.16.0 as build
    WORKDIR /app
    # Copy package & package-lock
    COPY package*.json ./
    # Install dependencies
    RUN npm install
    COPY . ./
