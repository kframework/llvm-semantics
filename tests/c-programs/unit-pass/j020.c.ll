; ModuleID = './j020.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.s = type { i32 }

@s0 = common global %struct.s zeroinitializer, align 4
@e0 = common global i32 0, align 4
@a = global [3 x i32] [i32 1, i32 2, i32 3], align 4

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %s1 = alloca %struct.s, align 4
  %e1 = alloca i32, align 4
  store i32 0, i32* %1
  %2 = bitcast %struct.s* %s1 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %2, i8* bitcast (%struct.s* @s0 to i8*), i64 4, i32 4, i1 false)
  %3 = load i32, i32* @e0, align 4
  store i32 %3, i32* %e1, align 4
  store i32 0, i32* getelementptr inbounds ([3 x i32], [3 x i32]* @a, i32 0, i64 0), align 4
  %4 = load i32, i32* getelementptr inbounds ([3 x i32], [3 x i32]* @a, i32 0, i64 0), align 4
  %5 = load i32, i32* %e1, align 4
  %6 = add i32 %4, %5
  %7 = getelementptr inbounds %struct.s, %struct.s* %s1, i32 0, i32 0
  %8 = load i32, i32* %7, align 4
  %9 = add i32 %6, %8
  ret i32 %9
}

; Function Attrs: nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture readonly, i64, i32, i1) #1

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind }

!llvm.ident = !{!0}

!0 = !{!"Ubuntu clang version 3.7.1-svn253571-1~exp1 (branches/release_37) (based on LLVM 3.7.1)"}
