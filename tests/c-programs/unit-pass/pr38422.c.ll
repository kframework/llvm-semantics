; ModuleID = './pr38422.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.S = type { i32 }

@s = common global %struct.S zeroinitializer, align 4

; Function Attrs: nounwind uwtable
define void @foo() #0 {
  %1 = load i32, i32* getelementptr inbounds (%struct.S, %struct.S* @s, i32 0, i32 0), align 4
  %2 = shl i32 %1, 2
  %3 = ashr i32 %2, 2
  %4 = mul nsw i32 %3, 2
  %5 = load i32, i32* getelementptr inbounds (%struct.S, %struct.S* @s, i32 0, i32 0), align 4
  %6 = and i32 %4, 1073741823
  %7 = and i32 %5, -1073741824
  %8 = or i32 %7, %6
  store i32 %8, i32* getelementptr inbounds (%struct.S, %struct.S* @s, i32 0, i32 0), align 4
  %9 = shl i32 %6, 2
  %10 = ashr i32 %9, 2
  ret void
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  store i32 0, i32* %1
  %2 = load i32, i32* getelementptr inbounds (%struct.S, %struct.S* @s, i32 0, i32 0), align 4
  %3 = and i32 %2, -1073741824
  %4 = or i32 %3, 24
  store i32 %4, i32* getelementptr inbounds (%struct.S, %struct.S* @s, i32 0, i32 0), align 4
  call void @foo()
  %5 = load i32, i32* getelementptr inbounds (%struct.S, %struct.S* @s, i32 0, i32 0), align 4
  %6 = shl i32 %5, 2
  %7 = ashr i32 %6, 2
  %8 = icmp ne i32 %7, 48
  br i1 %8, label %9, label %10

; <label>:9                                       ; preds = %0
  call void @abort() #2
  unreachable

; <label>:10                                      ; preds = %0
  ret i32 0
}

; Function Attrs: noreturn nounwind
declare void @abort() #1

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { noreturn nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noreturn nounwind }

!llvm.ident = !{!0}

!0 = !{!"Ubuntu clang version 3.7.1-svn253571-1~exp1 (branches/release_37) (based on LLVM 3.7.1)"}
