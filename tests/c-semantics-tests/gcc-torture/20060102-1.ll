; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/20060102-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@one = global i32 1, align 4

define i32 @f(i32 %x) nounwind uwtable {
entry:
  %x.addr = alloca i32, align 4
  store i32 %x, i32* %x.addr, align 4
  %0 = load i32* %x.addr, align 4
  %shr = ashr i32 %0, 31
  %tobool = icmp ne i32 %shr, 0
  %cond = select i1 %tobool, i32 -1, i32 1
  ret i32 %cond
}

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval
  %0 = load volatile i32* @one, align 4
  %call = call i32 @f(i32 %0)
  %1 = load volatile i32* @one, align 4
  %sub = sub nsw i32 0, %1
  %call1 = call i32 @f(i32 %sub)
  %cmp = icmp eq i32 %call, %call1
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  ret i32 0
}

declare void @abort() noreturn nounwind
