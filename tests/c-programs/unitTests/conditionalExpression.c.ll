; ModuleID = './conditionalExpression.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.S = type { i32, i32 }
%union.U = type { i32 }

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %s1 = alloca %struct.S, align 4
  %s2 = alloca %struct.S, align 4
  %u1 = alloca %union.U, align 4
  %u2 = alloca %union.U, align 4
  %foo = alloca i32, align 4
  %a = alloca i32, align 4
  %b = alloca i32, align 4
  store i32 0, i32* %1
  %2 = bitcast %struct.S* %s1 to i8*
  call void @llvm.memset.p0i8.i64(i8* %2, i8 0, i64 8, i32 4, i1 false)
  %3 = bitcast %struct.S* %s2 to i8*
  call void @llvm.memset.p0i8.i64(i8* %3, i8 0, i64 8, i32 4, i1 false)
  %4 = bitcast %union.U* %u1 to i8*
  call void @llvm.memset.p0i8.i64(i8* %4, i8 0, i64 4, i32 4, i1 false)
  %5 = bitcast %union.U* %u2 to i8*
  call void @llvm.memset.p0i8.i64(i8* %5, i8 0, i64 4, i32 4, i1 false)
  store i32 5, i32* %foo, align 4
  store i32 5, i32* %a, align 4
  store i32 6, i32* %b, align 4
  %6 = load i32, i32* %foo, align 4
  %7 = icmp ne i32 %6, 0
  %8 = select i1 %7, i32 5, i32 6
  %9 = load i32, i32* %foo, align 4
  %10 = icmp ne i32 %9, 0
  %11 = select i1 %10, float 5.000000e+00, float 6.000000e+00
  %12 = load i32, i32* %foo, align 4
  %13 = icmp ne i32 %12, 0
  br i1 %13, label %14, label %15

; <label>:14                                      ; preds = %0
  br label %16

; <label>:15                                      ; preds = %0
  br label %16

; <label>:16                                      ; preds = %15, %14
  %17 = load i32, i32* %foo, align 4
  %18 = icmp ne i32 %17, 0
  br i1 %18, label %19, label %20

; <label>:19                                      ; preds = %16
  br label %21

; <label>:20                                      ; preds = %16
  br label %21

; <label>:21                                      ; preds = %20, %19
  %22 = load i32, i32* %foo, align 4
  %23 = icmp ne i32 %22, 0
  br i1 %23, label %24, label %25

; <label>:24                                      ; preds = %21
  br label %26

; <label>:25                                      ; preds = %21
  br label %26

; <label>:26                                      ; preds = %25, %24
  %27 = load i32, i32* %foo, align 4
  %28 = icmp ne i32 %27, 0
  br i1 %28, label %29, label %30

; <label>:29                                      ; preds = %26
  br label %31

; <label>:30                                      ; preds = %26
  br label %31

; <label>:31                                      ; preds = %30, %29
  %32 = phi i32* [ %a, %29 ], [ %b, %30 ]
  %33 = load i32, i32* %foo, align 4
  %34 = icmp ne i32 %33, 0
  br i1 %34, label %35, label %36

; <label>:35                                      ; preds = %31
  br label %37

; <label>:36                                      ; preds = %31
  br label %37

; <label>:37                                      ; preds = %36, %35
  %38 = phi i32* [ %a, %35 ], [ %b, %36 ]
  %39 = load i32, i32* %foo, align 4
  %40 = icmp ne i32 %39, 0
  br i1 %40, label %41, label %42

; <label>:41                                      ; preds = %37
  br label %43

; <label>:42                                      ; preds = %37
  br label %43

; <label>:43                                      ; preds = %42, %41
  %44 = phi i32* [ %a, %41 ], [ null, %42 ]
  %45 = load i32, i32* %foo, align 4
  %46 = icmp ne i32 %45, 0
  br i1 %46, label %47, label %48

; <label>:47                                      ; preds = %43
  br label %49

; <label>:48                                      ; preds = %43
  br label %49

; <label>:49                                      ; preds = %48, %47
  %50 = phi i32* [ null, %47 ], [ %a, %48 ]
  %51 = load i32, i32* %foo, align 4
  %52 = icmp ne i32 %51, 0
  br i1 %52, label %53, label %55

; <label>:53                                      ; preds = %49
  %54 = bitcast i32* %a to i8*
  br label %57

; <label>:55                                      ; preds = %49
  %56 = bitcast i32* %b to i8*
  br label %57

; <label>:57                                      ; preds = %55, %53
  %58 = phi i8* [ %54, %53 ], [ %56, %55 ]
  %59 = load i32, i32* %foo, align 4
  %60 = icmp ne i32 %59, 0
  br i1 %60, label %61, label %63

; <label>:61                                      ; preds = %57
  %62 = bitcast i32* %a to i8*
  br label %65

; <label>:63                                      ; preds = %57
  %64 = bitcast i32* %b to i8*
  br label %65

; <label>:65                                      ; preds = %63, %61
  %66 = phi i8* [ %62, %61 ], [ %64, %63 ]
  %67 = load i32, i32* %foo, align 4
  %68 = icmp ne i32 %67, 0
  br i1 %68, label %69, label %71

; <label>:69                                      ; preds = %65
  %70 = bitcast i32* %a to i8*
  br label %73

; <label>:71                                      ; preds = %65
  %72 = bitcast i32* %b to i8*
  br label %73

; <label>:73                                      ; preds = %71, %69
  %74 = phi i8* [ %70, %69 ], [ %72, %71 ]
  %75 = load i32, i32* %1
  ret i32 %75
}

; Function Attrs: nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture, i8, i64, i32, i1) #1

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind }

!llvm.ident = !{!0}

!0 = !{!"Ubuntu clang version 3.7.1-svn253571-1~exp1 (branches/release_37) (based on LLVM 3.7.1)"}
