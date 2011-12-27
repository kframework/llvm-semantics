; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/pr20527-1.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@b = global [4 x i64] [i64 1, i64 5, i64 11, i64 23], align 16

define void @f(i64* %limit, i64* %base, i64 %minLen, i64 %maxLen) nounwind uwtable noinline {
entry:
  %cmp2 = icmp sgt i64 %minLen, %maxLen
  br i1 %cmp2, label %for.end, label %for.body.lr.ph

for.body.lr.ph:                                   ; preds = %entry
  %tmp6 = add i64 %minLen, 1
  br label %for.body

for.body:                                         ; preds = %for.body.lr.ph, %for.body
  %indvar = phi i64 [ 0, %for.body.lr.ph ], [ %indvar.next, %for.body ]
  %add1113 = phi i64 [ 0, %for.body.lr.ph ], [ %add11, %for.body ]
  %tmp = add i64 %indvar, %minLen
  %arrayidx16 = getelementptr i64* %limit, i64 %tmp
  %arrayidx8 = getelementptr i64* %base, i64 %tmp
  %add = add i64 %tmp6, %indvar
  %arrayidx = getelementptr i64* %base, i64 %add
  %tmp5 = load i64* %arrayidx, align 8
  %tmp9 = load i64* %arrayidx8, align 8
  %sub = sub nsw i64 %tmp5, %tmp9
  %add11 = add nsw i64 %sub, %add1113
  %sub13 = add nsw i64 %add11, -1
  store i64 %sub13, i64* %arrayidx16, align 8
  %cmp = icmp sgt i64 %add, %maxLen
  %indvar.next = add i64 %indvar, 1
  br i1 %cmp, label %for.end, label %for.body

for.end:                                          ; preds = %for.body, %entry
  ret void
}

define i32 @main() noreturn nounwind uwtable {
entry:
  %l = alloca [3 x i64], align 16
  %arraydecay = getelementptr inbounds [3 x i64]* %l, i64 0, i64 0
  call void @f(i64* %arraydecay, i64* getelementptr inbounds ([4 x i64]* @b, i64 0, i64 0), i64 0, i64 2)
  %tmp = load i64* %arraydecay, align 16
  %cmp = icmp eq i64 %tmp, 3
  br i1 %cmp, label %lor.lhs.false, label %if.then

lor.lhs.false:                                    ; preds = %entry
  %arrayidx1 = getelementptr inbounds [3 x i64]* %l, i64 0, i64 1
  %tmp2 = load i64* %arrayidx1, align 8
  %cmp3 = icmp eq i64 %tmp2, 9
  br i1 %cmp3, label %lor.lhs.false4, label %if.then

lor.lhs.false4:                                   ; preds = %lor.lhs.false
  %arrayidx5 = getelementptr inbounds [3 x i64]* %l, i64 0, i64 2
  %tmp6 = load i64* %arrayidx5, align 16
  %cmp7 = icmp eq i64 %tmp6, 21
  br i1 %cmp7, label %if.end, label %if.then

if.then:                                          ; preds = %lor.lhs.false4, %lor.lhs.false, %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %lor.lhs.false4
  call void @exit(i32 0) noreturn nounwind
  unreachable
}

declare void @abort() noreturn

declare void @exit(i32) noreturn
