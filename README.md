README for the Webhooks to be tested with Karate along with API tests for Image capture, DVR capture and Livestream on Dashcam

cd D:\Work\LM\Testing\KarateNew\lmtest
C:\progapps\apache-maven\bin\mvn clean test -Dkarate.options="--tags ~@ignore"
#C:\progapps\apache-maven\bin\mvn test -Dkarate.options="--tags @fleet"

ASYNC_DOWNLOAD_REPORT_STATUS	https://7b2d-13-127-64-54.ngrok-free.app/ASYNC
BAD_CAMERA_MOUNTING				https://7b2d-13-127-64-54.ngrok-free.app/MOUNT
DEBUG_EVENT_CREATED				https://7b2d-13-127-64-54.ngrok-free.app/DVR
DEBUG_EVENT_VIDEO_UPLOADED		https://7b2d-13-127-64-54.ngrok-free.app/DVR
DEVICE_INSTALLATION_COMPLETED	https://7b2d-13-127-64-54.ngrok-free.app/INSTALL
DVR_EXECUTED					https://7b2d-13-127-64-54.ngrok-free.app/DVR2
DVR_IMAGE_UPLOAD_EXECUTED		https://7b2d-13-127-64-54.ngrok-free.app/IMAGE
DVR_UPLOADED					https://7b2d-13-127-64-54.ngrok-free.app/DVR2
EVENT_CREATED					https://7b2d-13-127-64-54.ngrok-free.app/DVR
EVENT_DVR_EXECUTED				https://7b2d-13-127-64-54.ngrok-free.app/DVR3
EVENT_DVR_UPLOADED				https://7b2d-13-127-64-54.ngrok-free.app/DVR3
EVENT_VIDEO_UPLOADED			https://7b2d-13-127-64-54.ngrok-free.app/EVENT
IMAGE_UPLOAD_EXECUTED			https://7b2d-13-127-64-54.ngrok-free.app/IMAGE
LIVESTREAM_STATUS_UPDATE		https://7b2d-13-127-64-54.ngrok-free.app/LIVESTREAM
TRIP_DATA_UPLOADED				https://7b2d-13-127-64-54.ngrok-free.app/TRIPUPLOAD
TRIP_ENDED						https://7b2d-13-127-64-54.ngrok-free.app/TRIP_END
TRIP_STARTED					https://7b2d-13-127-64-54.ngrok-free.app/TRIP_START
VEHICLE_IGNITION_OFF			https://7b2d-13-127-64-54.ngrok-free.app/IGNITION
VEHICLE_IGNITION_ON				https://7b2d-13-127-64-54.ngrok-free.app/IGNITION
