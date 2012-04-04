; ModuleID = '/home/david/src/c-semantics/tests/mustPass/j020a.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.s = type { i32 }

@s0 = common global %struct.s zeroinitializer, align 4

define i32 @main() nounwind uwtable {
entry:
  %s1 = alloca %struct.s, align 4
  %0 = bitcast %struct.s* %s1 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %0, i8* bitcast (%struct.s* @s0 to i8*), i64 4, i32 4, i1 false)
  ret i32 0
}

declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture, i64, i32, i1) nounwind
