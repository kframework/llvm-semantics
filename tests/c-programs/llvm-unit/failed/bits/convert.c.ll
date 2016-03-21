; ModuleID = './convert.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [25 x i8] c"error: i15=%d, i31 = %d\0A\00", align 1
@.str.1 = private unnamed_addr constant [27 x i8] c"error: ui15=%u, ui31 = %u\0A\00", align 1
@.str.2 = private unnamed_addr constant [14 x i8] c"error: i8=%d\0A\00", align 1
@.str.3 = private unnamed_addr constant [7 x i8] c"i7=%d\0A\00", align 1
@.str.4 = private unnamed_addr constant [8 x i8] c"ui8=%u\0A\00", align 1
@.str.5 = private unnamed_addr constant [7 x i8] c"i8=%d\0A\00", align 1
@.str.6 = private unnamed_addr constant [8 x i8] c"ui7=%u\0A\00", align 1

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %i7 = alloca i32, align 4
  %i15 = alloca i32, align 4
  %i31 = alloca i32, align 4
  %i8 = alloca i32, align 4
  %ui7 = alloca i32, align 4
  %ui15 = alloca i32, align 4
  %ui31 = alloca i32, align 4
  %ui8 = alloca i32, align 4
  store i32 0, i32* %1
  store i32 127, i32* %i7, align 4
  %2 = load i32, i32* %i7, align 4
  store i32 %2, i32* %i15, align 4
  %3 = load i32, i32* %i15, align 4
  store i32 %3, i32* %i31, align 4
  %4 = load i32, i32* %i15, align 4
  %5 = icmp ne i32 %4, -1
  br i1 %5, label %9, label %6

; <label>:6                                       ; preds = %0
  %7 = load i32, i32* %i31, align 4
  %8 = icmp ne i32 %7, -1
  br i1 %8, label %9, label %13

; <label>:9                                       ; preds = %6, %0
  %10 = load i32, i32* %i15, align 4
  %11 = load i32, i32* %i31, align 4
  %12 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([25 x i8], [25 x i8]* @.str, i32 0, i32 0), i32 %10, i32 %11)
  br label %13

; <label>:13                                      ; preds = %9, %6
  store i32 127, i32* %ui7, align 4
  %14 = load i32, i32* %ui7, align 4
  store i32 %14, i32* %ui15, align 4
  %15 = load i32, i32* %ui15, align 4
  store i32 %15, i32* %ui31, align 4
  %16 = load i32, i32* %ui15, align 4
  %17 = icmp ne i32 %16, 127
  br i1 %17, label %21, label %18

; <label>:18                                      ; preds = %13
  %19 = load i32, i32* %ui31, align 4
  %20 = icmp ne i32 %19, 127
  br i1 %20, label %21, label %25

; <label>:21                                      ; preds = %18, %13
  %22 = load i32, i32* %ui15, align 4
  %23 = load i32, i32* %ui31, align 4
  %24 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([27 x i8], [27 x i8]* @.str.1, i32 0, i32 0), i32 %22, i32 %23)
  br label %25

; <label>:25                                      ; preds = %21, %18
  store i32 -1, i32* %i31, align 4
  %26 = load i32, i32* %i31, align 4
  store i32 %26, i32* %i8, align 4
  %27 = load i32, i32* %i8, align 4
  %28 = icmp ne i32 %27, -1
  br i1 %28, label %29, label %32

; <label>:29                                      ; preds = %25
  %30 = load i32, i32* %i8, align 4
  %31 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.2, i32 0, i32 0), i32 %30)
  br label %32

; <label>:32                                      ; preds = %29, %25
  store i32 255, i32* %i31, align 4
  %33 = load i32, i32* %i31, align 4
  store i32 %33, i32* %i7, align 4
  %34 = load i32, i32* %i7, align 4
  %35 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.3, i32 0, i32 0), i32 %34)
  store i32 511, i32* %ui31, align 4
  %36 = load i32, i32* %ui31, align 4
  store i32 %36, i32* %ui8, align 4
  %37 = load i32, i32* %ui8, align 4
  %38 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.4, i32 0, i32 0), i32 %37)
  %39 = load i32, i32* %ui8, align 4
  store i32 %39, i32* %i8, align 4
  %40 = load i32, i32* %i8, align 4
  %41 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.5, i32 0, i32 0), i32 %40)
  %42 = load i32, i32* %i7, align 4
  store i32 %42, i32* %ui7, align 4
  %43 = load i32, i32* %ui7, align 4
  %44 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.6, i32 0, i32 0), i32 %43)
  ret i32 0
}

declare i32 @printf(i8*, ...) #1

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = !{!"Ubuntu clang version 3.7.1-svn253571-1~exp1 (branches/release_37) (based on LLVM 3.7.1)"}
