; ModuleID = 'test/test.ll'
source_filename = "test.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [8 x i8] c"%016lx\0A\00", align 1
@.str.1 = private unnamed_addr constant [25 x i8] c"get c addr: %016lx - %d\0A\00", align 1
@.str.2 = private unnamed_addr constant [5 x i8] c"+%d\0A\00", align 1
@.str.3 = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1
@.str.4 = private unnamed_addr constant [12 x i8] c"ketag---%s\0A\00", align 1
@.str.5 = private unnamed_addr constant [25 x i8] c"get x addr: %016lx - %d\0A\00", align 1

; Function Attrs: noinline nounwind optnone sspstrong uwtable
define dso_local void @printx(i64 %0) #0 {
  %2 = call i64 asm "movq %rbp, $0", "=r"()
  %3 = alloca i64, align 8
  store i64 %0, i64* %3, align 8
  %4 = load i64, i64* %3, align 8
  %5 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str, i64 0, i64 0), i64 %4)
  ret void
}

declare i32 @printf(i8*, ...) #1

; Function Attrs: noinline nounwind optnone sspstrong uwtable
define dso_local i32 @a(i32 %0) #0 {
  %2 = call i64 asm "movq %rbp, $0", "=r"()
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  store i32 %0, i32* %4, align 4
  %5 = load i32, i32* %4, align 4
  %6 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([25 x i8], [25 x i8]* @.str.1, i64 0, i64 0), i32* %4, i32 %5)
  %7 = load i32, i32* %4, align 4
  %8 = icmp sgt i32 %7, 0
  br i1 %8, label %9, label %12

9:                                                ; preds = %1
  %10 = load i32, i32* %4, align 4
  %11 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.2, i64 0, i64 0), i32 %10)
  store i32 1, i32* %3, align 4
  br label %15

12:                                               ; preds = %1
  %13 = load i32, i32* %4, align 4
  %14 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.3, i64 0, i64 0), i32 %13)
  store i32 -1, i32* %3, align 4
  br label %15

15:                                               ; preds = %12, %9
  %16 = load i32, i32* %3, align 4
  ret i32 %16
}

; Function Attrs: noinline nounwind optnone sspstrong uwtable
define dso_local void @ketag_report(i64 %0) #0 {
  %2 = call i64 asm "movq %rbp, $0", "=r"()
  %3 = alloca i64, align 8
  store i64 %0, i64* %3, align 8
  %4 = load i64, i64* %3, align 8
  %5 = add i64 %4, 1
  store i64 %5, i64* %3, align 8
  ret void
}

; Function Attrs: noinline nounwind optnone sspstrong uwtable
define dso_local void @ketag_check(i64 %0, i8 signext %1) #0 {
  %3 = call i64 asm "movq %rbp, $0", "=r"()
  %4 = alloca i64, align 8
  %5 = alloca i8, align 1
  %6 = alloca i64, align 8
  %7 = alloca i8*, align 8
  store i64 %0, i64* %4, align 8
  store i8 %1, i8* %5, align 1
  %8 = load i64, i64* %4, align 8
  %9 = icmp uge i64 %8, -60473139527680
  br i1 %9, label %10, label %14

10:                                               ; preds = %2
  %11 = load i64, i64* %4, align 8
  %12 = icmp ule i64 %11, -23089744183297
  br i1 %12, label %13, label %14

13:                                               ; preds = %10
  br label %29

14:                                               ; preds = %10, %2
  %15 = load i64, i64* %4, align 8
  %16 = call i64 @ketag_addr_cal(i64 %15)
  store i64 %16, i64* %6, align 8
  %17 = load i64, i64* %6, align 8
  %18 = inttoptr i64 %17 to i8*
  store i8* %18, i8** %7, align 8
  %19 = load i8*, i8** %7, align 8
  %20 = getelementptr inbounds i8, i8* %19, i64 0
  %21 = load i8, i8* %20, align 1
  %22 = sext i8 %21 to i32
  %23 = load i8, i8* %5, align 1
  %24 = sext i8 %23 to i32
  %25 = and i32 %22, %24
  %26 = icmp ne i32 %25, 0
  br i1 %26, label %27, label %29

27:                                               ; preds = %14
  %28 = load i64, i64* %4, align 8
  call void @ketag_report(i64 %28)
  br label %29

29:                                               ; preds = %27, %14, %13
  ret void
}

; Function Attrs: noinline nounwind optnone sspstrong uwtable
define internal i64 @ketag_addr_cal(i64 %0) #0 {
  %2 = call i64 asm "movq %rbp, $0", "=r"()
  %3 = alloca i64, align 8
  store i64 %0, i64* %3, align 8
  %4 = load i64, i64* %3, align 8
  %5 = lshr i64 %4, 3
  %6 = add i64 %5, -2305904032109035520
  ret i64 %6
}

; Function Attrs: noinline nounwind optnone sspstrong uwtable
define dso_local void @ketag_print_func(i8* %0) #0 {
  %2 = call i64 asm "movq %rbp, $0", "=r"()
  %3 = alloca i8*, align 8
  store i8* %0, i8** %3, align 8
  %4 = load i8*, i8** %3, align 8
  %5 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.4, i64 0, i64 0), i8* %4)
  ret void
}

; Function Attrs: noinline nounwind optnone sspstrong uwtable
define dso_local i32 @main() #0 {
  %1 = call i64 asm "movq %rbp, $0", "=r"()
  call void @printx(i64 %1)
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  store i32 0, i32* %2, align 4
  store i32 10, i32* %3, align 4
  store i32 -12, i32* %4, align 4
  %5 = load i32, i32* %3, align 4
  %6 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([25 x i8], [25 x i8]* @.str.5, i64 0, i64 0), i32* %3, i32 %5)
  %7 = load i32, i32* %3, align 4
  %8 = call i32 @a(i32 %7)
  %9 = load i32, i32* %4, align 4
  %10 = call i32 @a(i32 %9)
  ret i32 0
}

declare void @ketag_set_tag(i64, i8)

attributes #0 = { noinline nounwind optnone sspstrong uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.module.flags = !{!0, !1, !2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{i32 7, !"PIE Level", i32 2}
!3 = !{!"clang version 11.1.0"}
