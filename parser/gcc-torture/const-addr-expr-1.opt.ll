; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/const-addr-expr-1.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

%struct.foo = type { i32, i8* }

@.str = private unnamed_addr constant [2 x i8] c"1\00", align 1
@.str1 = private unnamed_addr constant [2 x i8] c"2\00", align 1
@Upgrade_items = global [3 x %struct.foo] [%struct.foo { i32 1, i8* getelementptr inbounds ([2 x i8]* @.str, i32 0, i32 0) }, %struct.foo { i32 2, i8* getelementptr inbounds ([2 x i8]* @.str1, i32 0, i32 0) }, %struct.foo zeroinitializer], align 16
@Upgd_minor_ID = global i32* getelementptr inbounds ([3 x %struct.foo]* @Upgrade_items, i64 0, i64 1, i32 0), align 8
@Upgd_minor_ID1 = global i32* getelementptr inbounds ([3 x %struct.foo]* @Upgrade_items, i64 0, i64 0, i32 0), align 8

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

define i32 @main(i32 %argc, i8** nocapture %argv) nounwind uwtable {
entry:
  %tmp = load i32** @Upgd_minor_ID, align 8
  %tmp1 = load i32* %tmp, align 4
  %cmp = icmp eq i32 %tmp1, 2
  br i1 %cmp, label %if.end, label %if.then

if.then:                                          ; preds = %entry
  tail call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  %tmp2 = load i32** @Upgd_minor_ID1, align 8
  %tmp3 = load i32* %tmp2, align 4
  %cmp4 = icmp eq i32 %tmp3, 1
  br i1 %cmp4, label %if.end6, label %if.then5

if.then5:                                         ; preds = %if.end
  tail call void @abort() noreturn nounwind
  unreachable

if.end6:                                          ; preds = %if.end
  ret i32 0
}

declare void @abort() noreturn nounwind
