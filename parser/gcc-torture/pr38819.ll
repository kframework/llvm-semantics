; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/pr38819.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
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
  %tmp = volatile load i32* @a, align 4
  store i32 %tmp, i32* %si1, align 4
  %tmp2 = volatile load i32* @b, align 4
  store i32 %tmp2, i32* %si2, align 4
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %tmp4 = load i32* %i, align 4
  %cmp = icmp slt i32 %tmp4, 100
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  call void @foo()
  %tmp5 = volatile load i32* @x, align 4
  %cmp6 = icmp eq i32 %tmp5, 8
  br i1 %cmp6, label %if.then, label %if.end

if.then:                                          ; preds = %for.body
  %tmp7 = load i32* %i, align 4
  %inc = add nsw i32 %tmp7, 1
  store i32 %inc, i32* %i, align 4
  br label %if.end

if.end:                                           ; preds = %if.then, %for.body
  %tmp8 = load i32* %i, align 4
  %tmp9 = load i32* %si1, align 4
  %tmp10 = load i32* %si2, align 4
  %rem = srem i32 %tmp9, %tmp10
  %add = add nsw i32 %tmp8, %rem
  %tmp11 = volatile load i32* @r, align 4
  %add12 = add nsw i32 %tmp11, %add
  volatile store i32 %add12, i32* @r, align 4
  br label %for.inc

for.inc:                                          ; preds = %if.end
  %tmp13 = load i32* %i, align 4
  %inc14 = add nsw i32 %tmp13, 1
  store i32 %inc14, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  call void @abort() noreturn
  unreachable

return:                                           ; No predecessors!
  %0 = load i32* %retval
  ret i32 %0
}

declare void @abort() noreturn
