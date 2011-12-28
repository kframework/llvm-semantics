; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/loop-2.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@a = common global [2 x i32] zeroinitializer, align 4

define void @f(i32 %b) nounwind uwtable {
entry:
  %b.addr = alloca i32, align 4
  %i = alloca i32, align 4
  store i32 %b, i32* %b.addr, align 4
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %tmp = load i32* %i, align 4
  %tmp1 = load i32* %b.addr, align 4
  %cmp = icmp ult i32 %tmp, %tmp1
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %tmp2 = load i32* %i, align 4
  %sub = sub i32 %tmp2, 2
  %tmp3 = load i32* %i, align 4
  %idxprom = zext i32 %tmp3 to i64
  %arrayidx = getelementptr inbounds [2 x i32]* @a, i32 0, i64 %idxprom
  store i32 %sub, i32* %arrayidx, align 4
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %tmp4 = load i32* %i, align 4
  %inc = add i32 %tmp4, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  ret void
}

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval
  store i32 0, i32* getelementptr inbounds ([2 x i32]* @a, i32 0, i64 1), align 4
  store i32 0, i32* getelementptr inbounds ([2 x i32]* @a, i32 0, i64 0), align 4
  call void (...)* bitcast (void (i32)* @f to void (...)*)(i32 2)
  %tmp = load i32* getelementptr inbounds ([2 x i32]* @a, i32 0, i64 0), align 4
  %cmp = icmp ne i32 %tmp, -2
  br i1 %cmp, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %tmp1 = load i32* getelementptr inbounds ([2 x i32]* @a, i32 0, i64 1), align 4
  %cmp2 = icmp ne i32 %tmp1, -1
  br i1 %cmp2, label %if.then, label %if.end

if.then:                                          ; preds = %lor.lhs.false, %entry
  call void @abort() noreturn
  unreachable

if.end:                                           ; preds = %lor.lhs.false
  call void @exit(i32 0) noreturn
  unreachable

return:                                           ; No predecessors!
  %0 = load i32* %retval
  ret i32 %0
}

declare void @abort() noreturn

declare void @exit(i32) noreturn
