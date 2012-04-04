; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/940122-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@a = global i8* null, align 8
@b = global i8* null, align 8

define void @g(i32 %x) nounwind uwtable {
entry:
  %x.addr = alloca i32, align 4
  store i32 %x, i32* %x.addr, align 4
  %0 = load i8** @a, align 8
  %tobool = icmp ne i8* %0, null
  %lnot = xor i1 %tobool, true
  %lnot1 = xor i1 %lnot, true
  %lnot.ext = zext i1 %lnot1 to i32
  %1 = load i8** @b, align 8
  %tobool2 = icmp ne i8* %1, null
  %lnot3 = xor i1 %tobool2, true
  %lnot5 = xor i1 %lnot3, true
  %lnot.ext6 = zext i1 %lnot5 to i32
  %cmp = icmp ne i32 %lnot.ext, %lnot.ext6
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  ret void
}

declare void @abort() noreturn nounwind

define void @f(i32 %x) nounwind uwtable {
entry:
  %x.addr = alloca i32, align 4
  store i32 %x, i32* %x.addr, align 4
  %0 = load i32* %x.addr, align 4
  %1 = load i32* %x.addr, align 4
  %mul = mul nsw i32 %0, %1
  call void (...)* bitcast (void (i32)* @g to void (...)*)(i32 %mul)
  ret void
}

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval
  call void (...)* bitcast (void (i32)* @f to void (...)*)(i32 100)
  call void @exit(i32 0) noreturn nounwind
  unreachable

return:                                           ; No predecessors!
  %0 = load i32* %retval
  ret i32 %0
}

declare void @exit(i32) noreturn nounwind
