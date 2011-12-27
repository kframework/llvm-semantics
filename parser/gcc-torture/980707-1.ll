; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/980707-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@buildargv.arglist = internal global [256 x i8*] zeroinitializer, align 16
@.str = private unnamed_addr constant [5 x i8] c" a b\00", align 1
@.str1 = private unnamed_addr constant [2 x i8] c"a\00", align 1
@.str2 = private unnamed_addr constant [2 x i8] c"b\00", align 1

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

define i8** @buildargv(i8* %input) nounwind uwtable {
entry:
  %input.addr = alloca i8*, align 8
  %numargs = alloca i32, align 4
  store i8* %input, i8** %input.addr, align 8
  store i32 0, i32* %numargs, align 4
  br label %while.body

while.body:                                       ; preds = %entry, %if.end34
  br label %while.cond1

while.cond1:                                      ; preds = %while.body4, %while.body
  %tmp = load i8** %input.addr, align 8
  %tmp2 = load i8* %tmp
  %conv = sext i8 %tmp2 to i32
  %cmp = icmp eq i32 %conv, 32
  br i1 %cmp, label %while.body4, label %while.end

while.body4:                                      ; preds = %while.cond1
  %tmp5 = load i8** %input.addr, align 8
  %incdec.ptr = getelementptr inbounds i8* %tmp5, i32 1
  store i8* %incdec.ptr, i8** %input.addr, align 8
  br label %while.cond1

while.end:                                        ; preds = %while.cond1
  %tmp6 = load i8** %input.addr, align 8
  %tmp7 = load i8* %tmp6
  %conv8 = sext i8 %tmp7 to i32
  %cmp9 = icmp eq i32 %conv8, 0
  br i1 %cmp9, label %if.then, label %if.end

if.then:                                          ; preds = %while.end
  br label %while.end37

if.end:                                           ; preds = %while.end
  %tmp11 = load i8** %input.addr, align 8
  %tmp12 = load i32* %numargs, align 4
  %inc = add nsw i32 %tmp12, 1
  store i32 %inc, i32* %numargs, align 4
  %idxprom = sext i32 %tmp12 to i64
  %arrayidx = getelementptr inbounds [256 x i8*]* @buildargv.arglist, i32 0, i64 %idxprom
  store i8* %tmp11, i8** %arrayidx, align 8
  br label %while.cond13

while.cond13:                                     ; preds = %while.body24, %if.end
  %tmp14 = load i8** %input.addr, align 8
  %tmp15 = load i8* %tmp14
  %conv16 = sext i8 %tmp15 to i32
  %cmp17 = icmp ne i32 %conv16, 32
  br i1 %cmp17, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %while.cond13
  %tmp19 = load i8** %input.addr, align 8
  %tmp20 = load i8* %tmp19
  %conv21 = sext i8 %tmp20 to i32
  %cmp22 = icmp ne i32 %conv21, 0
  br label %land.end

land.end:                                         ; preds = %land.rhs, %while.cond13
  %0 = phi i1 [ false, %while.cond13 ], [ %cmp22, %land.rhs ]
  br i1 %0, label %while.body24, label %while.end27

while.body24:                                     ; preds = %land.end
  %tmp25 = load i8** %input.addr, align 8
  %incdec.ptr26 = getelementptr inbounds i8* %tmp25, i32 1
  store i8* %incdec.ptr26, i8** %input.addr, align 8
  br label %while.cond13

while.end27:                                      ; preds = %land.end
  %tmp28 = load i8** %input.addr, align 8
  %tmp29 = load i8* %tmp28
  %conv30 = sext i8 %tmp29 to i32
  %cmp31 = icmp eq i32 %conv30, 0
  br i1 %cmp31, label %if.then33, label %if.end34

if.then33:                                        ; preds = %while.end27
  br label %while.end37

if.end34:                                         ; preds = %while.end27
  %tmp35 = load i8** %input.addr, align 8
  %incdec.ptr36 = getelementptr inbounds i8* %tmp35, i32 1
  store i8* %incdec.ptr36, i8** %input.addr, align 8
  store i8 0, i8* %tmp35
  br label %while.body

while.end37:                                      ; preds = %if.then33, %if.then
  %tmp38 = load i32* %numargs, align 4
  %idxprom39 = sext i32 %tmp38 to i64
  %arrayidx40 = getelementptr inbounds [256 x i8*]* @buildargv.arglist, i32 0, i64 %idxprom39
  store i8* null, i8** %arrayidx40, align 8
  ret i8** getelementptr inbounds ([256 x i8*]* @buildargv.arglist, i32 0, i32 0)
}

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %args = alloca i8**, align 8
  %input = alloca [256 x i8], align 16
  %i = alloca i32, align 4
  store i32 0, i32* %retval
  %arraydecay = getelementptr inbounds [256 x i8]* %input, i32 0, i32 0
  %call = call i8* @strcpy(i8* %arraydecay, i8* getelementptr inbounds ([5 x i8]* @.str, i32 0, i32 0)) nounwind
  %arraydecay1 = getelementptr inbounds [256 x i8]* %input, i32 0, i32 0
  %call2 = call i8** @buildargv(i8* %arraydecay1)
  store i8** %call2, i8*** %args, align 8
  %tmp = load i8*** %args, align 8
  %arrayidx = getelementptr inbounds i8** %tmp, i64 0
  %tmp3 = load i8** %arrayidx
  %call4 = call i32 @strcmp(i8* %tmp3, i8* getelementptr inbounds ([2 x i8]* @.str1, i32 0, i32 0)) nounwind readonly
  %tobool = icmp ne i32 %call4, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  %tmp5 = load i8*** %args, align 8
  %arrayidx6 = getelementptr inbounds i8** %tmp5, i64 1
  %tmp7 = load i8** %arrayidx6
  %call8 = call i32 @strcmp(i8* %tmp7, i8* getelementptr inbounds ([2 x i8]* @.str2, i32 0, i32 0)) nounwind readonly
  %tobool9 = icmp ne i32 %call8, 0
  br i1 %tobool9, label %if.then10, label %if.end11

if.then10:                                        ; preds = %if.end
  call void @abort() noreturn nounwind
  unreachable

if.end11:                                         ; preds = %if.end
  %tmp12 = load i8*** %args, align 8
  %arrayidx13 = getelementptr inbounds i8** %tmp12, i64 2
  %tmp14 = load i8** %arrayidx13
  %cmp = icmp ne i8* %tmp14, null
  br i1 %cmp, label %if.then15, label %if.end16

if.then15:                                        ; preds = %if.end11
  call void @abort() noreturn nounwind
  unreachable

if.end16:                                         ; preds = %if.end11
  call void @exit(i32 0) noreturn nounwind
  unreachable

return:                                           ; No predecessors!
  %0 = load i32* %retval
  ret i32 %0
}

declare i8* @strcpy(i8*, i8*) nounwind

declare i32 @strcmp(i8*, i8*) nounwind readonly

declare void @abort() noreturn nounwind

declare void @exit(i32) noreturn nounwind
