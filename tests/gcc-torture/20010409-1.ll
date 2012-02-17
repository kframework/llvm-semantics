; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/20010409-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

%struct.A = type { i32, i32 }
%struct.B = type { %struct.A**, i32 }

@b = global i32 1, align 4
@c = common global i32 0, align 4
@d = common global [1 x %struct.B] zeroinitializer, align 16
@.str = private unnamed_addr constant [5 x i8] c"test\00", align 1
@a = common global %struct.A* null, align 8
@.str1 = private unnamed_addr constant [1 x i8] zeroinitializer, align 1

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

define void @foo(%struct.A* %x, i8* %y, i32 %z) nounwind uwtable {
entry:
  %x.addr = alloca %struct.A*, align 8
  %y.addr = alloca i8*, align 8
  %z.addr = alloca i32, align 4
  store %struct.A* %x, %struct.A** %x.addr, align 8
  store i8* %y, i8** %y.addr, align 8
  store i32 %z, i32* %z.addr, align 4
  %tmp = load i8** %y.addr, align 8
  %arrayidx = getelementptr inbounds i8* %tmp, i64 4
  %tmp1 = load i8* %arrayidx
  %conv = sext i8 %tmp1 to i32
  %tmp2 = load i32* %z.addr, align 4
  %mul = mul nsw i32 %tmp2, 25
  %add = add nsw i32 %conv, %mul
  store i32 %add, i32* @c, align 4
  ret void
}

define %struct.A* @bar(i8* %v, i32 %w, i32 %x, i8* %y, i32 %z) nounwind uwtable {
entry:
  %retval = alloca %struct.A*, align 8
  %v.addr = alloca i8*, align 8
  %w.addr = alloca i32, align 4
  %x.addr = alloca i32, align 4
  %y.addr = alloca i8*, align 8
  %z.addr = alloca i32, align 4
  store i8* %v, i8** %v.addr, align 8
  store i32 %w, i32* %w.addr, align 4
  store i32 %x, i32* %x.addr, align 4
  store i8* %y, i8** %y.addr, align 8
  store i32 %z, i32* %z.addr, align 4
  %tmp = load i32* %w.addr, align 4
  %tobool = icmp ne i32 %tmp, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  call void @exit(i32 0) noreturn nounwind
  unreachable

return:                                           ; No predecessors!
  %0 = load %struct.A** %retval
  ret %struct.A* %0
}

declare void @abort() noreturn nounwind

declare void @exit(i32) noreturn nounwind

define void @test(i8* %x, i32* %y) nounwind uwtable {
entry:
  %x.addr = alloca i8*, align 8
  %y.addr = alloca i32*, align 8
  store i8* %x, i8** %x.addr, align 8
  store i32* %y, i32** %y.addr, align 8
  %tmp = load i32* getelementptr inbounds ([1 x %struct.B]* @d, i32 0, i32 0, i32 1), align 4
  %idxprom = sext i32 %tmp to i64
  %tmp1 = load %struct.A*** getelementptr inbounds ([1 x %struct.B]* @d, i32 0, i32 0, i32 0), align 8
  %arrayidx = getelementptr inbounds %struct.A** %tmp1, i64 %idxprom
  %tmp2 = load %struct.A** %arrayidx
  call void @foo(%struct.A* %tmp2, i8* getelementptr inbounds ([5 x i8]* @.str, i32 0, i32 0), i32 200)
  %tmp3 = load i8** %x.addr, align 8
  %tmp4 = load i32* @b, align 4
  %tobool = icmp ne i32 %tmp4, 0
  %cond = select i1 %tobool, i32 0, i32 65536
  %tmp5 = load i8** %x.addr, align 8
  %call = call i64 @strlen(i8* %tmp5)
  %conv = trunc i64 %call to i32
  %call6 = call %struct.A* @bar(i8* %tmp3, i32 %cond, i32 %conv, i8* getelementptr inbounds ([5 x i8]* @.str, i32 0, i32 0), i32 201)
  %tmp7 = load i32* getelementptr inbounds ([1 x %struct.B]* @d, i32 0, i32 0, i32 1), align 4
  %idxprom8 = sext i32 %tmp7 to i64
  %tmp9 = load %struct.A*** getelementptr inbounds ([1 x %struct.B]* @d, i32 0, i32 0, i32 0), align 8
  %arrayidx10 = getelementptr inbounds %struct.A** %tmp9, i64 %idxprom8
  store %struct.A* %call6, %struct.A** %arrayidx10
  %tmp11 = load i32* getelementptr inbounds ([1 x %struct.B]* @d, i32 0, i32 0, i32 1), align 4
  %idxprom12 = sext i32 %tmp11 to i64
  %tmp13 = load %struct.A*** getelementptr inbounds ([1 x %struct.B]* @d, i32 0, i32 0, i32 0), align 8
  %arrayidx14 = getelementptr inbounds %struct.A** %tmp13, i64 %idxprom12
  %tmp15 = load %struct.A** %arrayidx14
  %a = getelementptr inbounds %struct.A* %tmp15, i32 0, i32 0
  %tmp16 = load i32* %a, align 4
  %inc = add nsw i32 %tmp16, 1
  store i32 %inc, i32* %a, align 4
  %tmp17 = load i32** %y.addr, align 8
  %tobool18 = icmp ne i32* %tmp17, null
  br i1 %tobool18, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %tmp19 = load i32** %y.addr, align 8
  %tmp20 = load i32* %tmp19
  %tmp21 = load i32* getelementptr inbounds ([1 x %struct.B]* @d, i32 0, i32 0, i32 1), align 4
  %idxprom22 = sext i32 %tmp21 to i64
  %tmp23 = load %struct.A*** getelementptr inbounds ([1 x %struct.B]* @d, i32 0, i32 0, i32 0), align 8
  %arrayidx24 = getelementptr inbounds %struct.A** %tmp23, i64 %idxprom22
  %tmp25 = load %struct.A** %arrayidx24
  %b = getelementptr inbounds %struct.A* %tmp25, i32 0, i32 1
  store i32 %tmp20, i32* %b, align 4
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  ret void
}

declare i64 @strlen(i8*)

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval
  store i32 0, i32* getelementptr inbounds ([1 x %struct.B]* @d, i32 0, i32 0, i32 1), align 4
  store %struct.A** @a, %struct.A*** getelementptr inbounds ([1 x %struct.B]* @d, i32 0, i32 0, i32 0), align 8
  call void @test(i8* getelementptr inbounds ([1 x i8]* @.str1, i32 0, i32 0), i32* null)
  %0 = load i32* %retval
  ret i32 %0
}
