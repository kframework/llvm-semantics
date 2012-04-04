; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/20011019-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.anon = type { i32, [5 x i32] }

@y = common global i32* null, align 8
@x = common global %struct.anon zeroinitializer, align 4

define i32 @foo() nounwind uwtable {
entry:
  %0 = load i32** @y, align 8
  %sub.ptr.lhs.cast = ptrtoint i32* %0 to i64
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, ptrtoint (i32* getelementptr inbounds (%struct.anon* @x, i32 0, i32 1, i32 0) to i64)
  %sub.ptr.div = sdiv exact i64 %sub.ptr.sub, 4
  %conv = trunc i64 %sub.ptr.div to i32
  ret i32 %conv
}

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval
  store i32* getelementptr inbounds (%struct.anon* @x, i32 0, i32 1, i32 0), i32** @y, align 8
  %call = call i32 @foo()
  %tobool = icmp ne i32 %call, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @abort() noreturn
  unreachable

if.end:                                           ; preds = %entry
  call void @exit(i32 0) noreturn
  unreachable

return:                                           ; No predecessors!
  %0 = load i32* %retval
  ret i32 %0
}

declare void @abort() noreturn

declare void @exit(i32) noreturn
