; ModuleID = './j058.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.anon = type { i32, i32 }
%struct.c_ = type { i32, i32 }

@a = global [2 x i32] [i32 0, i32 1], align 4
@p = global i32* getelementptr inbounds ([2 x i32], [2 x i32]* @a, i32 0, i32 0), align 8
@b = global %struct.anon { i32 0, i32 1 }, align 4
@q = global i32* getelementptr inbounds (%struct.anon, %struct.anon* @b, i32 0, i32 0), align 8
@c = global %struct.c_ { i32 0, i32 1 }, align 4
@rr = global %struct.c_* @c, align 8
@r = global i32* getelementptr inbounds (%struct.c_, %struct.c_* @c, i32 0, i32 0), align 8
@d1 = common global double 0.000000e+00, align 8
@ss = global double* @d1, align 8
@s = global double* @d1, align 8
@e1 = common global i32 0, align 4
@ttt = global i32* @e1, align 8
@tt = global i32** @ttt, align 8
@t1 = global i32* null, align 8
@d2 = common global double 0.000000e+00, align 8
@e2 = common global i32 0, align 4

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %t2 = alloca i32*, align 8
  store i32 0, i32* %1
  store i32* null, i32** %t2, align 8
  %2 = load i32*, i32** @p, align 8
  %3 = load i32, i32* %2, align 4
  %4 = load i32*, i32** @q, align 8
  %5 = load i32, i32* %4, align 4
  %6 = add nsw i32 %3, %5
  %7 = load i32*, i32** @r, align 8
  %8 = load i32, i32* %7, align 4
  %9 = add nsw i32 %6, %8
  %10 = sitofp i32 %9 to double
  %11 = load double*, double** @s, align 8
  %12 = load double, double* %11, align 8
  %13 = fadd double %10, %12
  %14 = load i32*, i32** @t1, align 8
  %15 = load i32*, i32** %t2, align 8
  %16 = icmp ne i32* %14, %15
  %17 = zext i1 %16 to i32
  %18 = sitofp i32 %17 to double
  %19 = fadd double %13, %18
  %20 = fptosi double %19 to i32
  ret i32 %20
}

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = !{!"Ubuntu clang version 3.7.1-svn253571-1~exp1 (branches/release_37) (based on LLVM 3.7.1)"}
