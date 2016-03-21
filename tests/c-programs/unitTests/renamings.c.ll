; ModuleID = './renamings.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@global_param_1 = global i32 5, align 4
@global_local_1 = global i32 5, align 4
@global_local_2 = global i32 5, align 4
@.str = private unnamed_addr constant [23 x i8] c"failed global_param_1\0A\00", align 1
@.str.1 = private unnamed_addr constant [23 x i8] c"failed global_param_2\0A\00", align 1
@.str.2 = private unnamed_addr constant [23 x i8] c"failed global_local_1\0A\00", align 1
@.str.3 = private unnamed_addr constant [23 x i8] c"failed global_local_2\0A\00", align 1
@.str.4 = private unnamed_addr constant [9 x i8] c"SUCCESS\0A\00", align 1

; Function Attrs: nounwind uwtable
define i32 @f1(i32 %global_param_1) #0 {
  %1 = alloca i32, align 4
  store i32 %global_param_1, i32* %1, align 4
  %2 = load i32, i32* %1, align 4
  ret i32 %2
}

; Function Attrs: nounwind uwtable
define i32 @f2(i32 %global_param_2) #0 {
  %1 = alloca i32, align 4
  store i32 %global_param_2, i32* %1, align 4
  %2 = load i32, i32* %1, align 4
  ret i32 %2
}

; Function Attrs: nounwind uwtable
define i32 @g1() #0 {
  %global_local_1 = alloca i32, align 4
  store i32 7, i32* %global_local_1, align 4
  %1 = load i32, i32* %global_local_1, align 4
  ret i32 %1
}

; Function Attrs: nounwind uwtable
define i32 @g2() #0 {
  %global_local_2 = alloca i32, align 4
  store i32 7, i32* %global_local_2, align 4
  %1 = load i32, i32* %global_local_2, align 4
  ret i32 %1
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %err = alloca i32, align 4
  store i32 0, i32* %1
  store i32 0, i32* %err, align 4
  %2 = call i32 @f1(i32 7)
  %3 = icmp ne i32 %2, 7
  br i1 %3, label %4, label %8

; <label>:4                                       ; preds = %0
  %5 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str, i32 0, i32 0))
  %6 = load i32, i32* %err, align 4
  %7 = add nsw i32 %6, 1
  store i32 %7, i32* %err, align 4
  br label %8

; <label>:8                                       ; preds = %4, %0
  %9 = call i32 @f2(i32 7)
  %10 = icmp ne i32 %9, 7
  br i1 %10, label %11, label %15

; <label>:11                                      ; preds = %8
  %12 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i32 0, i32 0))
  %13 = load i32, i32* %err, align 4
  %14 = add nsw i32 %13, 1
  store i32 %14, i32* %err, align 4
  br label %15

; <label>:15                                      ; preds = %11, %8
  %16 = call i32 @g1()
  %17 = icmp ne i32 %16, 7
  br i1 %17, label %18, label %22

; <label>:18                                      ; preds = %15
  %19 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.2, i32 0, i32 0))
  %20 = load i32, i32* %err, align 4
  %21 = add nsw i32 %20, 1
  store i32 %21, i32* %err, align 4
  br label %22

; <label>:22                                      ; preds = %18, %15
  %23 = call i32 @g2()
  %24 = icmp ne i32 %23, 7
  br i1 %24, label %25, label %29

; <label>:25                                      ; preds = %22
  %26 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.3, i32 0, i32 0))
  %27 = load i32, i32* %err, align 4
  %28 = add nsw i32 %27, 1
  store i32 %28, i32* %err, align 4
  br label %29

; <label>:29                                      ; preds = %25, %22
  %30 = load i32, i32* %err, align 4
  %31 = icmp ne i32 %30, 0
  br i1 %31, label %34, label %32

; <label>:32                                      ; preds = %29
  %33 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.4, i32 0, i32 0))
  br label %34

; <label>:34                                      ; preds = %32, %29
  ret i32 0
}

declare i32 @printf(i8*, ...) #1

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = !{!"Ubuntu clang version 3.7.1-svn253571-1~exp1 (branches/release_37) (based on LLVM 3.7.1)"}
