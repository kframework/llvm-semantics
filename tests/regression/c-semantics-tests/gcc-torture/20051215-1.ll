; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/20051215-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

define i32 @foo(i32 %x, i32 %y, i32* %z) nounwind uwtable noinline {
entry:
  %x.addr = alloca i32, align 4
  %y.addr = alloca i32, align 4
  %z.addr = alloca i32*, align 8
  %a = alloca i32, align 4
  %b = alloca i32, align 4
  %c = alloca i32, align 4
  %d = alloca i32, align 4
  store i32 %x, i32* %x.addr, align 4
  store i32 %y, i32* %y.addr, align 4
  store i32* %z, i32** %z.addr, align 8
  store i32 0, i32* %b, align 4
  store i32 0, i32* %a, align 4
  store i32 0, i32* %d, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc4, %entry
  %0 = load i32* %d, align 4
  %1 = load i32* %y.addr, align 4
  %cmp = icmp slt i32 %0, %1
  br i1 %cmp, label %for.body, label %for.end6

for.body:                                         ; preds = %for.cond
  %2 = load i32** %z.addr, align 8
  %tobool = icmp ne i32* %2, null
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %for.body
  %3 = load i32* %d, align 4
  %4 = load i32** %z.addr, align 8
  %5 = load i32* %4, align 4
  %mul = mul nsw i32 %3, %5
  store i32 %mul, i32* %b, align 4
  br label %if.end

if.end:                                           ; preds = %if.then, %for.body
  store i32 0, i32* %c, align 4
  br label %for.cond1

for.cond1:                                        ; preds = %for.inc, %if.end
  %6 = load i32* %c, align 4
  %7 = load i32* %x.addr, align 4
  %cmp2 = icmp slt i32 %6, %7
  br i1 %cmp2, label %for.body3, label %for.end

for.body3:                                        ; preds = %for.cond1
  %8 = load i32* %b, align 4
  %9 = load i32* %a, align 4
  %add = add nsw i32 %9, %8
  store i32 %add, i32* %a, align 4
  br label %for.inc

for.inc:                                          ; preds = %for.body3
  %10 = load i32* %c, align 4
  %inc = add nsw i32 %10, 1
  store i32 %inc, i32* %c, align 4
  br label %for.cond1

for.end:                                          ; preds = %for.cond1
  br label %for.inc4

for.inc4:                                         ; preds = %for.end
  %11 = load i32* %d, align 4
  %inc5 = add nsw i32 %11, 1
  store i32 %inc5, i32* %d, align 4
  br label %for.cond

for.end6:                                         ; preds = %for.cond
  %12 = load i32* %a, align 4
  ret i32 %12
}

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval
  %call = call i32 @foo(i32 3, i32 2, i32* null)
  %cmp = icmp ne i32 %call, 0
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  ret i32 0
}

declare void @abort() noreturn nounwind
