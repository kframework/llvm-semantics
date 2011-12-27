; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/pr29695-2.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@a = global i32 128, align 4
@b = global i8 -128, align 1
@c = global i64 2147483648, align 8
@d = global i32 -2147483648, align 4

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

define i32 @f1() nounwind uwtable readonly {
entry:
  %tmp = load i32* @a, align 4
  %and = and i32 %tmp, 128
  ret i32 %and
}

define i32 @f2() nounwind uwtable readonly {
entry:
  %tmp = load i8* @b, align 1
  %tobool = icmp slt i8 %tmp, 0
  %cond = select i1 %tobool, i32 128, i32 0
  ret i32 %cond
}

define i32 @f3() nounwind uwtable readonly {
entry:
  %tmp = load i8* @b, align 1
  %tobool = icmp slt i8 %tmp, 0
  %cond = select i1 %tobool, i32 896, i32 0
  ret i32 %cond
}

define i32 @f4() nounwind uwtable readonly {
entry:
  %tmp = load i8* @b, align 1
  %tobool = icmp slt i8 %tmp, 0
  %cond = select i1 %tobool, i32 -128, i32 0
  ret i32 %cond
}

define i64 @f5() nounwind uwtable readonly {
entry:
  %tmp = load i64* @c, align 8
  %and = and i64 %tmp, 2147483648
  ret i64 %and
}

define i64 @f6() nounwind uwtable readonly {
entry:
  %tmp = load i32* @d, align 4
  %tobool = icmp slt i32 %tmp, 0
  %cond = select i1 %tobool, i64 2147483648, i64 0
  ret i64 %cond
}

define i64 @f7() nounwind uwtable readonly {
entry:
  %tmp = load i32* @d, align 4
  %tobool = icmp slt i32 %tmp, 0
  %cond = select i1 %tobool, i64 15032385536, i64 0
  ret i64 %cond
}

define i64 @f8() nounwind uwtable readonly {
entry:
  %tmp = load i32* @d, align 4
  %tobool = icmp slt i32 %tmp, 0
  %cond = select i1 %tobool, i64 -2147483648, i64 0
  ret i64 %cond
}

define i32 @main() nounwind uwtable {
entry:
  %tmp.i = load i32* @a, align 4
  %and.i = and i32 %tmp.i, 128
  %cmp = icmp eq i32 %and.i, 0
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  tail call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  %tmp.i16 = load i8* @b, align 1
  %tobool.i17 = icmp slt i8 %tmp.i16, 0
  br i1 %tobool.i17, label %if.end12, label %if.then3

if.then3:                                         ; preds = %if.end
  tail call void @abort() noreturn nounwind
  unreachable

if.end12:                                         ; preds = %if.end
  %tmp.i8 = load i64* @c, align 8
  %and.i9 = and i64 %tmp.i8, 2147483648
  %cmp14 = icmp eq i64 %and.i9, 0
  br i1 %cmp14, label %if.then15, label %if.end16

if.then15:                                        ; preds = %if.end12
  tail call void @abort() noreturn nounwind
  unreachable

if.end16:                                         ; preds = %if.end12
  %tmp.i5 = load i32* @d, align 4
  %tobool.i6 = icmp slt i32 %tmp.i5, 0
  br i1 %tobool.i6, label %if.end28, label %if.then19

if.then19:                                        ; preds = %if.end16
  tail call void @abort() noreturn nounwind
  unreachable

if.end28:                                         ; preds = %if.end16
  ret i32 0
}

declare void @abort() noreturn nounwind
