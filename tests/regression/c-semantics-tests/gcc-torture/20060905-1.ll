; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/20060905-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@s = common global [256 x [3 x i8]] zeroinitializer, align 16
@g = common global i8 0, align 1

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval
  %call = call i32 @foo()
  %cmp = icmp ne i32 %call, 128
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  ret i32 0
}

define internal i32 @foo() nounwind uwtable {
entry:
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  store i32 0, i32* %j, align 4
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32* %i, align 4
  %cmp = icmp slt i32 %0, 256
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %1 = load i32* %i, align 4
  %cmp1 = icmp sge i32 %1, 128
  br i1 %cmp1, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %for.body
  %2 = load i32* %i, align 4
  %cmp2 = icmp slt i32 %2, 256
  br i1 %cmp2, label %if.then, label %if.end

if.then:                                          ; preds = %land.lhs.true
  %3 = load i32* %i, align 4
  %sub = sub nsw i32 %3, 128
  %idxprom = sext i32 %sub to i64
  %arrayidx = getelementptr inbounds [256 x [3 x i8]]* @s, i32 0, i64 %idxprom
  %arrayidx3 = getelementptr inbounds [3 x i8]* %arrayidx, i32 0, i64 0
  %4 = load volatile i8* %arrayidx3, align 1
  call void @dummy(i8 signext %4)
  %5 = load i32* %j, align 4
  %inc = add nsw i32 %5, 1
  store i32 %inc, i32* %j, align 4
  br label %if.end

if.end:                                           ; preds = %if.then, %land.lhs.true, %for.body
  br label %for.inc

for.inc:                                          ; preds = %if.end
  %6 = load i32* %i, align 4
  %inc4 = add nsw i32 %6, 1
  store i32 %inc4, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %7 = load i32* %j, align 4
  ret i32 %7
}

declare void @abort() noreturn nounwind

define internal void @dummy(i8 signext %a) nounwind uwtable {
entry:
  %a.addr = alloca i8, align 1
  store i8 %a, i8* %a.addr, align 1
  %0 = load i8* %a.addr, align 1
  store i8 %0, i8* @g, align 1
  ret void
}
