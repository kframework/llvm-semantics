; ModuleID = './20000227-1.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@f = internal constant [3 x i8] c"\00\FF\00", align 1
@g = internal constant [3 x i8] c"\00\FF\00", align 1

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  store i32 0, i32* %1
  %2 = load i8, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @f, i32 0, i64 0), align 1
  %3 = zext i8 %2 to i32
  %4 = load i8, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @g, i32 0, i64 0), align 1
  %5 = zext i8 %4 to i32
  %6 = icmp ne i32 %3, %5
  br i1 %6, label %7, label %8

; <label>:7                                       ; preds = %0
  call void @abort() #2
  unreachable

; <label>:8                                       ; preds = %0
  %9 = load i8, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @f, i32 0, i64 1), align 1
  %10 = zext i8 %9 to i32
  %11 = load i8, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @g, i32 0, i64 1), align 1
  %12 = zext i8 %11 to i32
  %13 = icmp ne i32 %10, %12
  br i1 %13, label %14, label %15

; <label>:14                                      ; preds = %8
  call void @abort() #2
  unreachable

; <label>:15                                      ; preds = %8
  %16 = load i8, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @f, i32 0, i64 2), align 1
  %17 = zext i8 %16 to i32
  %18 = load i8, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @g, i32 0, i64 2), align 1
  %19 = zext i8 %18 to i32
  %20 = icmp ne i32 %17, %19
  br i1 %20, label %21, label %22

; <label>:21                                      ; preds = %15
  call void @abort() #2
  unreachable

; <label>:22                                      ; preds = %15
  ret i32 0
}

; Function Attrs: noreturn nounwind
declare void @abort() #1

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { noreturn nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noreturn nounwind }

!llvm.ident = !{!0}

!0 = !{!"Ubuntu clang version 3.7.1-svn253571-1~exp1 (branches/release_37) (based on LLVM 3.7.1)"}
