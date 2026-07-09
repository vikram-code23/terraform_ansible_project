FROM nginx:latest

# Remove default nginx files
RUN rm -rf /usr/share/nginx/html/*

# Copy website files
COPY index.html /usr/share/nginx/html/
COPY style.css /usr/share/nginx/html/
COPY script.js /usr/share/nginx/html/

# Copy assets
COPY images /usr/share/nginx/html/images


EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]