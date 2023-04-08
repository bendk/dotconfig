function video_setup --wraps='v4l2-ctl -d /dev/video4 --set-ctrl=zoom_absolute=140 ; and v4l2-ctl -d /dev/video4 --set-ctrl=pan_absolute=7200' --description 'alias video_setup v4l2-ctl -d /dev/video4 --set-ctrl=zoom_absolute=140 ; and v4l2-ctl -d /dev/video4 --set-ctrl=pan_absolute=7200'
  v4l2-ctl -d /dev/video4 --set-ctrl=zoom_absolute=140 ; and v4l2-ctl -d /dev/video4 --set-ctrl=pan_absolute=7200 $argv; 
end
