; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/pr33142.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

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

define i32 @lisp_atan2(i64 %dy, i64 %dx) nounwind uwtable readnone noinline {
entry:
  %cmp = icmp slt i64 %dx, 1
  %cmp2 = icmp sgt i64 %dy, 0
  %or.cond = and i1 %cmp, %cmp2
  br i1 %or.cond, label %if.then3, label %return

if.then3:                                         ; preds = %entry
  %conv = trunc i64 %dx to i32
  %ispos = icmp sgt i32 %conv, -1
  %neg = sub i32 0, %conv
  %call = select i1 %ispos, i32 %conv, i32 %neg
  %conv6 = trunc i64 %dy to i32
  %ispos1 = icmp sgt i32 %conv6, -1
  %neg2 = sub i32 0, %conv6
  %call7 = select i1 %ispos1, i32 %conv6, i32 %neg2
  %cmp8 = icmp sle i32 %call, %call7
  %conv9 = zext i1 %cmp8 to i32
  br label %return

return:                                           ; preds = %entry, %if.then3
  %storemerge = phi i32 [ %conv9, %if.then3 ], [ 0, %entry ]
  ret i32 %storemerge
}

define i32 @main() nounwind uwtable {
entry:
  %dy = alloca i64, align 8
  %dx = alloca i64, align 8
  volatile store i64 63, i64* %dy, align 8
  volatile store i64 -77, i64* %dx, align 8
  %tmp = volatile load i64* %dy, align 8
  %tmp1 = volatile load i64* %dx, align 8
  %call = call i32 @lisp_atan2(i64 %tmp, i64 %tmp1)
  %tobool = icmp eq i32 %call, 0
  br i1 %tobool, label %if.end, label %if.then

if.then:                                          ; preds = %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  ret i32 0
}

declare void @abort() noreturn nounwind
