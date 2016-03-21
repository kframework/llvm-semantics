; ModuleID = './pr42142.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@sort.end = private unnamed_addr constant [2 x i32] [i32 10, i32 10], align 4

; Function Attrs: noinline nounwind uwtable
define i32 @sort(i32 %L) #0 {
  %1 = alloca i32, align 4
  %end = alloca [2 x i32], align 4
  %i = alloca i32, align 4
  %R = alloca i32, align 4
  store i32 %L, i32* %1, align 4
  %2 = bitcast [2 x i32]* %end to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %2, i8* bitcast ([2 x i32]* @sort.end to i8*), i64 8, i32 4, i1 false)
  store i32 0, i32* %i, align 4
  br label %3

; <label>:3                                       ; preds = %25, %0
  %4 = load i32, i32* %i, align 4
  %5 = icmp slt i32 %4, 2
  br i1 %5, label %6, label %26

; <label>:6                                       ; preds = %3
  %7 = load i32, i32* %i, align 4
  %8 = sext i32 %7 to i64
  %9 = getelementptr inbounds [2 x i32], [2 x i32]* %end, i32 0, i64 %8
  %10 = load i32, i32* %9, align 4
  store i32 %10, i32* %R, align 4
  %11 = load i32, i32* %1, align 4
  %12 = load i32, i32* %R, align 4
  %13 = icmp slt i32 %11, %12
  br i1 %13, label %14, label %24

; <label>:14                                      ; preds = %6
  %15 = load i32, i32* %i, align 4
  %16 = add nsw i32 %15, 1
  %17 = sext i32 %16 to i64
  %18 = getelementptr inbounds [2 x i32], [2 x i32]* %end, i32 0, i64 %17
  store i32 1, i32* %18, align 4
  %19 = load i32, i32* %i, align 4
  %20 = sext i32 %19 to i64
  %21 = getelementptr inbounds [2 x i32], [2 x i32]* %end, i32 0, i64 %20
  store i32 10, i32* %21, align 4
  %22 = load i32, i32* %i, align 4
  %23 = add nsw i32 %22, 1
  store i32 %23, i32* %i, align 4
  br label %25

; <label>:24                                      ; preds = %6
  br label %26

; <label>:25                                      ; preds = %14
  br label %3

; <label>:26                                      ; preds = %24, %3
  %27 = load i32, i32* %i, align 4
  ret i32 %27
}

; Function Attrs: nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture readonly, i64, i32, i1) #1

; Function Attrs: nounwind uwtable
define i32 @main() #2 {
  %1 = alloca i32, align 4
  store i32 0, i32* %1
  %2 = call i32 @sort(i32 5)
  %3 = icmp ne i32 %2, 1
  br i1 %3, label %4, label %5

; <label>:4                                       ; preds = %0
  call void @abort() #4
  unreachable

; <label>:5                                       ; preds = %0
  ret i32 0
}

; Function Attrs: noreturn nounwind
declare void @abort() #3

attributes #0 = { noinline nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind }
attributes #2 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { noreturn nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { noreturn nounwind }

!llvm.ident = !{!0}

!0 = !{!"Ubuntu clang version 3.7.1-svn253571-1~exp1 (branches/release_37) (based on LLVM 3.7.1)"}
