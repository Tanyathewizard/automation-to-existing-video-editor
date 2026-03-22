#!/bin/bash
# Start Celery Worker and Beat Scheduler

echo "Starting Redis server..."
# Start Redis (adjust path as needed)
redis-server --daemonize yes

echo "Starting Celery worker..."
celery -A celery_worker worker --loglevel=info --concurrency=2 --queues=video_processing,maintenance &

echo "Starting Celery beat scheduler..."
celery -A celery_worker beat --loglevel=info &

echo "Starting Flask application..."
python app.py

# Keep script running
wait