; ModuleID = './2003-05-21-UnionBitfields.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%union.anon = type { double }
%struct.anon = type { i32, i32 }

@.str = private unnamed_addr constant [7 x i8] c"%d %d\0A\00", align 1

; Function Attrs: nounwind uwtable
define i32 @target_isinf(double %x) #0 {
  %1 = alloca double, align 8
  %u = alloca %union.anon, align 8
  store double %x, double* %1, align 8
  %2 = load double, double* %1, align 8
  %3 = bitcast %union.anon* %u to double*
  store double %2, double* %3, align 8
  %4 = bitcast %union.anon* %u to %struct.anon*
  %5 = getelementptr inbounds %struct.anon, %struct.anon* %4, i32 0, i32 1
  %6 = load i32, i32* %5, align 4
  %7 = lshr i32 %6, 20
  %8 = and i32 %7, 2047
  %9 = icmp eq i32 %8, 2047
  br i1 %9, label %10, label %21

; <label>:10                                      ; preds = %0
  %11 = bitcast %union.anon* %u to %struct.anon*
  %12 = getelementptr inbounds %struct.anon, %struct.anon* %11, i32 0, i32 1
  %13 = load i32, i32* %12, align 4
  %14 = and i32 %13, 1048575
  %15 = icmp eq i32 %14, 0
  br i1 %15, label %16, label %21

; <label>:16                                      ; preds = %10
  %17 = bitcast %union.anon* %u to %struct.anon*
  %18 = getelementptr inbounds %struct.anon, %struct.anon* %17, i32 0, i32 0
  %19 = load i32, i32* %18, align 4
  %20 = icmp eq i32 %19, 0
  br label %21

; <label>:21                                      ; preds = %16, %10, %0
  %22 = phi i1 [ false, %10 ], [ false, %0 ], [ %20, %16 ]
  %23 = zext i1 %22 to i32
  ret i32 %23
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  store i32 0, i32* %1
  %2 = call i32 @target_isinf(double 1.234420e+03)
  %3 = call i32 @target_isinf(double 0x7FF0000000000000)
  %4 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i32 0, i32 0), i32 %2, i32 %3)
  ret i32 0
}

declare i32 @printf(i8*, ...) #1

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = !{!"Ubuntu clang version 3.7.1-svn253571-1~exp1 (branches/release_37) (based on LLVM 3.7.1)"}
