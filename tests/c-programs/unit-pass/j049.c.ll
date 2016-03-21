; ModuleID = './j049.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %a = alloca [4 x [5 x i32]], align 16
  %b = alloca [4 x [3 x i32]], align 16
  %z = alloca i32, align 4
  %c = alloca [4 x [5 x i32]], align 16
  store i32 0, i32* %1
  %2 = bitcast [4 x [5 x i32]]* %a to i8*
  call void @llvm.memset.p0i8.i64(i8* %2, i8 0, i64 80, i32 16, i1 false)
  %3 = getelementptr inbounds [4 x [5 x i32]], [4 x [5 x i32]]* %a, i32 0, i64 2
  %4 = getelementptr inbounds [5 x i32], [5 x i32]* %3, i32 0, i64 3
  %5 = load i32, i32* %4, align 4
  %6 = bitcast [4 x [3 x i32]]* %b to i8*
  call void @llvm.memset.p0i8.i64(i8* %6, i8 0, i64 48, i32 16, i1 false)
  %7 = getelementptr inbounds [4 x [3 x i32]], [4 x [3 x i32]]* %b, i32 0, i64 0
  %8 = getelementptr inbounds [3 x i32], [3 x i32]* %7, i32 0, i64 0
  %9 = load i32, i32* %8, align 4
  store i32 %9, i32* %z, align 4
  %10 = bitcast [4 x [5 x i32]]* %c to i8*
  call void @llvm.memset.p0i8.i64(i8* %10, i8 0, i64 80, i32 16, i1 false)
  %11 = getelementptr inbounds [4 x [5 x i32]], [4 x [5 x i32]]* %c, i32 0, i32 0
  %12 = getelementptr inbounds [5 x i32], [5 x i32]* %11, i32 0, i32 0
  %13 = getelementptr inbounds i32, i32* %12, i64 2
  %14 = getelementptr inbounds i32, i32* %13, i64 2
  %15 = load i32, i32* %14, align 4
  ret i32 0
}

; Function Attrs: nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture, i8, i64, i32, i1) #1

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind }

!llvm.ident = !{!0}

!0 = !{!"Ubuntu clang version 3.7.1-svn253571-1~exp1 (branches/release_37) (based on LLVM 3.7.1)"}
