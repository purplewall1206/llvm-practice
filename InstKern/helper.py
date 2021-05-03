ketag_offset = 0xdfffc88000000000


x = 0xffffb9902b76b950
y = 0xffff888100000000
z = 0xffff888220000000

a = 0xffffb9900fb0aa03
b = 0xffffffff81000000

def recal(x):
    x = (x-ketag_offset) << 3
    return x

print(hex(recal(x)))
print(hex(recal(a)))


def cal(x):
    x = (x >> 3) + ketag_offset
    return x

print(hex(cal(y)))

print(hex(cal(z)))
print(hex(cal(b)))