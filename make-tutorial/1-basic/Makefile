c.txt:
	cat a.txt b.txt > c.txt

result.txt: source.txt c.txt
	cp source.txt result.txt
	echo $@
	echo $<
	echo $?
	echo $^
	echo $*

source.txt:
	echo "this is the source" > source.txt

source: c.txt result.txt

.PHONY: clean 
# 这里是有可能存在叫clean的文件，如果发现有这个文件，那么clean这条指令不会执行，所以需要用phony声明伪目标保证clean目标执行
clean:
	rm *.o tmp c.txt  source.txt result.txt

txt = Hello World
v1 = $(txt)
v1 := $(txt)
v1 ?= $(txt)
v1 += $(txt)



test:
	# 这是测试0
	@# 这是测试1
	echo #这是测试2
	@echo #这是测试3
	@echo $(txt)
	@echo $$HOME
	@echo $(v1)

libs=x
ifeq ($(CC),gcc)
	libs=$(txt)
else
	libs=$(v1)
endif

LIST = one two three

srcfiles := $(shell echo src/{00..99}.txt)
test1:
	@echo $(CC)
	@echo $(libs)
	@for i in $(LIST); do \
		echo $$i; \
	done	
	@echo $(srcfiles)

srcfiles := $(wildcard *.txt)

ifneq ($(LLVM),)
HOSTCC	= clang
else
HOSTCC	= gcc
endif
test2:
	@echo $(srcfiles)
	@echo $(subst ee,EE,feet on the street)
	@echo $(patsubst %.txt,%.o.txt, $(wildcard *.txt))
	@echo $(LLVM)
	@echo $(HOSTCC)
