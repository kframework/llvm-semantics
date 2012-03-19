; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/20080522-1.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@i = internal global i32 0, align 4

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

define i32 @foo(i32* nocapture %q) nounwind uwtable noinline {
entry:
  store i32 1, i32* @i, align 4
  store i32 2, i32* %q, align 4
  %tmp3 = load i32* @i, align 4
  ret i32 %tmp3
}

define i32 @bar(i32* %q) nounwind uwtable noinline {
entry:
  store i32 2, i32* %q, align 4
  store i32 1, i32* @i, align 4
  %tmp3 = load i32* %q, align 4
  ret i32 %tmp3
}

define i32 @main() nounwind uwtable {
entry:
  %j = alloca i32, align 4
  store i32 0, i32* %j, align 4
  %call = call i32 @foo(i32* @i)
  %cmp = icmp eq i32 %call, 2
  br i1 %cmp, label %if.end, label %if.then

if.then:                                          ; preds = %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  %call1 = call i32 @bar(i32* @i)
  %cmp2 = icmp eq i32 %call1, 1
  br i1 %cmp2, label %if.end4, label %if.then3

if.then3:                                         ; preds = %if.end
  call void @abort() noreturn nounwind
  unreachable

if.end4:                                          ; preds = %if.end
  %call5 = call i32 @foo(i32* %j)
  %cmp6 = icmp eq i32 %call5, 1
  br i1 %cmp6, label %if.end8, label %if.then7

if.then7:                                         ; preds = %if.end4
  call void @abort() noreturn nounwind
  unreachable

if.end8:                                          ; preds = %if.end4
  %tmp = load i32* %j, align 4
  %cmp9 = icmp eq i32 %tmp, 2
  br i1 %cmp9, label %if.end11, label %if.then10

if.then10:                                        ; preds = %if.end8
  call void @abort() noreturn nounwind
  unreachable

if.end11:                                         ; preds = %if.end8
  %call12 = call i32 @bar(i32* %j)
  %cmp13 = icmp eq i32 %call12, 2
  br i1 %cmp13, label %if.end15, label %if.then14

if.then14:                                        ; preds = %if.end11
  call void @abort() noreturn nounwind
  unreachable

if.end15:                                         ; preds = %if.end11
  %tmp16 = load i32* %j, align 4
  %cmp17 = icmp eq i32 %tmp16, 2
  br i1 %cmp17, label %if.end19, label %if.then18

if.then18:                                        ; preds = %if.end15
  call void @abort() noreturn nounwind
  unreachable

if.end19:                                         ; preds = %if.end15
  ret i32 0
}

declare void @abort() noreturn nounwind
