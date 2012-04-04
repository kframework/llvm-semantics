; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/pr32500.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@x = common global i32 0, align 4
@main.numbers = private unnamed_addr constant [4 x i32] [i32 57005, i32 48879, i32 4919, i32 16962], align 16

define void @foo(i32 %i) nounwind uwtable noinline {
entry:
  %i.addr = alloca i32, align 4
  store i32 %i, i32* %i.addr, align 4
  %0 = load i32* %i.addr, align 4
  store i32 %0, i32* @x, align 4
  ret void
}

define void @bar() nounwind uwtable noinline {
entry:
  call void @exit(i32 0) noreturn
  unreachable

return:                                           ; No predecessors!
  ret void
}

declare void @exit(i32) noreturn

define i32 @main(i32 %argc, i8** %argv) nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  %i = alloca i32, align 4
  %numbers = alloca [4 x i32], align 16
  store i32 0, i32* %retval
  store i32 %argc, i32* %argc.addr, align 4
  store i8** %argv, i8*** %argv.addr, align 8
  %0 = bitcast [4 x i32]* %numbers to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %0, i8* bitcast ([4 x i32]* @main.numbers to i8*), i64 16, i32 16, i1 false)
  store i32 1, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load i32* %i, align 4
  %cmp = icmp sle i32 %1, 12
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %2 = load i32* %i, align 4
  %cmp1 = icmp sle i32 %2, 4
  br i1 %cmp1, label %if.then, label %if.else

if.then:                                          ; preds = %for.body
  %3 = load i32* %i, align 4
  %sub = sub nsw i32 %3, 1
  %idxprom = sext i32 %sub to i64
  %arrayidx = getelementptr inbounds [4 x i32]* %numbers, i32 0, i64 %idxprom
  %4 = load i32* %arrayidx, align 4
  call void @foo(i32 %4)
  br label %if.end5

if.else:                                          ; preds = %for.body
  %5 = load i32* %i, align 4
  %cmp2 = icmp sge i32 %5, 7
  br i1 %cmp2, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %if.else
  %6 = load i32* %i, align 4
  %cmp3 = icmp sle i32 %6, 9
  br i1 %cmp3, label %if.then4, label %if.end

if.then4:                                         ; preds = %land.lhs.true
  call void @bar()
  br label %if.end

if.end:                                           ; preds = %if.then4, %land.lhs.true, %if.else
  br label %if.end5

if.end5:                                          ; preds = %if.end, %if.then
  br label %for.inc

for.inc:                                          ; preds = %if.end5
  %7 = load i32* %i, align 4
  %inc = add nsw i32 %7, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  call void @abort() noreturn
  unreachable

return:                                           ; No predecessors!
  %8 = load i32* %retval
  ret i32 %8
}

declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture, i64, i32, i1) nounwind

declare void @abort() noreturn
