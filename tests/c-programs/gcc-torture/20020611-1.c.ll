; ModuleID = './20020611-1.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@n = global i32 30, align 4
@p = common global i32 0, align 4
@k = common global i32 0, align 4

; Function Attrs: nounwind uwtable
define void @x() #0 {
  %h = alloca i32, align 4
  %1 = load i32, i32* @n, align 4
  %2 = icmp ule i32 %1, 30
  %3 = zext i1 %2 to i32
  store i32 %3, i32* %h, align 4
  %4 = load i32, i32* %h, align 4
  %5 = icmp ne i32 %4, 0
  br i1 %5, label %6, label %7

; <label>:6                                       ; preds = %0
  store i32 1, i32* @p, align 4
  br label %8

; <label>:7                                       ; preds = %0
  store i32 0, i32* @p, align 4
  br label %8

; <label>:8                                       ; preds = %7, %6
  %9 = load i32, i32* %h, align 4
  %10 = icmp ne i32 %9, 0
  br i1 %10, label %11, label %12

; <label>:11                                      ; preds = %8
  store i32 1, i32* @k, align 4
  br label %13

; <label>:12                                      ; preds = %8
  store i32 0, i32* @k, align 4
  br label %13

; <label>:13                                      ; preds = %12, %11
  ret void
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  store i32 0, i32* %1
  call void @x()
  %2 = load i32, i32* @p, align 4
  %3 = icmp ne i32 %2, 1
  br i1 %3, label %7, label %4

; <label>:4                                       ; preds = %0
  %5 = load i32, i32* @k, align 4
  %6 = icmp ne i32 %5, 1
  br i1 %6, label %7, label %8

; <label>:7                                       ; preds = %4, %0
  call void @abort() #2
  unreachable

; <label>:8                                       ; preds = %4
  call void @exit(i32 0) #2
  unreachable
                                                  ; No predecessors!
  %10 = load i32, i32* %1
  ret i32 %10
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
