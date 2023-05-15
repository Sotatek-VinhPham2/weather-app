    # Build environment
    FROM node:lts as build
    WORKDIR /app
    # Copy package & package-lock
    COPY package*.json ./
    # Install dependencies
    RUN npm install
    COPY . ./