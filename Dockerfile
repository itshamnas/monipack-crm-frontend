FROM nginx:alpine
RUN apk add --no-cache unzip
WORKDIR /usr/share/nginx/html
COPY . .
RUN unzip -o *.zip && rm -f *.zip
RUN printf "server {\n listen 80;\n location / {\n  root /usr/share/nginx/html;\n  index index.html;\n  try_files \$uri \$uri/ /index.html;\n }\n}\n" > /etc/nginx/conf.d/default.conf
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
