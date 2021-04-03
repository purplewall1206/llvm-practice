c.txt:
	cat a.txt b.txt > c.txt

result.txt: source.txt c.txt
	cp source.txt result.txt

source.txt:
	echo "this is the source" > source.txt

source: c.txt result.txt

.PHONY: clean 
# 这里是有可能存在叫clean的文件，如果发现有这个文件，那么clean这条指令不会执行，所以需要用phony声明伪目标保证clean目标执行
clean:
	rm *.o tmp c.txt  source.txt result.txt