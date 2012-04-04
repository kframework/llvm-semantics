; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/20040707-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.s = type { i8, i8 }

@foo.s1 = internal global %struct.s zeroinitializer, align 1
@main.s2 = internal global %struct.s zeroinitializer, align 1

define void @foo(i16 %s.coerce) nounwind uwtable {
entry:
  %s = alloca %struct.s, align 2
  %0 = bitcast %struct.s* %s to i16*
  store i16 %s.coerce, i16* %0, align 1
  %1 = bitcast %struct.s* %s to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* getelementptr inbounds (%struct.s* @foo.s1, i32 0, i32 0), i8* %1, i64 2, i32 1, i1 false)
  ret void
}

declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture, i64, i32, i1) nounwind

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval
  %0 = load i16* bitcast (%struct.s* @main.s2 to i16*), align 1
  call void @foo(i16 %0)
  call void @exit(i32 0) noreturn nounwind
  unreachable

return:                                           ; No predecessors!
  %1 = load i32* %retval
  ret i32 %1
}

declare void @exit(i32) noreturn nounwind
