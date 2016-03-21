; ModuleID = './j054c.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%union.U = type { %struct.T }
%struct.T = type { i32, %struct.S }
%struct.S = type { i32, i32, i32 }

@u = common global %union.U zeroinitializer, align 4

; Function Attrs: nounwind uwtable
define void @copy(%struct.S* %p, %struct.S* %q) #0 {
  %1 = alloca %struct.S*, align 8
  %2 = alloca %struct.S*, align 8
  store %struct.S* %p, %struct.S** %1, align 8
  store %struct.S* %q, %struct.S** %2, align 8
  %3 = load %struct.S*, %struct.S** %1, align 8
  %4 = load %struct.S*, %struct.S** %2, align 8
  %5 = bitcast %struct.S* %3 to i8*
  %6 = bitcast %struct.S* %4 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %5, i8* %6, i64 12, i32 4, i1 false)
  ret void
}

; Function Attrs: nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture readonly, i64, i32, i1) #1

; Function Attrs: nounwind uwtable
define i32 @main(i32 %c, i8** %v) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i8**, align 8
  store i32 0, i32* %1
  store i32 %c, i32* %2, align 4
  store i8** %v, i8*** %3, align 8
  store i32 1, i32* getelementptr inbounds (%struct.S, %struct.S* bitcast (%union.U* @u to %struct.S*), i32 0, i32 1), align 4
  call void @copy(%struct.S* getelementptr inbounds (%union.U, %union.U* @u, i32 0, i32 0, i32 1), %struct.S* bitcast (%union.U* @u to %struct.S*))
  %4 = load i32, i32* getelementptr inbounds (%union.U, %union.U* @u, i32 0, i32 0, i32 1, i32 0), align 4
  %5 = load i32, i32* getelementptr inbounds (%union.U, %union.U* @u, i32 0, i32 0, i32 1, i32 1), align 4
  %6 = add nsw i32 %4, %5
  %7 = load i32, i32* getelementptr inbounds (%union.U, %union.U* @u, i32 0, i32 0, i32 1, i32 2), align 4
  %8 = add nsw i32 %6, %7
  ret i32 %8
}

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind }

!llvm.ident = !{!0}

!0 = !{!"Ubuntu clang version 3.7.1-svn253571-1~exp1 (branches/release_37) (based on LLVM 3.7.1)"}
