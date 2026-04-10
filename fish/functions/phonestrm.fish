function phonestrm
    scrcpy --video-source=camera --camera-facing=front --camera-size=1280x720 \
    --video-codec=h264 --video-bit-rate=2M --v4l2-sink=/dev/video0 \
    --no-playback --no-audio
end
