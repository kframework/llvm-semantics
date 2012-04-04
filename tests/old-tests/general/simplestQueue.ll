; ModuleID = '/home/grosu/celliso2/c-semantics/tests/integration/simplestQueue.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
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
  %tmp = load i32* @head, align 4
  %call = call i32 @inc(i32 %tmp)
  %tmp1 = load i32* @tail, align 4
  %cmp = icmp eq i32 %call, %tmp1
  %conv = zext i1 %cmp to i32
  ret i32 %conv
}

define internal i32 @inc(i32 %x) nounwind uwtable {
entry:
  %x.addr = alloca i32, align 4
  store i32 %x, i32* %x.addr, align 4
  %tmp = load i32* %x.addr, align 4
  %add = add nsw i32 %tmp, 1
  %and = and i32 %add, 15
  ret i32 %and
}

define i32 @mt() nounwind uwtable {
entry:
  %tmp = load i32* @head, align 4
  %tmp1 = load i32* @tail, align 4
  %cmp = icmp eq i32 %tmp, %tmp1
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
  %tmp = load i32* %item.addr, align 4
  %tmp1 = load i32* @head, align 4
  %idxprom = sext i32 %tmp1 to i64
  %arrayidx = getelementptr inbounds [16 x i32]* @q, i32 0, i64 %idxprom
  store i32 %tmp, i32* %arrayidx, align 4
  %tmp2 = load i32* @head, align 4
  %call3 = call i32 @inc(i32 %tmp2)
  store i32 %call3, i32* @head, align 4
  store i32 1, i32* %retval
  br label %return

return:                                           ; preds = %if.end, %if.then
  %0 = load i32* %retval
  ret i32 %0
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
  %tmp = load i32* @tail, align 4
  %idxprom = sext i32 %tmp to i64
  %arrayidx = getelementptr inbounds [16 x i32]* @q, i32 0, i64 %idxprom
  %tmp1 = load i32* %arrayidx, align 4
  %tmp2 = load i32** %loc.addr, align 8
  store i32 %tmp1, i32* %tmp2
  %tmp3 = load i32* @tail, align 4
  %call4 = call i32 @inc(i32 %tmp3)
  store i32 %call4, i32* @tail, align 4
  store i32 1, i32* %retval
  br label %return

return:                                           ; preds = %if.end, %if.then
  %0 = load i32* %retval
  ret i32 %0
}

define i32 @qents() nounwind uwtable {
entry:
  %s = alloca i32, align 4
  %tmp = load i32* @head, align 4
  %tmp1 = load i32* @tail, align 4
  %sub = sub nsw i32 %tmp, %tmp1
  store i32 %sub, i32* %s, align 4
  %tmp2 = load i32* %s, align 4
  %cmp = icmp slt i32 %tmp2, 0
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %tmp3 = load i32* %s, align 4
  %add = add nsw i32 %tmp3, 16
  store i32 %add, i32* %s, align 4
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %tmp4 = load i32* %s, align 4
  ret i32 %tmp4
}

define void @printdeq() nounwind uwtable {
entry:
  %item = alloca i32, align 4
  %res = alloca i32, align 4
  store i32 0, i32* %item, align 4
  %call = call i32 @deq(i32* %item)
  store i32 %call, i32* %res, align 4
  %tmp = load i32* %res, align 4
  %tmp1 = load i32* %item, align 4
  %call2 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([8 x i8]* @.str, i32 0, i32 0), i32 %tmp, i32 %tmp1)
  ret void
}

declare i32 @printf(i8*, ...)

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %i = alloca i32, align 4
  %i14 = alloca i32, align 4
  %i30 = alloca i32, align 4
  store i32 0, i32* %retval
  %call = call i32 @mt()
  %call1 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([11 x i8]* @.str1, i32 0, i32 0), i32 %call)
  %call2 = call i32 @full()
  %call3 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([10 x i8]* @.str2, i32 0, i32 0), i32 %call2)
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %tmp = load i32* %i, align 4
  %cmp = icmp slt i32 %tmp, 16
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %tmp4 = load i32* %i, align 4
  %mul = mul nsw i32 %tmp4, 2
  %call5 = call i32 @enq(i32 %mul)
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %tmp6 = load i32* %i, align 4
  %inc = add nsw i32 %tmp6, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %call7 = call i32 @mt()
  %call8 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([11 x i8]* @.str1, i32 0, i32 0), i32 %call7)
  %call9 = call i32 @full()
  %call10 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([10 x i8]* @.str2, i32 0, i32 0), i32 %call9)
  %call11 = call i32 @qents()
  %call12 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([11 x i8]* @.str3, i32 0, i32 0), i32 %call11)
  store i32 0, i32* %i14, align 4
  br label %for.cond15

for.cond15:                                       ; preds = %for.inc19, %for.end
  %tmp16 = load i32* %i14, align 4
  %cmp17 = icmp slt i32 %tmp16, 8
  br i1 %cmp17, label %for.body18, label %for.end22

for.body18:                                       ; preds = %for.cond15
  call void @printdeq()
  br label %for.inc19

for.inc19:                                        ; preds = %for.body18
  %tmp20 = load i32* %i14, align 4
  %inc21 = add nsw i32 %tmp20, 1
  store i32 %inc21, i32* %i14, align 4
  br label %for.cond15

for.end22:                                        ; preds = %for.cond15
  %call23 = call i32 @mt()
  %call24 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([11 x i8]* @.str1, i32 0, i32 0), i32 %call23)
  %call25 = call i32 @full()
  %call26 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([10 x i8]* @.str2, i32 0, i32 0), i32 %call25)
  %call27 = call i32 @qents()
  %call28 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([11 x i8]* @.str3, i32 0, i32 0), i32 %call27)
  store i32 0, i32* %i30, align 4
  br label %for.cond31

for.cond31:                                       ; preds = %for.inc38, %for.end22
  %tmp32 = load i32* %i30, align 4
  %cmp33 = icmp slt i32 %tmp32, 8
  br i1 %cmp33, label %for.body34, label %for.end41

for.body34:                                       ; preds = %for.cond31
  %tmp35 = load i32* %i30, align 4
  %mul36 = mul nsw i32 %tmp35, 2
  %call37 = call i32 @enq(i32 %mul36)
  br label %for.inc38

for.inc38:                                        ; preds = %for.body34
  %tmp39 = load i32* %i30, align 4
  %inc40 = add nsw i32 %tmp39, 1
  store i32 %inc40, i32* %i30, align 4
  br label %for.cond31

for.end41:                                        ; preds = %for.cond31
  %call42 = call i32 @mt()
  %call43 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([11 x i8]* @.str1, i32 0, i32 0), i32 %call42)
  %call44 = call i32 @full()
  %call45 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([10 x i8]* @.str2, i32 0, i32 0), i32 %call44)
  %call46 = call i32 @qents()
  %call47 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([11 x i8]* @.str3, i32 0, i32 0), i32 %call46)
  br label %while.cond

while.cond:                                       ; preds = %while.body, %for.end41
  %call48 = call i32 @mt()
  %tobool = icmp ne i32 %call48, 0
  %lnot = xor i1 %tobool, true
  br i1 %lnot, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  call void @printdeq()
  br label %while.cond

while.end:                                        ; preds = %while.cond
  call void @printdeq()
  %0 = load i32* %retval
  ret i32 %0
}
