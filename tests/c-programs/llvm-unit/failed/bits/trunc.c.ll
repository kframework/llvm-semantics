; ModuleID = './trunc.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [15 x i8] c"test() y = %d\0A\00", align 1
@.str.1 = private unnamed_addr constant [6 x i8] c"x=%x\0A\00", align 1
@.str.2 = private unnamed_addr constant [7 x i8] c"error\0A\00", align 1

; Function Attrs: nounwind uwtable
define i32 @test(i32 %v) #0 {
  %1 = alloca i32, align 4
  %y = alloca i32, align 4
  store i32 %v, i32* %1, align 4
  %2 = load i32, i32* %1, align 4
  %3 = mul nsw i32 %2, -1
  store i32 %3, i32* %y, align 4
  %4 = load i32, i32* %y, align 4
  %5 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str, i32 0, i32 0), i32 %4)
  ret i32 0
}

declare i32 @printf(i8*, ...) #1

; Function Attrs: nounwind uwtable
define i32 @main(i32 %argc, i8** %argv) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i8**, align 8
  %num = alloca i32, align 4
  %x = alloca i32, align 4
  store i32 0, i32* %1
  store i32 %argc, i32* %2, align 4
  store i8** %argv, i8*** %3, align 8
  %4 = load i32, i32* %2, align 4
  %5 = icmp sgt i32 %4, 1
  br i1 %5, label %6, label %11

; <label>:6                                       ; preds = %0
  %7 = load i8**, i8*** %3, align 8
  %8 = getelementptr inbounds i8*, i8** %7, i64 1
  %9 = load i8*, i8** %8, align 8
  %10 = call i32 (i8*, ...) bitcast (i32 (...)* @atoi to i32 (i8*, ...)*)(i8* %9)
  store i32 %10, i32* %num, align 4
  br label %11

; <label>:11                                      ; preds = %6, %0
  %12 = load i32, i32* %num, align 4
  %13 = call i32 @test(i32 %12)
  %14 = load i32, i32* %num, align 4
  %15 = sub nsw i32 %14, 14638709
  store i32 %15, i32* %num, align 4
  %16 = load i32, i32* %num, align 4
  store i32 %16, i32* %x, align 4
  %17 = load i32, i32* %x, align 4
  %18 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.1, i32 0, i32 0), i32 %17)
  %19 = load i32, i32* %x, align 4
  %20 = icmp ne i32 %19, 1
  br i1 %20, label %21, label %23

; <label>:21                                      ; preds = %11
  %22 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.2, i32 0, i32 0))
  br label %23

; <label>:23                                      ; preds = %21, %11
  %24 = load i32, i32* %x, align 4
  %25 = call i32 @test(i32 %24)
  ret i32 0
}

declare i32 @atoi(...) #1

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = !{!"Ubuntu clang version 3.7.1-svn253571-1~exp1 (branches/release_37) (based on LLVM 3.7.1)"}
