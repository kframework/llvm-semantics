; ModuleID = './skipList.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.sn = type { i32, %struct.sn** }
%struct.SkipSet = type { %struct.sn*, i32 }

@random_level.first = internal global i32 1, align 4
@.str = private unnamed_addr constant [2 x i8] c"{\00", align 1
@.str.1 = private unnamed_addr constant [3 x i8] c"%d\00", align 1
@.str.2 = private unnamed_addr constant [2 x i8] c",\00", align 1
@.str.3 = private unnamed_addr constant [3 x i8] c"}\0A\00", align 1
@.str.4 = private unnamed_addr constant [18 x i8] c"7 is in the list\0A\00", align 1
@.str.5 = private unnamed_addr constant [20 x i8] c"7 has been deleted\0A\00", align 1

; Function Attrs: nounwind uwtable
define float @frand() #0 {
  %1 = call i32 @rand() #3
  %2 = sitofp i32 %1 to float
  %3 = fdiv float %2, 0x41E0000000000000
  ret float %3
}

; Function Attrs: nounwind
declare i32 @rand() #1

; Function Attrs: nounwind uwtable
define i32 @random_level() #0 {
  %lvl = alloca i32, align 4
  store i32 0, i32* %lvl, align 4
  %1 = load i32, i32* @random_level.first, align 4
  %2 = icmp ne i32 %1, 0
  br i1 %2, label %3, label %4

; <label>:3                                       ; preds = %0
  store i32 0, i32* @random_level.first, align 4
  br label %4

; <label>:4                                       ; preds = %3, %0
  br label %5

; <label>:5                                       ; preds = %14, %4
  %6 = call float @frand()
  %7 = fpext float %6 to double
  %8 = fcmp olt double %7, 5.000000e-01
  br i1 %8, label %9, label %12

; <label>:9                                       ; preds = %5
  %10 = load i32, i32* %lvl, align 4
  %11 = icmp slt i32 %10, 6
  br label %12

; <label>:12                                      ; preds = %9, %5
  %13 = phi i1 [ false, %5 ], [ %11, %9 ]
  br i1 %13, label %14, label %17

; <label>:14                                      ; preds = %12
  %15 = load i32, i32* %lvl, align 4
  %16 = add nsw i32 %15, 1
  store i32 %16, i32* %lvl, align 4
  br label %5

; <label>:17                                      ; preds = %12
  %18 = load i32, i32* %lvl, align 4
  ret i32 %18
}

; Function Attrs: nounwind uwtable
define %struct.sn* @make_node(i32 %level, i32 %value) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %sn = alloca %struct.sn*, align 8
  %i = alloca i32, align 4
  store i32 %level, i32* %1, align 4
  store i32 %value, i32* %2, align 4
  %3 = call noalias i8* @malloc(i64 16) #3
  %4 = bitcast i8* %3 to %struct.sn*
  store %struct.sn* %4, %struct.sn** %sn, align 8
  %5 = load i32, i32* %1, align 4
  %6 = add nsw i32 %5, 1
  %7 = sext i32 %6 to i64
  %8 = mul i64 %7, 8
  %9 = call noalias i8* @malloc(i64 %8) #3
  %10 = bitcast i8* %9 to %struct.sn**
  %11 = load %struct.sn*, %struct.sn** %sn, align 8
  %12 = getelementptr inbounds %struct.sn, %struct.sn* %11, i32 0, i32 1
  store %struct.sn** %10, %struct.sn*** %12, align 8
  store i32 0, i32* %i, align 4
  br label %13

; <label>:13                                      ; preds = %25, %0
  %14 = load i32, i32* %i, align 4
  %15 = load i32, i32* %1, align 4
  %16 = add nsw i32 %15, 1
  %17 = icmp slt i32 %14, %16
  br i1 %17, label %18, label %28

; <label>:18                                      ; preds = %13
  %19 = load i32, i32* %i, align 4
  %20 = sext i32 %19 to i64
  %21 = load %struct.sn*, %struct.sn** %sn, align 8
  %22 = getelementptr inbounds %struct.sn, %struct.sn* %21, i32 0, i32 1
  %23 = load %struct.sn**, %struct.sn*** %22, align 8
  %24 = getelementptr inbounds %struct.sn*, %struct.sn** %23, i64 %20
  store %struct.sn* null, %struct.sn** %24, align 8
  br label %25

; <label>:25                                      ; preds = %18
  %26 = load i32, i32* %i, align 4
  %27 = add nsw i32 %26, 1
  store i32 %27, i32* %i, align 4
  br label %13

; <label>:28                                      ; preds = %13
  %29 = load i32, i32* %2, align 4
  %30 = load %struct.sn*, %struct.sn** %sn, align 8
  %31 = getelementptr inbounds %struct.sn, %struct.sn* %30, i32 0, i32 0
  store i32 %29, i32* %31, align 4
  %32 = load %struct.sn*, %struct.sn** %sn, align 8
  ret %struct.sn* %32
}

; Function Attrs: nounwind
declare noalias i8* @malloc(i64) #1

; Function Attrs: nounwind uwtable
define %struct.SkipSet* @make_skipset() #0 {
  %ss = alloca %struct.SkipSet*, align 8
  %1 = call noalias i8* @malloc(i64 16) #3
  %2 = bitcast i8* %1 to %struct.SkipSet*
  store %struct.SkipSet* %2, %struct.SkipSet** %ss, align 8
  %3 = call %struct.sn* @make_node(i32 6, i32 0)
  %4 = load %struct.SkipSet*, %struct.SkipSet** %ss, align 8
  %5 = getelementptr inbounds %struct.SkipSet, %struct.SkipSet* %4, i32 0, i32 0
  store %struct.sn* %3, %struct.sn** %5, align 8
  %6 = load %struct.SkipSet*, %struct.SkipSet** %ss, align 8
  %7 = getelementptr inbounds %struct.SkipSet, %struct.SkipSet* %6, i32 0, i32 1
  store i32 0, i32* %7, align 4
  %8 = load %struct.SkipSet*, %struct.SkipSet** %ss, align 8
  ret %struct.SkipSet* %8
}

; Function Attrs: nounwind uwtable
define void @print_skipset(%struct.SkipSet* %ss) #0 {
  %1 = alloca %struct.SkipSet*, align 8
  %x = alloca %struct.sn*, align 8
  store %struct.SkipSet* %ss, %struct.SkipSet** %1, align 8
  %2 = load %struct.SkipSet*, %struct.SkipSet** %1, align 8
  %3 = getelementptr inbounds %struct.SkipSet, %struct.SkipSet* %2, i32 0, i32 0
  %4 = load %struct.sn*, %struct.sn** %3, align 8
  %5 = getelementptr inbounds %struct.sn, %struct.sn* %4, i32 0, i32 1
  %6 = load %struct.sn**, %struct.sn*** %5, align 8
  %7 = getelementptr inbounds %struct.sn*, %struct.sn** %6, i64 0
  %8 = load %struct.sn*, %struct.sn** %7, align 8
  store %struct.sn* %8, %struct.sn** %x, align 8
  %9 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str, i32 0, i32 0))
  br label %10

; <label>:10                                      ; preds = %27, %0
  %11 = load %struct.sn*, %struct.sn** %x, align 8
  %12 = icmp ne %struct.sn* %11, null
  br i1 %12, label %13, label %28

; <label>:13                                      ; preds = %10
  %14 = load %struct.sn*, %struct.sn** %x, align 8
  %15 = getelementptr inbounds %struct.sn, %struct.sn* %14, i32 0, i32 0
  %16 = load i32, i32* %15, align 4
  %17 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.1, i32 0, i32 0), i32 %16)
  %18 = load %struct.sn*, %struct.sn** %x, align 8
  %19 = getelementptr inbounds %struct.sn, %struct.sn* %18, i32 0, i32 1
  %20 = load %struct.sn**, %struct.sn*** %19, align 8
  %21 = getelementptr inbounds %struct.sn*, %struct.sn** %20, i64 0
  %22 = load %struct.sn*, %struct.sn** %21, align 8
  store %struct.sn* %22, %struct.sn** %x, align 8
  %23 = load %struct.sn*, %struct.sn** %x, align 8
  %24 = icmp ne %struct.sn* %23, null
  br i1 %24, label %25, label %27

; <label>:25                                      ; preds = %13
  %26 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.2, i32 0, i32 0))
  br label %27

; <label>:27                                      ; preds = %25, %13
  br label %10

; <label>:28                                      ; preds = %10
  %29 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.3, i32 0, i32 0))
  ret void
}

declare i32 @printf(i8*, ...) #2

; Function Attrs: nounwind uwtable
define i32 @contains(%struct.SkipSet* %ss, i32 %search_value) #0 {
  %1 = alloca i32, align 4
  %2 = alloca %struct.SkipSet*, align 8
  %3 = alloca i32, align 4
  %i = alloca i32, align 4
  %x = alloca %struct.sn*, align 8
  store %struct.SkipSet* %ss, %struct.SkipSet** %2, align 8
  store i32 %search_value, i32* %3, align 4
  %4 = load %struct.SkipSet*, %struct.SkipSet** %2, align 8
  %5 = getelementptr inbounds %struct.SkipSet, %struct.SkipSet* %4, i32 0, i32 0
  %6 = load %struct.sn*, %struct.sn** %5, align 8
  store %struct.sn* %6, %struct.sn** %x, align 8
  %7 = load %struct.SkipSet*, %struct.SkipSet** %2, align 8
  %8 = getelementptr inbounds %struct.SkipSet, %struct.SkipSet* %7, i32 0, i32 1
  %9 = load i32, i32* %8, align 4
  store i32 %9, i32* %i, align 4
  br label %10

; <label>:10                                      ; preds = %46, %0
  %11 = load i32, i32* %i, align 4
  %12 = icmp sge i32 %11, 0
  br i1 %12, label %13, label %49

; <label>:13                                      ; preds = %10
  br label %14

; <label>:14                                      ; preds = %37, %13
  %15 = load i32, i32* %i, align 4
  %16 = sext i32 %15 to i64
  %17 = load %struct.sn*, %struct.sn** %x, align 8
  %18 = getelementptr inbounds %struct.sn, %struct.sn* %17, i32 0, i32 1
  %19 = load %struct.sn**, %struct.sn*** %18, align 8
  %20 = getelementptr inbounds %struct.sn*, %struct.sn** %19, i64 %16
  %21 = load %struct.sn*, %struct.sn** %20, align 8
  %22 = icmp ne %struct.sn* %21, null
  br i1 %22, label %23, label %35

; <label>:23                                      ; preds = %14
  %24 = load i32, i32* %i, align 4
  %25 = sext i32 %24 to i64
  %26 = load %struct.sn*, %struct.sn** %x, align 8
  %27 = getelementptr inbounds %struct.sn, %struct.sn* %26, i32 0, i32 1
  %28 = load %struct.sn**, %struct.sn*** %27, align 8
  %29 = getelementptr inbounds %struct.sn*, %struct.sn** %28, i64 %25
  %30 = load %struct.sn*, %struct.sn** %29, align 8
  %31 = getelementptr inbounds %struct.sn, %struct.sn* %30, i32 0, i32 0
  %32 = load i32, i32* %31, align 4
  %33 = load i32, i32* %3, align 4
  %34 = icmp slt i32 %32, %33
  br label %35

; <label>:35                                      ; preds = %23, %14
  %36 = phi i1 [ false, %14 ], [ %34, %23 ]
  br i1 %36, label %37, label %45

; <label>:37                                      ; preds = %35
  %38 = load i32, i32* %i, align 4
  %39 = sext i32 %38 to i64
  %40 = load %struct.sn*, %struct.sn** %x, align 8
  %41 = getelementptr inbounds %struct.sn, %struct.sn* %40, i32 0, i32 1
  %42 = load %struct.sn**, %struct.sn*** %41, align 8
  %43 = getelementptr inbounds %struct.sn*, %struct.sn** %42, i64 %39
  %44 = load %struct.sn*, %struct.sn** %43, align 8
  store %struct.sn* %44, %struct.sn** %x, align 8
  br label %14

; <label>:45                                      ; preds = %35
  br label %46

; <label>:46                                      ; preds = %45
  %47 = load i32, i32* %i, align 4
  %48 = add nsw i32 %47, -1
  store i32 %48, i32* %i, align 4
  br label %10

; <label>:49                                      ; preds = %10
  %50 = load %struct.sn*, %struct.sn** %x, align 8
  %51 = getelementptr inbounds %struct.sn, %struct.sn* %50, i32 0, i32 1
  %52 = load %struct.sn**, %struct.sn*** %51, align 8
  %53 = getelementptr inbounds %struct.sn*, %struct.sn** %52, i64 0
  %54 = load %struct.sn*, %struct.sn** %53, align 8
  store %struct.sn* %54, %struct.sn** %x, align 8
  %55 = load %struct.sn*, %struct.sn** %x, align 8
  %56 = icmp ne %struct.sn* %55, null
  br i1 %56, label %57, label %64

; <label>:57                                      ; preds = %49
  %58 = load %struct.sn*, %struct.sn** %x, align 8
  %59 = getelementptr inbounds %struct.sn, %struct.sn* %58, i32 0, i32 0
  %60 = load i32, i32* %59, align 4
  %61 = load i32, i32* %3, align 4
  %62 = icmp eq i32 %60, %61
  br i1 %62, label %63, label %64

; <label>:63                                      ; preds = %57
  store i32 1, i32* %1
  br label %65

; <label>:64                                      ; preds = %57, %49
  store i32 0, i32* %1
  br label %65

; <label>:65                                      ; preds = %64, %63
  %66 = load i32, i32* %1
  ret i32 %66
}

; Function Attrs: nounwind uwtable
define void @insert(%struct.SkipSet* %ss, i32 %value) #0 {
  %1 = alloca %struct.SkipSet*, align 8
  %2 = alloca i32, align 4
  %i = alloca i32, align 4
  %x = alloca %struct.sn*, align 8
  %update = alloca [7 x %struct.sn*], align 16
  %guard = alloca i32, align 4
  %lvl = alloca i32, align 4
  store %struct.SkipSet* %ss, %struct.SkipSet** %1, align 8
  store i32 %value, i32* %2, align 4
  %3 = load %struct.SkipSet*, %struct.SkipSet** %1, align 8
  %4 = getelementptr inbounds %struct.SkipSet, %struct.SkipSet* %3, i32 0, i32 0
  %5 = load %struct.sn*, %struct.sn** %4, align 8
  store %struct.sn* %5, %struct.sn** %x, align 8
  %6 = bitcast [7 x %struct.sn*]* %update to i8*
  call void @llvm.memset.p0i8.i64(i8* %6, i8 0, i64 7, i32 16, i1 false)
  %7 = load %struct.SkipSet*, %struct.SkipSet** %1, align 8
  %8 = getelementptr inbounds %struct.SkipSet, %struct.SkipSet* %7, i32 0, i32 1
  %9 = load i32, i32* %8, align 4
  store i32 %9, i32* %i, align 4
  br label %10

; <label>:10                                      ; preds = %50, %0
  %11 = load i32, i32* %i, align 4
  %12 = icmp sge i32 %11, 0
  br i1 %12, label %13, label %53

; <label>:13                                      ; preds = %10
  br label %14

; <label>:14                                      ; preds = %37, %13
  %15 = load i32, i32* %i, align 4
  %16 = sext i32 %15 to i64
  %17 = load %struct.sn*, %struct.sn** %x, align 8
  %18 = getelementptr inbounds %struct.sn, %struct.sn* %17, i32 0, i32 1
  %19 = load %struct.sn**, %struct.sn*** %18, align 8
  %20 = getelementptr inbounds %struct.sn*, %struct.sn** %19, i64 %16
  %21 = load %struct.sn*, %struct.sn** %20, align 8
  %22 = icmp ne %struct.sn* %21, null
  br i1 %22, label %23, label %35

; <label>:23                                      ; preds = %14
  %24 = load i32, i32* %i, align 4
  %25 = sext i32 %24 to i64
  %26 = load %struct.sn*, %struct.sn** %x, align 8
  %27 = getelementptr inbounds %struct.sn, %struct.sn* %26, i32 0, i32 1
  %28 = load %struct.sn**, %struct.sn*** %27, align 8
  %29 = getelementptr inbounds %struct.sn*, %struct.sn** %28, i64 %25
  %30 = load %struct.sn*, %struct.sn** %29, align 8
  %31 = getelementptr inbounds %struct.sn, %struct.sn* %30, i32 0, i32 0
  %32 = load i32, i32* %31, align 4
  %33 = load i32, i32* %2, align 4
  %34 = icmp slt i32 %32, %33
  br label %35

; <label>:35                                      ; preds = %23, %14
  %36 = phi i1 [ false, %14 ], [ %34, %23 ]
  br i1 %36, label %37, label %45

; <label>:37                                      ; preds = %35
  %38 = load i32, i32* %i, align 4
  %39 = sext i32 %38 to i64
  %40 = load %struct.sn*, %struct.sn** %x, align 8
  %41 = getelementptr inbounds %struct.sn, %struct.sn* %40, i32 0, i32 1
  %42 = load %struct.sn**, %struct.sn*** %41, align 8
  %43 = getelementptr inbounds %struct.sn*, %struct.sn** %42, i64 %39
  %44 = load %struct.sn*, %struct.sn** %43, align 8
  store %struct.sn* %44, %struct.sn** %x, align 8
  br label %14

; <label>:45                                      ; preds = %35
  %46 = load %struct.sn*, %struct.sn** %x, align 8
  %47 = load i32, i32* %i, align 4
  %48 = sext i32 %47 to i64
  %49 = getelementptr inbounds [7 x %struct.sn*], [7 x %struct.sn*]* %update, i32 0, i64 %48
  store %struct.sn* %46, %struct.sn** %49, align 8
  br label %50

; <label>:50                                      ; preds = %45
  %51 = load i32, i32* %i, align 4
  %52 = add nsw i32 %51, -1
  store i32 %52, i32* %i, align 4
  br label %10

; <label>:53                                      ; preds = %10
  %54 = load %struct.sn*, %struct.sn** %x, align 8
  %55 = getelementptr inbounds %struct.sn, %struct.sn* %54, i32 0, i32 1
  %56 = load %struct.sn**, %struct.sn*** %55, align 8
  %57 = getelementptr inbounds %struct.sn*, %struct.sn** %56, i64 0
  %58 = load %struct.sn*, %struct.sn** %57, align 8
  store %struct.sn* %58, %struct.sn** %x, align 8
  %59 = load %struct.sn*, %struct.sn** %x, align 8
  %60 = icmp eq %struct.sn* %59, null
  br i1 %60, label %67, label %61

; <label>:61                                      ; preds = %53
  %62 = load %struct.sn*, %struct.sn** %x, align 8
  %63 = getelementptr inbounds %struct.sn, %struct.sn* %62, i32 0, i32 0
  %64 = load i32, i32* %63, align 4
  %65 = load i32, i32* %2, align 4
  %66 = icmp ne i32 %64, %65
  br label %67

; <label>:67                                      ; preds = %61, %53
  %68 = phi i1 [ true, %53 ], [ %66, %61 ]
  %69 = zext i1 %68 to i32
  store i32 %69, i32* %guard, align 4
  %70 = load i32, i32* %guard, align 4
  %71 = icmp ne i32 %70, 0
  br i1 %71, label %72, label %141

; <label>:72                                      ; preds = %67
  %73 = call i32 @random_level()
  store i32 %73, i32* %lvl, align 4
  %74 = load i32, i32* %lvl, align 4
  %75 = load %struct.SkipSet*, %struct.SkipSet** %1, align 8
  %76 = getelementptr inbounds %struct.SkipSet, %struct.SkipSet* %75, i32 0, i32 1
  %77 = load i32, i32* %76, align 4
  %78 = icmp sgt i32 %74, %77
  br i1 %78, label %79, label %102

; <label>:79                                      ; preds = %72
  %80 = load %struct.SkipSet*, %struct.SkipSet** %1, align 8
  %81 = getelementptr inbounds %struct.SkipSet, %struct.SkipSet* %80, i32 0, i32 1
  %82 = load i32, i32* %81, align 4
  %83 = add nsw i32 %82, 1
  store i32 %83, i32* %i, align 4
  br label %84

; <label>:84                                      ; preds = %95, %79
  %85 = load i32, i32* %i, align 4
  %86 = load i32, i32* %lvl, align 4
  %87 = icmp sle i32 %85, %86
  br i1 %87, label %88, label %98

; <label>:88                                      ; preds = %84
  %89 = load %struct.SkipSet*, %struct.SkipSet** %1, align 8
  %90 = getelementptr inbounds %struct.SkipSet, %struct.SkipSet* %89, i32 0, i32 0
  %91 = load %struct.sn*, %struct.sn** %90, align 8
  %92 = load i32, i32* %i, align 4
  %93 = sext i32 %92 to i64
  %94 = getelementptr inbounds [7 x %struct.sn*], [7 x %struct.sn*]* %update, i32 0, i64 %93
  store %struct.sn* %91, %struct.sn** %94, align 8
  br label %95

; <label>:95                                      ; preds = %88
  %96 = load i32, i32* %i, align 4
  %97 = add nsw i32 %96, 1
  store i32 %97, i32* %i, align 4
  br label %84

; <label>:98                                      ; preds = %84
  %99 = load i32, i32* %lvl, align 4
  %100 = load %struct.SkipSet*, %struct.SkipSet** %1, align 8
  %101 = getelementptr inbounds %struct.SkipSet, %struct.SkipSet* %100, i32 0, i32 1
  store i32 %99, i32* %101, align 4
  br label %102

; <label>:102                                     ; preds = %98, %72
  %103 = load i32, i32* %lvl, align 4
  %104 = load i32, i32* %2, align 4
  %105 = call %struct.sn* @make_node(i32 %103, i32 %104)
  store %struct.sn* %105, %struct.sn** %x, align 8
  store i32 0, i32* %i, align 4
  br label %106

; <label>:106                                     ; preds = %137, %102
  %107 = load i32, i32* %i, align 4
  %108 = load i32, i32* %lvl, align 4
  %109 = icmp sle i32 %107, %108
  br i1 %109, label %110, label %140

; <label>:110                                     ; preds = %106
  %111 = load i32, i32* %i, align 4
  %112 = sext i32 %111 to i64
  %113 = load i32, i32* %i, align 4
  %114 = sext i32 %113 to i64
  %115 = getelementptr inbounds [7 x %struct.sn*], [7 x %struct.sn*]* %update, i32 0, i64 %114
  %116 = load %struct.sn*, %struct.sn** %115, align 8
  %117 = getelementptr inbounds %struct.sn, %struct.sn* %116, i32 0, i32 1
  %118 = load %struct.sn**, %struct.sn*** %117, align 8
  %119 = getelementptr inbounds %struct.sn*, %struct.sn** %118, i64 %112
  %120 = load %struct.sn*, %struct.sn** %119, align 8
  %121 = load i32, i32* %i, align 4
  %122 = sext i32 %121 to i64
  %123 = load %struct.sn*, %struct.sn** %x, align 8
  %124 = getelementptr inbounds %struct.sn, %struct.sn* %123, i32 0, i32 1
  %125 = load %struct.sn**, %struct.sn*** %124, align 8
  %126 = getelementptr inbounds %struct.sn*, %struct.sn** %125, i64 %122
  store %struct.sn* %120, %struct.sn** %126, align 8
  %127 = load %struct.sn*, %struct.sn** %x, align 8
  %128 = load i32, i32* %i, align 4
  %129 = sext i32 %128 to i64
  %130 = load i32, i32* %i, align 4
  %131 = sext i32 %130 to i64
  %132 = getelementptr inbounds [7 x %struct.sn*], [7 x %struct.sn*]* %update, i32 0, i64 %131
  %133 = load %struct.sn*, %struct.sn** %132, align 8
  %134 = getelementptr inbounds %struct.sn, %struct.sn* %133, i32 0, i32 1
  %135 = load %struct.sn**, %struct.sn*** %134, align 8
  %136 = getelementptr inbounds %struct.sn*, %struct.sn** %135, i64 %129
  store %struct.sn* %127, %struct.sn** %136, align 8
  br label %137

; <label>:137                                     ; preds = %110
  %138 = load i32, i32* %i, align 4
  %139 = add nsw i32 %138, 1
  store i32 %139, i32* %i, align 4
  br label %106

; <label>:140                                     ; preds = %106
  br label %141

; <label>:141                                     ; preds = %140, %67
  ret void
}

; Function Attrs: nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture, i8, i64, i32, i1) #3

; Function Attrs: nounwind uwtable
define void @delete(%struct.SkipSet* %ss, i32 %value) #0 {
  %1 = alloca %struct.SkipSet*, align 8
  %2 = alloca i32, align 4
  %i = alloca i32, align 4
  %x = alloca %struct.sn*, align 8
  %update = alloca [7 x %struct.sn*], align 16
  store %struct.SkipSet* %ss, %struct.SkipSet** %1, align 8
  store i32 %value, i32* %2, align 4
  %3 = load %struct.SkipSet*, %struct.SkipSet** %1, align 8
  %4 = getelementptr inbounds %struct.SkipSet, %struct.SkipSet* %3, i32 0, i32 0
  %5 = load %struct.sn*, %struct.sn** %4, align 8
  store %struct.sn* %5, %struct.sn** %x, align 8
  %6 = bitcast [7 x %struct.sn*]* %update to i8*
  call void @llvm.memset.p0i8.i64(i8* %6, i8 0, i64 7, i32 16, i1 false)
  %7 = load %struct.SkipSet*, %struct.SkipSet** %1, align 8
  %8 = getelementptr inbounds %struct.SkipSet, %struct.SkipSet* %7, i32 0, i32 1
  %9 = load i32, i32* %8, align 4
  store i32 %9, i32* %i, align 4
  br label %10

; <label>:10                                      ; preds = %50, %0
  %11 = load i32, i32* %i, align 4
  %12 = icmp sge i32 %11, 0
  br i1 %12, label %13, label %53

; <label>:13                                      ; preds = %10
  br label %14

; <label>:14                                      ; preds = %37, %13
  %15 = load i32, i32* %i, align 4
  %16 = sext i32 %15 to i64
  %17 = load %struct.sn*, %struct.sn** %x, align 8
  %18 = getelementptr inbounds %struct.sn, %struct.sn* %17, i32 0, i32 1
  %19 = load %struct.sn**, %struct.sn*** %18, align 8
  %20 = getelementptr inbounds %struct.sn*, %struct.sn** %19, i64 %16
  %21 = load %struct.sn*, %struct.sn** %20, align 8
  %22 = icmp ne %struct.sn* %21, null
  br i1 %22, label %23, label %35

; <label>:23                                      ; preds = %14
  %24 = load i32, i32* %i, align 4
  %25 = sext i32 %24 to i64
  %26 = load %struct.sn*, %struct.sn** %x, align 8
  %27 = getelementptr inbounds %struct.sn, %struct.sn* %26, i32 0, i32 1
  %28 = load %struct.sn**, %struct.sn*** %27, align 8
  %29 = getelementptr inbounds %struct.sn*, %struct.sn** %28, i64 %25
  %30 = load %struct.sn*, %struct.sn** %29, align 8
  %31 = getelementptr inbounds %struct.sn, %struct.sn* %30, i32 0, i32 0
  %32 = load i32, i32* %31, align 4
  %33 = load i32, i32* %2, align 4
  %34 = icmp slt i32 %32, %33
  br label %35

; <label>:35                                      ; preds = %23, %14
  %36 = phi i1 [ false, %14 ], [ %34, %23 ]
  br i1 %36, label %37, label %45

; <label>:37                                      ; preds = %35
  %38 = load i32, i32* %i, align 4
  %39 = sext i32 %38 to i64
  %40 = load %struct.sn*, %struct.sn** %x, align 8
  %41 = getelementptr inbounds %struct.sn, %struct.sn* %40, i32 0, i32 1
  %42 = load %struct.sn**, %struct.sn*** %41, align 8
  %43 = getelementptr inbounds %struct.sn*, %struct.sn** %42, i64 %39
  %44 = load %struct.sn*, %struct.sn** %43, align 8
  store %struct.sn* %44, %struct.sn** %x, align 8
  br label %14

; <label>:45                                      ; preds = %35
  %46 = load %struct.sn*, %struct.sn** %x, align 8
  %47 = load i32, i32* %i, align 4
  %48 = sext i32 %47 to i64
  %49 = getelementptr inbounds [7 x %struct.sn*], [7 x %struct.sn*]* %update, i32 0, i64 %48
  store %struct.sn* %46, %struct.sn** %49, align 8
  br label %50

; <label>:50                                      ; preds = %45
  %51 = load i32, i32* %i, align 4
  %52 = add nsw i32 %51, -1
  store i32 %52, i32* %i, align 4
  br label %10

; <label>:53                                      ; preds = %10
  %54 = load %struct.sn*, %struct.sn** %x, align 8
  %55 = getelementptr inbounds %struct.sn, %struct.sn* %54, i32 0, i32 1
  %56 = load %struct.sn**, %struct.sn*** %55, align 8
  %57 = getelementptr inbounds %struct.sn*, %struct.sn** %56, i64 0
  %58 = load %struct.sn*, %struct.sn** %57, align 8
  store %struct.sn* %58, %struct.sn** %x, align 8
  %59 = load %struct.sn*, %struct.sn** %x, align 8
  %60 = getelementptr inbounds %struct.sn, %struct.sn* %59, i32 0, i32 0
  %61 = load i32, i32* %60, align 4
  %62 = load i32, i32* %2, align 4
  %63 = icmp eq i32 %61, %62
  br i1 %63, label %64, label %134

; <label>:64                                      ; preds = %53
  store i32 0, i32* %i, align 4
  br label %65

; <label>:65                                      ; preds = %102, %64
  %66 = load i32, i32* %i, align 4
  %67 = load %struct.SkipSet*, %struct.SkipSet** %1, align 8
  %68 = getelementptr inbounds %struct.SkipSet, %struct.SkipSet* %67, i32 0, i32 1
  %69 = load i32, i32* %68, align 4
  %70 = icmp sle i32 %66, %69
  br i1 %70, label %71, label %105

; <label>:71                                      ; preds = %65
  %72 = load i32, i32* %i, align 4
  %73 = sext i32 %72 to i64
  %74 = load i32, i32* %i, align 4
  %75 = sext i32 %74 to i64
  %76 = getelementptr inbounds [7 x %struct.sn*], [7 x %struct.sn*]* %update, i32 0, i64 %75
  %77 = load %struct.sn*, %struct.sn** %76, align 8
  %78 = getelementptr inbounds %struct.sn, %struct.sn* %77, i32 0, i32 1
  %79 = load %struct.sn**, %struct.sn*** %78, align 8
  %80 = getelementptr inbounds %struct.sn*, %struct.sn** %79, i64 %73
  %81 = load %struct.sn*, %struct.sn** %80, align 8
  %82 = load %struct.sn*, %struct.sn** %x, align 8
  %83 = icmp ne %struct.sn* %81, %82
  br i1 %83, label %84, label %85

; <label>:84                                      ; preds = %71
  br label %105

; <label>:85                                      ; preds = %71
  %86 = load i32, i32* %i, align 4
  %87 = sext i32 %86 to i64
  %88 = load %struct.sn*, %struct.sn** %x, align 8
  %89 = getelementptr inbounds %struct.sn, %struct.sn* %88, i32 0, i32 1
  %90 = load %struct.sn**, %struct.sn*** %89, align 8
  %91 = getelementptr inbounds %struct.sn*, %struct.sn** %90, i64 %87
  %92 = load %struct.sn*, %struct.sn** %91, align 8
  %93 = load i32, i32* %i, align 4
  %94 = sext i32 %93 to i64
  %95 = load i32, i32* %i, align 4
  %96 = sext i32 %95 to i64
  %97 = getelementptr inbounds [7 x %struct.sn*], [7 x %struct.sn*]* %update, i32 0, i64 %96
  %98 = load %struct.sn*, %struct.sn** %97, align 8
  %99 = getelementptr inbounds %struct.sn, %struct.sn* %98, i32 0, i32 1
  %100 = load %struct.sn**, %struct.sn*** %99, align 8
  %101 = getelementptr inbounds %struct.sn*, %struct.sn** %100, i64 %94
  store %struct.sn* %92, %struct.sn** %101, align 8
  br label %102

; <label>:102                                     ; preds = %85
  %103 = load i32, i32* %i, align 4
  %104 = add nsw i32 %103, 1
  store i32 %104, i32* %i, align 4
  br label %65

; <label>:105                                     ; preds = %84, %65
  %106 = load %struct.sn*, %struct.sn** %x, align 8
  %107 = bitcast %struct.sn* %106 to i8*
  call void @free(i8* %107) #3
  br label %108

; <label>:108                                     ; preds = %128, %105
  %109 = load %struct.SkipSet*, %struct.SkipSet** %1, align 8
  %110 = getelementptr inbounds %struct.SkipSet, %struct.SkipSet* %109, i32 0, i32 1
  %111 = load i32, i32* %110, align 4
  %112 = icmp sgt i32 %111, 0
  br i1 %112, label %113, label %126

; <label>:113                                     ; preds = %108
  %114 = load %struct.SkipSet*, %struct.SkipSet** %1, align 8
  %115 = getelementptr inbounds %struct.SkipSet, %struct.SkipSet* %114, i32 0, i32 1
  %116 = load i32, i32* %115, align 4
  %117 = sext i32 %116 to i64
  %118 = load %struct.SkipSet*, %struct.SkipSet** %1, align 8
  %119 = getelementptr inbounds %struct.SkipSet, %struct.SkipSet* %118, i32 0, i32 0
  %120 = load %struct.sn*, %struct.sn** %119, align 8
  %121 = getelementptr inbounds %struct.sn, %struct.sn* %120, i32 0, i32 1
  %122 = load %struct.sn**, %struct.sn*** %121, align 8
  %123 = getelementptr inbounds %struct.sn*, %struct.sn** %122, i64 %117
  %124 = load %struct.sn*, %struct.sn** %123, align 8
  %125 = icmp eq %struct.sn* %124, null
  br label %126

; <label>:126                                     ; preds = %113, %108
  %127 = phi i1 [ false, %108 ], [ %125, %113 ]
  br i1 %127, label %128, label %133

; <label>:128                                     ; preds = %126
  %129 = load %struct.SkipSet*, %struct.SkipSet** %1, align 8
  %130 = getelementptr inbounds %struct.SkipSet, %struct.SkipSet* %129, i32 0, i32 1
  %131 = load i32, i32* %130, align 4
  %132 = add nsw i32 %131, -1
  store i32 %132, i32* %130, align 4
  br label %108

; <label>:133                                     ; preds = %126
  br label %134

; <label>:134                                     ; preds = %133, %53
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) #1

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %ss = alloca %struct.SkipSet*, align 8
  store i32 0, i32* %1
  %2 = call %struct.SkipSet* @make_skipset()
  store %struct.SkipSet* %2, %struct.SkipSet** %ss, align 8
  %3 = load %struct.SkipSet*, %struct.SkipSet** %ss, align 8
  call void @print_skipset(%struct.SkipSet* %3)
  %4 = load %struct.SkipSet*, %struct.SkipSet** %ss, align 8
  call void @insert(%struct.SkipSet* %4, i32 5)
  %5 = load %struct.SkipSet*, %struct.SkipSet** %ss, align 8
  call void @insert(%struct.SkipSet* %5, i32 10)
  %6 = load %struct.SkipSet*, %struct.SkipSet** %ss, align 8
  call void @insert(%struct.SkipSet* %6, i32 7)
  %7 = load %struct.SkipSet*, %struct.SkipSet** %ss, align 8
  call void @insert(%struct.SkipSet* %7, i32 7)
  %8 = load %struct.SkipSet*, %struct.SkipSet** %ss, align 8
  call void @insert(%struct.SkipSet* %8, i32 6)
  %9 = load %struct.SkipSet*, %struct.SkipSet** %ss, align 8
  %10 = call i32 @contains(%struct.SkipSet* %9, i32 7)
  %11 = icmp ne i32 %10, 0
  br i1 %11, label %12, label %14

; <label>:12                                      ; preds = %0
  %13 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.4, i32 0, i32 0))
  br label %14

; <label>:14                                      ; preds = %12, %0
  %15 = load %struct.SkipSet*, %struct.SkipSet** %ss, align 8
  call void @print_skipset(%struct.SkipSet* %15)
  %16 = load %struct.SkipSet*, %struct.SkipSet** %ss, align 8
  call void @delete(%struct.SkipSet* %16, i32 7)
  %17 = load %struct.SkipSet*, %struct.SkipSet** %ss, align 8
  call void @print_skipset(%struct.SkipSet* %17)
  %18 = load %struct.SkipSet*, %struct.SkipSet** %ss, align 8
  %19 = call i32 @contains(%struct.SkipSet* %18, i32 7)
  %20 = icmp ne i32 %19, 0
  br i1 %20, label %23, label %21

; <label>:21                                      ; preds = %14
  %22 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str.5, i32 0, i32 0))
  br label %23

; <label>:23                                      ; preds = %21, %14
  ret i32 0
}

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }

!llvm.ident = !{!0}

!0 = !{!"Ubuntu clang version 3.7.1-svn253571-1~exp1 (branches/release_37) (based on LLVM 3.7.1)"}
