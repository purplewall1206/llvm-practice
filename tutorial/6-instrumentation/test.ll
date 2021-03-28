; ModuleID = 'test.bc'
source_filename = "test.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [17 x i8] c"function a : %d\0A\00", align 1
@.str.1 = private unnamed_addr constant [17 x i8] c"function a-: %d\0A\00", align 1
@.str.2 = private unnamed_addr constant [13 x i8] c"call a : %d\0A\00", align 1
@.str.3 = private unnamed_addr constant [22 x i8] c"indirect call a : %d\0A\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @a(i32 %x) #0 {
entry:
  %retval = alloca i32, align 4
  %x.addr = alloca i32, align 4
  store i32 %x, i32* %x.addr, align 4
  %0 = load i32, i32* %x.addr, align 4
  %cmp = icmp eq i32 %0, 1
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %x.addr, align 4
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str, i64 0, i64 0), i32 %1)
  store i32 0, i32* %retval, align 4
  br label %return

if.else:                                          ; preds = %entry
  %2 = load i32, i32* %x.addr, align 4
  %call1 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.1, i64 0, i64 0), i32 %2)
  store i32 2, i32* %retval, align 4
  br label %return

return:                                           ; preds = %if.else, %if.then
  %3 = load i32, i32* %retval, align 4
  ret i32 %3
}

declare dso_local i32 @printf(i8*, ...) #1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 {
entry:
  %retval = alloca i32, align 4
  %p = alloca i32 (i32)*, align 8
  %c = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  %call = call i32 @a(i32 1)
  %call1 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.2, i64 0, i64 0), i32 %call)
  store i32 (i32)* @a, i32 (i32)** %p, align 8
  %0 = load i32 (i32)*, i32 (i32)** %p, align 8
  %call2 = call i32 %0(i32 2)
  %call3 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.3, i64 0, i64 0), i32 %call2)
  store i32 0, i32* %c, align 4
  store i32 10, i32* %c, align 4
  ret i32 0
}

attributes #0 = { noinline nounwind optnone uwtable "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{!"clang version 12.0.0"}
