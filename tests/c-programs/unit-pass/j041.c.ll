; ModuleID = './j041.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.s = type { i32 (i32)*, i32 (i32)* }

@x = common global %struct.s zeroinitializer, align 8
@pf = common global i32 (i32)** null, align 8

; Function Attrs: nounwind uwtable
define i32 @g(i32 %v) #0 {
  %1 = alloca i32, align 4
  store i32 %v, i32* %1, align 4
  ret i32 0
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  store i32 (i32)* @g, i32 (i32)** getelementptr inbounds (%struct.s, %struct.s* @x, i32 0, i32 1), align 8
  store i32 (i32)** getelementptr inbounds (%struct.s, %struct.s* @x, i32 0, i32 0), i32 (i32)*** @pf, align 8
  store i32 (i32)** bitcast (i8* getelementptr inbounds (i8, i8* bitcast (%struct.s* @x to i8*), i64 8) to i32 (i32)**), i32 (i32)*** @pf, align 8
  %1 = load i32 (i32)**, i32 (i32)*** @pf, align 8
  %2 = load i32 (i32)*, i32 (i32)** %1, align 8
  %3 = call i32 %2(i32 2)
  ret i32 0
}

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = !{!"Ubuntu clang version 3.7.1-svn253571-1~exp1 (branches/release_37) (based on LLVM 3.7.1)"}
