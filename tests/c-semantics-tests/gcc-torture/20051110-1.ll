; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/20051110-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@bytes = common global [5 x i8] zeroinitializer, align 1

define void @add_unwind_adjustsp(i64 %offset) nounwind uwtable {
entry:
  %offset.addr = alloca i64, align 8
  %n = alloca i32, align 4
  %o = alloca i64, align 8
  store i64 %offset, i64* %offset.addr, align 8
  %0 = load i64* %offset.addr, align 8
  %sub = sub nsw i64 %0, 516
  %shr = ashr i64 %sub, 2
  store i64 %shr, i64* %o, align 8
  store i32 0, i32* %n, align 4
  br label %while.cond

while.cond:                                       ; preds = %if.end, %entry
  %1 = load i64* %o, align 8
  %tobool = icmp ne i64 %1, 0
  br i1 %tobool, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %2 = load i64* %o, align 8
  %and = and i64 %2, 127
  %conv = trunc i64 %and to i8
  %3 = load i32* %n, align 4
  %idxprom = sext i32 %3 to i64
  %arrayidx = getelementptr inbounds [5 x i8]* @bytes, i32 0, i64 %idxprom
  store i8 %conv, i8* %arrayidx, align 1
  %4 = load i64* %o, align 8
  %shr1 = lshr i64 %4, 7
  store i64 %shr1, i64* %o, align 8
  %5 = load i64* %o, align 8
  %tobool2 = icmp ne i64 %5, 0
  br i1 %tobool2, label %if.then, label %if.end

if.then:                                          ; preds = %while.body
  %6 = load i32* %n, align 4
  %idxprom3 = sext i32 %6 to i64
  %arrayidx4 = getelementptr inbounds [5 x i8]* @bytes, i32 0, i64 %idxprom3
  %7 = load i8* %arrayidx4, align 1
  %conv5 = zext i8 %7 to i32
  %or = or i32 %conv5, 128
  %conv6 = trunc i32 %or to i8
  store i8 %conv6, i8* %arrayidx4, align 1
  br label %if.end

if.end:                                           ; preds = %if.then, %while.body
  %8 = load i32* %n, align 4
  %inc = add nsw i32 %8, 1
  store i32 %inc, i32* %n, align 4
  br label %while.cond

while.end:                                        ; preds = %while.cond
  ret void
}

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval
  call void @add_unwind_adjustsp(i64 4132)
  %0 = load i8* getelementptr inbounds ([5 x i8]* @bytes, i32 0, i64 0), align 1
  %conv = zext i8 %0 to i32
  %cmp = icmp ne i32 %conv, 136
  br i1 %cmp, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %1 = load i8* getelementptr inbounds ([5 x i8]* @bytes, i32 0, i64 1), align 1
  %conv2 = zext i8 %1 to i32
  %cmp3 = icmp ne i32 %conv2, 7
  br i1 %cmp3, label %if.then, label %if.end

if.then:                                          ; preds = %lor.lhs.false, %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %lor.lhs.false
  ret i32 0
}

declare void @abort() noreturn nounwind
