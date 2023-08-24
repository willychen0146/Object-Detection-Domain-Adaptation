import os
import argparse

# 命令列參數
parser = argparse.ArgumentParser()
parser.add_argument('--train', type=str, default='../../../../hw3_data/hw3_dataset/org/images/train')
parser.add_argument('--val', type=str, default='../../../../hw3_data/hw3_dataset/org/images/valid')
parser.add_argument('--test', type=str, default='../../../../hw3_data/hw3_dataset/fog/images/public_test')
parser.add_argument('--uda', type=str, default='../../../../hw3_data/hw3_dataset/fog/images/train')
parser.add_argument('--output_dir', type=str, default='ConfMix/data/hw3.yaml')
args = parser.parse_args()

# 定義類別字串
class_str = '''
nc: 8
names: ['person', 'car', 'truck', 'bus', 'rider', 'motorcycle', 'bicycle', 'train']
'''

# 寫入資料到 YAML 檔案
with open(args.output_dir, 'w') as f:
    f.write('# Train/val/test sets as 1) dir: path/to/imgs, 2) file: path/to/imgs.txt, or 3) list: [path/to/imgs1, path/to/imgs2, ..] \n\n')
    
    f.write('# train images \n')
    # 寫入訓練資料路徑
    f.write('train:\n')
    if args.train != '#':
        if os.path.isabs(args.train):
            f.write('  - ' + args.train)
        else:
            f.write('  - ../' + args.train)
    
    # 寫入驗證資料路徑
    f.write('\n\n# val images')
    f.write('\nval:\n')
    if args.val != '#':
        if os.path.isabs(args.val):
            f.write('  - ' + args.val)
        else:
            f.write('  - ../' + args.val)
    
    # 寫入測試資料路徑
    f.write('\n\n# test images')
    f.write('\ntest:\n')
    if args.test != '#':
        if os.path.isabs(args.test):
            f.write('  - ' + args.test)
        else:
            f.write('  - ../' + args.test)
    
    # 寫入UDA資料路徑
    f.write('\nuda:\n')
    if args.uda != '#':
        if os.path.isabs(args.uda):
            f.write('  - ' + args.uda)
        else:
            f.write('  - ../' + args.uda)
    
    # 寫入類別字串
    f.write('\n\n# number of classes + class name')
    f.write(class_str)