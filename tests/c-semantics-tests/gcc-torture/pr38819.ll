; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/pr38819.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@a = global i32 1, align 4
@b = global i32 0, align 4
@x = global i32 2, align 4
@r = global i32 8, align 4

define void @foo() nounwind uwtable noinline {
entry:
  call void @exit(i32 0) noreturn
  unreachable

return:                                           ; No predecessors!
  ret void
}

declare void @exit(i32) noreturn

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %si1 = alloca i32, align 4
  %si2 = alloca i32, align 4
  %i = alloca i32, align 4
  store i32 0, i32* %retval
  %0 = load volatile i32* @a, align 4
  store i32 %0, i32* %si1, align 4
  %1 = load volatile i32* @b, align 4
  store i32 %1, i32* %si2, align 4
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %2 = load i32* %i, align 4
  %cmp = icmp slt i32 %2, 100
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  call void @foo()
  %3 = load volatile i32* @x, align 4
  %cmp1 = icmp eq i32 %3, 8
  br i1 %cmp1, label %if.then, label %if.end

if.then:                                          ; preds = %for.body
  %4 = load i32* %i, align 4
  %inc = add nsw i32 %4, 1
  store i32 %inc, i32* %i, align 4
  br label %if.end

if.end:                                           ; preds = %if.then, %for.body
  %5 = load i32* %i, align 4
  %6 = load i32* %si1, align 4
  %7 = load i32* %si2, align 4
  %rem = srem i32 %6, %7
  %add = add nsw i32 %5, %rem
  %8 = load volatile i32* @r, align 4
  %add2 = add nsw i32 %8, %add
  store volatile i32 %add2, i32* @r, align 4
  br label %for.inc

for.inc:                                          ; preds = %if.end
  %9 = load i32* %i, align 4
  %inc3 = add nsw i32 %9, 1
  store i32 %inc3, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  call void @abort() noreturn
  unreachable

return:                                           ; No predecessors!
  %10 = load i32* %retval
  ret i32 %10
}

declare void @abort() noreturn
