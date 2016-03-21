; ModuleID = './static.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@test.x = internal global i32 0, align 4
@.str = private unnamed_addr constant [7 x i8] c"error\0A\00", align 1

; Function Attrs: nounwind uwtable
define i32 @test(i32 %y, i32* %z) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32*, align 8
  store i32 %y, i32* %1, align 4
  store i32* %z, i32** %2, align 8
  %3 = load i32, i32* @test.x, align 4
  %4 = load i32*, i32** %2, align 8
  store i32 %3, i32* %4, align 4
  %5 = load i32, i32* %1, align 4
  store i32 %5, i32* @test.x, align 4
  %6 = load i32, i32* @test.x, align 4
  ret i32 %6
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %a = alloca i32, align 4
  %b = alloca i32, align 4
  store i32 0, i32* %1
  %2 = call i32 @test(i32 1, i32* %b)
  store i32 %2, i32* %a, align 4
  %3 = load i32, i32* %b, align 4
  %4 = icmp ne i32 %3, 0
  br i1 %4, label %8, label %5

; <label>:5                                       ; preds = %0
  %6 = load i32, i32* %a, align 4
  %7 = icmp ne i32 %6, 1
  br i1 %7, label %8, label %10

; <label>:8                                       ; preds = %5, %0
  %9 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i32 0, i32 0))
  br label %10

; <label>:10                                      ; preds = %8, %5
  %11 = call i32 @test(i32 -1, i32* %b)
  store i32 %11, i32* %a, align 4
  %12 = load i32, i32* %b, align 4
  %13 = icmp ne i32 %12, 1
  br i1 %13, label %17, label %14

; <label>:14                                      ; preds = %10
  %15 = load i32, i32* %a, align 4
  %16 = icmp ne i32 %15, -1
  br i1 %16, label %17, label %19

; <label>:17                                      ; preds = %14, %10
  %18 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i32 0, i32 0))
  br label %19

; <label>:19                                      ; preds = %17, %14
  ret i32 0
}

declare i32 @printf(i8*, ...) #1

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = !{!"Ubuntu clang version 3.7.1-svn253571-1~exp1 (branches/release_37) (based on LLVM 3.7.1)"}
