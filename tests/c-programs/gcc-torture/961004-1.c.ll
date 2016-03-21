; ModuleID = './961004-1.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@k = global i32 0, align 4

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  store i32 0, i32* %1
  store i32 0, i32* %i, align 4
  br label %2

; <label>:2                                       ; preds = %17, %0
  %3 = load i32, i32* %i, align 4
  %4 = icmp slt i32 %3, 2
  br i1 %4, label %5, label %20

; <label>:5                                       ; preds = %2
  %6 = load i32, i32* @k, align 4
  %7 = icmp ne i32 %6, 0
  br i1 %7, label %8, label %13

; <label>:8                                       ; preds = %5
  %9 = load i32, i32* %j, align 4
  %10 = icmp ne i32 %9, 2
  br i1 %10, label %11, label %12

; <label>:11                                      ; preds = %8
  call void @abort() #2
  unreachable

; <label>:12                                      ; preds = %8
  br label %16

; <label>:13                                      ; preds = %5
  store i32 2, i32* %j, align 4
  %14 = load i32, i32* @k, align 4
  %15 = add nsw i32 %14, 1
  store i32 %15, i32* @k, align 4
  br label %16

; <label>:16                                      ; preds = %13, %12
  br label %17

; <label>:17                                      ; preds = %16
  %18 = load i32, i32* %i, align 4
  %19 = add nsw i32 %18, 1
  store i32 %19, i32* %i, align 4
  br label %2

; <label>:20                                      ; preds = %2
  call void @exit(i32 0) #2
  unreachable
                                                  ; No predecessors!
  %22 = load i32, i32* %1
  ret i32 %22
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
