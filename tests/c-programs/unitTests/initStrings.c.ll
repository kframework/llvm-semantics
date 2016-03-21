; ModuleID = './initStrings.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@main.s1 = private unnamed_addr constant [2 x i8] c"x\00", align 1

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %s1 = alloca [2 x i8], align 1
  %s2 = alloca [2 x i8], align 1
  store i32 0, i32* %1
  %2 = bitcast [2 x i8]* %s1 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %2, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @main.s1, i32 0, i32 0), i64 2, i32 1, i1 false)
  %3 = bitcast [2 x i8]* %s2 to i8*
  call void @llvm.memset.p0i8.i64(i8* %3, i8 0, i64 2, i32 1, i1 false)
  %4 = getelementptr inbounds [2 x i8], [2 x i8]* %s1, i32 0, i64 0
  %5 = load i8, i8* %4, align 1
  %6 = sext i8 %5 to i32
  %7 = icmp ne i32 %6, 120
  br i1 %7, label %8, label %9

; <label>:8                                       ; preds = %0
  store i32 1, i32* %1
  br label %28

; <label>:9                                       ; preds = %0
  %10 = getelementptr inbounds [2 x i8], [2 x i8]* %s1, i32 0, i64 1
  %11 = load i8, i8* %10, align 1
  %12 = sext i8 %11 to i32
  %13 = icmp ne i32 %12, 0
  br i1 %13, label %14, label %15

; <label>:14                                      ; preds = %9
  store i32 2, i32* %1
  br label %28

; <label>:15                                      ; preds = %9
  %16 = getelementptr inbounds [2 x i8], [2 x i8]* %s2, i32 0, i64 0
  %17 = load i8, i8* %16, align 1
  %18 = sext i8 %17 to i32
  %19 = icmp ne i32 %18, 0
  br i1 %19, label %20, label %21

; <label>:20                                      ; preds = %15
  store i32 3, i32* %1
  br label %28

; <label>:21                                      ; preds = %15
  %22 = getelementptr inbounds [2 x i8], [2 x i8]* %s2, i32 0, i64 1
  %23 = load i8, i8* %22, align 1
  %24 = sext i8 %23 to i32
  %25 = icmp ne i32 %24, 0
  br i1 %25, label %26, label %27

; <label>:26                                      ; preds = %21
  store i32 4, i32* %1
  br label %28

; <label>:27                                      ; preds = %21
  store i32 0, i32* %1
  br label %28

; <label>:28                                      ; preds = %27, %26, %20, %14, %8
  %29 = load i32, i32* %1
  ret i32 %29
}

; Function Attrs: nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture readonly, i64, i32, i1) #1

; Function Attrs: nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture, i8, i64, i32, i1) #1

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind }

!llvm.ident = !{!0}

!0 = !{!"Ubuntu clang version 3.7.1-svn253571-1~exp1 (branches/release_37) (based on LLVM 3.7.1)"}
