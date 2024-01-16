# Use the official Nginx base image
FROM nginx:latest

# Remove the default Nginx configuration
RUN rm /etc/nginx/conf.d/default.conf

# Copy custom Nginx configuration file
COPY nginx.conf /etc/nginx/conf.d/

# Copy your HTML file to the default Nginx web root directory
COPY index.html /usr/share/nginx/html/

# Expose the port Nginx will listen on
EXPOSE 80

# Command to run Nginx in the foreground
CMD ["nginx", "-g", "daemon off;"]
