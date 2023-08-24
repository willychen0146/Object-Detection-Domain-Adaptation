# Download YOLOv5 source model checkpoint - name: yolov5x_source.pt
wget --load-cookies /tmp/cookies.txt "https://docs.google.com/uc?export=download&confirm=$(wget --quiet --save-cookies /tmp/cookies.txt --keep-session-cookies --no-check-certificate 'https://docs.google.com/uc?export=download&id=11NuPn87UhmcKZSnuyStAbaiqiaDQSnw8' -O- | sed -rn 's/.*confirm=([0-9A-Za-z_]+).*/\1\n/p')&id=11NuPn87UhmcKZSnuyStAbaiqiaDQSnw8" -O yolov5x_source.pt&& rm -rf /tmp/cookies.txt

# Download YOLOv5 adapt checkpoint 33% - name: yolov5x_UDA_epoch50.pt
wget --load-cookies /tmp/cookies.txt "https://docs.google.com/uc?export=download&confirm=$(wget --quiet --save-cookies /tmp/cookies.txt --keep-session-cookies --no-check-certificate 'https://docs.google.com/uc?export=download&id=19a1fDp_kWrjQuR2unKG_l1rOw7l0LWZD' -O- | sed -rn 's/.*confirm=([0-9A-Za-z_]+).*/\1\n/p')&id=19a1fDp_kWrjQuR2unKG_l1rOw7l0LWZD" -O yolov5x_UDA_epoch50.pt&& rm -rf /tmp/cookies.txt

# Download YOLOv5 adapt checkpoint 66% - name: yolov5x_UDA_epoch100.pt
wget --load-cookies /tmp/cookies.txt "https://docs.google.com/uc?export=download&confirm=$(wget --quiet --save-cookies /tmp/cookies.txt --keep-session-cookies --no-check-certificate 'https://docs.google.com/uc?export=download&id=1-ZDdgZoUf8WeJaLorgrmTpVfEK8nKTvl' -O- | sed -rn 's/.*confirm=([0-9A-Za-z_]+).*/\1\n/p')&id=1-ZDdgZoUf8WeJaLorgrmTpVfEK8nKTvl" -O yolov5x_UDA_epoch100.pt&& rm -rf /tmp/cookies.txt

# Download YOLOv5 adapt checkpoint 100% - name: yolov5x_UDA_epoch150.pt
wget --load-cookies /tmp/cookies.txt "https://docs.google.com/uc?export=download&confirm=$(wget --quiet --save-cookies /tmp/cookies.txt --keep-session-cookies --no-check-certificate 'https://docs.google.com/uc?export=download&id=1uTv4G4Rxjj5VrKcDsuHVS424XaCFI64z' -O- | sed -rn 's/.*confirm=([0-9A-Za-z_]+).*/\1\n/p')&id=1uTv4G4Rxjj5VrKcDsuHVS424XaCFI64z" -O yolov5x_UDA_epoch150.pt&& rm -rf /tmp/cookies.txt

# Download best YOLOv5 adapt checkpoint - name: yolov5x_UDA_best.pt
wget --load-cookies /tmp/cookies.txt "https://docs.google.com/uc?export=download&confirm=$(wget --quiet --save-cookies /tmp/cookies.txt --keep-session-cookies --no-check-certificate 'https://docs.google.com/uc?export=download&id=1XE5cdOluV2iz14pXsV-eRN12Tw2Vmc29' -O- | sed -rn 's/.*confirm=([0-9A-Za-z_]+).*/\1\n/p')&id=1XE5cdOluV2iz14pXsV-eRN12Tw2Vmc29" -O yolov5x_UDA_best.pt&& rm -rf /tmp/cookies.txt
