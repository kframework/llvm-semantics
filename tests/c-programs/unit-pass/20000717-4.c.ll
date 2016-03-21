; ModuleID = './20000717-4.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.anon = type { i32, [4 x %struct.slot] }
%struct.slot = type { [6 x i32] }

@s = common global %struct.anon zeroinitializer, align 4

; Function Attrs: nounwind uwtable
define i32 @x() #0 {
  %toggle = alloca i32, align 4
  %r = alloca i32, align 4
  store i32 0, i32* %toggle, align 4
  %1 = load i32, i32* %toggle, align 4
  %2 = icmp ne i32 %1, 0
  %3 = xor i1 %2, true
  %4 = zext i1 %3 to i32
  %5 = sext i32 %4 to i64
  %6 = getelementptr inbounds [6 x i32], [6 x i32]* getelementptr inbounds (%struct.anon, %struct.anon* @s, i32 0, i32 1, i64 0, i32 0), i32 0, i64 %5
  %7 = load i32, i32* %6, align 4
  store i32 %7, i32* %r, align 4
  %8 = load i32, i32* %r, align 4
  ret i32 %8
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  store i32 0, i32* %1
  ret i32 0
}

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = !{!"Ubuntu clang version 3.7.1-svn253571-1~exp1 (branches/release_37) (based on LLVM 3.7.1)"}
