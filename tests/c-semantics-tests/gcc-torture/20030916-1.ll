; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/20030916-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

define void @f(i32* %x) nounwind uwtable {
entry:
  %x.addr = alloca i32*, align 8
  %i = alloca i8, align 1
  %j = alloca i32, align 4
  store i32* %x, i32** %x.addr, align 8
  store i8 16, i8* %i, align 1
  store i32 0, i32* %j, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32* %j, align 4
  %cmp = icmp slt i32 %0, 16
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %1 = load i8* %i, align 1
  %conv = zext i8 %1 to i32
  %add = add nsw i32 %conv, 232
  %conv1 = trunc i32 %add to i8
  store i8 %conv1, i8* %i, align 1
  %2 = load i8* %i, align 1
  %idxprom = zext i8 %2 to i64
  %3 = load i32** %x.addr, align 8
  %arrayidx = getelementptr inbounds i32* %3, i64 %idxprom
  store i32 0, i32* %arrayidx, align 4
  %4 = load i8* %i, align 1
  %conv2 = zext i8 %4 to i32
  %sub = sub nsw i32 %conv2, 231
  %conv3 = trunc i32 %sub to i8
  store i8 %conv3, i8* %i, align 1
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %5 = load i32* %j, align 4
  %inc = add nsw i32 %5, 1
  store i32 %inc, i32* %j, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  ret void
}

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %x = alloca [256 x i32], align 16
  %i = alloca i32, align 4
  store i32 0, i32* %retval
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32* %i, align 4
  %cmp = icmp slt i32 %0, 256
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %1 = load i32* %i, align 4
  %idxprom = sext i32 %1 to i64
  %arrayidx = getelementptr inbounds [256 x i32]* %x, i32 0, i64 %idxprom
  store i32 1, i32* %arrayidx, align 4
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %2 = load i32* %i, align 4
  %inc = add nsw i32 %2, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %arraydecay = getelementptr inbounds [256 x i32]* %x, i32 0, i32 0
  call void @f(i32* %arraydecay)
  store i32 0, i32* %i, align 4
  br label %for.cond1

for.cond1:                                        ; preds = %for.inc9, %for.end
  %3 = load i32* %i, align 4
  %cmp2 = icmp slt i32 %3, 256
  br i1 %cmp2, label %for.body3, label %for.end11

for.body3:                                        ; preds = %for.cond1
  %4 = load i32* %i, align 4
  %idxprom4 = sext i32 %4 to i64
  %arrayidx5 = getelementptr inbounds [256 x i32]* %x, i32 0, i64 %idxprom4
  %5 = load i32* %arrayidx5, align 4
  %6 = load i32* %i, align 4
  %cmp6 = icmp sge i32 %6, 8
  br i1 %cmp6, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %for.body3
  %7 = load i32* %i, align 4
  %cmp7 = icmp slt i32 %7, 248
  br label %land.end

land.end:                                         ; preds = %land.rhs, %for.body3
  %8 = phi i1 [ false, %for.body3 ], [ %cmp7, %land.rhs ]
  %land.ext = zext i1 %8 to i32
  %cmp8 = icmp ne i32 %5, %land.ext
  br i1 %cmp8, label %if.then, label %if.end

if.then:                                          ; preds = %land.end
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %land.end
  br label %for.inc9

for.inc9:                                         ; preds = %if.end
  %9 = load i32* %i, align 4
  %inc10 = add nsw i32 %9, 1
  store i32 %inc10, i32* %i, align 4
  br label %for.cond1

for.end11:                                        ; preds = %for.cond1
  call void @exit(i32 0) noreturn nounwind
  unreachable

return:                                           ; No predecessors!
  %10 = load i32* %retval
  ret i32 %10
}

declare void @abort() noreturn nounwind

declare void @exit(i32) noreturn nounwind
