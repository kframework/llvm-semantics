; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/pr42006.ll'
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

define i32 @main() nounwind uwtable {
entry:
  br label %for.cond.i

for.cond.i:                                       ; preds = %for.inc.i, %entry
  %0 = phi i32 [ 0, %entry ], [ %inc.i, %for.inc.i ]
  %storemerge.i = phi i32 [ 1, %entry ], [ %si1.add.i.i, %for.inc.i ]
  %cmp.i = icmp ult i32 %storemerge.i, 3
  br i1 %cmp.i, label %for.body.i, label %func_4.exit

for.body.i:                                       ; preds = %for.cond.i
  %inc.i = add nsw i32 %0, 1
  %cmp2.i = icmp sgt i32 %0, 1
  br i1 %cmp2.i, label %if.then.i, label %if.end.i

if.then.i:                                        ; preds = %for.body.i
  tail call void @abort() noreturn nounwind
  unreachable

if.end.i:                                         ; preds = %for.body.i
  %cmp.i.i = icmp ugt i32 %storemerge.i, 100
  %shr.i.i = select i1 %cmp.i.i, i32 0, i32 %storemerge.i
  %left.shr.i.i = lshr i32 %storemerge.i, %shr.i.i
  %tobool.i = icmp eq i32 %left.shr.i.i, 0
  br i1 %tobool.i, label %for.inc.i, label %func_4.exit

for.inc.i:                                        ; preds = %if.end.i
  %not.cmp.i.i = icmp ult i32 %storemerge.i, 50
  %add.i.i = zext i1 %not.cmp.i.i to i32
  %si1.add.i.i = add i32 %add.i.i, %storemerge.i
  br label %for.cond.i

func_4.exit:                                      ; preds = %for.cond.i, %if.end.i
  ret i32 0
}

declare void @abort() noreturn nounwind
