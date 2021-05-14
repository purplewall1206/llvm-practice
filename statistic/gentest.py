ext4 = list()

with open('ext4.txt', 'r') as f:
    ext4 = f.readlines()

ext4.sort()

for e in ext4:
    name = e[:-3]
    print('echo "' + name + '"')
    print('opt -load ./LLVMstatistic.so -inst /home/wangzc/Documents/linux-5.10.25/fs/ext4/' + name + '.ll')