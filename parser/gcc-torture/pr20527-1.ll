; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/pr20527-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@b = global [4 x i64] [i64 1, i64 5, i64 11, i64 23], align 16

define void @f(i64* %limit, i64* %base, i64 %minLen, i64 %maxLen) nounwind uwtable noinline {
entry:
  %limit.addr = alloca i64*, align 8
  %base.addr = alloca i64*, align 8
  %minLen.addr = alloca i64, align 8
  %maxLen.addr = alloca i64, align 8
  %i = alloca i64, align 8
  %vec = alloca i64, align 8
  store i64* %limit, i64** %limit.addr, align 8
  store i64* %base, i64** %base.addr, align 8
  store i64 %minLen, i64* %minLen.addr, align 8
  store i64 %maxLen, i64* %maxLen.addr, align 8
  store i64 0, i64* %vec, align 8
  %tmp = load i64* %minLen.addr, align 8
  store i64 %tmp, i64* %i, align 8
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %tmp1 = load i64* %i, align 8
  %tmp2 = load i64* %maxLen.addr, align 8
  %cmp = icmp sle i64 %tmp1, %tmp2
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %tmp3 = load i64* %i, align 8
  %add = add nsw i64 %tmp3, 1
  %tmp4 = load i64** %base.addr, align 8
  %arrayidx = getelementptr inbounds i64* %tmp4, i64 %add
  %tmp5 = load i64* %arrayidx
  %tmp6 = load i64* %i, align 8
  %tmp7 = load i64** %base.addr, align 8
  %arrayidx8 = getelementptr inbounds i64* %tmp7, i64 %tmp6
  %tmp9 = load i64* %arrayidx8
  %sub = sub nsw i64 %tmp5, %tmp9
  %tmp10 = load i64* %vec, align 8
  %add11 = add nsw i64 %tmp10, %sub
  store i64 %add11, i64* %vec, align 8
  %tmp12 = load i64* %vec, align 8
  %sub13 = sub nsw i64 %tmp12, 1
  %tmp14 = load i64* %i, align 8
  %tmp15 = load i64** %limit.addr, align 8
  %arrayidx16 = getelementptr inbounds i64* %tmp15, i64 %tmp14
  store i64 %sub13, i64* %arrayidx16
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %tmp17 = load i64* %i, align 8
  %inc = add nsw i64 %tmp17, 1
  store i64 %inc, i64* %i, align 8
  br label %for.cond

for.end:                                          ; preds = %for.cond
  ret void
}

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %l = alloca [3 x i64], align 16
  store i32 0, i32* %retval
  %arraydecay = getelementptr inbounds [3 x i64]* %l, i32 0, i32 0
  call void @f(i64* %arraydecay, i64* getelementptr inbounds ([4 x i64]* @b, i32 0, i32 0), i64 0, i64 2)
  %arrayidx = getelementptr inbounds [3 x i64]* %l, i32 0, i64 0
  %tmp = load i64* %arrayidx, align 8
  %cmp = icmp ne i64 %tmp, 3
  br i1 %cmp, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %arrayidx1 = getelementptr inbounds [3 x i64]* %l, i32 0, i64 1
  %tmp2 = load i64* %arrayidx1, align 8
  %cmp3 = icmp ne i64 %tmp2, 9
  br i1 %cmp3, label %if.then, label %lor.lhs.false4

lor.lhs.false4:                                   ; preds = %lor.lhs.false
  %arrayidx5 = getelementptr inbounds [3 x i64]* %l, i32 0, i64 2
  %tmp6 = load i64* %arrayidx5, align 8
  %cmp7 = icmp ne i64 %tmp6, 21
  br i1 %cmp7, label %if.then, label %if.end

if.then:                                          ; preds = %lor.lhs.false4, %lor.lhs.false, %entry
  call void @abort() noreturn
  unreachable

if.end:                                           ; preds = %lor.lhs.false4
  call void @exit(i32 0) noreturn
  unreachable

return:                                           ; No predecessors!
  %0 = load i32* %retval
  ret i32 %0
}

declare void @abort() noreturn

declare void @exit(i32) noreturn
