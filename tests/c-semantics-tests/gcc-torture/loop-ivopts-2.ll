; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/loop-ivopts-2.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

define void @check(i32* %l) nounwind uwtable {
entry:
  %l.addr = alloca i32*, align 8
  %i = alloca i32, align 4
  store i32* %l, i32** %l.addr, align 8
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32* %i, align 4
  %cmp = icmp slt i32 %0, 288
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %1 = load i32* %i, align 4
  %idxprom = sext i32 %1 to i64
  %2 = load i32** %l.addr, align 8
  %arrayidx = getelementptr inbounds i32* %2, i64 %idxprom
  %3 = load i32* %arrayidx, align 4
  %4 = load i32* %i, align 4
  %cmp1 = icmp slt i32 %4, 256
  br i1 %cmp1, label %lor.end, label %lor.rhs

lor.rhs:                                          ; preds = %for.body
  %5 = load i32* %i, align 4
  %cmp2 = icmp sge i32 %5, 280
  br label %lor.end

lor.end:                                          ; preds = %lor.rhs, %for.body
  %6 = phi i1 [ true, %for.body ], [ %cmp2, %lor.rhs ]
  %lor.ext = zext i1 %6 to i32
  %add = add nsw i32 7, %lor.ext
  %7 = load i32* %i, align 4
  %cmp3 = icmp sge i32 %7, 144
  br i1 %cmp3, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %lor.end
  %8 = load i32* %i, align 4
  %cmp4 = icmp slt i32 %8, 256
  br label %land.end

land.end:                                         ; preds = %land.rhs, %lor.end
  %9 = phi i1 [ false, %lor.end ], [ %cmp4, %land.rhs ]
  %land.ext = zext i1 %9 to i32
  %add5 = add nsw i32 %add, %land.ext
  %cmp6 = icmp ne i32 %3, %add5
  br i1 %cmp6, label %if.then, label %if.end

if.then:                                          ; preds = %land.end
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %land.end
  br label %for.inc

for.inc:                                          ; preds = %if.end
  %10 = load i32* %i, align 4
  %inc = add nsw i32 %10, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  ret void
}

declare void @abort() noreturn nounwind

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %i = alloca i32, align 4
  %l = alloca [288 x i32], align 16
  store i32 0, i32* %retval
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32* %i, align 4
  %cmp = icmp slt i32 %0, 144
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %1 = load i32* %i, align 4
  %idxprom = sext i32 %1 to i64
  %arrayidx = getelementptr inbounds [288 x i32]* %l, i32 0, i64 %idxprom
  store i32 8, i32* %arrayidx, align 4
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %2 = load i32* %i, align 4
  %inc = add nsw i32 %2, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  br label %for.cond1

for.cond1:                                        ; preds = %for.inc6, %for.end
  %3 = load i32* %i, align 4
  %cmp2 = icmp slt i32 %3, 256
  br i1 %cmp2, label %for.body3, label %for.end8

for.body3:                                        ; preds = %for.cond1
  %4 = load i32* %i, align 4
  %idxprom4 = sext i32 %4 to i64
  %arrayidx5 = getelementptr inbounds [288 x i32]* %l, i32 0, i64 %idxprom4
  store i32 9, i32* %arrayidx5, align 4
  br label %for.inc6

for.inc6:                                         ; preds = %for.body3
  %5 = load i32* %i, align 4
  %inc7 = add nsw i32 %5, 1
  store i32 %inc7, i32* %i, align 4
  br label %for.cond1

for.end8:                                         ; preds = %for.cond1
  br label %for.cond9

for.cond9:                                        ; preds = %for.inc14, %for.end8
  %6 = load i32* %i, align 4
  %cmp10 = icmp slt i32 %6, 280
  br i1 %cmp10, label %for.body11, label %for.end16

for.body11:                                       ; preds = %for.cond9
  %7 = load i32* %i, align 4
  %idxprom12 = sext i32 %7 to i64
  %arrayidx13 = getelementptr inbounds [288 x i32]* %l, i32 0, i64 %idxprom12
  store i32 7, i32* %arrayidx13, align 4
  br label %for.inc14

for.inc14:                                        ; preds = %for.body11
  %8 = load i32* %i, align 4
  %inc15 = add nsw i32 %8, 1
  store i32 %inc15, i32* %i, align 4
  br label %for.cond9

for.end16:                                        ; preds = %for.cond9
  br label %for.cond17

for.cond17:                                       ; preds = %for.inc22, %for.end16
  %9 = load i32* %i, align 4
  %cmp18 = icmp slt i32 %9, 288
  br i1 %cmp18, label %for.body19, label %for.end24

for.body19:                                       ; preds = %for.cond17
  %10 = load i32* %i, align 4
  %idxprom20 = sext i32 %10 to i64
  %arrayidx21 = getelementptr inbounds [288 x i32]* %l, i32 0, i64 %idxprom20
  store i32 8, i32* %arrayidx21, align 4
  br label %for.inc22

for.inc22:                                        ; preds = %for.body19
  %11 = load i32* %i, align 4
  %inc23 = add nsw i32 %11, 1
  store i32 %inc23, i32* %i, align 4
  br label %for.cond17

for.end24:                                        ; preds = %for.cond17
  %arraydecay = getelementptr inbounds [288 x i32]* %l, i32 0, i32 0
  call void @check(i32* %arraydecay)
  ret i32 0
}
