MP4Box -add ./264configs/low_config.264 -fps 24 low_config.mp4
MP4Box -add ./264configs/medium_config.264 -fps 24 medium_config.mp4
MP4Box -add ./264configs/high_config.264 -fps 24 high_config.mp4

../bento4/bin/mp4dash ../videos/low_config_fragments.mp4 ../videos/medium_config_fragments.mp4 ../videos/high_config_fragments.mp4 --output-dir ../app/output