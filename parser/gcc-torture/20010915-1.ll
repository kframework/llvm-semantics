; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/20010915-1.c'
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
@r.c = internal global [2 x i8] c"b\00", align 1
@r.cnt = internal global i32 0, align 4

define i32 @gnu_dev_major(i64 %__dev) nounwind uwtable inlinehint {
entry:
  %__dev.addr = alloca i64, align 8
  store i64 %__dev, i64* %__dev.addr, align 8
  %tmp = load i64* %__dev.addr, align 8
  %shr = lshr i64 %tmp, 8
  %and = and i64 %shr, 4095
  %tmp1 = load i64* %__dev.addr, align 8
  %shr2 = lshr i64 %tmp1, 32
  %conv = trunc i64 %shr2 to i32
  %and3 = and i32 %conv, -4096
  %conv4 = zext i32 %and3 to i64
  %or = or i64 %and, %conv4
  %conv5 = trunc i64 %or to i32
  ret i32 %conv5
}

define i32 @gnu_dev_minor(i64 %__dev) nounwind uwtable inlinehint {
entry:
  %__dev.addr = alloca i64, align 8
  store i64 %__dev, i64* %__dev.addr, align 8
  %tmp = load i64* %__dev.addr, align 8
  %and = and i64 %tmp, 255
  %tmp1 = load i64* %__dev.addr, align 8
  %shr = lshr i64 %tmp1, 12
  %conv = trunc i64 %shr to i32
  %and2 = and i32 %conv, -256
  %conv3 = zext i32 %and2 to i64
  %or = or i64 %and, %conv3
  %conv4 = trunc i64 %or to i32
  ret i32 %conv4
}

define i64 @gnu_dev_makedev(i32 %__major, i32 %__minor) nounwind uwtable inlinehint {
entry:
  %__major.addr = alloca i32, align 4
  %__minor.addr = alloca i32, align 4
  store i32 %__major, i32* %__major.addr, align 4
  store i32 %__minor, i32* %__minor.addr, align 4
  %tmp = load i32* %__minor.addr, align 4
  %and = and i32 %tmp, 255
  %tmp1 = load i32* %__major.addr, align 4
  %and2 = and i32 %tmp1, 4095
  %shl = shl i32 %and2, 8
  %or = or i32 %and, %shl
  %conv = zext i32 %or to i64
  %tmp3 = load i32* %__minor.addr, align 4
  %and4 = and i32 %tmp3, -256
  %conv5 = zext i32 %and4 to i64
  %shl6 = shl i64 %conv5, 12
  %or7 = or i64 %conv, %shl6
  %tmp8 = load i32* %__major.addr, align 4
  %and9 = and i32 %tmp8, -4096
  %conv10 = zext i32 %and9 to i64
  %shl11 = shl i64 %conv10, 32
  %or12 = or i64 %or7, %shl11
  ret i64 %or12
}

define i32 @main(i32 %argc, i8** %argv) nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  %args = alloca [5 x i8*], align 16
  store i32 0, i32* %retval
  store i32 %argc, i32* %argc.addr, align 4
  store i8** %argv, i8*** %argv.addr, align 8
  %tmp = bitcast [5 x i8*]* %args to i8*
  call void @llvm.memset.p0i8.i64(i8* %tmp, i8 0, i64 40, i32 16, i1 false)
  %0 = bitcast i8* %tmp to [5 x i8*]*
  %1 = getelementptr [5 x i8*]* %0, i32 0, i32 0
  store i8* getelementptr inbounds ([2 x i8]* @.str, i32 0, i32 0), i8** %1
  %2 = getelementptr [5 x i8*]* %0, i32 0, i32 1
  store i8* getelementptr inbounds ([2 x i8]* @.str1, i32 0, i32 0), i8** %2
  %3 = getelementptr [5 x i8*]* %0, i32 0, i32 2
  store i8* getelementptr inbounds ([2 x i8]* @.str2, i32 0, i32 0), i8** %3
  %4 = getelementptr [5 x i8*]* %0, i32 0, i32 3
  store i8* getelementptr inbounds ([2 x i8]* @.str3, i32 0, i32 0), i8** %4
  %5 = getelementptr [5 x i8*]* %0, i32 0, i32 4
  store i8* getelementptr inbounds ([2 x i8]* @.str4, i32 0, i32 0), i8** %5
  %arraydecay = getelementptr inbounds [5 x i8*]* %args, i32 0, i32 0
  %call = call i32 @x(i32 5, i8** %arraydecay)
  %cmp = icmp ne i32 %call, 0
  br i1 %cmp, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %tmp1 = load i32* @check, align 4
  %cmp2 = icmp ne i32 %tmp1, 2
  br i1 %cmp2, label %if.then, label %lor.lhs.false3

lor.lhs.false3:                                   ; preds = %lor.lhs.false
  %tmp4 = load i32* @o, align 4
  %cmp5 = icmp ne i32 %tmp4, 5
  br i1 %cmp5, label %if.then, label %if.end

if.then:                                          ; preds = %lor.lhs.false3, %lor.lhs.false, %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %lor.lhs.false3
  call void @exit(i32 0) noreturn nounwind
  unreachable

return:                                           ; No predecessors!
  %6 = load i32* %retval
  ret i32 %6
}

declare void @llvm.memset.p0i8.i64(i8* nocapture, i8, i64, i32, i1) nounwind

define i32 @x(i32 %argc, i8** %argv) nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  %opt = alloca i32, align 4
  %g = alloca i8*, align 8
  %p = alloca i8*, align 8
  store i32 %argc, i32* %argc.addr, align 4
  store i8** %argv, i8*** %argv.addr, align 8
  store i32 0, i32* %opt, align 4
  store i8* null, i8** %g, align 8
  store i8* null, i8** %p, align 8
  %tmp = load i32* %argc.addr, align 4
  %tmp1 = load i32* @o, align 4
  %cmp = icmp sgt i32 %tmp, %tmp1
  br i1 %cmp, label %land.lhs.true, label %if.else

land.lhs.true:                                    ; preds = %entry
  %tmp2 = load i32* %argc.addr, align 4
  %cmp3 = icmp sgt i32 %tmp2, 2
  br i1 %cmp3, label %land.lhs.true4, label %if.else

land.lhs.true4:                                   ; preds = %land.lhs.true
  %tmp5 = load i32* @o, align 4
  %idxprom = sext i32 %tmp5 to i64
  %tmp6 = load i8*** %argv.addr, align 8
  %arrayidx = getelementptr inbounds i8** %tmp6, i64 %idxprom
  %tmp7 = load i8** %arrayidx
  %tobool = icmp ne i8* %tmp7, null
  br i1 %tobool, label %if.then, label %if.else

if.then:                                          ; preds = %land.lhs.true4
  %tmp8 = load i32* @o, align 4
  %idxprom9 = sext i32 %tmp8 to i64
  %tmp10 = load i8*** %argv.addr, align 8
  %arrayidx11 = getelementptr inbounds i8** %tmp10, i64 %idxprom9
  %tmp12 = load i8** %arrayidx11
  %call = call i8* @s(i8* %tmp12, i8** %p)
  store i8* %call, i8** %g, align 8
  %tmp13 = load i8** %g, align 8
  %tobool14 = icmp ne i8* %tmp13, null
  br i1 %tobool14, label %if.then15, label %if.end25

if.then15:                                        ; preds = %if.then
  %tmp16 = load i8** %g, align 8
  %incdec.ptr = getelementptr inbounds i8* %tmp16, i32 1
  store i8* %incdec.ptr, i8** %g, align 8
  store i8 0, i8* %tmp16
  %tmp17 = load i8** %g, align 8
  %call18 = call i8* @s(i8* %tmp17, i8** %p)
  store i8* %call18, i8** @h, align 8
  %tmp19 = load i8** %g, align 8
  %tmp20 = load i8** %p, align 8
  %cmp21 = icmp eq i8* %tmp19, %tmp20
  br i1 %cmp21, label %if.then22, label %if.end

if.then22:                                        ; preds = %if.then15
  %tmp23 = load i8** %g, align 8
  %call24 = call i8* @m(i8* %tmp23)
  store i8* %call24, i8** @h, align 8
  br label %if.end

if.end:                                           ; preds = %if.then22, %if.then15
  br label %if.end25

if.end25:                                         ; preds = %if.end, %if.then
  %tmp26 = load i32* @o, align 4
  %idxprom27 = sext i32 %tmp26 to i64
  %tmp28 = load i8*** %argv.addr, align 8
  %arrayidx29 = getelementptr inbounds i8** %tmp28, i64 %idxprom27
  %tmp30 = load i8** %arrayidx29
  %call31 = call i8* @s(i8* %tmp30, i8** %p)
  store i8* %call31, i8** @u, align 8
  %tmp32 = load i32* @o, align 4
  %idxprom33 = sext i32 %tmp32 to i64
  %tmp34 = load i8*** %argv.addr, align 8
  %arrayidx35 = getelementptr inbounds i8** %tmp34, i64 %idxprom33
  %tmp36 = load i8** %arrayidx35
  %tmp37 = load i8** %p, align 8
  %cmp38 = icmp eq i8* %tmp36, %tmp37
  br i1 %cmp38, label %if.then39, label %if.end46

if.then39:                                        ; preds = %if.end25
  %tmp40 = load i32* @o, align 4
  %idxprom41 = sext i32 %tmp40 to i64
  %tmp42 = load i8*** %argv.addr, align 8
  %arrayidx43 = getelementptr inbounds i8** %tmp42, i64 %idxprom41
  %tmp44 = load i8** %arrayidx43
  %call45 = call i8* @m(i8* %tmp44)
  store i8* %call45, i8** @u, align 8
  br label %if.end46

if.end46:                                         ; preds = %if.then39, %if.end25
  br label %if.end47

if.else:                                          ; preds = %land.lhs.true4, %land.lhs.true, %entry
  call void @abort() noreturn nounwind
  unreachable

if.end47:                                         ; preds = %if.end46
  br label %while.cond

while.cond:                                       ; preds = %if.end59, %if.end47
  %tmp48 = load i32* @o, align 4
  %inc = add nsw i32 %tmp48, 1
  store i32 %inc, i32* @o, align 4
  %tmp49 = load i32* %argc.addr, align 4
  %cmp50 = icmp slt i32 %inc, %tmp49
  br i1 %cmp50, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %tmp51 = load i32* @o, align 4
  %idxprom52 = sext i32 %tmp51 to i64
  %tmp53 = load i8*** %argv.addr, align 8
  %arrayidx54 = getelementptr inbounds i8** %tmp53, i64 %idxprom52
  %tmp55 = load i8** %arrayidx54
  %call56 = call i32 @r(i8* %tmp55)
  %cmp57 = icmp eq i32 %call56, 0
  br i1 %cmp57, label %if.then58, label %if.end59

if.then58:                                        ; preds = %while.body
  store i32 1, i32* %retval
  br label %return

if.end59:                                         ; preds = %while.body
  br label %while.cond

while.end:                                        ; preds = %while.cond
  store i32 0, i32* %retval
  br label %return

return:                                           ; preds = %while.end, %if.then58
  %0 = load i32* %retval
  ret i32 %0
}

declare void @abort() noreturn nounwind

declare void @exit(i32) noreturn nounwind

define i8* @s(i8* %v, i8** %pp) nounwind uwtable {
entry:
  %v.addr = alloca i8*, align 8
  %pp.addr = alloca i8**, align 8
  store i8* %v, i8** %v.addr, align 8
  store i8** %pp, i8*** %pp.addr, align 8
  %tmp = load i8** %v.addr, align 8
  %call = call i32 @strcmp(i8* %tmp, i8* getelementptr inbounds ([2 x i8]* @.str, i32 0, i32 0)) nounwind readonly
  %cmp = icmp ne i32 %call, 0
  br i1 %cmp, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %tmp1 = load i32* @check, align 4
  %inc = add nsw i32 %tmp1, 1
  store i32 %inc, i32* @check, align 4
  %cmp2 = icmp sgt i32 %tmp1, 1
  br i1 %cmp2, label %if.then, label %if.end

if.then:                                          ; preds = %lor.lhs.false, %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %lor.lhs.false
  %tmp3 = load i8** %v.addr, align 8
  %add.ptr = getelementptr inbounds i8* %tmp3, i64 1
  %tmp4 = load i8*** %pp.addr, align 8
  store i8* %add.ptr, i8** %tmp4
  ret i8* null
}

define i8* @m(i8* %x) nounwind uwtable {
entry:
  %retval = alloca i8*, align 8
  %x.addr = alloca i8*, align 8
  store i8* %x, i8** %x.addr, align 8
  call void @abort() noreturn nounwind
  unreachable

return:                                           ; No predecessors!
  %0 = load i8** %retval
  ret i8* %0
}

define i32 @r(i8* %f) nounwind uwtable {
entry:
  %f.addr = alloca i8*, align 8
  store i8* %f, i8** %f.addr, align 8
  %tmp = load i8** %f.addr, align 8
  %tmp1 = load i8* %tmp
  %conv = sext i8 %tmp1 to i32
  %tmp2 = load i8* getelementptr inbounds ([2 x i8]* @r.c, i32 0, i32 0)
  %conv3 = sext i8 %tmp2 to i32
  %cmp = icmp ne i32 %conv, %conv3
  br i1 %cmp, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %tmp5 = load i8** %f.addr, align 8
  %arrayidx = getelementptr inbounds i8* %tmp5, i64 1
  %tmp6 = load i8* %arrayidx
  %conv7 = sext i8 %tmp6 to i32
  %tmp8 = load i8* getelementptr inbounds ([2 x i8]* @r.c, i32 0, i64 1), align 1
  %conv9 = sext i8 %tmp8 to i32
  %cmp10 = icmp ne i32 %conv7, %conv9
  br i1 %cmp10, label %if.then, label %lor.lhs.false12

lor.lhs.false12:                                  ; preds = %lor.lhs.false
  %tmp13 = load i32* @r.cnt, align 4
  %cmp14 = icmp sgt i32 %tmp13, 3
  br i1 %cmp14, label %if.then, label %if.end

if.then:                                          ; preds = %lor.lhs.false12, %lor.lhs.false, %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %lor.lhs.false12
  %tmp16 = load i8* getelementptr inbounds ([2 x i8]* @r.c, i32 0, i64 0), align 1
  %inc = add i8 %tmp16, 1
  store i8 %inc, i8* getelementptr inbounds ([2 x i8]* @r.c, i32 0, i64 0), align 1
  %tmp17 = load i32* @r.cnt, align 4
  %inc18 = add nsw i32 %tmp17, 1
  store i32 %inc18, i32* @r.cnt, align 4
  ret i32 1
}

declare i32 @strcmp(i8*, i8*) nounwind readonly
