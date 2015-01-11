; ModuleID = './20030606-1.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: nounwind uwtable
define i32* @foo(i32* %x, i32 %b) #0 {
  %1 = alloca i32*, align 8
  %2 = alloca i32, align 4
  store i32* %x, i32** %1, align 8
  store i32 %b, i32* %2, align 4
  %3 = load i32** %1, align 8
  %4 = getelementptr inbounds i32* %3, i32 1
  store i32* %4, i32** %1, align 8
  store i32 55, i32* %3, align 4
  %5 = load i32* %2, align 4
  %6 = icmp ne i32 %5, 0
  br i1 %6, label %7, label %11

; <label>:7                                       ; preds = %0
  %8 = load i32* %2, align 4
  %9 = load i32** %1, align 8
  %10 = getelementptr inbounds i32* %9, i32 1
  store i32* %10, i32** %1, align 8
  store i32 %8, i32* %9, align 4
  br label %11

; <label>:11                                      ; preds = %7, %0
  %12 = load i32** %1, align 8
  ret i32* %12
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %a = alloca [5 x i32], align 16
  store i32 0, i32* %1
  %2 = bitcast [5 x i32]* %a to i8*
  call void @llvm.memset.p0i8.i64(i8* %2, i8 1, i64 20, i32 16, i1 false)
  %3 = getelementptr inbounds [5 x i32]* %a, i32 0, i32 0
  %4 = call i32* @foo(i32* %3, i32 0)
  %5 = getelementptr inbounds [5 x i32]* %a, i32 0, i32 0
  %6 = ptrtoint i32* %4 to i64
  %7 = ptrtoint i32* %5 to i64
  %8 = sub i64 %6, %7
  %9 = sdiv exact i64 %8, 4
  %10 = icmp ne i64 %9, 1
  br i1 %10, label %21, label %11

; <label>:11                                      ; preds = %0
  %12 = getelementptr inbounds [5 x i32]* %a, i32 0, i64 0
  %13 = load i32* %12, align 4
  %14 = icmp ne i32 %13, 55
  br i1 %14, label %21, label %15

; <label>:15                                      ; preds = %11
  %16 = getelementptr inbounds [5 x i32]* %a, i32 0, i64 1
  %17 = load i32* %16, align 4
  %18 = getelementptr inbounds [5 x i32]* %a, i32 0, i64 4
  %19 = load i32* %18, align 4
  %20 = icmp ne i32 %17, %19
  br i1 %20, label %21, label %22

; <label>:21                                      ; preds = %15, %11, %0
  call void @abort() #3
  unreachable

; <label>:22                                      ; preds = %15
  %23 = bitcast [5 x i32]* %a to i8*
  call void @llvm.memset.p0i8.i64(i8* %23, i8 1, i64 20, i32 16, i1 false)
  %24 = getelementptr inbounds [5 x i32]* %a, i32 0, i32 0
  %25 = call i32* @foo(i32* %24, i32 2)
  %26 = getelementptr inbounds [5 x i32]* %a, i32 0, i32 0
  %27 = ptrtoint i32* %25 to i64
  %28 = ptrtoint i32* %26 to i64
  %29 = sub i64 %27, %28
  %30 = sdiv exact i64 %29, 4
  %31 = icmp ne i64 %30, 2
  br i1 %31, label %40, label %32

; <label>:32                                      ; preds = %22
  %33 = getelementptr inbounds [5 x i32]* %a, i32 0, i64 0
  %34 = load i32* %33, align 4
  %35 = icmp ne i32 %34, 55
  br i1 %35, label %40, label %36

; <label>:36                                      ; preds = %32
  %37 = getelementptr inbounds [5 x i32]* %a, i32 0, i64 1
  %38 = load i32* %37, align 4
  %39 = icmp ne i32 %38, 2
  br i1 %39, label %40, label %41

; <label>:40                                      ; preds = %36, %32, %22
  call void @abort() #3
  unreachable

; <label>:41                                      ; preds = %36
  call void @exit(i32 0) #3
  unreachable
                                                  ; No predecessors!
  %43 = load i32* %1
  ret i32 %43
}

; Function Attrs: nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture, i8, i64, i32, i1) #1

; Function Attrs: noreturn nounwind
declare void @abort() #2

; Function Attrs: noreturn nounwind
declare void @exit(i32) #2

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind }
attributes #2 = { noreturn nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { noreturn nounwind }

!llvm.ident = !{!0}

!0 = metadata !{metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)"}
