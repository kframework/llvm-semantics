; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/20051110-2.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@bytes = common global [5 x i8] zeroinitializer, align 1
@flag = common global i32 0, align 4

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
  br label %do.body

do.body:                                          ; preds = %do.cond, %entry
  br label %a

a:                                                ; preds = %if.then7, %do.body
  %1 = load i64* %o, align 8
  %and = and i64 %1, 127
  %conv = trunc i64 %and to i8
  %2 = load i32* %n, align 4
  %idxprom = sext i32 %2 to i64
  %arrayidx = getelementptr inbounds [5 x i8]* @bytes, i32 0, i64 %idxprom
  store i8 %conv, i8* %arrayidx, align 1
  %3 = load i64* %o, align 8
  %shr1 = lshr i64 %3, 7
  store i64 %shr1, i64* %o, align 8
  %4 = load i64* %o, align 8
  %tobool = icmp ne i64 %4, 0
  br i1 %tobool, label %if.then, label %if.end8

if.then:                                          ; preds = %a
  %5 = load i32* %n, align 4
  %idxprom2 = sext i32 %5 to i64
  %arrayidx3 = getelementptr inbounds [5 x i8]* @bytes, i32 0, i64 %idxprom2
  %6 = load i8* %arrayidx3, align 1
  %conv4 = zext i8 %6 to i32
  %or = or i32 %conv4, 128
  %conv5 = trunc i32 %or to i8
  store i8 %conv5, i8* %arrayidx3, align 1
  %7 = load i32* @flag, align 4
  %tobool6 = icmp ne i32 %7, 0
  br i1 %tobool6, label %if.then7, label %if.end

if.then7:                                         ; preds = %if.then
  br label %a

if.end:                                           ; preds = %if.then
  br label %if.end8

if.end8:                                          ; preds = %if.end, %a
  %8 = load i32* %n, align 4
  %inc = add nsw i32 %8, 1
  store i32 %inc, i32* %n, align 4
  br label %do.cond

do.cond:                                          ; preds = %if.end8
  %9 = load i64* %o, align 8
  %tobool9 = icmp ne i64 %9, 0
  br i1 %tobool9, label %do.body, label %do.end

do.end:                                           ; preds = %do.cond
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
