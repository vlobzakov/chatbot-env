echo<< EOF > docker-compose.yml
version: "3"
services:
  appsmith:
     image: index.docker.io/appsmith/appsmith-ce
     container_name: appsmith
     ports:
         - "443:443"
         - "80:80"
     environment:
      - nodeUrlS=https://node@ARGV[1]
      - nodeUrl=http://node@ARGV[1]
     volumes:
         - ./stacks:/appsmith-stacks
     restart: unless-stopped
EOF

docker-compose up --build -d
sleep 10
