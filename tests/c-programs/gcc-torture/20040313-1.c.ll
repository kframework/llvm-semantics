; ModuleID = './20040313-1.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %t = alloca [1025 x i32], align 16
  %d = alloca i32, align 4
  store i32 0, i32* %1
  %2 = bitcast [1025 x i32]* %t to i8*
  call void @llvm.memset.p0i8.i64(i8* %2, i8 0, i64 4100, i32 16, i1 false)
  %3 = bitcast i8* %2 to [1025 x i32]*
  %4 = getelementptr [1025 x i32], [1025 x i32]* %3, i32 0, i32 0
  store i32 1024, i32* %4
  store i32 0, i32* %d, align 4
  %5 = load i32, i32* %d, align 4
  %6 = sext i32 %5 to i64
  %7 = getelementptr inbounds [1025 x i32], [1025 x i32]* %t, i32 0, i64 %6
  %8 = load i32, i32* %7, align 4
  %9 = add nsw i32 %8, 1
  store i32 %9, i32* %7, align 4
  store i32 %8, i32* %d, align 4
  %10 = getelementptr inbounds [1025 x i32], [1025 x i32]* %t, i32 0, i64 0
  %11 = load i32, i32* %10, align 4
  %12 = icmp ne i32 %11, 1025
  br i1 %12, label %13, label %14

; <label>:13                                      ; preds = %0
  call void @abort() #3
  unreachable

; <label>:14                                      ; preds = %0
  %15 = load i32, i32* %d, align 4
  %16 = icmp ne i32 %15, 1024
  br i1 %16, label %17, label %18

; <label>:17                                      ; preds = %14
  call void @abort() #3
  unreachable

; <label>:18                                      ; preds = %14
  ret i32 0
}

; Function Attrs: nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture, i8, i64, i32, i1) #1

; Function Attrs: noreturn nounwind
declare void @abort() #2

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind }
attributes #2 = { noreturn nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { noreturn nounwind }

!llvm.ident = !{!0}

!0 = !{!"Ubuntu clang version 3.7.1-svn253571-1~exp1 (branches/release_37) (based on LLVM 3.7.1)"}
