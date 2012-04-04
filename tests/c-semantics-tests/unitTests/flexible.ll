; ModuleID = '/home/david/src/c-semantics/tests/unitTests/flexible.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._s = type { i32, [0 x i32] }

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %p = alloca %struct._s*, align 8
  store i32 0, i32* %retval
  %call = call noalias i8* @malloc(i64 24) nounwind
  %0 = bitcast i8* %call to %struct._s*
  store %struct._s* %0, %struct._s** %p, align 8
  %1 = load %struct._s** %p, align 8
  %a = getelementptr inbounds %struct._s* %1, i32 0, i32 1
  %arrayidx = getelementptr inbounds [0 x i32]* %a, i32 0, i64 2
  store i32 5, i32* %arrayidx, align 1
  %2 = load %struct._s** %p, align 8
  %a1 = getelementptr inbounds %struct._s* %2, i32 0, i32 1
  %arrayidx2 = getelementptr inbounds [0 x i32]* %a1, i32 0, i64 2
  %3 = load i32* %arrayidx2, align 1
  ret i32 %3
}

declare noalias i8* @malloc(i64) nounwind
