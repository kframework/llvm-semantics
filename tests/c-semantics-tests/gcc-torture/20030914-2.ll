; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/20030914-2.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.s = type { [18 x i32] }

@gs = common global %struct.s zeroinitializer, align 4

define i32 @f(%struct.s* byval align 8 %pa, i32 %pb, ...) nounwind uwtable {
entry:
  %pb.addr = alloca i32, align 4
  store i32 %pb, i32* %pb.addr, align 4
  %0 = load i32* %pb.addr, align 4
  ret i32 %0
}

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %tmp = alloca %struct.s, align 8
  store i32 0, i32* %retval
  %0 = bitcast %struct.s* %tmp to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %0, i8* bitcast (%struct.s* @gs to i8*), i64 72, i32 4, i1 false)
  %call = call i32 (%struct.s*, i32, ...)* @f(%struct.s* byval align 8 %tmp, i32 4660)
  %cmp = icmp ne i32 %call, 4660
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  call void @exit(i32 0) noreturn nounwind
  unreachable

return:                                           ; No predecessors!
  %1 = load i32* %retval
  ret i32 %1
}

declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture, i64, i32, i1) nounwind

declare void @abort() noreturn nounwind

declare void @exit(i32) noreturn nounwind
