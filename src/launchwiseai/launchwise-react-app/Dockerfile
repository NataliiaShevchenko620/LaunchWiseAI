# ── Stage 1: Build the React app ───────────────────────────────────────
FROM node:20-alpine AS builder
WORKDIR /app

# Copy only package files and lockfile
COPY package.json package-lock.json ./

# Use npm install (safer if you don't have a lockfile yet)
RUN npm install

# Now copy the rest of your source and build
COPY . .
RUN npm run build


# ── Stage 2: Serve with Nginx ────────────────────────────────────────
FROM nginx:alpine

# Copy the built static files into Nginx’s html folder
COPY --from=builder /app/dist /usr/share/nginx/html

# Expose the standard HTTP port
EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
