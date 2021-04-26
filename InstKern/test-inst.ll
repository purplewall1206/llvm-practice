; ModuleID = 'test/test.ll'
source_filename = "test.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [8 x i8] c"%016lx\0A\00", align 1
@.str.1 = private unnamed_addr constant [25 x i8] c"get c addr: %016lx - %d\0A\00", align 1
@.str.2 = private unnamed_addr constant [5 x i8] c"+%d\0A\00", align 1
@.str.3 = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1

; Function Attrs: noinline nounwind optnone sspstrong uwtable
define dso_local void @printx(i64 %0) #0 {
  %2 = alloca i64, align 8
  store i64 %0, i64* %2, align 8
  %3 = load i64, i64* %2, align 8
  %4 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str, i64 0, i64 0), i64 %3)
  ret void
}

declare i32 @printf(i8*, ...) #1

; Function Attrs: noinline nounwind optnone sspstrong uwtable
define dso_local i32 @a(i32 %0) #0 {
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %alloca2 = alloca i64, align 8
  %vaddrtoi64 = ptrtoint i32* %3 to i64
  store i64 %vaddrtoi64, i64* %alloca2, align 8
  %load3 = load i64, i64* %alloca2, align 8
  %lshr4 = lshr i64 %load3, 3
  %add5 = add i64 %lshr4, 0
  %4 = call i64 asm "movq %rbp, $0", "=r"()
  call void @printx(i64 %add5)
  call void @printx(i64 %4)
  %alloca3 = alloca i64, align 8
  %alloca4 = alloca i8, align 1
  %alloca5 = alloca i8*, align 8
  store i64 %add5, i64* %alloca3, align 8
  store i8 2, i8* %alloca4, align 1
  %load6 = load i64, i64* %alloca3, align 8
  %inttoptr7 = inttoptr i64 %load6 to i8*
  call void @printx(i64 %load6)
  store i8* %inttoptr7, i8** %alloca5, align 8
  %load8 = load i8, i8* %alloca4, align 1
  ; %load9 = load i8*, i8** %alloca5, align 8
  ; store i8 %load8, i8* %load9, align 1
  store i32 %0, i32* %3, align 4
  %5 = load i32, i32* %3, align 4
  %6 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([25 x i8], [25 x i8]* @.str.1, i64 0, i64 0), i32* %3, i32 %5)
  %7 = load i32, i32* %3, align 4
  %8 = icmp sgt i32 %7, 0
  br i1 %8, label %9, label %12

9:                                                ; preds = %1
  %10 = load i32, i32* %3, align 4
  %11 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.2, i64 0, i64 0), i32 %10)
  store i32 1, i32* %2, align 4
  br label %15

12:                                               ; preds = %1
  %13 = load i32, i32* %3, align 4
  %14 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.3, i64 0, i64 0), i32 %13)
  store i32 -1, i32* %2, align 4
  br label %15

15:                                               ; preds = %12, %9
  %16 = load i32, i32* %2, align 4
  ret i32 %16
}

; Function Attrs: noinline nounwind optnone sspstrong uwtable
define dso_local i32 @main() #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  store i32 0, i32* %1, align 4
  store i32 10, i32* %2, align 4
  store i32 -12, i32* %3, align 4
  %4 = load i32, i32* %2, align 4
  %5 = call i32 @a(i32 %4)
  %6 = load i32, i32* %3, align 4
  %7 = call i32 @a(i32 %6)
  ret i32 0
}

attributes #0 = { noinline nounwind optnone sspstrong uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.module.flags = !{!0, !1, !2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{i32 7, !"PIE Level", i32 2}
!3 = !{!"clang version 11.1.0"}
