; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/loop-2b.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@a = common global [2 x i32] zeroinitializer, align 4

define void @f(i32 %i) nounwind uwtable {
entry:
  %i.addr = alloca i32, align 4
  store i32 %i, i32* %i.addr, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32* %i.addr, align 4
  %cmp = icmp slt i32 %0, 2147483647
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %1 = load i32* %i.addr, align 4
  %idxprom = sext i32 %1 to i64
  %arrayidx = getelementptr inbounds [2 x i32]* @a, i32 0, i64 %idxprom
  store i32 -2, i32* %arrayidx, align 4
  %2 = load i32* %i.addr, align 4
  %idxprom1 = sext i32 %2 to i64
  %arrayidx2 = getelementptr inbounds [2 x i32]* @a, i32 0, i64 %idxprom1
  %cmp3 = icmp eq i32* %arrayidx2, getelementptr inbounds ([2 x i32]* @a, i32 0, i64 1)
  br i1 %cmp3, label %if.then, label %if.end

if.then:                                          ; preds = %for.body
  br label %for.end

if.end:                                           ; preds = %for.body
  br label %for.inc

for.inc:                                          ; preds = %if.end
  %3 = load i32* %i.addr, align 4
  %inc = add nsw i32 %3, 1
  store i32 %inc, i32* %i.addr, align 4
  br label %for.cond

for.end:                                          ; preds = %if.then, %for.cond
  ret void
}

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval
  store i32 0, i32* getelementptr inbounds ([2 x i32]* @a, i32 0, i64 1), align 4
  store i32 0, i32* getelementptr inbounds ([2 x i32]* @a, i32 0, i64 0), align 4
  call void @f(i32 0)
  %0 = load i32* getelementptr inbounds ([2 x i32]* @a, i32 0, i64 0), align 4
  %cmp = icmp ne i32 %0, -2
  br i1 %cmp, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %1 = load i32* getelementptr inbounds ([2 x i32]* @a, i32 0, i64 1), align 4
  %cmp1 = icmp ne i32 %1, -2
  br i1 %cmp1, label %if.then, label %if.end

if.then:                                          ; preds = %lor.lhs.false, %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %lor.lhs.false
  call void @exit(i32 0) noreturn nounwind
  unreachable

return:                                           ; No predecessors!
  %2 = load i32* %retval
  ret i32 %2
}

declare void @abort() noreturn nounwind

declare void @exit(i32) noreturn nounwind
