; ModuleID = '/home/david/src/c-semantics/tests/integration/simplestQueue.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@head = internal global i32 0, align 4
@tail = internal global i32 0, align 4
@q = internal global [16 x i32] zeroinitializer, align 16
@.str = private unnamed_addr constant [8 x i8] c"%d, %d\0A\00", align 1
@.str1 = private unnamed_addr constant [11 x i8] c"emtpy==%d\0A\00", align 1
@.str2 = private unnamed_addr constant [10 x i8] c"full==%d\0A\00", align 1
@.str3 = private unnamed_addr constant [11 x i8] c"qents==%d\0A\00", align 1

define i32 @full() nounwind uwtable {
entry:
  %0 = load i32* @head, align 4
  %call = call i32 @inc(i32 %0)
  %1 = load i32* @tail, align 4
  %cmp = icmp eq i32 %call, %1
  %conv = zext i1 %cmp to i32
  ret i32 %conv
}

define internal i32 @inc(i32 %x) nounwind uwtable {
entry:
  %x.addr = alloca i32, align 4
  store i32 %x, i32* %x.addr, align 4
  %0 = load i32* %x.addr, align 4
  %add = add nsw i32 %0, 1
  %and = and i32 %add, 15
  ret i32 %and
}

define i32 @mt() nounwind uwtable {
entry:
  %0 = load i32* @head, align 4
  %1 = load i32* @tail, align 4
  %cmp = icmp eq i32 %0, %1
  %conv = zext i1 %cmp to i32
  ret i32 %conv
}

define i32 @enq(i32 %item) nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %item.addr = alloca i32, align 4
  store i32 %item, i32* %item.addr, align 4
  %call = call i32 @full()
  %tobool = icmp ne i32 %call, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  store i32 0, i32* %retval
  br label %return

if.end:                                           ; preds = %entry
  %0 = load i32* %item.addr, align 4
  %1 = load i32* @head, align 4
  %idxprom = sext i32 %1 to i64
  %arrayidx = getelementptr inbounds [16 x i32]* @q, i32 0, i64 %idxprom
  store i32 %0, i32* %arrayidx, align 4
  %2 = load i32* @head, align 4
  %call1 = call i32 @inc(i32 %2)
  store i32 %call1, i32* @head, align 4
  store i32 1, i32* %retval
  br label %return

return:                                           ; preds = %if.end, %if.then
  %3 = load i32* %retval
  ret i32 %3
}

define i32 @deq(i32* %loc) nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %loc.addr = alloca i32*, align 8
  store i32* %loc, i32** %loc.addr, align 8
  %call = call i32 @mt()
  %tobool = icmp ne i32 %call, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  store i32 0, i32* %retval
  br label %return

if.end:                                           ; preds = %entry
  %0 = load i32* @tail, align 4
  %idxprom = sext i32 %0 to i64
  %arrayidx = getelementptr inbounds [16 x i32]* @q, i32 0, i64 %idxprom
  %1 = load i32* %arrayidx, align 4
  %2 = load i32** %loc.addr, align 8
  store i32 %1, i32* %2, align 4
  %3 = load i32* @tail, align 4
  %call1 = call i32 @inc(i32 %3)
  store i32 %call1, i32* @tail, align 4
  store i32 1, i32* %retval
  br label %return

return:                                           ; preds = %if.end, %if.then
  %4 = load i32* %retval
  ret i32 %4
}

define i32 @qents() nounwind uwtable {
entry:
  %s = alloca i32, align 4
  %0 = load i32* @head, align 4
  %1 = load i32* @tail, align 4
  %sub = sub nsw i32 %0, %1
  store i32 %sub, i32* %s, align 4
  %2 = load i32* %s, align 4
  %cmp = icmp slt i32 %2, 0
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %3 = load i32* %s, align 4
  %add = add nsw i32 %3, 16
  store i32 %add, i32* %s, align 4
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %4 = load i32* %s, align 4
  ret i32 %4
}

define void @printdeq() nounwind uwtable {
entry:
  %item = alloca i32, align 4
  %res = alloca i32, align 4
  store i32 0, i32* %item, align 4
  %call = call i32 @deq(i32* %item)
  store i32 %call, i32* %res, align 4
  %0 = load i32* %res, align 4
  %1 = load i32* %item, align 4
  %call1 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([8 x i8]* @.str, i32 0, i32 0), i32 %0, i32 %1)
  ret void
}

declare i32 @printf(i8*, ...)

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %i = alloca i32, align 4
  %i11 = alloca i32, align 4
  %i24 = alloca i32, align 4
  store i32 0, i32* %retval
  %call = call i32 @mt()
  %call1 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([11 x i8]* @.str1, i32 0, i32 0), i32 %call)
  %call2 = call i32 @full()
  %call3 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([10 x i8]* @.str2, i32 0, i32 0), i32 %call2)
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32* %i, align 4
  %cmp = icmp slt i32 %0, 16
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %1 = load i32* %i, align 4
  %mul = mul nsw i32 %1, 2
  %call4 = call i32 @enq(i32 %mul)
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %2 = load i32* %i, align 4
  %inc = add nsw i32 %2, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %call5 = call i32 @mt()
  %call6 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([11 x i8]* @.str1, i32 0, i32 0), i32 %call5)
  %call7 = call i32 @full()
  %call8 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([10 x i8]* @.str2, i32 0, i32 0), i32 %call7)
  %call9 = call i32 @qents()
  %call10 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([11 x i8]* @.str3, i32 0, i32 0), i32 %call9)
  store i32 0, i32* %i11, align 4
  br label %for.cond12

for.cond12:                                       ; preds = %for.inc15, %for.end
  %3 = load i32* %i11, align 4
  %cmp13 = icmp slt i32 %3, 8
  br i1 %cmp13, label %for.body14, label %for.end17

for.body14:                                       ; preds = %for.cond12
  call void @printdeq()
  br label %for.inc15

for.inc15:                                        ; preds = %for.body14
  %4 = load i32* %i11, align 4
  %inc16 = add nsw i32 %4, 1
  store i32 %inc16, i32* %i11, align 4
  br label %for.cond12

for.end17:                                        ; preds = %for.cond12
  %call18 = call i32 @mt()
  %call19 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([11 x i8]* @.str1, i32 0, i32 0), i32 %call18)
  %call20 = call i32 @full()
  %call21 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([10 x i8]* @.str2, i32 0, i32 0), i32 %call20)
  %call22 = call i32 @qents()
  %call23 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([11 x i8]* @.str3, i32 0, i32 0), i32 %call22)
  store i32 0, i32* %i24, align 4
  br label %for.cond25

for.cond25:                                       ; preds = %for.inc30, %for.end17
  %5 = load i32* %i24, align 4
  %cmp26 = icmp slt i32 %5, 8
  br i1 %cmp26, label %for.body27, label %for.end32

for.body27:                                       ; preds = %for.cond25
  %6 = load i32* %i24, align 4
  %mul28 = mul nsw i32 %6, 2
  %call29 = call i32 @enq(i32 %mul28)
  br label %for.inc30

for.inc30:                                        ; preds = %for.body27
  %7 = load i32* %i24, align 4
  %inc31 = add nsw i32 %7, 1
  store i32 %inc31, i32* %i24, align 4
  br label %for.cond25

for.end32:                                        ; preds = %for.cond25
  %call33 = call i32 @mt()
  %call34 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([11 x i8]* @.str1, i32 0, i32 0), i32 %call33)
  %call35 = call i32 @full()
  %call36 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([10 x i8]* @.str2, i32 0, i32 0), i32 %call35)
  %call37 = call i32 @qents()
  %call38 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([11 x i8]* @.str3, i32 0, i32 0), i32 %call37)
  br label %while.cond

while.cond:                                       ; preds = %while.body, %for.end32
  %call39 = call i32 @mt()
  %tobool = icmp ne i32 %call39, 0
  %lnot = xor i1 %tobool, true
  br i1 %lnot, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  call void @printdeq()
  br label %while.cond

while.end:                                        ; preds = %while.cond
  call void @printdeq()
  %8 = load i32* %retval
  ret i32 %8
}
