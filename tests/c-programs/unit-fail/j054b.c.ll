; ModuleID = './j054b.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%union.u = type { %struct.s2 }
%struct.s2 = type { i64, %struct.big_type }
%struct.big_type = type { [32 x i32] }
%struct.s1 = type { i8, %struct.big_type }

@obj = common global %union.u zeroinitializer, align 8

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  store i32 0, i32* %1
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* bitcast (%struct.big_type* getelementptr inbounds (%union.u, %union.u* @obj, i32 0, i32 0, i32 1) to i8*), i8* bitcast (%struct.big_type* getelementptr inbounds (%struct.s1, %struct.s1* bitcast (%union.u* @obj to %struct.s1*), i32 0, i32 1) to i8*), i64 128, i32 4, i1 false)
  ret i32 0
}

; Function Attrs: nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture readonly, i64, i32, i1) #1

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind }

!llvm.ident = !{!0}

!0 = !{!"Ubuntu clang version 3.7.1-svn253571-1~exp1 (branches/release_37) (based on LLVM 3.7.1)"}
