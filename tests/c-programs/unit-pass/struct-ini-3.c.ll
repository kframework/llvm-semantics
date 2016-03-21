; ModuleID = './struct-ini-3.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@result = global { i8, i8, [2 x i8] } { i8 -1, i8 15, [2 x i8] undef }, align 4

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  store i32 0, i32* %1
  %2 = load i16, i16* bitcast ({ i8, i8, [2 x i8] }* @result to i16*), align 4
  %3 = lshr i16 %2, 2
  %4 = and i16 %3, 7
  %5 = zext i16 %4 to i32
  %6 = and i32 %5, -8
  %7 = icmp ne i32 %6, 0
  br i1 %7, label %15, label %8

; <label>:8                                       ; preds = %0
  %9 = load i16, i16* bitcast ({ i8, i8, [2 x i8] }* @result to i16*), align 4
  %10 = lshr i16 %9, 5
  %11 = and i16 %10, 7
  %12 = zext i16 %11 to i32
  %13 = and i32 %12, -8
  %14 = icmp ne i32 %13, 0
  br i1 %14, label %15, label %16

; <label>:15                                      ; preds = %8, %0
  call void @abort() #2
  unreachable

; <label>:16                                      ; preds = %8
  call void @exit(i32 0) #2
  unreachable
                                                  ; No predecessors!
  %18 = load i32, i32* %1
  ret i32 %18
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
