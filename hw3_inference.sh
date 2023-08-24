input=$1 # testing images directory with images named 'xxxx.jpg (e.g. input/test_dir/)
output=$2 # path of output json file (e.g. output/pred.json)
case $3 in
  0)
    weight="../yolov5x_source.pt"
    ;;
  1)
    weight="../yolov5x_UDA_epoch50.pt"
    ;;
  2)
    weight="../yolov5x_UDA_epoch100.pt"
    ;;
  3)
    weight="../yolov5x_UDA_epoch150.pt"
    ;;
  4)
    weight="../yolov5x_UDA_best.pt"
    ;;
  *)
    echo "Invalid checkpoint selection."
    exit 1
    ;;
esac

if [[ $3 -eq 4 ]]; then
  img="--img 1280"
else
  img=""
fi

# 判定並處理相對路徑
if [[ ! $output = /* ]]; then
  output="../$output"
fi

# generate hw3.yaml for inference
python3 prepare_datasets_yaml.py --val $input


# inference source or UDA model: output the pred.json file
cd ConfMix
python3 inference_self.py --output_dir $output --weight $weight $img
cd ..
