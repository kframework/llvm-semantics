; ModuleID = './j054.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%union.u = type { %struct.s1 }
%struct.s1 = type { i64, %struct.big_type }
%struct.big_type = type { [32 x i32] }
%union.anon = type { i32 }
%struct.s2 = type { i64, %struct.big_type }

@obj = common global %union.u zeroinitializer, align 8
@ic = common global %union.anon zeroinitializer, align 4

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %p = alloca i64*, align 8
  store i32 0, i32* %1
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* bitcast (%struct.big_type* getelementptr inbounds (%struct.s2, %struct.s2* bitcast (%union.u* @obj to %struct.s2*), i32 0, i32 1) to i8*), i8* bitcast (%struct.big_type* getelementptr inbounds (%union.u, %union.u* @obj, i32 0, i32 0, i32 1) to i8*), i64 128, i32 4, i1 false)
  %2 = call noalias i8* @malloc(i64 8) #1
  %3 = bitcast i8* %2 to i64*
  store i64* %3, i64** %p, align 8
  %4 = load i64*, i64** %p, align 8
  store i64 5, i64* %4, align 8
  %5 = load i64*, i64** %p, align 8
  %6 = load i64, i64* %5, align 8
  %7 = load i64*, i64** %p, align 8
  store i64 %6, i64* %7, align 8
  %8 = load i32, i32* getelementptr inbounds (%union.anon, %union.anon* @ic, i32 0, i32 0), align 4
  store i32 %8, i32* getelementptr inbounds (%union.anon, %union.anon* @ic, i32 0, i32 0), align 4
  ret i32 0
}

; Function Attrs: nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture readonly, i64, i32, i1) #1

; Function Attrs: nounwind
declare noalias i8* @malloc(i64) #2

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind }
attributes #2 = { nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = !{!"Ubuntu clang version 3.7.1-svn253571-1~exp1 (branches/release_37) (based on LLVM 3.7.1)"}
