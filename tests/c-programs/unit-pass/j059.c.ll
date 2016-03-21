; ModuleID = './j059.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.s = type { i32 }
%union.u = type { i32 }

@main.g = private unnamed_addr constant [2 x i32] [i32 0, i32 1], align 4

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %a = alloca [1 x i32], align 4
  %b = alloca %struct.s, align 4
  %c = alloca %union.u, align 4
  %d = alloca %struct.s, align 4
  %e = alloca %union.u, align 4
  %f = alloca [1 x i32], align 4
  %g = alloca [2 x i32], align 4
  %h = alloca %struct.s, align 4
  %i = alloca %union.u, align 4
  store i32 0, i32* %1
  %2 = bitcast [1 x i32]* %a to i8*
  call void @llvm.memset.p0i8.i64(i8* %2, i8 0, i64 4, i32 4, i1 false)
  %3 = bitcast %struct.s* %d to i8*
  call void @llvm.memset.p0i8.i64(i8* %3, i8 0, i64 4, i32 4, i1 false)
  %4 = bitcast %union.u* %e to i8*
  call void @llvm.memset.p0i8.i64(i8* %4, i8 0, i64 4, i32 4, i1 false)
  %5 = bitcast [1 x i32]* %f to i8*
  call void @llvm.memset.p0i8.i64(i8* %5, i8 0, i64 4, i32 4, i1 false)
  %6 = bitcast [2 x i32]* %g to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %6, i8* bitcast ([2 x i32]* @main.g to i8*), i64 8, i32 4, i1 false)
  ret i32 0
}

; Function Attrs: nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture, i8, i64, i32, i1) #1

; Function Attrs: nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture readonly, i64, i32, i1) #1

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind }

!llvm.ident = !{!0}

!0 = !{!"Ubuntu clang version 3.7.1-svn253571-1~exp1 (branches/release_37) (based on LLVM 3.7.1)"}
