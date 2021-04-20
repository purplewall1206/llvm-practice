s1 = "balloc.o bitmap.o block_validity.o dir.o ext4_jbd2.o extents.o extents_status.o file.o fsmap.o fsync.o hash.o ialloc.o indirect.o inline.o inode.o ioctl.o mballoc.o migrate.o mmp.o move_extent.o namei.o page-io.o readpage.o resize.o super.o symlink.o sysfs.o xattr.o xattr_hurd.o xattr_trusted.o xattr_user.o fast_commit.o acl.o xattr_security.o  verity.o"

ll = s1.split(' ')
ll.sort()
lclang = list()
with open('clang-no-dbg.txt', 'r') as f:
    lclang = f.readlines()

lclang.sort()
print(len(lclang))
print(len(ll))
i = 0

# tmpl = (lclang[0].split(' '))
# print(tmpl[-1])
for x in ll:
    print(x[:-1]+"ll:\t")
    for y in lclang:
        if y.find(x[:-2]) != -1:
            print("\t"+y)
            break
    print(x[:-2]+"-inst.bc: "+ x[:-1]+"ll\t" +   "\n\topt -load ./LLVMinstkern.so -analyze -inst fs/ext4/"+x[:-1]+"ll  -o  fs/ext4/"+ x[:-2]+"-inst.bc")
    print(x+": " + x[:-2] + "-inst.bc  \t\n\tllc -code-model=kernel --filetype=obj fs/ext4/"+x[:-1] + "bc  -o fs/ext4/"+x[:-1]+"o\n")

print("all: " + s1)

allinst = 0
store = 0
icall = 0
ret = 0
# instructions : 379
# store instructions: 17
# icall instructions: 0
# ret   instructions: 4
# with open('compile.log', 'r') as f:
#     for line in f.readlines():
#         if line.find('instructions :')!=  -1:
#             # print(line)
#             allinst = allinst + int(line.split(":")[-1])
#         elif line.find('store instructions:') != -1:
#             store = store + int(line.split(':')[-1])
#         elif line.find('icall instructions:') != -1:
#             icall = icall + int(line.split(':')[-1])
#         elif line.find('ret   instructions:') != -1:
#             ret = ret + int(line.split(':')[-1])

# print(allinst)
# print(store)
# print(icall)
# print(ret)

# print(float(store/allinst))
# print(float(icall/allinst))
# print(float(ret/allinst))


