; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/20041126-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@main.a = private unnamed_addr constant [10 x i32] [i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10], align 16

define void @check(i32* %p) nounwind uwtable {
entry:
  %p.addr = alloca i32*, align 8
  %i = alloca i32, align 4
  store i32* %p, i32** %p.addr, align 8
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32* %i, align 4
  %cmp = icmp slt i32 %0, 5
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %1 = load i32* %i, align 4
  %idxprom = sext i32 %1 to i64
  %2 = load i32** %p.addr, align 8
  %arrayidx = getelementptr inbounds i32* %2, i64 %idxprom
  %3 = load i32* %arrayidx, align 4
  %tobool = icmp ne i32 %3, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %for.body
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %for.body
  br label %for.inc

for.inc:                                          ; preds = %if.end
  %4 = load i32* %i, align 4
  %inc = add nsw i32 %4, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  br label %for.cond1

for.cond1:                                        ; preds = %for.inc9, %for.end
  %5 = load i32* %i, align 4
  %cmp2 = icmp slt i32 %5, 10
  br i1 %cmp2, label %for.body3, label %for.end11

for.body3:                                        ; preds = %for.cond1
  %6 = load i32* %i, align 4
  %idxprom4 = sext i32 %6 to i64
  %7 = load i32** %p.addr, align 8
  %arrayidx5 = getelementptr inbounds i32* %7, i64 %idxprom4
  %8 = load i32* %arrayidx5, align 4
  %9 = load i32* %i, align 4
  %add = add nsw i32 %9, 1
  %cmp6 = icmp ne i32 %8, %add
  br i1 %cmp6, label %if.then7, label %if.end8

if.then7:                                         ; preds = %for.body3
  call void @abort() noreturn nounwind
  unreachable

if.end8:                                          ; preds = %for.body3
  br label %for.inc9

for.inc9:                                         ; preds = %if.end8
  %10 = load i32* %i, align 4
  %inc10 = add nsw i32 %10, 1
  store i32 %inc10, i32* %i, align 4
  br label %for.cond1

for.end11:                                        ; preds = %for.cond1
  ret void
}

declare void @abort() noreturn nounwind

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %a = alloca [10 x i32], align 16
  %i = alloca i32, align 4
  store i32 0, i32* %retval
  %0 = bitcast [10 x i32]* %a to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %0, i8* bitcast ([10 x i32]* @main.a to i8*), i64 40, i32 16, i1 false)
  store i32 -5, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load i32* %i, align 4
  %cmp = icmp slt i32 %1, 0
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %2 = load i32* %i, align 4
  %sub = sub nsw i32 %2, 10
  %call = call i32 @abs(i32 %sub) nounwind readnone
  %sub1 = sub nsw i32 %call, 11
  %idxprom = sext i32 %sub1 to i64
  %arrayidx = getelementptr inbounds [10 x i32]* %a, i32 0, i64 %idxprom
  store i32 0, i32* %arrayidx, align 4
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %3 = load i32* %i, align 4
  %inc = add nsw i32 %3, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %arraydecay = getelementptr inbounds [10 x i32]* %a, i32 0, i32 0
  call void @check(i32* %arraydecay)
  ret i32 0
}

declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture, i64, i32, i1) nounwind

declare i32 @abs(i32) nounwind readnone
