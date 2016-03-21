; ModuleID = './pr43236.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %A = alloca [30 x i8], align 16
  %B = alloca [30 x i8], align 16
  %C = alloca [30 x i8], align 16
  %i = alloca i32, align 4
  store i32 0, i32* %1
  %2 = getelementptr inbounds [30 x i8], [30 x i8]* %A, i32 0, i32 0
  %3 = call i8* @memset(i8* %2, i32 1, i32 30)
  %4 = getelementptr inbounds [30 x i8], [30 x i8]* %B, i32 0, i32 0
  %5 = call i8* @memset(i8* %4, i32 1, i32 30)
  store i32 20, i32* %i, align 4
  br label %6

; <label>:6                                       ; preds = %10, %0
  %7 = load i32, i32* %i, align 4
  %8 = add nsw i32 %7, -1
  store i32 %8, i32* %i, align 4
  %9 = icmp sgt i32 %7, 10
  br i1 %9, label %10, label %17

; <label>:10                                      ; preds = %6
  %11 = load i32, i32* %i, align 4
  %12 = sext i32 %11 to i64
  %13 = getelementptr inbounds [30 x i8], [30 x i8]* %A, i32 0, i64 %12
  store i8 0, i8* %13, align 1
  %14 = load i32, i32* %i, align 4
  %15 = sext i32 %14 to i64
  %16 = getelementptr inbounds [30 x i8], [30 x i8]* %B, i32 0, i64 %15
  store i8 0, i8* %16, align 1
  br label %6

; <label>:17                                      ; preds = %6
  %18 = getelementptr inbounds [30 x i8], [30 x i8]* %C, i32 0, i32 0
  %19 = call i8* @memset(i8* %18, i32 1, i32 30)
  %20 = getelementptr inbounds [30 x i8], [30 x i8]* %C, i32 0, i32 0
  %21 = getelementptr inbounds i8, i8* %20, i64 10
  %22 = call i8* @memset(i8* %21, i32 0, i32 10)
  %23 = getelementptr inbounds [30 x i8], [30 x i8]* %A, i32 0, i32 0
  %24 = getelementptr inbounds [30 x i8], [30 x i8]* %C, i32 0, i32 0
  %25 = call i32 @memcmp(i8* %23, i8* %24, i32 30)
  %26 = icmp ne i32 %25, 0
  br i1 %26, label %32, label %27

; <label>:27                                      ; preds = %17
  %28 = getelementptr inbounds [30 x i8], [30 x i8]* %B, i32 0, i32 0
  %29 = getelementptr inbounds [30 x i8], [30 x i8]* %C, i32 0, i32 0
  %30 = call i32 @memcmp(i8* %28, i8* %29, i32 30)
  %31 = icmp ne i32 %30, 0
  br i1 %31, label %32, label %33

; <label>:32                                      ; preds = %27, %17
  call void @abort() #3
  unreachable

; <label>:33                                      ; preds = %27
  ret i32 0
}

declare i8* @memset(i8*, i32, i32) #1

declare i32 @memcmp(i8*, i8*, i32) #1

; Function Attrs: noreturn
declare void @abort() #2

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noreturn "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { noreturn }

!llvm.ident = !{!0}

!0 = !{!"Ubuntu clang version 3.7.1-svn253571-1~exp1 (branches/release_37) (based on LLVM 3.7.1)"}
