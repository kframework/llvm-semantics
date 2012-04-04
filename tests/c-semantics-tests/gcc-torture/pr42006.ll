; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/pr42006.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval
  %call = call i32 @func_4(i32 0)
  ret i32 0
}

define internal i32 @func_4(i32 %p_6) nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %p_6.addr = alloca i32, align 4
  %count = alloca i32, align 4
  store i32 %p_6, i32* %p_6.addr, align 4
  store i32 0, i32* %count, align 4
  store i32 1, i32* %p_6.addr, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32* %p_6.addr, align 4
  %cmp = icmp ult i32 %0, 3
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %1 = load i32* %count, align 4
  %inc = add nsw i32 %1, 1
  store i32 %inc, i32* %count, align 4
  %cmp1 = icmp sgt i32 %1, 1
  br i1 %cmp1, label %if.then, label %if.end

if.then:                                          ; preds = %for.body
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %for.body
  %2 = load i32* %p_6.addr, align 4
  %3 = load i32* %p_6.addr, align 4
  %call = call i32 @my_shift(i32 %2, i32 %3)
  %tobool = icmp ne i32 %call, 0
  br i1 %tobool, label %if.then2, label %if.end3

if.then2:                                         ; preds = %if.end
  store i32 0, i32* %retval
  br label %return

if.end3:                                          ; preds = %if.end
  br label %for.inc

for.inc:                                          ; preds = %if.end3
  %4 = load i32* %p_6.addr, align 4
  %call4 = call i32 @my_add(i32 %4, i32 1)
  store i32 %call4, i32* %p_6.addr, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  store i32 0, i32* %retval
  br label %return

return:                                           ; preds = %for.end, %if.then2
  %5 = load i32* %retval
  ret i32 %5
}

declare void @abort() noreturn nounwind

define internal i32 @my_shift(i32 %left, i32 %right) nounwind uwtable {
entry:
  %left.addr = alloca i32, align 4
  %right.addr = alloca i32, align 4
  store i32 %left, i32* %left.addr, align 4
  store i32 %right, i32* %right.addr, align 4
  %0 = load i32* %right.addr, align 4
  %cmp = icmp ugt i32 %0, 100
  br i1 %cmp, label %cond.true, label %cond.false

cond.true:                                        ; preds = %entry
  %1 = load i32* %left.addr, align 4
  br label %cond.end

cond.false:                                       ; preds = %entry
  %2 = load i32* %left.addr, align 4
  %3 = load i32* %right.addr, align 4
  %shr = lshr i32 %2, %3
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %1, %cond.true ], [ %shr, %cond.false ]
  ret i32 %cond
}

define internal i32 @my_add(i32 %si1, i32 %si2) nounwind uwtable {
entry:
  %si1.addr = alloca i32, align 4
  %si2.addr = alloca i32, align 4
  store i32 %si1, i32* %si1.addr, align 4
  store i32 %si2, i32* %si2.addr, align 4
  %0 = load i32* %si1.addr, align 4
  %1 = load i32* %si2.addr, align 4
  %sub = sub i32 50, %1
  %cmp = icmp ugt i32 %0, %sub
  br i1 %cmp, label %cond.true, label %cond.false

cond.true:                                        ; preds = %entry
  %2 = load i32* %si1.addr, align 4
  br label %cond.end

cond.false:                                       ; preds = %entry
  %3 = load i32* %si1.addr, align 4
  %4 = load i32* %si2.addr, align 4
  %add = add i32 %3, %4
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %2, %cond.true ], [ %add, %cond.false ]
  ret i32 %cond
}
