@echo off
REM Start Celery Worker and Beat Scheduler for Windows

echo Starting Redis server...
REM Start Redis (adjust path as needed)
start /B redis-server

echo Starting Celery worker...
start /B celery -A celery_worker worker --loglevel=info --concurrency=2 --queues=video_processing,maintenance

echo Starting Celery beat scheduler...
start /B celery -A celery_worker beat --loglevel=info

echo Starting Flask application...
python app.py

pause