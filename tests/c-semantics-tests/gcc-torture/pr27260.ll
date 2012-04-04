; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/pr27260.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@buf = common global [65 x i8] zeroinitializer, align 16

define void @foo(i32 %x) nounwind uwtable {
entry:
  %x.addr = alloca i32, align 4
  store i32 %x, i32* %x.addr, align 4
  %0 = load i32* %x.addr, align 4
  %cmp = icmp ne i32 %0, 2
  %cond = select i1 %cmp, i32 1, i32 0
  %1 = trunc i32 %cond to i8
  call void @llvm.memset.p0i8.i64(i8* getelementptr inbounds ([65 x i8]* @buf, i32 0, i32 0), i8 %1, i64 64, i32 1, i1 false)
  ret void
}

declare void @llvm.memset.p0i8.i64(i8* nocapture, i8, i64, i32, i1) nounwind

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %i = alloca i32, align 4
  store i32 0, i32* %retval
  store i8 2, i8* getelementptr inbounds ([65 x i8]* @buf, i32 0, i64 64), align 1
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32* %i, align 4
  %cmp = icmp slt i32 %0, 64
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %1 = load i32* %i, align 4
  %idxprom = sext i32 %1 to i64
  %arrayidx = getelementptr inbounds [65 x i8]* @buf, i32 0, i64 %idxprom
  %2 = load i8* %arrayidx, align 1
  %conv = sext i8 %2 to i32
  %cmp1 = icmp ne i32 %conv, 0
  br i1 %cmp1, label %if.then, label %if.end

if.then:                                          ; preds = %for.body
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %for.body
  br label %for.inc

for.inc:                                          ; preds = %if.end
  %3 = load i32* %i, align 4
  %inc = add nsw i32 %3, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  call void @foo(i32 0)
  store i32 0, i32* %i, align 4
  br label %for.cond3

for.cond3:                                        ; preds = %for.inc14, %for.end
  %4 = load i32* %i, align 4
  %cmp4 = icmp slt i32 %4, 64
  br i1 %cmp4, label %for.body6, label %for.end16

for.body6:                                        ; preds = %for.cond3
  %5 = load i32* %i, align 4
  %idxprom7 = sext i32 %5 to i64
  %arrayidx8 = getelementptr inbounds [65 x i8]* @buf, i32 0, i64 %idxprom7
  %6 = load i8* %arrayidx8, align 1
  %conv9 = sext i8 %6 to i32
  %cmp10 = icmp ne i32 %conv9, 1
  br i1 %cmp10, label %if.then12, label %if.end13

if.then12:                                        ; preds = %for.body6
  call void @abort() noreturn nounwind
  unreachable

if.end13:                                         ; preds = %for.body6
  br label %for.inc14

for.inc14:                                        ; preds = %if.end13
  %7 = load i32* %i, align 4
  %inc15 = add nsw i32 %7, 1
  store i32 %inc15, i32* %i, align 4
  br label %for.cond3

for.end16:                                        ; preds = %for.cond3
  call void @foo(i32 2)
  store i32 0, i32* %i, align 4
  br label %for.cond17

for.cond17:                                       ; preds = %for.inc28, %for.end16
  %8 = load i32* %i, align 4
  %cmp18 = icmp slt i32 %8, 64
  br i1 %cmp18, label %for.body20, label %for.end30

for.body20:                                       ; preds = %for.cond17
  %9 = load i32* %i, align 4
  %idxprom21 = sext i32 %9 to i64
  %arrayidx22 = getelementptr inbounds [65 x i8]* @buf, i32 0, i64 %idxprom21
  %10 = load i8* %arrayidx22, align 1
  %conv23 = sext i8 %10 to i32
  %cmp24 = icmp ne i32 %conv23, 0
  br i1 %cmp24, label %if.then26, label %if.end27

if.then26:                                        ; preds = %for.body20
  call void @abort() noreturn nounwind
  unreachable

if.end27:                                         ; preds = %for.body20
  br label %for.inc28

for.inc28:                                        ; preds = %if.end27
  %11 = load i32* %i, align 4
  %inc29 = add nsw i32 %11, 1
  store i32 %inc29, i32* %i, align 4
  br label %for.cond17

for.end30:                                        ; preds = %for.cond17
  %12 = load i8* getelementptr inbounds ([65 x i8]* @buf, i32 0, i64 64), align 1
  %conv31 = sext i8 %12 to i32
  %cmp32 = icmp ne i32 %conv31, 2
  br i1 %cmp32, label %if.then34, label %if.end35

if.then34:                                        ; preds = %for.end30
  call void @abort() noreturn nounwind
  unreachable

if.end35:                                         ; preds = %for.end30
  ret i32 0
}

declare void @abort() noreturn nounwind
