; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/pr37102.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@b = global i32 1, align 4
@c = common global i32 0, align 4
@a = common global i32 0, align 4

define void @foo(i32 %x) nounwind uwtable noinline {
entry:
  %x.addr = alloca i32, align 4
  store i32 %x, i32* %x.addr, align 4
  %0 = load i32* %x.addr, align 4
  %cmp = icmp ne i32 %0, 5
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  ret void
}

declare void @abort() noreturn nounwind

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %d = alloca i32, align 4
  %e = alloca i32, align 4
  store i32 0, i32* %retval
  store i32 1, i32* %d, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32* %d, align 4
  %cmp = icmp ult i32 %0, 5
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %1 = load i32* @c, align 4
  %tobool = icmp ne i32 %1, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %for.body
  %2 = load i32* @b, align 4
  store i32 %2, i32* @a, align 4
  br label %if.end

if.end:                                           ; preds = %if.then, %for.body
  br label %for.inc

for.inc:                                          ; preds = %if.end
  %3 = load i32* %d, align 4
  %inc = add i32 %3, 1
  store i32 %inc, i32* %d, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %4 = load i32* @b, align 4
  store i32 %4, i32* @a, align 4
  %5 = load i32* @a, align 4
  %shl = shl i32 %5, 1
  store i32 %shl, i32* %e, align 4
  %6 = load i32* %e, align 4
  %tobool1 = icmp ne i32 %6, 0
  br i1 %tobool1, label %if.then2, label %if.end4

if.then2:                                         ; preds = %for.end
  %7 = load i32* %e, align 4
  %shl3 = shl i32 %7, 1
  %xor = xor i32 %shl3, 1
  store i32 %xor, i32* %e, align 4
  br label %if.end4

if.end4:                                          ; preds = %if.then2, %for.end
  %8 = load i32* %e, align 4
  call void @foo(i32 %8)
  ret i32 0
}
