; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/pr39240.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@l1 = global i64 4294967292, align 8
@l2 = global i64 65532, align 8
@l3 = global i64 252, align 8
@l4 = global i64 -4, align 8
@l5 = global i64 -4, align 8
@l6 = global i64 -4, align 8

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

define i32 @bar1(i32 %x) nounwind uwtable readnone noinline {
entry:
  %add = add nsw i32 %x, 6
  %call = tail call fastcc i32 @foo1(i32 %add)
  ret i32 %call
}

define internal fastcc i32 @foo1(i32 %x) nounwind uwtable readnone noinline {
entry:
  ret i32 %x
}

define zeroext i16 @bar2(i32 %x) nounwind uwtable readnone noinline {
entry:
  %add = add nsw i32 %x, 6
  %call = tail call fastcc signext i16 @foo2(i32 %add)
  ret i16 %call
}

define internal fastcc signext i16 @foo2(i32 %x) nounwind uwtable readnone noinline {
entry:
  %conv = trunc i32 %x to i16
  ret i16 %conv
}

define zeroext i8 @bar3(i32 %x) nounwind uwtable readnone noinline {
entry:
  %add = add nsw i32 %x, 6
  %call = tail call fastcc signext i8 @foo3(i32 %add)
  ret i8 %call
}

define internal fastcc signext i8 @foo3(i32 %x) nounwind uwtable readnone noinline {
entry:
  %conv = trunc i32 %x to i8
  ret i8 %conv
}

define i32 @bar4(i32 %x) nounwind uwtable readnone noinline {
entry:
  %add = add nsw i32 %x, 6
  %call = tail call fastcc i32 @foo4(i32 %add)
  ret i32 %call
}

define internal fastcc i32 @foo4(i32 %x) nounwind uwtable readnone noinline {
entry:
  ret i32 %x
}

define signext i16 @bar5(i32 %x) nounwind uwtable readnone noinline {
entry:
  %add = add nsw i32 %x, 6
  %call = tail call fastcc zeroext i16 @foo5(i32 %add)
  ret i16 %call
}

define internal fastcc zeroext i16 @foo5(i32 %x) nounwind uwtable readnone noinline {
entry:
  %conv = trunc i32 %x to i16
  ret i16 %conv
}

define signext i8 @bar6(i32 %x) nounwind uwtable readnone noinline {
entry:
  %add = add nsw i32 %x, 6
  %call = tail call fastcc zeroext i8 @foo6(i32 %add)
  ret i8 %call
}

define internal fastcc zeroext i8 @foo6(i32 %x) nounwind uwtable readnone noinline {
entry:
  %conv = trunc i32 %x to i8
  ret i8 %conv
}

define i32 @main() nounwind uwtable {
entry:
  %call = tail call i32 @bar1(i32 -10)
  %conv = zext i32 %call to i64
  %tmp = volatile load i64* @l1, align 8
  %cmp = icmp eq i64 %conv, %tmp
  br i1 %cmp, label %if.end, label %if.then

if.then:                                          ; preds = %entry
  tail call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  %call2 = tail call zeroext i16 @bar2(i32 -10)
  %conv3 = zext i16 %call2 to i64
  %tmp4 = volatile load i64* @l2, align 8
  %cmp5 = icmp eq i64 %conv3, %tmp4
  br i1 %cmp5, label %if.end8, label %if.then7

if.then7:                                         ; preds = %if.end
  tail call void @abort() noreturn nounwind
  unreachable

if.end8:                                          ; preds = %if.end
  %call9 = tail call zeroext i8 @bar3(i32 -10)
  %conv10 = zext i8 %call9 to i64
  %tmp11 = volatile load i64* @l3, align 8
  %cmp12 = icmp eq i64 %conv10, %tmp11
  br i1 %cmp12, label %if.end15, label %if.then14

if.then14:                                        ; preds = %if.end8
  tail call void @abort() noreturn nounwind
  unreachable

if.end15:                                         ; preds = %if.end8
  %call16 = tail call i32 @bar4(i32 -10)
  %conv17 = sext i32 %call16 to i64
  %tmp18 = volatile load i64* @l4, align 8
  %cmp19 = icmp eq i64 %conv17, %tmp18
  br i1 %cmp19, label %if.end22, label %if.then21

if.then21:                                        ; preds = %if.end15
  tail call void @abort() noreturn nounwind
  unreachable

if.end22:                                         ; preds = %if.end15
  %call23 = tail call signext i16 @bar5(i32 -10)
  %conv24 = sext i16 %call23 to i64
  %tmp25 = volatile load i64* @l5, align 8
  %cmp26 = icmp eq i64 %conv24, %tmp25
  br i1 %cmp26, label %if.end29, label %if.then28

if.then28:                                        ; preds = %if.end22
  tail call void @abort() noreturn nounwind
  unreachable

if.end29:                                         ; preds = %if.end22
  %call30 = tail call signext i8 @bar6(i32 -10)
  %conv31 = sext i8 %call30 to i64
  %tmp32 = volatile load i64* @l6, align 8
  %cmp33 = icmp eq i64 %conv31, %tmp32
  br i1 %cmp33, label %if.end36, label %if.then35

if.then35:                                        ; preds = %if.end29
  tail call void @abort() noreturn nounwind
  unreachable

if.end36:                                         ; preds = %if.end29
  ret i32 0
}

declare void @abort() noreturn nounwind
