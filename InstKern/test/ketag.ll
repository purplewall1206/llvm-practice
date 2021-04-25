; ModuleID = 'ketag.c'
source_filename = "ketag.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: noinline nounwind optnone sspstrong uwtable
define dso_local i64 @cal_tag(i64 %0) #0 {
  %2 = alloca i64, align 8
  store i64 %0, i64* %2, align 8
  %3 = load i64, i64* %2, align 8
  %4 = lshr i64 %3, 3
  %5 = add i64 %4, -2305904032109035520
  ret i64 %5
}

; Function Attrs: noinline nounwind optnone sspstrong uwtable
define dso_local void @set_tag(i64 %0, i8 signext %1) #0 {
  %3 = alloca i64, align 8
  %4 = alloca i8, align 1
  %5 = alloca i8*, align 8
  store i64 %0, i64* %3, align 8
  store i8 %1, i8* %4, align 1
  %6 = load i64, i64* %3, align 8
  %7 = lshr i64 %6, 3
  %8 = add i64 %7, -2305904032109035520
  store i64 %8, i64* %3, align 8
  %9 = load i64, i64* %3, align 8
  %10 = inttoptr i64 %9 to i8*
  store i8* %10, i8** %5, align 8
  %11 = load i8, i8* %4, align 1
  %12 = load i8*, i8** %5, align 8
  %13 = getelementptr inbounds i8, i8* %12, i64 0
  store i8 %11, i8* %13, align 1
  ret void
}

; Function Attrs: noinline nounwind optnone sspstrong uwtable
define dso_local void @report_bug(i64 %0) #0 {
  %2 = alloca i64, align 8
  store i64 %0, i64* %2, align 8
  ret void
}

; Function Attrs: noinline nounwind optnone sspstrong uwtable
define dso_local void @check_tag(i64 %0, i8 signext %1) #0 {
  %3 = alloca i64, align 8
  %4 = alloca i8, align 1
  %5 = alloca i64, align 8
  %6 = alloca i8*, align 8
  store i64 %0, i64* %3, align 8
  store i8 %1, i8* %4, align 1
  %7 = load i64, i64* %3, align 8
  %8 = lshr i64 %7, 3
  %9 = add i64 %8, -2305904032109035520
  store i64 %9, i64* %5, align 8
  %10 = load i64, i64* %5, align 8
  %11 = inttoptr i64 %10 to i8*
  store i8* %11, i8** %6, align 8
  %12 = load i8*, i8** %6, align 8
  %13 = getelementptr inbounds i8, i8* %12, i64 0
  %14 = load i8, i8* %13, align 1
  %15 = sext i8 %14 to i32
  %16 = load i8, i8* %4, align 1
  %17 = sext i8 %16 to i32
  %18 = and i32 %15, %17
  %19 = icmp ne i32 %18, 0
  br i1 %19, label %20, label %22

20:                                               ; preds = %2
  %21 = load i64, i64* %3, align 8
  call void @report_bug(i64 %21)
  br label %22

22:                                               ; preds = %20, %2
  ret void
}

attributes #0 = { noinline nounwind optnone sspstrong uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.module.flags = !{!0, !1, !2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{i32 7, !"PIE Level", i32 2}
!3 = !{!"clang version 11.1.0"}
