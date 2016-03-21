; ModuleID = './local-union.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%union.foo = type { i32 }
%union.foo.0 = type { float }

@.str = private unnamed_addr constant [14 x i8] c"return  = %f\0A\00", align 1

; Function Attrs: nounwind uwtable
define double @test(%union.foo* %F) #0 {
  %1 = alloca %union.foo*, align 8
  %A = alloca %union.foo.0, align 4
  store %union.foo* %F, %union.foo** %1, align 8
  %2 = bitcast %union.foo.0* %A to i32*
  store i32 -1, i32* %2, align 4
  %3 = bitcast %union.foo.0* %A to float*
  %4 = load float, float* %3, align 4
  %5 = fpext float %4 to double
  ret double %5
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %F = alloca %union.foo, align 4
  store i32 0, i32* %1
  %2 = call double @test(%union.foo* %F)
  %3 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str, i32 0, i32 0), double %2)
  ret i32 0
}

declare i32 @printf(i8*, ...) #1

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = !{!"Ubuntu clang version 3.7.1-svn253571-1~exp1 (branches/release_37) (based on LLVM 3.7.1)"}
