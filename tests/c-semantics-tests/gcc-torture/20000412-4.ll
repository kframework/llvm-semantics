; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/20000412-4.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

define void @f(i32 %i, i32 %j, i32 %radius, i32 %width, i32 %N) nounwind uwtable {
entry:
  %i.addr = alloca i32, align 4
  %j.addr = alloca i32, align 4
  %radius.addr = alloca i32, align 4
  %width.addr = alloca i32, align 4
  %N.addr = alloca i32, align 4
  %diff = alloca i32, align 4
  %lowk = alloca i32, align 4
  %k = alloca i32, align 4
  %idx = alloca i32, align 4
  store i32 %i, i32* %i.addr, align 4
  store i32 %j, i32* %j.addr, align 4
  store i32 %radius, i32* %radius.addr, align 4
  store i32 %width, i32* %width.addr, align 4
  store i32 %N, i32* %N.addr, align 4
  %0 = load i32* %i.addr, align 4
  %1 = load i32* %radius.addr, align 4
  %sub = sub nsw i32 %0, %1
  store i32 %sub, i32* %diff, align 4
  %2 = load i32* %diff, align 4
  %cmp = icmp sgt i32 %2, 0
  br i1 %cmp, label %cond.true, label %cond.false

cond.true:                                        ; preds = %entry
  %3 = load i32* %diff, align 4
  br label %cond.end

cond.false:                                       ; preds = %entry
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %3, %cond.true ], [ 0, %cond.false ]
  store i32 %cond, i32* %lowk, align 4
  %4 = load i32* %lowk, align 4
  store i32 %4, i32* %k, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %cond.end
  %5 = load i32* %k, align 4
  %cmp1 = icmp sle i32 %5, 2
  br i1 %cmp1, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %6 = load i32* %k, align 4
  %7 = load i32* %i.addr, align 4
  %sub2 = sub nsw i32 %6, %7
  %8 = load i32* %radius.addr, align 4
  %add = add nsw i32 %sub2, %8
  %9 = load i32* %width.addr, align 4
  %mul = mul nsw i32 %add, %9
  %10 = load i32* %j.addr, align 4
  %sub3 = sub nsw i32 %mul, %10
  %11 = load i32* %radius.addr, align 4
  %add4 = add nsw i32 %sub3, %11
  store i32 %add4, i32* %idx, align 4
  %12 = load i32* %idx, align 4
  %cmp5 = icmp slt i32 %12, 0
  br i1 %cmp5, label %if.then, label %if.end

if.then:                                          ; preds = %for.body
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %for.body
  br label %for.inc

for.inc:                                          ; preds = %if.end
  %13 = load i32* %k, align 4
  %inc = add nsw i32 %13, 1
  store i32 %inc, i32* %k, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %14 = load i32* %lowk, align 4
  store i32 %14, i32* %k, align 4
  br label %for.cond6

for.cond6:                                        ; preds = %for.inc9, %for.end
  %15 = load i32* %k, align 4
  %cmp7 = icmp sle i32 %15, 2
  br i1 %cmp7, label %for.body8, label %for.end11

for.body8:                                        ; preds = %for.cond6
  br label %for.inc9

for.inc9:                                         ; preds = %for.body8
  %16 = load i32* %k, align 4
  %inc10 = add nsw i32 %16, 1
  store i32 %inc10, i32* %k, align 4
  br label %for.cond6

for.end11:                                        ; preds = %for.cond6
  ret void
}

declare void @abort() noreturn nounwind

define i32 @main(i32 %argc, i8** %argv) nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  %exc_rad = alloca i32, align 4
  %N = alloca i32, align 4
  %i = alloca i32, align 4
  store i32 0, i32* %retval
  store i32 %argc, i32* %argc.addr, align 4
  store i8** %argv, i8*** %argv.addr, align 8
  store i32 2, i32* %exc_rad, align 4
  store i32 8, i32* %N, align 4
  store i32 1, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32* %i, align 4
  %cmp = icmp slt i32 %0, 4
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %1 = load i32* %i, align 4
  %2 = load i32* %exc_rad, align 4
  %3 = load i32* %exc_rad, align 4
  %mul = mul nsw i32 2, %3
  %add = add nsw i32 %mul, 1
  %4 = load i32* %N, align 4
  call void @f(i32 %1, i32 1, i32 %2, i32 %add, i32 %4)
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %5 = load i32* %i, align 4
  %inc = add nsw i32 %5, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  call void @exit(i32 0) noreturn nounwind
  unreachable

return:                                           ; No predecessors!
  %6 = load i32* %retval
  ret i32 %6
}

declare void @exit(i32) noreturn nounwind
