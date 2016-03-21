; ModuleID = './folding.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@myConst = constant i32 1, align 4
@myConst2 = constant i32 32767, align 4
@.str = private unnamed_addr constant [24 x i8] c"error1: x = %d, y = %d\0A\00", align 1
@.str.1 = private unnamed_addr constant [24 x i8] c"error2: x = %d, y = %d\0A\00", align 1
@.str.2 = private unnamed_addr constant [24 x i8] c"error3: x = %d, y = %d\0A\00", align 1
@.str.3 = private unnamed_addr constant [24 x i8] c"error4: x = %d, y = %d\0A\00", align 1

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %x = alloca i32, align 4
  %y = alloca i32, align 4
  %z = alloca i32, align 4
  %u = alloca i32, align 4
  store i32 0, i32* %1
  store i32 8, i32* %x, align 4
  %2 = load i32, i32* %x, align 4
  %3 = add nsw i32 %2, 1
  store i32 %3, i32* %y, align 4
  %4 = load i32, i32* %y, align 4
  %5 = load i32, i32* %x, align 4
  %6 = sub nsw i32 %4, %5
  %7 = icmp ne i32 %6, 1
  br i1 %7, label %8, label %12

; <label>:8                                       ; preds = %0
  %9 = load i32, i32* %x, align 4
  %10 = load i32, i32* %y, align 4
  %11 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([24 x i8], [24 x i8]* @.str, i32 0, i32 0), i32 %9, i32 %10)
  br label %12

; <label>:12                                      ; preds = %8, %0
  store i32 128, i32* %x, align 4
  %13 = load i32, i32* %y, align 4
  %14 = load i32, i32* %x, align 4
  %15 = sub nsw i32 %13, %14
  %16 = icmp ne i32 %15, 9
  br i1 %16, label %17, label %21

; <label>:17                                      ; preds = %12
  %18 = load i32, i32* %x, align 4
  %19 = load i32, i32* %y, align 4
  %20 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([24 x i8], [24 x i8]* @.str.1, i32 0, i32 0), i32 %18, i32 %19)
  br label %21

; <label>:21                                      ; preds = %17, %12
  %22 = load i32, i32* %y, align 4
  store i32 %22, i32* %z, align 4
  %23 = load i32, i32* %z, align 4
  %24 = and i32 %23, 32767
  store i32 %24, i32* %z, align 4
  %25 = load i32, i32* %z, align 4
  %26 = icmp ne i32 %25, 9
  br i1 %26, label %27, label %31

; <label>:27                                      ; preds = %21
  %28 = load i32, i32* %x, align 4
  %29 = load i32, i32* %y, align 4
  %30 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([24 x i8], [24 x i8]* @.str.2, i32 0, i32 0), i32 %28, i32 %29)
  br label %31

; <label>:31                                      ; preds = %27, %21
  store i32 127, i32* %u, align 4
  %32 = load i32, i32* %u, align 4
  %33 = add i32 %32, 1
  store i32 %33, i32* %u, align 4
  %34 = load i32, i32* %u, align 4
  %35 = icmp ne i32 %34, 0
  br i1 %35, label %36, label %40

; <label>:36                                      ; preds = %31
  %37 = load i32, i32* %x, align 4
  %38 = load i32, i32* %y, align 4
  %39 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([24 x i8], [24 x i8]* @.str.3, i32 0, i32 0), i32 %37, i32 %38)
  br label %40

; <label>:40                                      ; preds = %36, %31
  ret i32 0
}

declare i32 @printf(i8*, ...) #1

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = !{!"Ubuntu clang version 3.7.1-svn253571-1~exp1 (branches/release_37) (based on LLVM 3.7.1)"}
