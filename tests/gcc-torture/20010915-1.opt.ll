; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/20010915-1.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@check = global i32 0, align 4
@o = global i32 0, align 4
@.str = private unnamed_addr constant [2 x i8] c"a\00", align 1
@.str1 = private unnamed_addr constant [2 x i8] c"b\00", align 1
@.str2 = private unnamed_addr constant [2 x i8] c"c\00", align 1
@.str3 = private unnamed_addr constant [2 x i8] c"d\00", align 1
@.str4 = private unnamed_addr constant [2 x i8] c"e\00", align 1
@h = common global i8* null, align 8
@u = common global i8* null, align 8
@r.c.0 = internal unnamed_addr global i8 98
@r.cnt = internal unnamed_addr global i32 0, align 4

define i32 @gnu_dev_major(i64 %__dev) nounwind uwtable readnone inlinehint {
entry:
  %shr = lshr i64 %__dev, 8
  %and = and i64 %shr, 4095
  %shr2 = lshr i64 %__dev, 32
  %and3 = and i64 %shr2, 4294963200
  %or = or i64 %and, %and3
  %conv5 = trunc i64 %or to i32
  ret i32 %conv5
}

define i32 @gnu_dev_minor(i64 %__dev) nounwind uwtable readnone inlinehint {
entry:
  %and = and i64 %__dev, 255
  %shr = lshr i64 %__dev, 12
  %and2 = and i64 %shr, 4294967040
  %or = or i64 %and2, %and
  %conv4 = trunc i64 %or to i32
  ret i32 %conv4
}

define i64 @gnu_dev_makedev(i32 %__major, i32 %__minor) nounwind uwtable readnone inlinehint {
entry:
  %and = and i32 %__minor, 255
  %and2 = shl i32 %__major, 8
  %shl = and i32 %and2, 1048320
  %or = or i32 %and, %shl
  %conv = zext i32 %or to i64
  %and4 = and i32 %__minor, -256
  %conv5 = zext i32 %and4 to i64
  %shl6 = shl nuw nsw i64 %conv5, 12
  %and9 = and i32 %__major, -4096
  %conv10 = zext i32 %and9 to i64
  %shl11 = shl nuw i64 %conv10, 32
  %or7 = or i64 %shl6, %shl11
  %or12 = or i64 %or7, %conv
  ret i64 %or12
}

define i32 @main(i32 %argc, i8** nocapture %argv) noreturn nounwind uwtable {
entry:
  %args = alloca [5 x i8*], align 16
  %tmp = bitcast [5 x i8*]* %args to i8*
  call void @llvm.memset.p0i8.i64(i8* %tmp, i8 0, i64 40, i32 16, i1 false)
  %0 = getelementptr [5 x i8*]* %args, i64 0, i64 0
  store i8* getelementptr inbounds ([2 x i8]* @.str, i64 0, i64 0), i8** %0, align 16
  %1 = getelementptr [5 x i8*]* %args, i64 0, i64 1
  store i8* getelementptr inbounds ([2 x i8]* @.str1, i64 0, i64 0), i8** %1, align 8
  %2 = getelementptr [5 x i8*]* %args, i64 0, i64 2
  store i8* getelementptr inbounds ([2 x i8]* @.str2, i64 0, i64 0), i8** %2, align 16
  %3 = getelementptr [5 x i8*]* %args, i64 0, i64 3
  store i8* getelementptr inbounds ([2 x i8]* @.str3, i64 0, i64 0), i8** %3, align 8
  %4 = getelementptr [5 x i8*]* %args, i64 0, i64 4
  store i8* getelementptr inbounds ([2 x i8]* @.str4, i64 0, i64 0), i8** %4, align 16
  %call = call i32 @x(i32 5, i8** %0)
  %cmp = icmp eq i32 %call, 0
  %tmp1 = load i32* @check, align 4
  %cmp2 = icmp eq i32 %tmp1, 2
  %or.cond = and i1 %cmp, %cmp2
  %tmp4 = load i32* @o, align 4
  %cmp5 = icmp eq i32 %tmp4, 5
  %or.cond1 = and i1 %or.cond, %cmp5
  br i1 %or.cond1, label %if.end, label %if.then

if.then:                                          ; preds = %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  call void @exit(i32 0) noreturn nounwind
  unreachable
}

declare void @llvm.memset.p0i8.i64(i8* nocapture, i8, i64, i32, i1) nounwind

define i32 @x(i32 %argc, i8** %argv) nounwind uwtable {
entry:
  %tmp1 = load i32* @o, align 4
  %cmp = icmp slt i32 %tmp1, %argc
  %cmp3 = icmp sgt i32 %argc, 2
  %or.cond = and i1 %cmp, %cmp3
  br i1 %or.cond, label %land.lhs.true4, label %if.else

land.lhs.true4:                                   ; preds = %entry
  %idxprom = sext i32 %tmp1 to i64
  %arrayidx = getelementptr inbounds i8** %argv, i64 %idxprom
  %tmp7 = load i8** %arrayidx, align 8
  %tobool = icmp eq i8* %tmp7, null
  br i1 %tobool, label %if.else, label %if.then

if.then:                                          ; preds = %land.lhs.true4
  %call.i = tail call i32 @strcmp(i8* %tmp7, i8* getelementptr inbounds ([2 x i8]* @.str, i64 0, i64 0)) nounwind readonly
  %cmp.i = icmp eq i32 %call.i, 0
  br i1 %cmp.i, label %lor.lhs.false.i, label %if.then.i

lor.lhs.false.i:                                  ; preds = %if.then
  %tmp1.i = load i32* @check, align 4
  %inc.i = add nsw i32 %tmp1.i, 1
  store i32 %inc.i, i32* @check, align 4
  %cmp2.i = icmp sgt i32 %tmp1.i, 1
  br i1 %cmp2.i, label %if.then.i, label %s.exit

if.then.i:                                        ; preds = %lor.lhs.false.i, %if.then
  tail call void @abort() noreturn nounwind
  unreachable

s.exit:                                           ; preds = %lor.lhs.false.i
  %call.i1 = tail call i32 @strcmp(i8* %tmp7, i8* getelementptr inbounds ([2 x i8]* @.str, i64 0, i64 0)) nounwind readonly
  %cmp.i2 = icmp eq i32 %call.i1, 0
  br i1 %cmp.i2, label %lor.lhs.false.i6, label %if.then.i7

lor.lhs.false.i6:                                 ; preds = %s.exit
  %inc.i4 = add i32 %tmp1.i, 2
  store i32 %inc.i4, i32* @check, align 4
  %cmp2.i5 = icmp sgt i32 %tmp1.i, 0
  br i1 %cmp2.i5, label %if.then.i7, label %s.exit9

if.then.i7:                                       ; preds = %lor.lhs.false.i6, %s.exit
  tail call void @abort() noreturn nounwind
  unreachable

s.exit9:                                          ; preds = %lor.lhs.false.i6
  %add.ptr.i8 = getelementptr inbounds i8* %tmp7, i64 1
  store i8* null, i8** @u, align 8
  %tmp36 = load i8** %arrayidx, align 8
  %cmp38 = icmp eq i8* %tmp36, %add.ptr.i8
  br i1 %cmp38, label %if.then39, label %while.cond

if.then39:                                        ; preds = %s.exit9
  %call45 = tail call i8* @m(i8* %tmp36)
  unreachable

if.else:                                          ; preds = %land.lhs.true4, %entry
  tail call void @abort() noreturn nounwind
  unreachable

while.cond:                                       ; preds = %s.exit9, %r.exit
  %tmp48 = phi i32 [ %inc, %r.exit ], [ %tmp1, %s.exit9 ]
  %inc = add nsw i32 %tmp48, 1
  store i32 %inc, i32* @o, align 4
  %cmp50 = icmp slt i32 %inc, %argc
  br i1 %cmp50, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %idxprom52 = sext i32 %inc to i64
  %arrayidx54 = getelementptr inbounds i8** %argv, i64 %idxprom52
  %tmp55 = load i8** %arrayidx54, align 8
  %tmp1.i10 = load i8* %tmp55, align 1
  %tmp2.i = load i8* @r.c.0, align 1
  %cmp.i11 = icmp eq i8 %tmp1.i10, %tmp2.i
  br i1 %cmp.i11, label %lor.lhs.false.i12, label %if.then.i13

lor.lhs.false.i12:                                ; preds = %while.body
  %arrayidx.i = getelementptr inbounds i8* %tmp55, i64 1
  %tmp6.i = load i8* %arrayidx.i, align 1
  %cmp10.i = icmp ne i8 %tmp6.i, 0
  %tmp13.i = load i32* @r.cnt, align 4
  %cmp14.i = icmp sgt i32 %tmp13.i, 3
  %or.cond.i = or i1 %cmp10.i, %cmp14.i
  br i1 %or.cond.i, label %if.then.i13, label %r.exit

if.then.i13:                                      ; preds = %lor.lhs.false.i12, %while.body
  tail call void @abort() noreturn nounwind
  unreachable

r.exit:                                           ; preds = %lor.lhs.false.i12
  %inc.i14 = add i8 %tmp2.i, 1
  store i8 %inc.i14, i8* @r.c.0, align 1
  %inc18.i = add nsw i32 %tmp13.i, 1
  store i32 %inc18.i, i32* @r.cnt, align 4
  br label %while.cond

while.end:                                        ; preds = %while.cond
  ret i32 0
}

declare void @abort() noreturn nounwind

declare void @exit(i32) noreturn nounwind

define noalias i8* @s(i8* %v, i8** %pp) nounwind uwtable {
entry:
  %call = tail call i32 @strcmp(i8* %v, i8* getelementptr inbounds ([2 x i8]* @.str, i64 0, i64 0)) nounwind readonly
  %cmp = icmp eq i32 %call, 0
  br i1 %cmp, label %lor.lhs.false, label %if.then

lor.lhs.false:                                    ; preds = %entry
  %tmp1 = load i32* @check, align 4
  %inc = add nsw i32 %tmp1, 1
  store i32 %inc, i32* @check, align 4
  %cmp2 = icmp sgt i32 %tmp1, 1
  br i1 %cmp2, label %if.then, label %if.end

if.then:                                          ; preds = %entry, %lor.lhs.false
  tail call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %lor.lhs.false
  %add.ptr = getelementptr inbounds i8* %v, i64 1
  store i8* %add.ptr, i8** %pp, align 8
  ret i8* null
}

define noalias i8* @m(i8* nocapture %x) noreturn nounwind uwtable {
entry:
  tail call void @abort() noreturn nounwind
  unreachable
}

define i32 @r(i8* %f) nounwind uwtable {
entry:
  %tmp1 = load i8* %f, align 1
  %tmp2 = load i8* @r.c.0, align 1
  %cmp = icmp eq i8 %tmp1, %tmp2
  br i1 %cmp, label %lor.lhs.false, label %if.then

lor.lhs.false:                                    ; preds = %entry
  %arrayidx = getelementptr inbounds i8* %f, i64 1
  %tmp6 = load i8* %arrayidx, align 1
  %cmp10 = icmp ne i8 %tmp6, 0
  %tmp13 = load i32* @r.cnt, align 4
  %cmp14 = icmp sgt i32 %tmp13, 3
  %or.cond = or i1 %cmp10, %cmp14
  br i1 %or.cond, label %if.then, label %if.end

if.then:                                          ; preds = %lor.lhs.false, %entry
  tail call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %lor.lhs.false
  %inc = add i8 %tmp2, 1
  store i8 %inc, i8* @r.c.0, align 1
  %inc18 = add nsw i32 %tmp13, 1
  store i32 %inc18, i32* @r.cnt, align 4
  ret i32 1
}

declare i32 @strcmp(i8* nocapture, i8* nocapture) nounwind readonly
