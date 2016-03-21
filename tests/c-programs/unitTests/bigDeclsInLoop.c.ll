; ModuleID = './bigDeclsInLoop.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.anon = type { i32, [2 x i32], i8, %struct.anon.0, %union.anon, i32 ()* }
%struct.anon.0 = type { i32 }
%union.anon = type { i32 }

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %i = alloca i32, align 4
  %s = alloca [2 x %struct.anon], align 16
  store i32 0, i32* %1
  store i32 0, i32* %i, align 4
  br label %2

; <label>:2                                       ; preds = %12, %0
  %3 = load i32, i32* %i, align 4
  %4 = icmp slt i32 %3, 100
  br i1 %4, label %5, label %15

; <label>:5                                       ; preds = %2
  %6 = bitcast [2 x %struct.anon]* %s to i8*
  call void @llvm.memset.p0i8.i64(i8* %6, i8 0, i64 64, i32 16, i1 false)
  %7 = bitcast i8* %6 to [2 x %struct.anon]*
  %8 = getelementptr [2 x %struct.anon], [2 x %struct.anon]* %7, i32 0, i32 0
  %9 = getelementptr %struct.anon, %struct.anon* %8, i32 0, i32 0
  store i32 1, i32* %9
  %10 = getelementptr [2 x %struct.anon], [2 x %struct.anon]* %7, i32 0, i32 1
  %11 = getelementptr %struct.anon, %struct.anon* %10, i32 0, i32 0
  store i32 2, i32* %11
  br label %12

; <label>:12                                      ; preds = %5
  %13 = load i32, i32* %i, align 4
  %14 = add nsw i32 %13, 1
  store i32 %14, i32* %i, align 4
  br label %2

; <label>:15                                      ; preds = %2
  ret i32 0
}

; Function Attrs: nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture, i8, i64, i32, i1) #1

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind }

!llvm.ident = !{!0}

!0 = !{!"Ubuntu clang version 3.7.1-svn253571-1~exp1 (branches/release_37) (based on LLVM 3.7.1)"}
