#!/usr/bin/env bash
rm /run/redisup
set -Eeuo pipefail
REDISDBS=${REDISDBS:-512}

# Fire up redis
redis-server /etc/redis/redis.conf

echo "Wait for redis socket to be created..."
while  [ ! -S /run/redis/redis.sock ]; do
        sleep 1
done

echo "Testing redis status..."
X="$(redis-cli -s /run/redis/redis.sock ping)"
while  [ "${X}" != "PONG" ]; do
        echo "Redis not yet ready..."
        sleep 1
        X="$(redis-cli -s /run/redis/redis.sock ping)"
done
echo "Redis ready."
touch /run/redisup

echo "++++++++++++++++"
echo "+ Tailing logs +"
echo "++++++++++++++++"
tail -F /data/var-log/gvm/redis-server.log