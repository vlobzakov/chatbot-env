wget https://raw.githubusercontent.com/vlobzakov/chatbot-env/master/scripts/chromadb-workable.tar -O chromadb-workable.tar
tar -xf chromadb-workable.tar
cd chroma/
docker-compose up --build -d
sleep 10
docker_id=$(docker ps | grep chroma-server | awk -F\  '{print $1}')
docker update --restart=always $docker_id
