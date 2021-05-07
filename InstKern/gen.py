# ext4= "acl.o extents.o indirect.o namei.o xattr_hurd.o balloc.o extents_status.o inline.o page-io.o xattr.o bitmap.o fast_commit.o inode.o readpage.o xattr_security.o block_validity.o file.o ioctl.o resize.o xattr_trusted.o dir.o fsmap.o mballoc.o super.o xattr_user.o ext4_jbd2.o fsync.o migrate.o symlink.o ext4.mod.o hash.o mmp.o sysfs.o ext4.o ialloc.o move_extent.o verity.o"

ext4files = "balloc.o bitmap.o block_validity.o dir.o ext4_jbd2.o extents.o extents_status.o file.o fsmap.o fsync.o hash.o ialloc.o indirect.o inline.o inode.o ioctl.o mballoc.o migrate.o mmp.o move_extent.o namei.o page-io.o readpage.o resize.o super.o symlink.o sysfs.o xattr.o xattr_hurd.o xattr_trusted.o xattr_user.o fast_commit.o acl.o xattr_security.o verity.o"

ext4 = ext4files.split(' ')

print('all: ' + ext4files)
print('instkern = ./llvminst2.so')

clangs = list()

with open('tmpext4.txt', 'r') as f:
    clangs = f.readlines()

clangs.sort()

for e in ext4:
    name = e[:-2]
    instname = name + '-inst.ll'
    print(name+".ll:")
    for c in clangs:
        if c.find(name) != -1:
            print('\t' + c)
            break
    print(name + '-inst.ll: ' + name + ".ll")
    print('\topt -load $(instkern) -S -inst fs/ext4/' + name + '.ll -o fs/ext4/' + instname)
    print(e + ': ' + instname)
    print('\tllc -code-model=kernel --filetype=obj fs/ext4/' + instname + ' -o fs/ext4/' + e)
    print('\n\n')