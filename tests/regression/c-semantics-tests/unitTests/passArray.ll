; ModuleID = '/home/david/src/c-semantics/tests/unitTests/passArray.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [6 x i8] c"Bug1\0A\00", align 1
@.str1 = private unnamed_addr constant [6 x i8] c"Bug2\0A\00", align 1
@.str2 = private unnamed_addr constant [6 x i8] c"Bug3\0A\00", align 1
@.str3 = private unnamed_addr constant [6 x i8] c"Bug4\0A\00", align 1

define i32 @array(i32* %a, i32 %size, i32 %start) nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %a.addr = alloca i32*, align 8
  %size.addr = alloca i32, align 4
  %start.addr = alloca i32, align 4
  %i = alloca i32, align 4
  store i32* %a, i32** %a.addr, align 8
  store i32 %size, i32* %size.addr, align 4
  store i32 %start, i32* %start.addr, align 4
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32* %i, align 4
  %1 = load i32* %size.addr, align 4
  %cmp = icmp slt i32 %0, %1
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %2 = load i32* %i, align 4
  %idxprom = sext i32 %2 to i64
  %3 = load i32** %a.addr, align 8
  %arrayidx = getelementptr inbounds i32* %3, i64 %idxprom
  %4 = load i32* %arrayidx, align 4
  %5 = load i32* %i, align 4
  %6 = load i32* %start.addr, align 4
  %add = add nsw i32 %5, %6
  %cmp1 = icmp ne i32 %4, %add
  br i1 %cmp1, label %if.then, label %if.end

if.then:                                          ; preds = %for.body
  store i32 1, i32* %retval
  br label %return

if.end:                                           ; preds = %for.body
  br label %for.inc

for.inc:                                          ; preds = %if.end
  %7 = load i32* %i, align 4
  %inc = add nsw i32 %7, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  store i32 0, i32* %retval
  br label %return

return:                                           ; preds = %for.end, %if.then
  %8 = load i32* %retval
  ret i32 %8
}

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %x3d = alloca [3 x [5 x [7 x i32]]], align 16
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %k = alloca i32, align 4
  %i19 = alloca i32, align 4
  %j20 = alloca i32, align 4
  %k21 = alloca i32, align 4
  store i32 0, i32* %retval
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc16, %entry
  %0 = load i32* %i, align 4
  %cmp = icmp slt i32 %0, 3
  br i1 %cmp, label %for.body, label %for.end18

for.body:                                         ; preds = %for.cond
  store i32 0, i32* %j, align 4
  br label %for.cond1

for.cond1:                                        ; preds = %for.inc13, %for.body
  %1 = load i32* %j, align 4
  %cmp2 = icmp slt i32 %1, 5
  br i1 %cmp2, label %for.body3, label %for.end15

for.body3:                                        ; preds = %for.cond1
  store i32 0, i32* %k, align 4
  br label %for.cond4

for.cond4:                                        ; preds = %for.inc, %for.body3
  %2 = load i32* %k, align 4
  %cmp5 = icmp slt i32 %2, 7
  br i1 %cmp5, label %for.body6, label %for.end

for.body6:                                        ; preds = %for.cond4
  %3 = load i32* %i, align 4
  %mul = mul nsw i32 %3, 35
  %4 = load i32* %j, align 4
  %mul7 = mul nsw i32 %4, 7
  %add = add nsw i32 %mul, %mul7
  %5 = load i32* %k, align 4
  %add8 = add nsw i32 %add, %5
  %6 = load i32* %k, align 4
  %idxprom = sext i32 %6 to i64
  %7 = load i32* %j, align 4
  %idxprom9 = sext i32 %7 to i64
  %8 = load i32* %i, align 4
  %idxprom10 = sext i32 %8 to i64
  %arrayidx = getelementptr inbounds [3 x [5 x [7 x i32]]]* %x3d, i32 0, i64 %idxprom10
  %arrayidx11 = getelementptr inbounds [5 x [7 x i32]]* %arrayidx, i32 0, i64 %idxprom9
  %arrayidx12 = getelementptr inbounds [7 x i32]* %arrayidx11, i32 0, i64 %idxprom
  store i32 %add8, i32* %arrayidx12, align 4
  br label %for.inc

for.inc:                                          ; preds = %for.body6
  %9 = load i32* %k, align 4
  %inc = add nsw i32 %9, 1
  store i32 %inc, i32* %k, align 4
  br label %for.cond4

for.end:                                          ; preds = %for.cond4
  br label %for.inc13

for.inc13:                                        ; preds = %for.end
  %10 = load i32* %j, align 4
  %inc14 = add nsw i32 %10, 1
  store i32 %inc14, i32* %j, align 4
  br label %for.cond1

for.end15:                                        ; preds = %for.cond1
  br label %for.inc16

for.inc16:                                        ; preds = %for.end15
  %11 = load i32* %i, align 4
  %inc17 = add nsw i32 %11, 1
  store i32 %inc17, i32* %i, align 4
  br label %for.cond

for.end18:                                        ; preds = %for.cond
  store i32 1, i32* %i19, align 4
  store i32 2, i32* %j20, align 4
  store i32 3, i32* %k21, align 4
  %arraydecay = getelementptr inbounds [3 x [5 x [7 x i32]]]* %x3d, i32 0, i32 0
  %12 = bitcast [5 x [7 x i32]]* %arraydecay to i32*
  %call = call i32 @array(i32* %12, i32 105, i32 0)
  %tobool = icmp ne i32 %call, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %for.end18
  %call22 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([6 x i8]* @.str, i32 0, i32 0))
  br label %if.end

if.end:                                           ; preds = %if.then, %for.end18
  %13 = load i32* %i19, align 4
  %idxprom23 = sext i32 %13 to i64
  %arrayidx24 = getelementptr inbounds [3 x [5 x [7 x i32]]]* %x3d, i32 0, i64 %idxprom23
  %arraydecay25 = getelementptr inbounds [5 x [7 x i32]]* %arrayidx24, i32 0, i32 0
  %14 = bitcast [7 x i32]* %arraydecay25 to i32*
  %call26 = call i32 @array(i32* %14, i32 35, i32 35)
  %tobool27 = icmp ne i32 %call26, 0
  br i1 %tobool27, label %if.then28, label %if.end30

if.then28:                                        ; preds = %if.end
  %call29 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([6 x i8]* @.str1, i32 0, i32 0))
  br label %if.end30

if.end30:                                         ; preds = %if.then28, %if.end
  %15 = load i32* %j20, align 4
  %idxprom31 = sext i32 %15 to i64
  %16 = load i32* %i19, align 4
  %idxprom32 = sext i32 %16 to i64
  %arrayidx33 = getelementptr inbounds [3 x [5 x [7 x i32]]]* %x3d, i32 0, i64 %idxprom32
  %arrayidx34 = getelementptr inbounds [5 x [7 x i32]]* %arrayidx33, i32 0, i64 %idxprom31
  %arraydecay35 = getelementptr inbounds [7 x i32]* %arrayidx34, i32 0, i32 0
  %call36 = call i32 @array(i32* %arraydecay35, i32 7, i32 49)
  %tobool37 = icmp ne i32 %call36, 0
  br i1 %tobool37, label %if.then38, label %if.end40

if.then38:                                        ; preds = %if.end30
  %call39 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([6 x i8]* @.str2, i32 0, i32 0))
  br label %if.end40

if.end40:                                         ; preds = %if.then38, %if.end30
  %17 = load i32* %k21, align 4
  %idxprom41 = sext i32 %17 to i64
  %18 = load i32* %j20, align 4
  %idxprom42 = sext i32 %18 to i64
  %19 = load i32* %i19, align 4
  %idxprom43 = sext i32 %19 to i64
  %arrayidx44 = getelementptr inbounds [3 x [5 x [7 x i32]]]* %x3d, i32 0, i64 %idxprom43
  %arrayidx45 = getelementptr inbounds [5 x [7 x i32]]* %arrayidx44, i32 0, i64 %idxprom42
  %arrayidx46 = getelementptr inbounds [7 x i32]* %arrayidx45, i32 0, i64 %idxprom41
  %20 = load i32* %arrayidx46, align 4
  %sub = sub nsw i32 %20, 52
  %tobool47 = icmp ne i32 %sub, 0
  br i1 %tobool47, label %if.then48, label %if.end50

if.then48:                                        ; preds = %if.end40
  %call49 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([6 x i8]* @.str3, i32 0, i32 0))
  br label %if.end50

if.end50:                                         ; preds = %if.then48, %if.end40
  ret i32 0
}

declare i32 @printf(i8*, ...)
