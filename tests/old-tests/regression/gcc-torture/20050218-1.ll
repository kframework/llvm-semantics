; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/20050218-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [2 x i8] c"a\00", align 1
@.str1 = private unnamed_addr constant [3 x i8] c"bc\00", align 1
@.str2 = private unnamed_addr constant [3 x i8] c"de\00", align 1
@.str3 = private unnamed_addr constant [4 x i8] c"fgh\00", align 1
@a = global [16 x i8*] [i8* getelementptr inbounds ([2 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8]* @.str1, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8]* @.str2, i32 0, i32 0), i8* getelementptr inbounds ([4 x i8]* @.str3, i32 0, i32 0), i8* null, i8* null, i8* null, i8* null, i8* null, i8* null, i8* null, i8* null, i8* null, i8* null, i8* null, i8* null], align 16
@.str4 = private unnamed_addr constant [6 x i8] c"abcde\00", align 1

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

define i32 @foo(i8* %x, i8* %y, i64 %n) nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %x.addr = alloca i8*, align 8
  %y.addr = alloca i8*, align 8
  %n.addr = alloca i64, align 8
  %i = alloca i64, align 8
  %j = alloca i64, align 8
  store i8* %x, i8** %x.addr, align 8
  store i8* %y, i8** %y.addr, align 8
  store i64 %n, i64* %n.addr, align 8
  store i64 0, i64* %j, align 8
  store i64 0, i64* %i, align 8
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %tmp = load i64* %i, align 8
  %tmp1 = load i64* %n.addr, align 8
  %cmp = icmp ult i64 %tmp, %tmp1
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %tmp2 = load i8** %x.addr, align 8
  %tmp3 = load i64* %j, align 8
  %add.ptr = getelementptr inbounds i8* %tmp2, i64 %tmp3
  %tmp4 = load i64* %i, align 8
  %arrayidx = getelementptr inbounds [16 x i8*]* @a, i32 0, i64 %tmp4
  %tmp5 = load i8** %arrayidx, align 8
  %tmp6 = load i64* %i, align 8
  %arrayidx7 = getelementptr inbounds [16 x i8*]* @a, i32 0, i64 %tmp6
  %tmp8 = load i8** %arrayidx7, align 8
  %call = call i64 @strlen(i8* %tmp8)
  %call9 = call i32 @strncmp(i8* %add.ptr, i8* %tmp5, i64 %call)
  %cmp10 = icmp ne i32 %call9, 0
  br i1 %cmp10, label %if.then, label %if.end

if.then:                                          ; preds = %for.body
  store i32 2, i32* %retval
  br label %return

if.end:                                           ; preds = %for.body
  %tmp11 = load i64* %i, align 8
  %arrayidx12 = getelementptr inbounds [16 x i8*]* @a, i32 0, i64 %tmp11
  %tmp13 = load i8** %arrayidx12, align 8
  %call14 = call i64 @strlen(i8* %tmp13)
  %tmp15 = load i64* %j, align 8
  %add = add i64 %tmp15, %call14
  store i64 %add, i64* %j, align 8
  %tmp16 = load i8** %y.addr, align 8
  %tobool = icmp ne i8* %tmp16, null
  br i1 %tobool, label %if.then17, label %if.end22

if.then17:                                        ; preds = %if.end
  %tmp18 = load i8** %y.addr, align 8
  %call19 = call i64 @strlen(i8* %tmp18)
  %tmp20 = load i64* %j, align 8
  %add21 = add i64 %tmp20, %call19
  store i64 %add21, i64* %j, align 8
  br label %if.end22

if.end22:                                         ; preds = %if.then17, %if.end
  br label %for.inc

for.inc:                                          ; preds = %if.end22
  %tmp23 = load i64* %i, align 8
  %inc = add i64 %tmp23, 1
  store i64 %inc, i64* %i, align 8
  br label %for.cond

for.end:                                          ; preds = %for.cond
  store i32 0, i32* %retval
  br label %return

return:                                           ; preds = %for.end, %if.then
  %0 = load i32* %retval
  ret i32 %0
}

declare i32 @strncmp(i8*, i8*, i64)

declare i64 @strlen(i8*)

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval
  %call = call i32 @foo(i8* getelementptr inbounds ([6 x i8]* @.str4, i32 0, i32 0), i8* null, i64 3)
  %cmp = icmp ne i32 %call, 0
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  ret i32 0
}

declare void @abort() noreturn nounwind
