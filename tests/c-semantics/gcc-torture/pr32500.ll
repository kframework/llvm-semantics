; ModuleID = './pr32500.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@x = common global i32 0, align 4
@main.numbers = private unnamed_addr constant [4 x i32] [i32 57005, i32 48879, i32 4919, i32 16962], align 16

; Function Attrs: noinline nounwind uwtable
define void @foo(i32 %i) #0 {
  %1 = alloca i32, align 4
  store i32 %i, i32* %1, align 4
  %2 = load i32* %1, align 4
  store i32 %2, i32* @x, align 4
  ret void
}

; Function Attrs: noinline nounwind uwtable
define void @bar() #0 {
  call void @exit(i32 0) #4
  unreachable
                                                  ; No predecessors!
  ret void
}

; Function Attrs: noreturn
declare void @exit(i32) #1

; Function Attrs: nounwind uwtable
define i32 @main(i32 %argc, i8** %argv) #2 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i8**, align 8
  %i = alloca i32, align 4
  %numbers = alloca [4 x i32], align 16
  store i32 0, i32* %1
  store i32 %argc, i32* %2, align 4
  store i8** %argv, i8*** %3, align 8
  %4 = bitcast [4 x i32]* %numbers to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %4, i8* bitcast ([4 x i32]* @main.numbers to i8*), i64 16, i32 16, i1 false)
  store i32 1, i32* %i, align 4
  br label %5

; <label>:5                                       ; preds = %26, %0
  %6 = load i32* %i, align 4
  %7 = icmp sle i32 %6, 12
  br i1 %7, label %8, label %29

; <label>:8                                       ; preds = %5
  %9 = load i32* %i, align 4
  %10 = icmp sle i32 %9, 4
  br i1 %10, label %11, label %17

; <label>:11                                      ; preds = %8
  %12 = load i32* %i, align 4
  %13 = sub nsw i32 %12, 1
  %14 = sext i32 %13 to i64
  %15 = getelementptr inbounds [4 x i32]* %numbers, i32 0, i64 %14
  %16 = load i32* %15, align 4
  call void @foo(i32 %16)
  br label %25

; <label>:17                                      ; preds = %8
  %18 = load i32* %i, align 4
  %19 = icmp sge i32 %18, 7
  br i1 %19, label %20, label %24

; <label>:20                                      ; preds = %17
  %21 = load i32* %i, align 4
  %22 = icmp sle i32 %21, 9
  br i1 %22, label %23, label %24

; <label>:23                                      ; preds = %20
  call void @bar()
  br label %24

; <label>:24                                      ; preds = %23, %20, %17
  br label %25

; <label>:25                                      ; preds = %24, %11
  br label %26

; <label>:26                                      ; preds = %25
  %27 = load i32* %i, align 4
  %28 = add nsw i32 %27, 1
  store i32 %28, i32* %i, align 4
  br label %5

; <label>:29                                      ; preds = %5
  call void @abort() #4
  unreachable
                                                  ; No predecessors!
  %31 = load i32* %1
  ret i32 %31
}

; Function Attrs: nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture readonly, i64, i32, i1) #3

; Function Attrs: noreturn
declare void @abort() #1

attributes #0 = { noinline nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { noreturn "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }
attributes #4 = { noreturn }

!llvm.ident = !{!0}

!0 = metadata !{metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)"}
