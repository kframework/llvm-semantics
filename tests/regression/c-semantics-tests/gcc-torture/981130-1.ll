; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/981130-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.s = type { i32, i32 }

@s2 = global %struct.s { i32 1, i32 2 }, align 4
@s1 = common global %struct.s zeroinitializer, align 4

define void @check(i32 %a, i32 %b) nounwind uwtable {
entry:
  %a.addr = alloca i32, align 4
  %b.addr = alloca i32, align 4
  store i32 %a, i32* %a.addr, align 4
  store i32 %b, i32* %b.addr, align 4
  %0 = load i32* %a.addr, align 4
  %1 = load i32* %b.addr, align 4
  %cmp = icmp eq i32 %0, %1
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  call void @exit(i32 0) noreturn nounwind
  unreachable

if.else:                                          ; preds = %entry
  call void @abort() noreturn nounwind
  unreachable

return:                                           ; No predecessors!
  ret void
}

declare void @exit(i32) noreturn nounwind

declare void @abort() noreturn nounwind

define i32 @main() nounwind uwtable {
entry:
  %p = alloca i32*, align 8
  %x = alloca i32, align 4
  store i32 9, i32* getelementptr inbounds (%struct.s* @s1, i32 0, i32 0), align 4
  store i32* getelementptr inbounds (%struct.s* @s1, i32 0, i32 0), i32** %p, align 8
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* bitcast (%struct.s* @s1 to i8*), i8* bitcast (%struct.s* @s2 to i8*), i64 8, i32 4, i1 false)
  %0 = load i32** %p, align 8
  %1 = load i32* %0, align 4
  store i32 %1, i32* %x, align 4
  %2 = load i32* %x, align 4
  call void (...)* bitcast (void (i32, i32)* @check to void (...)*)(i32 %2, i32 1)
  ret i32 0
}

declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture, i64, i32, i1) nounwind
