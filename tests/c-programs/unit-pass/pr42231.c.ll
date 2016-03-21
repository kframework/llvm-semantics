; ModuleID = './pr42231.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@max = internal global i32 0, align 4

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  store i32 0, i32* %1
  %2 = call i32 @CallFunction(i32 (i32)* @callback)
  %3 = load i32, i32* @max, align 4
  %4 = icmp ne i32 %3, 10
  br i1 %4, label %5, label %6

; <label>:5                                       ; preds = %0
  call void @abort() #3
  unreachable

; <label>:6                                       ; preds = %0
  ret i32 0
}

; Function Attrs: nounwind uwtable
define internal i32 @CallFunction(i32 (i32)* %fun) #0 {
  %1 = alloca i32 (i32)*, align 8
  store i32 (i32)* %fun, i32 (i32)** %1, align 8
  %2 = load i32 (i32)*, i32 (i32)** %1, align 8
  %3 = call i32 @CallFunctionRec(i32 (i32)* %2, i32 1)
  %4 = icmp ne i32 %3, 0
  br i1 %4, label %5, label %10

; <label>:5                                       ; preds = %0
  %6 = load i32 (i32)*, i32 (i32)** %1, align 8
  %7 = call i32 %6(i32 0)
  %8 = icmp ne i32 %7, 0
  %9 = xor i1 %8, true
  br label %10

; <label>:10                                      ; preds = %5, %0
  %11 = phi i1 [ false, %0 ], [ %9, %5 ]
  %12 = zext i1 %11 to i32
  ret i32 %12
}

; Function Attrs: nounwind uwtable
define internal i32 @callback(i32 %depth) #0 {
  %1 = alloca i32, align 4
  store i32 %depth, i32* %1, align 4
  %2 = load i32, i32* %1, align 4
  call void @storemax(i32 %2)
  %3 = load i32, i32* %1, align 4
  %4 = icmp ne i32 %3, 0
  %5 = zext i1 %4 to i32
  ret i32 %5
}

; Function Attrs: noreturn nounwind
declare void @abort() #1

; Function Attrs: nounwind uwtable
define internal i32 @CallFunctionRec(i32 (i32)* %fun, i32 %depth) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32 (i32)*, align 8
  %3 = alloca i32, align 4
  store i32 (i32)* %fun, i32 (i32)** %2, align 8
  store i32 %depth, i32* %3, align 4
  %4 = load i32 (i32)*, i32 (i32)** %2, align 8
  %5 = load i32, i32* %3, align 4
  %6 = call i32 %4(i32 %5)
  %7 = icmp ne i32 %6, 0
  br i1 %7, label %9, label %8

; <label>:8                                       ; preds = %0
  store i32 0, i32* %1
  br label %18

; <label>:9                                       ; preds = %0
  %10 = load i32, i32* %3, align 4
  %11 = icmp slt i32 %10, 10
  br i1 %11, label %12, label %17

; <label>:12                                      ; preds = %9
  %13 = load i32 (i32)*, i32 (i32)** %2, align 8
  %14 = load i32, i32* %3, align 4
  %15 = add nsw i32 %14, 1
  %16 = call i32 @CallFunctionRec(i32 (i32)* %13, i32 %15)
  br label %17

; <label>:17                                      ; preds = %12, %9
  store i32 1, i32* %1
  br label %18

; <label>:18                                      ; preds = %17, %8
  %19 = load i32, i32* %1
  ret i32 %19
}

; Function Attrs: noinline nounwind uwtable
define internal void @storemax(i32 %i) #2 {
  %1 = alloca i32, align 4
  store i32 %i, i32* %1, align 4
  %2 = load i32, i32* %1, align 4
  %3 = load i32, i32* @max, align 4
  %4 = icmp sgt i32 %2, %3
  br i1 %4, label %5, label %7

; <label>:5                                       ; preds = %0
  %6 = load i32, i32* %1, align 4
  store i32 %6, i32* @max, align 4
  br label %7

; <label>:7                                       ; preds = %5, %0
  ret void
}

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { noreturn nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noinline nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { noreturn nounwind }

!llvm.ident = !{!0}

!0 = !{!"Ubuntu clang version 3.7.1-svn253571-1~exp1 (branches/release_37) (based on LLVM 3.7.1)"}
