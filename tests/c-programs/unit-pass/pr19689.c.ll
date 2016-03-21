; ModuleID = './pr19689.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.anon = type { i32 }

@f = common global %struct.anon zeroinitializer, align 4

; Function Attrs: nounwind uwtable
define void @foo(i16 signext %j) #0 {
  %1 = alloca i16, align 2
  store i16 %j, i16* %1, align 2
  %2 = load i16, i16* %1, align 2
  %3 = sext i16 %2 to i32
  %4 = load i32, i32* getelementptr inbounds (%struct.anon, %struct.anon* @f, i32 0, i32 0), align 4
  %5 = and i32 %3, 536870911
  %6 = and i32 %4, -536870912
  %7 = or i32 %6, %5
  store i32 %7, i32* getelementptr inbounds (%struct.anon, %struct.anon* @f, i32 0, i32 0), align 4
  %8 = shl i32 %5, 3
  %9 = ashr i32 %8, 3
  ret void
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  store i32 0, i32* %1
  call void @foo(i16 signext -55)
  %2 = load i32, i32* getelementptr inbounds (%struct.anon, %struct.anon* @f, i32 0, i32 0), align 4
  %3 = shl i32 %2, 3
  %4 = ashr i32 %3, 3
  %5 = icmp ne i32 %4, -55
  br i1 %5, label %6, label %7

; <label>:6                                       ; preds = %0
  call void @abort() #2
  unreachable

; <label>:7                                       ; preds = %0
  ret i32 0
}

; Function Attrs: noreturn nounwind
declare void @abort() #1

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { noreturn nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noreturn nounwind }

!llvm.ident = !{!0}

!0 = !{!"Ubuntu clang version 3.7.1-svn253571-1~exp1 (branches/release_37) (based on LLVM 3.7.1)"}
