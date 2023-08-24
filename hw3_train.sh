# You can refer to README.md for detail step

# You should input the 7 following variable to construct the data structure before using this script
:<<EOF
cp_input_org_train_image = $1 # path to org training image
cp_input_org_valid_image = $2 # path to org validation image
cp_input_fog_train_image = $3 # path to fog training image
cp_input_fog_valid_image = $4 # path to fog validation image
cp_input_org_train_json = $5 # path to org training images' label json file 
cp_input_org_valid_json = $6 # path to org validation images' label json file 
cp_input_fog_valid_json = $7 # path to fog validation images' label json file 
EOF

# Train source model

# environment setting
pip install -r requirements.txt

mkdir -p datasets/org/images/train
mkdir -p datasets/org/images/valid
mkdir -p datasets/org/labels/train
mkdir -p datasets/org/labels/valid
mkdir -p datasets/fog/images/train
mkdir -p datasets/fog/images/valid
mkdir -p datasets/fog/labels/train
mkdir -p datasets/fog/labels/valid
cp -r "$1"/*png datasets/org/images/train/
cp -r "$2"/*png datasets/org/images/valid/
cp -r "$3"/*png datasets/fog/images/train/
cp -r "$4"/*png datasets/fog/images/valid/
cp  $5 datasets/org/train.coco.json
cp  $6 datasets/org/val.coco.json
cp  $7 datasets/fog/val.coco.json

# the data structure should put like this
:<<EOF
Root___
      |__org___images___train
      |      |        |_valid 
      |      |
      |      |_labels___train      
      |               |_valid 
      |__fog___images___train
             |        |_valid 
             |        |_public_test
             |          
             |_labels___train(place pseudo-label)      
                      |_valid 
EOF

# convert datasets labels (input_dir should cotain both train.coco.json and val.coco.json)
python3 JSON_to_txt.py --input_dir datasets/org/ --output_dir_train datasets/org/labels/train/ --output_dir_val datasets/org/labels/valid/
python3 JSON_to_txt_valid.py --input_dir datasets/fog/ --output_dir_val datasets/fog/labels/valid/


# generate hw3_source.yaml for training
python3 prepare_datasets_yaml.py --train datasets/org/images/train --val datasets/org/images/valid --test datasets/org/images/valid --uda datasets/fog/images/train --output_dir ConfMix/data/hw3_source.yaml

# Place your datasets under the folder you want to use - detail datasets format should be like README.md, you might need to modify the route inside yaml file 
cd ConfMix
python3 train.py --name cityscapes --batch 8 --imgsz 640 --epochs 170 --data data/hw3_source.yaml --weights yolov5x.pt --hyp data/hyps/hyp.scratch-cos.yaml --image-weights --optimizer AdamW
cd ..

# Create Pseudo-Labelling (Need to create the coco128.yaml like yaml file first to detect the specific datasets, and the yaml file should cotain the correct class numbers)
python3 prepare_datasets_yaml.py --val datasets/fog/images/train --test datasets/fog/images/train --output_dir ConfMix/data/hw3_txt.yaml

cd ConfMix
python3 detect.py --weights runs/train/cityscapes/weights/best.pt --source ../datasets/fog/images/train --data data/hw3_txt.yaml --save-txt
# Then move the output txt file to the root/fog/labels/train to create Pseudo-Label
cp -r runs/detect/exp/labels/*txt ../datasets/fog/labels/train/
cd ..

# '''Train UDA model'''
# generate hw3_UDA.yaml for training
python3 prepare_datasets_yaml.py --train datasets/org/images/train --val datasets/fog/images/valid --test datasets/fog/images/valid --uda datasets/fog/images/train --output_dir ConfMix/data/hw3_UDA.yaml

# Training uda model (150 epochs, save every 50 epochs) - detail datasets format should be like README.md, you might need to modify the route inside yaml file 
cd ConfMix
python3 uda_train.py --name cityscapes2foggy --batch 4 --epochs 151 --data data/hw3_UDA.yaml --weight runs/train/cityscapes/weights/best.pt  --imgsz 640 --save-period 50
cd ..
