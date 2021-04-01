; ModuleID = 'test-transform.bc'
source_filename = "../instFind/test.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [8 x i8] c"c = %d\0A\00", align 1
@.str.1 = private unnamed_addr constant [17 x i8] c"\0Atail triggered\0A\00", align 1
@.str.2 = private unnamed_addr constant [9 x i8] c"x(1) %d\0A\00", align 1
@.str.3 = private unnamed_addr constant [11 x i8] c"x(100) %d\0A\00", align 1
@.str.4 = private unnamed_addr constant [15 x i8] c"indirect c %d\0A\00", align 1
@.str.5 = private unnamed_addr constant [18 x i8] c"current rbp: %lx\0A\00", align 1
@PrintfFormatStr = global [70 x i8] c"(llvm-tutor) Hello from: %s   (llvm-tutor)   number of arguments: %d\0A\00"
@0 = private unnamed_addr constant [2 x i8] c"x\00", align 1
@1 = private unnamed_addr constant [10 x i8] c"printtail\00", align 1
@2 = private unnamed_addr constant [5 x i8] c"main\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @x(i32 %c) #0 {
entry:
  %0 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([70 x i8], [70 x i8]* @PrintfFormatStr, i32 0, i32 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @0, i32 0, i32 0), i32 1)
  %retval = alloca i32, align 4
  %c.addr = alloca i32, align 4
  store i32 %c, i32* %c.addr, align 4
  %1 = load i32, i32* %c.addr, align 4
  %cmp = icmp eq i32 %1, 0
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  %2 = load i32, i32* %c.addr, align 4
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str, i64 0, i64 0), i32 %2)
  store i32 1, i32* %retval, align 4
  br label %return

if.else:                                          ; preds = %entry
  %3 = load i32, i32* %c.addr, align 4
  %call1 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str, i64 0, i64 0), i32 %3)
  store i32 2, i32* %retval, align 4
  br label %return

return:                                           ; preds = %if.else, %if.then
  %4 = load i32, i32* %retval, align 4
  call void @printtail()
  ret i32 %4
}

; Function Attrs: nounwind
declare dso_local i32 @printf(i8* nocapture readonly, ...) #1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @printtail() #0 {
entry:
  %0 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([70 x i8], [70 x i8]* @PrintfFormatStr, i32 0, i32 0), i8* getelementptr inbounds ([10 x i8], [10 x i8]* @1, i32 0, i32 0), i32 0)
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.1, i64 0, i64 0))
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 {
entry:
  %0 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([70 x i8], [70 x i8]* @PrintfFormatStr, i32 0, i32 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @2, i32 0, i32 0), i32 0)
  %retval = alloca i32, align 4
  %res = alloca i32, align 4
  %a = alloca i32 (i32)*, align 8
  %rbp = alloca i64, align 8
  %tmp = alloca i64, align 8
  store i32 0, i32* %retval, align 4
  %call = call i32 @x(i32 1)
  store i32 %call, i32* %res, align 4
  %1 = load i32, i32* %res, align 4
  %call1 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.2, i64 0, i64 0), i32 %1)
  %call2 = call i32 @x(i32 100)
  store i32 %call2, i32* %res, align 4
  %2 = load i32, i32* %res, align 4
  %call3 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.3, i64 0, i64 0), i32 %2)
  store i32 (i32)* @x, i32 (i32)** %a, align 8
  %3 = load i32 (i32)*, i32 (i32)** %a, align 8
  %call4 = call i32 %3(i32 12)
  store i32 %call4, i32* %res, align 4
  %4 = load i32, i32* %res, align 4
  %call5 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.4, i64 0, i64 0), i32 %4)
  store i64 0, i64* %rbp, align 8
  %5 = call i64 asm "movq %rbp, $0\0A\09", "=r,~{dirflag},~{fpsr},~{flags}"() #2, !srcloc !2
  store i64 %5, i64* %rbp, align 8
  %6 = load i64, i64* %rbp, align 8
  %call6 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.5, i64 0, i64 0), i64 %6)
  %7 = load i64, i64* %rbp, align 8
  store i64 %7, i64* %tmp, align 8
  %8 = load i64, i64* %tmp, align 8
  call void @printtail()
  ret i32 0
}

attributes #0 = { noinline nounwind optnone uwtable "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind readnone }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{!"clang version 12.0.0"}
!2 = !{i32 -2147340657, i32 -2147340640}
