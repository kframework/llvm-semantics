; ModuleID = './j086.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.s = type { i32 }
%union.u = type { i32 }

@s = common global %struct.s zeroinitializer, align 4
@u = common global %union.u zeroinitializer, align 4

; Function Attrs: nounwind uwtable
define i32 @f(i32 %s.coerce) #0 {
  %s = alloca %struct.s, align 4
  %1 = getelementptr %struct.s, %struct.s* %s, i32 0, i32 0
  store i32 %s.coerce, i32* %1, align 4
  ret i32 0
}

; Function Attrs: nounwind uwtable
define i32 @g(i32 %u.coerce) #0 {
  %u = alloca %union.u, align 4
  %1 = getelementptr %union.u, %union.u* %u, i32 0, i32 0
  store i32 %u.coerce, i32* %1, align 4
  ret i32 0
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  store i32 0, i32* %1
  %2 = load i32, i32* getelementptr inbounds (%struct.s, %struct.s* @s, i32 0, i32 0), align 4
  %3 = call i32 @f(i32 %2)
  %4 = load i32, i32* getelementptr inbounds (%union.u, %union.u* @u, i32 0, i32 0), align 4
  %5 = call i32 @g(i32 %4)
  %6 = add nsw i32 %3, %5
  ret i32 %6
}

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = !{!"Ubuntu clang version 3.7.1-svn253571-1~exp1 (branches/release_37) (based on LLVM 3.7.1)"}
