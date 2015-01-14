; ModuleID = './loop-5.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@a = internal global [4 x i32] zeroinitializer, align 16
@testit.ir = private unnamed_addr constant [4 x i32] [i32 0, i32 1, i32 2, i32 3], align 16
@t = internal global i32 0, align 4

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  store i32 0, i32* %1
  call void @testit()
  %2 = load i32* getelementptr inbounds ([4 x i32]* @a, i32 0, i64 0), align 4
  %3 = icmp ne i32 %2, 0
  br i1 %3, label %4, label %5

; <label>:4                                       ; preds = %0
  call void @abort() #3
  unreachable

; <label>:5                                       ; preds = %0
  %6 = load i32* getelementptr inbounds ([4 x i32]* @a, i32 0, i64 1), align 4
  %7 = icmp ne i32 %6, 3
  br i1 %7, label %8, label %9

; <label>:8                                       ; preds = %5
  call void @abort() #3
  unreachable

; <label>:9                                       ; preds = %5
  %10 = load i32* getelementptr inbounds ([4 x i32]* @a, i32 0, i64 2), align 4
  %11 = icmp ne i32 %10, 2
  br i1 %11, label %12, label %13

; <label>:12                                      ; preds = %9
  call void @abort() #3
  unreachable

; <label>:13                                      ; preds = %9
  %14 = load i32* getelementptr inbounds ([4 x i32]* @a, i32 0, i64 3), align 4
  %15 = icmp ne i32 %14, 1
  br i1 %15, label %16, label %17

; <label>:16                                      ; preds = %13
  call void @abort() #3
  unreachable

; <label>:17                                      ; preds = %13
  call void @exit(i32 0) #3
  unreachable
                                                  ; No predecessors!
  %19 = load i32* %1
  ret i32 %19
}

; Function Attrs: nounwind uwtable
define internal void @testit() #0 {
  %ir = alloca [4 x i32], align 16
  %ix = alloca i32, align 4
  %n = alloca i32, align 4
  %m = alloca i32, align 4
  %1 = bitcast [4 x i32]* %ir to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %1, i8* bitcast ([4 x i32]* @testit.ir to i8*), i64 16, i32 16, i1 false)
  store i32 1, i32* %n, align 4
  store i32 3, i32* %m, align 4
  store i32 1, i32* %ix, align 4
  br label %2

; <label>:2                                       ; preds = %20, %0
  %3 = load i32* %ix, align 4
  %4 = icmp sle i32 %3, 4
  br i1 %4, label %5, label %23

; <label>:5                                       ; preds = %2
  %6 = load i32* %n, align 4
  %7 = icmp eq i32 %6, 1
  br i1 %7, label %8, label %9

; <label>:8                                       ; preds = %5
  store i32 4, i32* %m, align 4
  br label %12

; <label>:9                                       ; preds = %5
  %10 = load i32* %n, align 4
  %11 = sub nsw i32 %10, 1
  store i32 %11, i32* %m, align 4
  br label %12

; <label>:12                                      ; preds = %9, %8
  %13 = load i32* %n, align 4
  %14 = sub nsw i32 %13, 1
  %15 = sext i32 %14 to i64
  %16 = getelementptr inbounds [4 x i32]* %ir, i32 0, i64 %15
  %17 = load i32* %16, align 4
  %18 = call i32 @ap(i32 %17)
  %19 = load i32* %m, align 4
  store i32 %19, i32* %n, align 4
  br label %20

; <label>:20                                      ; preds = %12
  %21 = load i32* %ix, align 4
  %22 = add nsw i32 %21, 1
  store i32 %22, i32* %ix, align 4
  br label %2

; <label>:23                                      ; preds = %2
  ret void
}

; Function Attrs: noreturn nounwind
declare void @abort() #1

; Function Attrs: noreturn nounwind
declare void @exit(i32) #1

; Function Attrs: nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture readonly, i64, i32, i1) #2

; Function Attrs: nounwind uwtable
define internal i32 @ap(i32 %i) #0 {
  %1 = alloca i32, align 4
  store i32 %i, i32* %1, align 4
  %2 = load i32* @t, align 4
  %3 = icmp sgt i32 %2, 3
  br i1 %3, label %4, label %5

; <label>:4                                       ; preds = %0
  call void @abort() #3
  unreachable

; <label>:5                                       ; preds = %0
  %6 = load i32* %1, align 4
  %7 = load i32* @t, align 4
  %8 = add nsw i32 %7, 1
  store i32 %8, i32* @t, align 4
  %9 = sext i32 %7 to i64
  %10 = getelementptr inbounds [4 x i32]* @a, i32 0, i64 %9
  store i32 %6, i32* %10, align 4
  ret i32 1
}

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { noreturn nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind }
attributes #3 = { noreturn nounwind }

!llvm.ident = !{!0}

!0 = metadata !{metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)"}
