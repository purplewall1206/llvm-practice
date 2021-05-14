; ModuleID = 'test.c'
source_filename = "test.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [8 x i8] c"%016lx\0A\00", align 1
@.str.1 = private unnamed_addr constant [25 x i8] c"get c addr: %016lx - %d\0A\00", align 1
@.str.2 = private unnamed_addr constant [5 x i8] c"+%d\0A\00", align 1
@.str.3 = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1
@.str.4 = private unnamed_addr constant [12 x i8] c"ketag---%s\0A\00", align 1
@.str.5 = private unnamed_addr constant [22 x i8] c"test addr %016lx, %d\0A\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @printx(i64 %addr) #0 {
entry:
  %addr.addr = alloca i64, align 8
  store i64 %addr, i64* %addr.addr, align 8
  %0 = load i64, i64* %addr.addr, align 8
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str, i64 0, i64 0), i64 %0)
  ret void
}

declare dso_local i32 @printf(i8*, ...) #1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @a(i32 %c) #0 {
entry:
  %retval = alloca i32, align 4
  %c.addr = alloca i32, align 4
  store i32 %c, i32* %c.addr, align 4
  %0 = load i32, i32* %c.addr, align 4
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([25 x i8], [25 x i8]* @.str.1, i64 0, i64 0), i32* %c.addr, i32 %0)
  %1 = load i32, i32* %c.addr, align 4
  %cmp = icmp sgt i32 %1, 0
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  %2 = load i32, i32* %c.addr, align 4
  %call1 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.2, i64 0, i64 0), i32 %2)
  store i32 1, i32* %retval, align 4
  br label %return

if.else:                                          ; preds = %entry
  %3 = load i32, i32* %c.addr, align 4
  %call2 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.3, i64 0, i64 0), i32 %3)
  store i32 -1, i32* %retval, align 4
  br label %return

return:                                           ; preds = %if.else, %if.then
  %4 = load i32, i32* %retval, align 4
  ret i32 %4
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @ketag_report(i64 %addr) #0 {
entry:
  %addr.addr = alloca i64, align 8
  store i64 %addr, i64* %addr.addr, align 8
  %0 = load i64, i64* %addr.addr, align 8
  %inc = add i64 %0, 1
  store i64 %inc, i64* %addr.addr, align 8
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @ketag_check(i64 %addr, i8 signext %extID) #0 {
entry:
  %addr.addr = alloca i64, align 8
  %extID.addr = alloca i8, align 1
  %tagaddr = alloca i64, align 8
  %val = alloca i8*, align 8
  store i64 %addr, i64* %addr.addr, align 8
  store i8 %extID, i8* %extID.addr, align 1
  %0 = load i64, i64* %addr.addr, align 8
  %cmp = icmp uge i64 %0, -60473139527680
  br i1 %cmp, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %entry
  %1 = load i64, i64* %addr.addr, align 8
  %cmp1 = icmp ule i64 %1, -23089744183297
  br i1 %cmp1, label %if.then, label %if.end

if.then:                                          ; preds = %land.lhs.true
  br label %if.end4

if.end:                                           ; preds = %land.lhs.true, %entry
  %2 = load i64, i64* %addr.addr, align 8
  %call = call i64 @ketag_addr_cal(i64 %2)
  store i64 %call, i64* %tagaddr, align 8
  %3 = load i64, i64* %tagaddr, align 8
  %4 = inttoptr i64 %3 to i8*
  store i8* %4, i8** %val, align 8
  %5 = load i8*, i8** %val, align 8
  %arrayidx = getelementptr inbounds i8, i8* %5, i64 0
  %6 = load i8, i8* %arrayidx, align 1
  %conv = sext i8 %6 to i32
  %7 = load i8, i8* %extID.addr, align 1
  %conv2 = sext i8 %7 to i32
  %and = and i32 %conv, %conv2
  %tobool = icmp ne i32 %and, 0
  br i1 %tobool, label %if.then3, label %if.end4

if.then3:                                         ; preds = %if.end
  %8 = load i64, i64* %addr.addr, align 8
  call void @ketag_report(i64 %8)
  br label %if.end4

if.end4:                                          ; preds = %if.then, %if.then3, %if.end
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define internal i64 @ketag_addr_cal(i64 %addr) #0 {
entry:
  %addr.addr = alloca i64, align 8
  store i64 %addr, i64* %addr.addr, align 8
  %0 = load i64, i64* %addr.addr, align 8
  %shr = lshr i64 %0, 3
  %add = add i64 %shr, -2305904032109035520
  ret i64 %add
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @ketag_print_func(i8* %name) #0 {
entry:
  %name.addr = alloca i8*, align 8
  store i8* %name, i8** %name.addr, align 8
  %0 = load i8*, i8** %name.addr, align 8
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.4, i64 0, i64 0), i8* %0)
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @testaddr(i32* %x) #0 {
entry:
  %x.addr = alloca i32*, align 8
  store i32* %x, i32** %x.addr, align 8
  %0 = load i32*, i32** %x.addr, align 8
  %1 = load i32*, i32** %x.addr, align 8
  %2 = load i32, i32* %1, align 4
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.5, i64 0, i64 0), i32* %0, i32 %2)
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 {
entry:
  %retval = alloca i32, align 4
  %x = alloca i32, align 4
  %y = alloca i32*, align 8
  store i32 0, i32* %retval, align 4
  store i32 10, i32* %x, align 4
  call void @testaddr(i32* %x)
  %0 = load i32*, i32** %y, align 8
  call void @testaddr(i32* %0)
  ret i32 0
}

attributes #0 = { noinline nounwind optnone uwtable "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{!"clang version 12.0.0"}
