CONTAINER_LIST_COUNT=$(docker ps -a -q | wc -l | awk '{print $1}')

if [ ${CONTAINER_LIST_COUNT} -ne 0 ]
then
	echo "Found ${CONTAINER_LIST_COUNT} containers. Stopping and removing them."
	docker stop $(docker ps -a -q)
	docker rm $(docker ps -a -q)
else
	echo "No containers removed because none were found on this machine."
fi

IMAGE_LIST_COUNT=$(docker images -q | wc -l | awk '{print $1}')

if [ ${IMAGE_LIST_COUNT} -ne 0 ]
then
	echo "Found ${IMAGE_LIST_COUNT} images. Removing them."
	docker rmi -f $(docker images -q)
else
	echo "No images removed because none were found on this machine."
fi
