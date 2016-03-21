; ModuleID = './20071202-1.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.S = type { i32, i32, [6 x i32], %struct.T }
%struct.T = type { i32, [8 x i32] }

@main.s = private unnamed_addr constant %struct.S { i32 6, i32 12, [6 x i32] [i32 1, i32 2, i32 3, i32 4, i32 5, i32 6], %struct.T { i32 7, [8 x i32] [i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15] } }, align 4

; Function Attrs: noinline nounwind uwtable
define void @foo(%struct.S* %s) #0 {
  %1 = alloca %struct.S*, align 8
  %2 = alloca %struct.S, align 4
  store %struct.S* %s, %struct.S** %1, align 8
  %3 = load %struct.S*, %struct.S** %1, align 8
  %4 = getelementptr inbounds %struct.S, %struct.S* %2, i32 0, i32 0
  %5 = load %struct.S*, %struct.S** %1, align 8
  %6 = getelementptr inbounds %struct.S, %struct.S* %5, i32 0, i32 1
  %7 = load i32, i32* %6, align 4
  store i32 %7, i32* %4, align 4
  %8 = getelementptr inbounds %struct.S, %struct.S* %2, i32 0, i32 1
  %9 = load %struct.S*, %struct.S** %1, align 8
  %10 = getelementptr inbounds %struct.S, %struct.S* %9, i32 0, i32 0
  %11 = load i32, i32* %10, align 4
  store i32 %11, i32* %8, align 4
  %12 = getelementptr inbounds %struct.S, %struct.S* %2, i32 0, i32 2
  %13 = bitcast [6 x i32]* %12 to i8*
  call void @llvm.memset.p0i8.i64(i8* %13, i8 0, i64 24, i32 4, i1 false)
  %14 = getelementptr inbounds [6 x i32], [6 x i32]* %12, i64 0, i64 0
  %15 = getelementptr inbounds i32, i32* %14, i64 1
  %16 = getelementptr inbounds i32, i32* %15, i64 1
  %17 = getelementptr inbounds i32, i32* %16, i64 1
  %18 = getelementptr inbounds i32, i32* %17, i64 1
  %19 = getelementptr inbounds i32, i32* %18, i64 1
  %20 = getelementptr inbounds %struct.S, %struct.S* %2, i32 0, i32 3
  %21 = load %struct.S*, %struct.S** %1, align 8
  %22 = getelementptr inbounds %struct.S, %struct.S* %21, i32 0, i32 3
  %23 = bitcast %struct.T* %20 to i8*
  %24 = bitcast %struct.T* %22 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %23, i8* %24, i64 36, i32 4, i1 false)
  %25 = bitcast %struct.S* %3 to i8*
  %26 = bitcast %struct.S* %2 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %25, i8* %26, i64 68, i32 4, i1 false)
  ret void
}

; Function Attrs: nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture, i8, i64, i32, i1) #1

; Function Attrs: nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture readonly, i64, i32, i1) #1

; Function Attrs: nounwind uwtable
define i32 @main() #2 {
  %1 = alloca i32, align 4
  %s = alloca %struct.S, align 4
  store i32 0, i32* %1
  %2 = bitcast %struct.S* %s to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %2, i8* bitcast (%struct.S* @main.s to i8*), i64 68, i32 4, i1 false)
  call void @foo(%struct.S* %s)
  %3 = getelementptr inbounds %struct.S, %struct.S* %s, i32 0, i32 0
  %4 = load i32, i32* %3, align 4
  %5 = icmp ne i32 %4, 12
  br i1 %5, label %40, label %6

; <label>:6                                       ; preds = %0
  %7 = getelementptr inbounds %struct.S, %struct.S* %s, i32 0, i32 1
  %8 = load i32, i32* %7, align 4
  %9 = icmp ne i32 %8, 6
  br i1 %9, label %40, label %10

; <label>:10                                      ; preds = %6
  %11 = getelementptr inbounds %struct.S, %struct.S* %s, i32 0, i32 2
  %12 = getelementptr inbounds [6 x i32], [6 x i32]* %11, i32 0, i64 0
  %13 = load i32, i32* %12, align 4
  %14 = icmp ne i32 %13, 0
  br i1 %14, label %40, label %15

; <label>:15                                      ; preds = %10
  %16 = getelementptr inbounds %struct.S, %struct.S* %s, i32 0, i32 2
  %17 = getelementptr inbounds [6 x i32], [6 x i32]* %16, i32 0, i64 1
  %18 = load i32, i32* %17, align 4
  %19 = icmp ne i32 %18, 0
  br i1 %19, label %40, label %20

; <label>:20                                      ; preds = %15
  %21 = getelementptr inbounds %struct.S, %struct.S* %s, i32 0, i32 2
  %22 = getelementptr inbounds [6 x i32], [6 x i32]* %21, i32 0, i64 2
  %23 = load i32, i32* %22, align 4
  %24 = icmp ne i32 %23, 0
  br i1 %24, label %40, label %25

; <label>:25                                      ; preds = %20
  %26 = getelementptr inbounds %struct.S, %struct.S* %s, i32 0, i32 2
  %27 = getelementptr inbounds [6 x i32], [6 x i32]* %26, i32 0, i64 3
  %28 = load i32, i32* %27, align 4
  %29 = icmp ne i32 %28, 0
  br i1 %29, label %40, label %30

; <label>:30                                      ; preds = %25
  %31 = getelementptr inbounds %struct.S, %struct.S* %s, i32 0, i32 2
  %32 = getelementptr inbounds [6 x i32], [6 x i32]* %31, i32 0, i64 4
  %33 = load i32, i32* %32, align 4
  %34 = icmp ne i32 %33, 0
  br i1 %34, label %40, label %35

; <label>:35                                      ; preds = %30
  %36 = getelementptr inbounds %struct.S, %struct.S* %s, i32 0, i32 2
  %37 = getelementptr inbounds [6 x i32], [6 x i32]* %36, i32 0, i64 5
  %38 = load i32, i32* %37, align 4
  %39 = icmp ne i32 %38, 0
  br i1 %39, label %40, label %41

; <label>:40                                      ; preds = %35, %30, %25, %20, %15, %10, %6, %0
  call void @abort() #4
  unreachable

; <label>:41                                      ; preds = %35
  %42 = getelementptr inbounds %struct.S, %struct.S* %s, i32 0, i32 3
  %43 = getelementptr inbounds %struct.T, %struct.T* %42, i32 0, i32 0
  %44 = load i32, i32* %43, align 4
  %45 = icmp ne i32 %44, 7
  br i1 %45, label %94, label %46

; <label>:46                                      ; preds = %41
  %47 = getelementptr inbounds %struct.S, %struct.S* %s, i32 0, i32 3
  %48 = getelementptr inbounds %struct.T, %struct.T* %47, i32 0, i32 1
  %49 = getelementptr inbounds [8 x i32], [8 x i32]* %48, i32 0, i64 0
  %50 = load i32, i32* %49, align 4
  %51 = icmp ne i32 %50, 8
  br i1 %51, label %94, label %52

; <label>:52                                      ; preds = %46
  %53 = getelementptr inbounds %struct.S, %struct.S* %s, i32 0, i32 3
  %54 = getelementptr inbounds %struct.T, %struct.T* %53, i32 0, i32 1
  %55 = getelementptr inbounds [8 x i32], [8 x i32]* %54, i32 0, i64 1
  %56 = load i32, i32* %55, align 4
  %57 = icmp ne i32 %56, 9
  br i1 %57, label %94, label %58

; <label>:58                                      ; preds = %52
  %59 = getelementptr inbounds %struct.S, %struct.S* %s, i32 0, i32 3
  %60 = getelementptr inbounds %struct.T, %struct.T* %59, i32 0, i32 1
  %61 = getelementptr inbounds [8 x i32], [8 x i32]* %60, i32 0, i64 2
  %62 = load i32, i32* %61, align 4
  %63 = icmp ne i32 %62, 10
  br i1 %63, label %94, label %64

; <label>:64                                      ; preds = %58
  %65 = getelementptr inbounds %struct.S, %struct.S* %s, i32 0, i32 3
  %66 = getelementptr inbounds %struct.T, %struct.T* %65, i32 0, i32 1
  %67 = getelementptr inbounds [8 x i32], [8 x i32]* %66, i32 0, i64 3
  %68 = load i32, i32* %67, align 4
  %69 = icmp ne i32 %68, 11
  br i1 %69, label %94, label %70

; <label>:70                                      ; preds = %64
  %71 = getelementptr inbounds %struct.S, %struct.S* %s, i32 0, i32 3
  %72 = getelementptr inbounds %struct.T, %struct.T* %71, i32 0, i32 1
  %73 = getelementptr inbounds [8 x i32], [8 x i32]* %72, i32 0, i64 4
  %74 = load i32, i32* %73, align 4
  %75 = icmp ne i32 %74, 12
  br i1 %75, label %94, label %76

; <label>:76                                      ; preds = %70
  %77 = getelementptr inbounds %struct.S, %struct.S* %s, i32 0, i32 3
  %78 = getelementptr inbounds %struct.T, %struct.T* %77, i32 0, i32 1
  %79 = getelementptr inbounds [8 x i32], [8 x i32]* %78, i32 0, i64 5
  %80 = load i32, i32* %79, align 4
  %81 = icmp ne i32 %80, 13
  br i1 %81, label %94, label %82

; <label>:82                                      ; preds = %76
  %83 = getelementptr inbounds %struct.S, %struct.S* %s, i32 0, i32 3
  %84 = getelementptr inbounds %struct.T, %struct.T* %83, i32 0, i32 1
  %85 = getelementptr inbounds [8 x i32], [8 x i32]* %84, i32 0, i64 6
  %86 = load i32, i32* %85, align 4
  %87 = icmp ne i32 %86, 14
  br i1 %87, label %94, label %88

; <label>:88                                      ; preds = %82
  %89 = getelementptr inbounds %struct.S, %struct.S* %s, i32 0, i32 3
  %90 = getelementptr inbounds %struct.T, %struct.T* %89, i32 0, i32 1
  %91 = getelementptr inbounds [8 x i32], [8 x i32]* %90, i32 0, i64 7
  %92 = load i32, i32* %91, align 4
  %93 = icmp ne i32 %92, 15
  br i1 %93, label %94, label %95

; <label>:94                                      ; preds = %88, %82, %76, %70, %64, %58, %52, %46, %41
  call void @abort() #4
  unreachable

; <label>:95                                      ; preds = %88
  ret i32 0
}

; Function Attrs: noreturn nounwind
declare void @abort() #3

attributes #0 = { noinline nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind }
attributes #2 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { noreturn nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { noreturn nounwind }

!llvm.ident = !{!0}

!0 = !{!"Ubuntu clang version 3.7.1-svn253571-1~exp1 (branches/release_37) (based on LLVM 3.7.1)"}
