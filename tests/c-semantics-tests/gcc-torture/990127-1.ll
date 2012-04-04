; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/990127-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %a = alloca i32, align 4
  %b = alloca i32, align 4
  %c = alloca i32, align 4
  %pa = alloca i32*, align 8
  %pb = alloca i32*, align 8
  %pc = alloca i32*, align 8
  %ppa = alloca i32**, align 8
  %ppb = alloca i32**, align 8
  %ppc = alloca i32**, align 8
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %k = alloca i32, align 4
  %x = alloca i32, align 4
  %y = alloca i32, align 4
  %z = alloca i32, align 4
  store i32 0, i32* %retval
  store i32 10, i32* %a, align 4
  store i32 20, i32* %b, align 4
  store i32 30, i32* %c, align 4
  store i32* %a, i32** %pa, align 8
  store i32* %b, i32** %pb, align 8
  store i32* %c, i32** %pc, align 8
  store i32** %pa, i32*** %ppa, align 8
  store i32** %pb, i32*** %ppb, align 8
  store i32** %pc, i32*** %ppc, align 8
  store i32 0, i32* %x, align 4
  store i32 0, i32* %y, align 4
  store i32 0, i32* %z, align 4
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32* %i, align 4
  %cmp = icmp slt i32 %0, 10
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %1 = load i32** %pa, align 8
  %cmp1 = icmp eq i32* %1, %a
  br i1 %cmp1, label %if.then, label %if.else

if.then:                                          ; preds = %for.body
  store i32* %b, i32** %pa, align 8
  br label %if.end

if.else:                                          ; preds = %for.body
  store i32* %a, i32** %pa, align 8
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  br label %while.cond

while.cond:                                       ; preds = %if.end5, %if.end
  %2 = load i32** %pa, align 8
  %3 = load i32* %2, align 4
  %dec = add nsw i32 %3, -1
  store i32 %dec, i32* %2, align 4
  %tobool = icmp ne i32 %3, 0
  br i1 %tobool, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %4 = load i32* %x, align 4
  %inc = add nsw i32 %4, 1
  store i32 %inc, i32* %x, align 4
  %5 = load i32** %pa, align 8
  %6 = load i32* %5, align 4
  %cmp2 = icmp slt i32 %6, 3
  br i1 %cmp2, label %if.then3, label %if.else4

if.then3:                                         ; preds = %while.body
  br label %while.end

if.else4:                                         ; preds = %while.body
  store i32* %b, i32** %pa, align 8
  br label %if.end5

if.end5:                                          ; preds = %if.else4
  br label %while.cond

while.end:                                        ; preds = %if.then3, %while.cond
  %7 = load i32* %x, align 4
  %inc6 = add nsw i32 %7, 1
  store i32 %inc6, i32* %x, align 4
  store i32* %b, i32** %pa, align 8
  br label %for.inc

for.inc:                                          ; preds = %while.end
  %8 = load i32* %i, align 4
  %inc7 = add nsw i32 %8, 1
  store i32 %inc7, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %9 = load i32** %pa, align 8
  %10 = load i32* %9, align 4
  %cmp8 = icmp ne i32 %10, -5
  br i1 %cmp8, label %if.then12, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %for.end
  %11 = load i32** %pb, align 8
  %12 = load i32* %11, align 4
  %cmp9 = icmp ne i32 %12, -5
  br i1 %cmp9, label %if.then12, label %lor.lhs.false10

lor.lhs.false10:                                  ; preds = %lor.lhs.false
  %13 = load i32* %x, align 4
  %cmp11 = icmp ne i32 %13, 43
  br i1 %cmp11, label %if.then12, label %if.end13

if.then12:                                        ; preds = %lor.lhs.false10, %lor.lhs.false, %for.end
  call void @abort() noreturn nounwind
  unreachable

if.end13:                                         ; preds = %lor.lhs.false10
  call void @exit(i32 0) noreturn nounwind
  unreachable

return:                                           ; No predecessors!
  %14 = load i32* %retval
  ret i32 %14
}

declare void @abort() noreturn nounwind

declare void @exit(i32) noreturn nounwind
