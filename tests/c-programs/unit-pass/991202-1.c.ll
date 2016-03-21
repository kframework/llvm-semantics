; ModuleID = './991202-1.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@x = common global i32 0, align 4
@y = common global i32 0, align 4

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  store i32 0, i32* %1
  store i32 2, i32* @x, align 4
  %2 = load i32, i32* @x, align 4
  store i32 %2, i32* @y, align 4
  br label %3

; <label>:3                                       ; preds = %7, %0
  %4 = load i32, i32* @y, align 4
  store i32 %4, i32* @x, align 4
  %5 = load i32, i32* @y, align 4
  %6 = mul nsw i32 2, %5
  store i32 %6, i32* @y, align 4
  br label %7

; <label>:7                                       ; preds = %3
  %8 = load i32, i32* @y, align 4
  %9 = load i32, i32* @x, align 4
  %10 = sub nsw i32 %8, %9
  %11 = icmp sge i32 %10, 20
  %12 = xor i1 %11, true
  br i1 %12, label %3, label %13

; <label>:13                                      ; preds = %7
  call void @exit(i32 0) #2
  unreachable
                                                  ; No predecessors!
  %15 = load i32, i32* %1
  ret i32 %15
}

; Function Attrs: noreturn nounwind
declare void @exit(i32) #1

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { noreturn nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noreturn nounwind }

!llvm.ident = !{!0}

!0 = !{!"Ubuntu clang version 3.7.1-svn253571-1~exp1 (branches/release_37) (based on LLVM 3.7.1)"}
