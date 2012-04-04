; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/pr33992.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

define void @bar(i64 %i) nounwind uwtable noinline {
entry:
  %i.addr = alloca i64, align 8
  store i64 %i, i64* %i.addr, align 8
  %0 = load i64* %i.addr, align 8
  %tobool = icmp ne i64 %0, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  ret void
}

declare void @abort() noreturn nounwind

define void @foo(i64* %r) nounwind uwtable alwaysinline {
entry:
  %r.addr = alloca i64*, align 8
  %i = alloca i32, align 4
  store i64* %r, i64** %r.addr, align 8
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i64** %r.addr, align 8
  %1 = load i64* %0, align 8
  %2 = load i32* %i, align 4
  %sub = sub nsw i32 63, %2
  %sh_prom = zext i32 %sub to i64
  %shl = shl i64 1, %sh_prom
  %and = and i64 %1, %shl
  %tobool = icmp ne i64 %and, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %for.cond
  br label %for.end

if.end:                                           ; preds = %for.cond
  br label %for.inc

for.inc:                                          ; preds = %if.end
  %3 = load i32* %i, align 4
  %inc = add nsw i32 %3, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %if.then
  %4 = load i32* %i, align 4
  %conv = sext i32 %4 to i64
  call void @bar(i64 %conv)
  ret void
}

define void @do_test(i64* %r) nounwind uwtable noinline {
entry:
  %r.addr.i = alloca i64*, align 8
  %i.i = alloca i32, align 4
  %r.addr = alloca i64*, align 8
  %i = alloca i32, align 4
  store i64* %r, i64** %r.addr, align 8
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32* %i, align 4
  %cmp = icmp slt i32 %0, 2
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %1 = load i64** %r.addr, align 8
  store i64* %1, i64** %r.addr.i, align 8
  store i32 0, i32* %i.i, align 4
  br label %for.cond.i

for.cond.i:                                       ; preds = %if.end.i, %for.body
  %2 = load i64** %r.addr.i, align 8
  %3 = load i64* %2, align 8
  %4 = load i32* %i.i, align 4
  %sub.i = sub nsw i32 63, %4
  %sh_prom.i = zext i32 %sub.i to i64
  %shl.i = shl i64 1, %sh_prom.i
  %and.i = and i64 %3, %shl.i
  %tobool.i = icmp ne i64 %and.i, 0
  br i1 %tobool.i, label %foo.exit, label %if.end.i

if.end.i:                                         ; preds = %for.cond.i
  %5 = load i32* %i.i, align 4
  %inc.i = add nsw i32 %5, 1
  store i32 %inc.i, i32* %i.i, align 4
  br label %for.cond.i

foo.exit:                                         ; preds = %for.cond.i
  %6 = load i32* %i.i, align 4
  %conv.i = sext i32 %6 to i64
  call void @bar(i64 %conv.i) nounwind
  br label %for.inc

for.inc:                                          ; preds = %foo.exit
  %7 = load i32* %i, align 4
  %inc = add nsw i32 %7, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  ret void
}

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %r = alloca i64, align 8
  store i32 0, i32* %retval
  store i64 -9223372036854775807, i64* %r, align 8
  call void @do_test(i64* %r)
  ret i32 0
}
