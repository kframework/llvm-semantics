; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/950426-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

%struct.tag = type { i32, [5 x i8*] }

@s1 = common global %struct.tag zeroinitializer, align 8
@p1 = common global %struct.tag* null, align 8
@.str = private unnamed_addr constant [3 x i8] c"ok\00", align 1
@i = common global i32 0, align 4
@.str1 = private unnamed_addr constant [4 x i8] c"123\00", align 1

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

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval
  store i32 -1, i32* getelementptr inbounds (%struct.tag* @s1, i32 0, i32 0), align 4
  store %struct.tag* @s1, %struct.tag** @p1, align 8
  %tmp = load %struct.tag** @p1, align 8
  %m1 = getelementptr inbounds %struct.tag* %tmp, i32 0, i32 0
  %call = call i32 (...)* bitcast (i32 (i32*)* @func1 to i32 (...)*)(i32* %m1)
  %cmp = icmp eq i32 %call, -1
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  call void (...)* bitcast (void (i8*)* @foo to void (...)*)(i8* getelementptr inbounds ([3 x i8]* @.str, i32 0, i32 0))
  br label %if.end

if.else:                                          ; preds = %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %if.then
  store i32 3, i32* @i, align 4
  store i8* getelementptr inbounds ([4 x i8]* @.str1, i32 0, i32 0), i8** getelementptr inbounds (%struct.tag* @s1, i32 0, i32 1, i64 3), align 8
  %tmp1 = load i32* @i, align 4
  %idxprom = sext i32 %tmp1 to i64
  %tmp2 = load %struct.tag** @p1, align 8
  %m2 = getelementptr inbounds %struct.tag* %tmp2, i32 0, i32 1
  %arrayidx = getelementptr inbounds [5 x i8*]* %m2, i32 0, i64 %idxprom
  %tmp3 = load i8** %arrayidx, align 8
  %incdec.ptr = getelementptr inbounds i8* %tmp3, i32 1
  store i8* %incdec.ptr, i8** %arrayidx, align 8
  %call4 = call i64 @strlen(i8* %tmp3) nounwind readonly
  %cmp5 = icmp eq i64 %call4, 3
  br i1 %cmp5, label %if.then6, label %if.else7

if.then6:                                         ; preds = %if.end
  call void (...)* bitcast (void (i8*)* @foo to void (...)*)(i8* getelementptr inbounds ([3 x i8]* @.str, i32 0, i32 0))
  br label %if.end8

if.else7:                                         ; preds = %if.end
  call void @abort() noreturn nounwind
  unreachable

if.end8:                                          ; preds = %if.then6
  call void @exit(i32 0) noreturn nounwind
  unreachable

return:                                           ; No predecessors!
  %0 = load i32* %retval
  ret i32 %0
}

declare void @abort() noreturn nounwind

declare i64 @strlen(i8*) nounwind readonly

declare void @exit(i32) noreturn nounwind

define i32 @func1(i32* %p) nounwind uwtable {
entry:
  %p.addr = alloca i32*, align 8
  store i32* %p, i32** %p.addr, align 8
  %tmp = load i32** %p.addr, align 8
  %tmp1 = load i32* %tmp
  ret i32 %tmp1
}

define void @foo(i8* %s) nounwind uwtable {
entry:
  %s.addr = alloca i8*, align 8
  store i8* %s, i8** %s.addr, align 8
  ret void
}
