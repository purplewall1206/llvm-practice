; ModuleID = 'targetaddr.cpp'
source_filename = "targetaddr.cpp"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@count = dso_local global i32 0, align 4
@user_end = dso_local global i64 140737488355327, align 8
@hugegap = dso_local global i64 -140737488355329, align 8
@hypervisor_begin = dso_local global i64 -140737488355328, align 8
@hypervisor_end = dso_local global i64 -131391639519233, align 8
@phymaps_begin = dso_local global i64 -131391639519232, align 8
@phymaps_end = dso_local global i64 -61022895341569, align 8
@vmalloc_begin = dso_local global i64 -60473139527680, align 8
@vmalloc_end = dso_local global i64 -25288767438849, align 8
@vmemmap_begin = dso_local global i64 -24189255811072, align 8
@vmemmap_end = dso_local global i64 -23089744183297, align 8
@kernel_begin = dso_local global i64 -2147483648, align 8
@kernel_end = dso_local global i64 -1610612737, align 8
@module_start = dso_local global i64 -1610612736, align 8
@module_end = dso_local global i64 -16777217, align 8
@upper_begin = dso_local global i64 -16777216, align 8
@c_user = dso_local global i32 0, align 4
@c_hypervisor = dso_local global i32 0, align 4
@c_phymaps = dso_local global i32 0, align 4
@c_vmalloc = dso_local global i32 0, align 4
@c_vmemmap = dso_local global i32 0, align 4
@c_kernel = dso_local global i32 0, align 4
@c_module = dso_local global i32 0, align 4
@upper = dso_local global i32 0, align 4
@.str = private unnamed_addr constant [29 x i8] c"==================\0Acount:%u\0A\00", align 1
@.str.1 = private unnamed_addr constant [11 x i8] c"c_user:%u\0A\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"c_hypervisor:%u\0A\00", align 1
@.str.3 = private unnamed_addr constant [14 x i8] c"c_phymaps:%u\0A\00", align 1
@.str.4 = private unnamed_addr constant [14 x i8] c"c_vmalloc:%u\0A\00", align 1
@.str.5 = private unnamed_addr constant [14 x i8] c"c_vmemmap:%u\0A\00", align 1
@.str.6 = private unnamed_addr constant [13 x i8] c"c_kernel:%u\0A\00", align 1
@.str.7 = private unnamed_addr constant [12 x i8] c"c_module:u\0A\00", align 1
@.str.8 = private unnamed_addr constant [35 x i8] c"upper:%u\0A=======================\0A\0A\00", align 1

; Function Attrs: noinline optnone sspstrong uwtable
define dso_local void @_Z7c_printv() #0 {
  %1 = load i32, i32* @count, align 4
  %2 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([29 x i8], [29 x i8]* @.str, i64 0, i64 0), i32 %1)
  %3 = load i32, i32* @c_user, align 4
  %4 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.1, i64 0, i64 0), i32 %3)
  %5 = load i32, i32* @c_hypervisor, align 4
  %6 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0), i32 %5)
  %7 = load i32, i32* @c_phymaps, align 4
  %8 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.3, i64 0, i64 0), i32 %7)
  %9 = load i32, i32* @c_vmalloc, align 4
  %10 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.4, i64 0, i64 0), i32 %9)
  %11 = load i32, i32* @c_vmemmap, align 4
  %12 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.5, i64 0, i64 0), i32 %11)
  %13 = load i32, i32* @c_kernel, align 4
  %14 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.6, i64 0, i64 0), i32 %13)
  %15 = load i32, i32* @c_module, align 4
  %16 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.7, i64 0, i64 0), i32 %15)
  %17 = load i32, i32* @upper, align 4
  %18 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.8, i64 0, i64 0), i32 %17)
  ret void
}

declare i32 @printf(i8*, ...) #1

; Function Attrs: noinline optnone sspstrong uwtable
define dso_local zeroext i1 @_Z9storeaddrm(i64 %0) #0 {
  %2 = alloca i64, align 8
  store i64 %0, i64* %2, align 8
  %3 = load i64, i64* %2, align 8
  %4 = load i64, i64* @user_end, align 8
  %5 = icmp ule i64 %3, %4
  br i1 %5, label %6, label %9

6:                                                ; preds = %1
  %7 = load i32, i32* @c_user, align 4
  %8 = add i32 %7, 1
  store i32 %8, i32* @c_user, align 4
  br label %89

9:                                                ; preds = %1
  %10 = load i64, i64* %2, align 8
  %11 = load i64, i64* @hypervisor_begin, align 8
  %12 = icmp uge i64 %10, %11
  br i1 %12, label %13, label %20

13:                                               ; preds = %9
  %14 = load i64, i64* %2, align 8
  %15 = load i64, i64* @hypervisor_end, align 8
  %16 = icmp ule i64 %14, %15
  br i1 %16, label %17, label %20

17:                                               ; preds = %13
  %18 = load i32, i32* @c_hypervisor, align 4
  %19 = add i32 %18, 1
  store i32 %19, i32* @c_hypervisor, align 4
  br label %88

20:                                               ; preds = %13, %9
  %21 = load i64, i64* %2, align 8
  %22 = load i64, i64* @phymaps_begin, align 8
  %23 = icmp uge i64 %21, %22
  br i1 %23, label %24, label %31

24:                                               ; preds = %20
  %25 = load i64, i64* %2, align 8
  %26 = load i64, i64* @phymaps_end, align 8
  %27 = icmp ule i64 %25, %26
  br i1 %27, label %28, label %31

28:                                               ; preds = %24
  %29 = load i32, i32* @c_phymaps, align 4
  %30 = add i32 %29, 1
  store i32 %30, i32* @c_phymaps, align 4
  br label %87

31:                                               ; preds = %24, %20
  %32 = load i64, i64* %2, align 8
  %33 = load i64, i64* @vmalloc_begin, align 8
  %34 = icmp uge i64 %32, %33
  br i1 %34, label %35, label %42

35:                                               ; preds = %31
  %36 = load i64, i64* %2, align 8
  %37 = load i64, i64* @vmalloc_end, align 8
  %38 = icmp ule i64 %36, %37
  br i1 %38, label %39, label %42

39:                                               ; preds = %35
  %40 = load i32, i32* @c_vmalloc, align 4
  %41 = add i32 %40, 1
  store i32 %41, i32* @c_vmalloc, align 4
  br label %86

42:                                               ; preds = %35, %31
  %43 = load i64, i64* %2, align 8
  %44 = load i64, i64* @vmemmap_begin, align 8
  %45 = icmp uge i64 %43, %44
  br i1 %45, label %46, label %53

46:                                               ; preds = %42
  %47 = load i64, i64* %2, align 8
  %48 = load i64, i64* @vmemmap_end, align 8
  %49 = icmp ule i64 %47, %48
  br i1 %49, label %50, label %53

50:                                               ; preds = %46
  %51 = load i32, i32* @c_vmemmap, align 4
  %52 = add i32 %51, 1
  store i32 %52, i32* @c_vmemmap, align 4
  br label %85

53:                                               ; preds = %46, %42
  %54 = load i64, i64* %2, align 8
  %55 = load i64, i64* @kernel_begin, align 8
  %56 = icmp uge i64 %54, %55
  br i1 %56, label %57, label %64

57:                                               ; preds = %53
  %58 = load i64, i64* %2, align 8
  %59 = load i64, i64* @kernel_end, align 8
  %60 = icmp ule i64 %58, %59
  br i1 %60, label %61, label %64

61:                                               ; preds = %57
  %62 = load i32, i32* @c_kernel, align 4
  %63 = add i32 %62, 1
  store i32 %63, i32* @c_kernel, align 4
  br label %84

64:                                               ; preds = %57, %53
  %65 = load i64, i64* %2, align 8
  %66 = load i64, i64* @module_start, align 8
  %67 = icmp uge i64 %65, %66
  br i1 %67, label %68, label %75

68:                                               ; preds = %64
  %69 = load i64, i64* %2, align 8
  %70 = load i64, i64* @module_end, align 8
  %71 = icmp ule i64 %69, %70
  br i1 %71, label %72, label %75

72:                                               ; preds = %68
  %73 = load i32, i32* @c_module, align 4
  %74 = add i32 %73, 1
  store i32 %74, i32* @c_module, align 4
  br label %83

75:                                               ; preds = %68, %64
  %76 = load i64, i64* %2, align 8
  %77 = load i64, i64* @upper_begin, align 8
  %78 = icmp uge i64 %76, %77
  br i1 %78, label %79, label %82

79:                                               ; preds = %75
  %80 = load i32, i32* @upper, align 4
  %81 = add i32 %80, 1
  store i32 %81, i32* @upper, align 4
  br label %82

82:                                               ; preds = %79, %75
  br label %83

83:                                               ; preds = %82, %72
  br label %84

84:                                               ; preds = %83, %61
  br label %85

85:                                               ; preds = %84, %50
  br label %86

86:                                               ; preds = %85, %39
  br label %87

87:                                               ; preds = %86, %28
  br label %88

88:                                               ; preds = %87, %17
  br label %89

89:                                               ; preds = %88, %6
  %90 = load i32, i32* @count, align 4
  %91 = add i32 %90, 1
  store i32 %91, i32* @count, align 4
  %92 = urem i32 %91, 100
  %93 = icmp eq i32 %92, 0
  br i1 %93, label %94, label %95

94:                                               ; preds = %89
  call void @_Z7c_printv()
  br label %95

95:                                               ; preds = %94, %89
  ret i1 true
}

attributes #0 = { noinline optnone sspstrong uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.module.flags = !{!0, !1, !2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{i32 7, !"PIE Level", i32 2}
!3 = !{!"clang version 11.1.0"}
