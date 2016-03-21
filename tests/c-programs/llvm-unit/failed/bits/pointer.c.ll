; ModuleID = './pointer.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [7 x i8] c"error\0A\00", align 1
@.str.1 = private unnamed_addr constant [27 x i8] c"error2: &i31=%p, ret = %p\0A\00", align 1

; Function Attrs: nounwind uwtable
define i32* @test(i32* %C) #0 {
  %1 = alloca i32*, align 8
  store i32* %C, i32** %1, align 8
  %2 = load i32*, i32** %1, align 8
  %3 = getelementptr inbounds i32, i32* %2, i64 -1
  ret i32* %3
}

; Function Attrs: nounwind uwtable
define i32* @test2(i32* %I) #0 {
  %1 = alloca i32*, align 8
  store i32* %I, i32** %1, align 8
  %2 = load i32*, i32** %1, align 8
  %3 = getelementptr inbounds i32, i32* %2, i64 -1
  ret i32* %3
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %i3 = alloca i32, align 4
  %i31 = alloca i32, align 4
  store i32 0, i32* %1
  %2 = call i32* @test(i32* %i3)
  %3 = getelementptr inbounds i32, i32* %2, i64 1
  %4 = icmp ne i32* %i3, %3
  br i1 %4, label %5, label %7

; <label>:5                                       ; preds = %0
  %6 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i32 0, i32 0))
  br label %7

; <label>:7                                       ; preds = %5, %0
  %8 = call i32* @test2(i32* %i31)
  %9 = getelementptr inbounds i32, i32* %8, i64 1
  %10 = icmp ne i32* %i31, %9
  br i1 %10, label %11, label %14

; <label>:11                                      ; preds = %7
  %12 = call i32* @test2(i32* %i31)
  %13 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([27 x i8], [27 x i8]* @.str.1, i32 0, i32 0), i32* %i31, i32* %12)
  br label %14

; <label>:14                                      ; preds = %11, %7
  ret i32 0
}

declare i32 @printf(i8*, ...) #1

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = !{!"Ubuntu clang version 3.7.1-svn253571-1~exp1 (branches/release_37) (based on LLVM 3.7.1)"}
