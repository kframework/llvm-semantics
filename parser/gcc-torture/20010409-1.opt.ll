; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/20010409-1.ll'
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

define void @foo(%struct.A* nocapture %x, i8* nocapture %y, i32 %z) nounwind uwtable {
entry:
  %arrayidx = getelementptr inbounds i8* %y, i64 4
  %tmp1 = load i8* %arrayidx, align 1
  %conv = sext i8 %tmp1 to i32
  %mul = mul nsw i32 %z, 25
  %add = add nsw i32 %conv, %mul
  store i32 %add, i32* @c, align 4
  ret void
}

define noalias %struct.A* @bar(i8* nocapture %v, i32 %w, i32 %x, i8* nocapture %y, i32 %z) noreturn nounwind uwtable {
entry:
  %tobool = icmp eq i32 %w, 0
  br i1 %tobool, label %if.end, label %if.then

if.then:                                          ; preds = %entry
  tail call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  tail call void @exit(i32 0) noreturn nounwind
  unreachable
}

declare void @abort() noreturn nounwind

declare void @exit(i32) noreturn nounwind

define void @test(i8* %x, i32* %y) nounwind uwtable {
entry:
  store i32 5000, i32* @c, align 4
  %tmp4 = load i32* @b, align 4
  %tobool = icmp ne i32 %tmp4, 0
  %cond = select i1 %tobool, i32 0, i32 65536
  %call = tail call i64 @strlen(i8* %x) nounwind
  %conv = trunc i64 %call to i32
  %call6 = tail call %struct.A* @bar(i8* %x, i32 %cond, i32 %conv, i8* getelementptr inbounds ([5 x i8]* @.str, i64 0, i64 0), i32 201)
  unreachable
}

declare i64 @strlen(i8* nocapture) nounwind readonly

define i32 @main() nounwind uwtable {
entry:
  store i32 0, i32* getelementptr inbounds ([1 x %struct.B]* @d, i64 0, i64 0, i32 1), align 8
  store %struct.A** @a, %struct.A*** getelementptr inbounds ([1 x %struct.B]* @d, i64 0, i64 0, i32 0), align 16
  store i32 5000, i32* @c, align 4
  %tmp4.i = load i32* @b, align 4
  %tobool.i = icmp ne i32 %tmp4.i, 0
  %cond.i = select i1 %tobool.i, i32 0, i32 65536
  %call6.i = tail call %struct.A* @bar(i8* getelementptr inbounds ([1 x i8]* @.str1, i64 0, i64 0), i32 %cond.i, i32 0, i8* getelementptr inbounds ([5 x i8]* @.str, i64 0, i64 0), i32 201) nounwind
  unreachable
}
