; ModuleID = './j082.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.s = type { i32, i32 }

@main.s1 = private unnamed_addr constant %struct.s { i32 0, i32 1 }, align 4

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %s0 = alloca %struct.s, align 4
  %s1 = alloca %struct.s, align 4
  %s2 = alloca %struct.s, align 4
  store i32 0, i32* %1
  %2 = bitcast %struct.s* %s0 to i8*
  call void @llvm.memset.p0i8.i64(i8* %2, i8 0, i64 8, i32 4, i1 false)
  %3 = bitcast %struct.s* %s1 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %3, i8* bitcast (%struct.s* @main.s1 to i8*), i64 8, i32 4, i1 false)
  %4 = bitcast %struct.s* %s2 to i8*
  %5 = bitcast %struct.s* %s1 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %4, i8* %5, i64 8, i32 4, i1 false)
  %6 = getelementptr inbounds %struct.s, %struct.s* %s0, i32 0, i32 0
  %7 = load i32, i32* %6, align 4
  %8 = getelementptr inbounds %struct.s, %struct.s* %s1, i32 0, i32 0
  %9 = load i32, i32* %8, align 4
  %10 = add nsw i32 %7, %9
  %11 = getelementptr inbounds %struct.s, %struct.s* %s2, i32 0, i32 0
  %12 = load i32, i32* %11, align 4
  %13 = add nsw i32 %10, %12
  ret i32 %13
}

; Function Attrs: nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture, i8, i64, i32, i1) #1

; Function Attrs: nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture readonly, i64, i32, i1) #1

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind }

!llvm.ident = !{!0}

!0 = !{!"Ubuntu clang version 3.7.1-svn253571-1~exp1 (branches/release_37) (based on LLVM 3.7.1)"}
