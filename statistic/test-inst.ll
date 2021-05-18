; ModuleID = 'test.ll'
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
  %0 = ptrtoint i32* %c.addr to i64
  %1 = call i8 @storeaddr(i64 %0)
  store i32 %c, i32* %c.addr, align 4
  %2 = ptrtoint i32* %c.addr to i64
  %3 = call i8 @loadaddr(i64 %2)
  %4 = load i32, i32* %c.addr, align 4
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([25 x i8], [25 x i8]* @.str.1, i64 0, i64 0), i32* %c.addr, i32 %4)
  %5 = ptrtoint i32* %c.addr to i64
  %6 = call i8 @loadaddr(i64 %5)
  %7 = load i32, i32* %c.addr, align 4
  %cmp = icmp sgt i32 %7, 0
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  %8 = ptrtoint i32* %c.addr to i64
  %9 = call i8 @loadaddr(i64 %8)
  %10 = load i32, i32* %c.addr, align 4
  %call1 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.2, i64 0, i64 0), i32 %10)
  %11 = ptrtoint i32* %retval to i64
  %12 = call i8 @storeaddr(i64 %11)
  store i32 1, i32* %retval, align 4
  br label %return

if.else:                                          ; preds = %entry
  %13 = ptrtoint i32* %c.addr to i64
  %14 = call i8 @loadaddr(i64 %13)
  %15 = load i32, i32* %c.addr, align 4
  %call2 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.3, i64 0, i64 0), i32 %15)
  %16 = ptrtoint i32* %retval to i64
  %17 = call i8 @storeaddr(i64 %16)
  store i32 -1, i32* %retval, align 4
  br label %return

return:                                           ; preds = %if.else, %if.then
  %18 = ptrtoint i32* %retval to i64
  %19 = call i8 @loadaddr(i64 %18)
  %20 = load i32, i32* %retval, align 4
  ret i32 %20
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @ketag_report(i64 %addr) #0 {
entry:
  %addr.addr = alloca i64, align 8
  %0 = ptrtoint i64* %addr.addr to i64
  %1 = call i8 @storeaddr(i64 %0)
  store i64 %addr, i64* %addr.addr, align 8
  %2 = ptrtoint i64* %addr.addr to i64
  %3 = call i8 @loadaddr(i64 %2)
  %4 = load i64, i64* %addr.addr, align 8
  %inc = add i64 %4, 1
  %5 = ptrtoint i64* %addr.addr to i64
  %6 = call i8 @storeaddr(i64 %5)
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
  %0 = ptrtoint i64* %addr.addr to i64
  %1 = call i8 @storeaddr(i64 %0)
  store i64 %addr, i64* %addr.addr, align 8
  %2 = ptrtoint i8* %extID.addr to i64
  %3 = call i8 @storeaddr(i64 %2)
  store i8 %extID, i8* %extID.addr, align 1
  %4 = ptrtoint i64* %addr.addr to i64
  %5 = call i8 @loadaddr(i64 %4)
  %6 = load i64, i64* %addr.addr, align 8
  %cmp = icmp uge i64 %6, -60473139527680
  br i1 %cmp, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %entry
  %7 = ptrtoint i64* %addr.addr to i64
  %8 = call i8 @loadaddr(i64 %7)
  %9 = load i64, i64* %addr.addr, align 8
  %cmp1 = icmp ule i64 %9, -23089744183297
  br i1 %cmp1, label %if.then, label %if.end

if.then:                                          ; preds = %land.lhs.true
  br label %if.end4

if.end:                                           ; preds = %land.lhs.true, %entry
  %10 = ptrtoint i64* %addr.addr to i64
  %11 = call i8 @loadaddr(i64 %10)
  %12 = load i64, i64* %addr.addr, align 8
  %call = call i64 @ketag_addr_cal(i64 %12)
  %13 = ptrtoint i64* %tagaddr to i64
  %14 = call i8 @storeaddr(i64 %13)
  store i64 %call, i64* %tagaddr, align 8
  %15 = ptrtoint i64* %tagaddr to i64
  %16 = call i8 @loadaddr(i64 %15)
  %17 = load i64, i64* %tagaddr, align 8
  %18 = inttoptr i64 %17 to i8*
  %19 = ptrtoint i8** %val to i64
  %20 = call i8 @storeaddr(i64 %19)
  store i8* %18, i8** %val, align 8
  %21 = ptrtoint i8** %val to i64
  %22 = call i8 @loadaddr(i64 %21)
  %23 = load i8*, i8** %val, align 8
  %arrayidx = getelementptr inbounds i8, i8* %23, i64 0
  %24 = ptrtoint i8* %arrayidx to i64
  %25 = call i8 @loadaddr(i64 %24)
  %26 = load i8, i8* %arrayidx, align 1
  %conv = sext i8 %26 to i32
  %27 = ptrtoint i8* %extID.addr to i64
  %28 = call i8 @loadaddr(i64 %27)
  %29 = load i8, i8* %extID.addr, align 1
  %conv2 = sext i8 %29 to i32
  %and = and i32 %conv, %conv2
  %tobool = icmp ne i32 %and, 0
  br i1 %tobool, label %if.then3, label %if.end4

if.then3:                                         ; preds = %if.end
  %30 = ptrtoint i64* %addr.addr to i64
  %31 = call i8 @loadaddr(i64 %30)
  %32 = load i64, i64* %addr.addr, align 8
  call void @ketag_report(i64 %32)
  br label %if.end4

if.end4:                                          ; preds = %if.then3, %if.end, %if.then
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define internal i64 @ketag_addr_cal(i64 %addr) #0 {
entry:
  %addr.addr = alloca i64, align 8
  %0 = ptrtoint i64* %addr.addr to i64
  %1 = call i8 @storeaddr(i64 %0)
  store i64 %addr, i64* %addr.addr, align 8
  %2 = ptrtoint i64* %addr.addr to i64
  %3 = call i8 @loadaddr(i64 %2)
  %4 = load i64, i64* %addr.addr, align 8
  %shr = lshr i64 %4, 3
  %add = add i64 %shr, -2305904032109035520
  ret i64 %add
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @ketag_print_func(i8* %name) #0 {
entry:
  %name.addr = alloca i8*, align 8
  %0 = ptrtoint i8** %name.addr to i64
  %1 = call i8 @storeaddr(i64 %0)
  store i8* %name, i8** %name.addr, align 8
  %2 = ptrtoint i8** %name.addr to i64
  %3 = call i8 @loadaddr(i64 %2)
  %4 = load i8*, i8** %name.addr, align 8
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.4, i64 0, i64 0), i8* %4)
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @testaddr(i32* %x) #0 {
entry:
  %x.addr = alloca i32*, align 8
  %0 = ptrtoint i32** %x.addr to i64
  %1 = call i8 @storeaddr(i64 %0)
  store i32* %x, i32** %x.addr, align 8
  %2 = ptrtoint i32** %x.addr to i64
  %3 = call i8 @loadaddr(i64 %2)
  %4 = load i32*, i32** %x.addr, align 8
  %5 = ptrtoint i32** %x.addr to i64
  %6 = call i8 @loadaddr(i64 %5)
  %7 = load i32*, i32** %x.addr, align 8
  %8 = ptrtoint i32* %7 to i64
  %9 = call i8 @loadaddr(i64 %8)
  %10 = load i32, i32* %7, align 4
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.5, i64 0, i64 0), i32* %4, i32 %10)
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 {
entry:
  %retval = alloca i32, align 4
  %x = alloca i32, align 4
  %y = alloca i32*, align 8
  %0 = ptrtoint i32* %retval to i64
  %1 = call i8 @storeaddr(i64 %0)
  store i32 0, i32* %retval, align 4
  %2 = ptrtoint i32* %x to i64
  %3 = call i8 @storeaddr(i64 %2)
  store i32 10, i32* %x, align 4
  call void @testaddr(i32* %x)
  %4 = ptrtoint i32** %y to i64
  %5 = call i8 @loadaddr(i64 %4)
  %6 = load i32*, i32** %y, align 8
  call void @testaddr(i32* %6)
  ret i32 0
}

declare void @ketag_set_tag(i64, i8)

declare i8 @storeaddr(i64)

declare i8 @loadaddr(i64)

attributes #0 = { noinline nounwind optnone uwtable "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{!"clang version 12.0.0"}
