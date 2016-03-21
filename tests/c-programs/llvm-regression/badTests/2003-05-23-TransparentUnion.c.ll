; ModuleID = './2003-05-23-TransparentUnion.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%union.UNION = type { float* }

@.str = private unnamed_addr constant [3 x i8] c"ok\00", align 1

; Function Attrs: nounwind uwtable
define i32 @try(float* %U.coerce) #0 {
  %U = alloca %union.UNION, align 8
  %1 = getelementptr %union.UNION, %union.UNION* %U, i32 0, i32 0
  store float* %U.coerce, float** %1, align 8
  ret i32 1
}

; Function Attrs: nounwind uwtable
define i32 @test() #0 {
  %I = alloca i32, align 4
  %F = alloca float, align 4
  %1 = alloca %union.UNION, align 8
  %2 = alloca %union.UNION, align 8
  %3 = bitcast %union.UNION* %1 to i32**
  store i32* %I, i32** %3, align 8
  %4 = getelementptr %union.UNION, %union.UNION* %1, i32 0, i32 0
  %5 = load float*, float** %4, align 8
  %6 = call i32 @try(float* %5)
  %7 = bitcast %union.UNION* %2 to float**
  store float* %F, float** %7, align 8
  %8 = getelementptr %union.UNION, %union.UNION* %2, i32 0, i32 0
  %9 = load float*, float** %8, align 8
  %10 = call i32 @try(float* %9)
  %11 = or i32 %6, %10
  ret i32 %11
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  store i32 0, i32* %1
  %2 = call i32 @test()
  %3 = icmp ne i32 %2, 0
  br i1 %3, label %4, label %6

; <label>:4                                       ; preds = %0
  %5 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i32 0, i32 0))
  br label %6

; <label>:6                                       ; preds = %4, %0
  ret i32 0
}

declare i32 @printf(i8*, ...) #1

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = !{!"Ubuntu clang version 3.7.1-svn253571-1~exp1 (branches/release_37) (based on LLVM 3.7.1)"}
