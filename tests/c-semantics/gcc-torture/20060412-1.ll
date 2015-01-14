; ModuleID = './20060412-1.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.T = type { i64, [82 x %struct.S] }
%struct.S = type { i64 }

@t = common global %struct.T zeroinitializer, align 8

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %p = alloca %struct.S*, align 8
  %q = alloca %struct.S*, align 8
  store i32 0, i32* %1
  store %struct.S* bitcast (%struct.T* @t to %struct.S*), %struct.S** %p, align 8
  %2 = load %struct.S** %p, align 8
  %3 = bitcast %struct.S* %2 to %struct.T*
  %4 = getelementptr inbounds %struct.T* %3, i32 0, i32 1
  %5 = getelementptr inbounds [82 x %struct.S]* %4, i32 0, i64 0
  store %struct.S* %5, %struct.S** %p, align 8
  %6 = load %struct.S** %p, align 8
  %7 = getelementptr inbounds %struct.S* %6, i64 82
  store %struct.S* %7, %struct.S** %q, align 8
  br label %8

; <label>:8                                       ; preds = %13, %0
  %9 = load %struct.S** %q, align 8
  %10 = getelementptr inbounds %struct.S* %9, i32 -1
  store %struct.S* %10, %struct.S** %q, align 8
  %11 = load %struct.S** %p, align 8
  %12 = icmp ugt %struct.S* %10, %11
  br i1 %12, label %13, label %16

; <label>:13                                      ; preds = %8
  %14 = load %struct.S** %q, align 8
  %15 = getelementptr inbounds %struct.S* %14, i32 0, i32 0
  store i64 -1, i64* %15, align 8
  br label %8

; <label>:16                                      ; preds = %8
  %17 = load %struct.S** %q, align 8
  %18 = getelementptr inbounds %struct.S* %17, i32 0, i32 0
  store i64 0, i64* %18, align 8
  %19 = load %struct.S** %q, align 8
  %20 = load %struct.S** %p, align 8
  %21 = icmp ugt %struct.S* %19, %20
  br i1 %21, label %22, label %23

; <label>:22                                      ; preds = %16
  call void @abort() #2
  unreachable

; <label>:23                                      ; preds = %16
  %24 = load %struct.S** %q, align 8
  %25 = load %struct.S** %p, align 8
  %26 = ptrtoint %struct.S* %24 to i64
  %27 = ptrtoint %struct.S* %25 to i64
  %28 = sub i64 %26, %27
  %29 = sdiv exact i64 %28, 8
  %30 = icmp sgt i64 %29, 0
  br i1 %30, label %31, label %32

; <label>:31                                      ; preds = %23
  call void @abort() #2
  unreachable

; <label>:32                                      ; preds = %23
  ret i32 0
}

; Function Attrs: noreturn nounwind
declare void @abort() #1

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { noreturn nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noreturn nounwind }

!llvm.ident = !{!0}

!0 = metadata !{metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)"}
