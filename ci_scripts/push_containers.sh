export IMAGE_TAG=$(cat VERSION)
export AARCH=`uname -m`

docker build \
  -t confluentinc/cp-base \
  --build-arg KAFKA_VERSION=1.1.1 \
  --build-arg CONFLUENT_MAJOR_VERSION=4 \
  --build-arg CONFLUENT_MINOR_VERSION=1 \
  --build-arg CONFLUENT_PATCH_VERSION=2 \
  --build-arg CONFLUENT_PACKAGES_REPO=http://packages.confluent.io \
  ./debian/base

export IMAGE_NAME=cp-kafka
docker build -t cachengo/$IMAGE_NAME-$AARCH:$IMAGE_TAG ./debian/kafka
docker push cachengo/$IMAGE_NAME-$AARCH:$IMAGE_TAG
