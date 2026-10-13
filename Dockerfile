FROM nginx:alpine
RUN apk add --no-cache unzip
WORKDIR /usr/share/nginx/html
COPY . .
RUN unzip -o *.zip || true
RUN rm -f *.zip
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
