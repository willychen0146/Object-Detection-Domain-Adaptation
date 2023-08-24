
# change valid json to txt

import json
import os
import argparse

# get command line arguments
parser = argparse.ArgumentParser()
parser.add_argument('--input_dir', default='../hw3_data/hw3_dataset/org/')
parser.add_argument('--output_dir_val', default='../hw3_data/hw3_dataset/org/labels/valid/')
args = parser.parse_args()

# change train json to txt       
path = args.input_dir
filename = 'val.coco.json'

with open(os.path.join(path, filename), 'r') as f:
    str0 = f.read()
    #print(str)

strjson = str0
parsedJson = json.loads(strjson)
print(len(parsedJson['images']))

# check if output directory exists and create it if necessary
labels_path = args.output_dir_val + '/'
os.makedirs(args.output_dir_val, exist_ok=True)

for i in range(len(parsedJson['images'])):
    print('i: ',i)
    
    labels_filename = os.path.basename(parsedJson['images'][i]['file_name'])
    print(labels_filename[:-4] + '.txt')
    with open(os.path.join(labels_path + labels_filename[:-4] + '.txt'), 'w') as f:
        height = parsedJson['images'][i]['height']
        width = parsedJson['images'][i]['width']

        #f.write('height: ' + height + '\n')
        #f.write('width: '  + width  + '\n')

        for j in parsedJson['annotations']:
            if(j['image_id'] == i):
                print(j)
                f.write(str(j['category_id'] - 1) + ' ')
                #cx = round((j['bbox'][0]+j['bbox'][2]) / width / 2, 5)
                #cy = round((j['bbox'][1]+j['bbox'][3]) / height / 2, 5)
                cx = round((j['bbox'][0] + j['bbox'][2] / 2 )/ width, 5)
                cy = round((j['bbox'][1] + j['bbox'][3] / 2) / height, 5)
                #ww = round((j['bbox'][2]-j['bbox'][0]) / width, 5)
                #hh = round(abs(j['bbox'][3]-j['bbox'][1]) / height, 5)
                ww = round((j['bbox'][2]) / width, 5)
                hh = round((j['bbox'][3]) / height, 5)
                f.write(str(cx) + ' ')
                f.write(str(cy) + ' ')
                f.write(str(ww) + ' ')
                f.write(str(hh) + '\n')       
        
