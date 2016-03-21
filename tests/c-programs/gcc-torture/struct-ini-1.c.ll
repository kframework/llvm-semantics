; ModuleID = './struct-ini-1.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.S = type { i8, [2 x i32] }

@object = global %struct.S { i8 88, [2 x i32] [i32 8, i32 9] }, align 4

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  store i32 0, i32* %1
  %2 = load i8, i8* getelementptr inbounds (%struct.S, %struct.S* @object, i32 0, i32 0), align 1
  %3 = sext i8 %2 to i32
  %4 = icmp ne i32 %3, 88
  br i1 %4, label %11, label %5

; <label>:5                                       ; preds = %0
  %6 = load i32, i32* getelementptr inbounds (%struct.S, %struct.S* @object, i32 0, i32 1, i64 0), align 4
  %7 = icmp ne i32 %6, 8
  br i1 %7, label %11, label %8

; <label>:8                                       ; preds = %5
  %9 = load i32, i32* getelementptr inbounds (%struct.S, %struct.S* @object, i32 0, i32 1, i64 1), align 4
  %10 = icmp ne i32 %9, 9
  br i1 %10, label %11, label %12

; <label>:11                                      ; preds = %8, %5, %0
  call void @abort() #2
  unreachable

; <label>:12                                      ; preds = %8
  call void @exit(i32 0) #2
  unreachable
                                                  ; No predecessors!
  %14 = load i32, i32* %1
  ret i32 %14
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
