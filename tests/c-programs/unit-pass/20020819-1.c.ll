; ModuleID = './20020819-1.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: nounwind uwtable
define i32 @foo() #0 {
  ret i32 0
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %k = alloca i32, align 4
  %ccp_bad = alloca i32, align 4
  store i32 0, i32* %1
  store i32 0, i32* %ccp_bad, align 4
  store i32 0, i32* %i, align 4
  br label %2

; <label>:2                                       ; preds = %25, %0
  %3 = load i32, i32* %i, align 4
  %4 = icmp slt i32 %3, 10
  br i1 %4, label %5, label %28

; <label>:5                                       ; preds = %2
  store i32 0, i32* %j, align 4
  br label %6

; <label>:6                                       ; preds = %14, %5
  %7 = load i32, i32* %j, align 4
  %8 = icmp slt i32 %7, 10
  br i1 %8, label %9, label %17

; <label>:9                                       ; preds = %6
  %10 = call i32 @foo()
  %11 = icmp ne i32 %10, 0
  br i1 %11, label %12, label %13

; <label>:12                                      ; preds = %9
  store i32 1, i32* %ccp_bad, align 4
  br label %13

; <label>:13                                      ; preds = %12, %9
  br label %14

; <label>:14                                      ; preds = %13
  %15 = load i32, i32* %j, align 4
  %16 = add nsw i32 %15, 1
  store i32 %16, i32* %j, align 4
  br label %6

; <label>:17                                      ; preds = %6
  %18 = load i32, i32* %ccp_bad, align 4
  %19 = icmp ne i32 %18, 0
  %20 = zext i1 %19 to i32
  store i32 %20, i32* %k, align 4
  %21 = load i32, i32* %k, align 4
  %22 = icmp ne i32 %21, 0
  br i1 %22, label %23, label %24

; <label>:23                                      ; preds = %17
  call void @abort() #2
  unreachable

; <label>:24                                      ; preds = %17
  br label %25

; <label>:25                                      ; preds = %24
  %26 = load i32, i32* %i, align 4
  %27 = add nsw i32 %26, 1
  store i32 %27, i32* %i, align 4
  br label %2

; <label>:28                                      ; preds = %2
  call void @exit(i32 0) #2
  unreachable
                                                  ; No predecessors!
  %30 = load i32, i32* %1
  ret i32 %30
}

; Function Attrs: noreturn nounwind
declare void @abort() #1

; Function Attrs: noreturn nounwind
declare void @exit(i32) #1

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { noreturn nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noreturn nounwind }

!llvm.ident = !{!0}

!0 = !{!"Ubuntu clang version 3.7.1-svn253571-1~exp1 (branches/release_37) (based on LLVM 3.7.1)"}
