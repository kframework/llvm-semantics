; ModuleID = './challenge02.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.anon = type { [5 x i32] }

@s = common global %struct.anon zeroinitializer, align 4

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %p = alloca i8*, align 8
  store i32 0, i32* %1
  store i8* bitcast (%struct.anon* @s to i8*), i8** %p, align 8
  %2 = load i8*, i8** %p, align 8
  %3 = getelementptr inbounds i8, i8* %2, i64 4
  %4 = bitcast i8* %3 to i32*
  store i32 5, i32* %4, align 4
  %5 = load i32, i32* getelementptr inbounds (%struct.anon, %struct.anon* @s, i32 0, i32 0, i64 1), align 4
  ret i32 %5
}

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = !{!"Ubuntu clang version 3.7.1-svn253571-1~exp1 (branches/release_37) (based on LLVM 3.7.1)"}
