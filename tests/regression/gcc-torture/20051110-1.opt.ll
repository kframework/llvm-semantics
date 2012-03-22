; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/20051110-1.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@bytes = common global [5 x i8] zeroinitializer, align 1

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

define void @add_unwind_adjustsp(i64 %offset) nounwind uwtable {
entry:
  %sub = add nsw i64 %offset, -516
  %shr = ashr i64 %sub, 2
  %tobool3 = icmp eq i64 %shr, 0
  br i1 %tobool3, label %while.end, label %while.body

while.body:                                       ; preds = %entry, %while.body
  %indvar = phi i64 [ %indvar.next, %while.body ], [ 0, %entry ]
  %shr514 = phi i64 [ %shr5, %while.body ], [ %shr, %entry ]
  %arrayidx = getelementptr [5 x i8]* @bytes, i64 0, i64 %indvar
  %tmp2.tr = trunc i64 %shr514 to i8
  %conv = and i8 %tmp2.tr, 127
  %shr5 = lshr i64 %shr514, 7
  %or = or i8 %tmp2.tr, -128
  %tobool7 = icmp eq i64 %shr5, 0
  %conv.or = select i1 %tobool7, i8 %conv, i8 %or
  store i8 %conv.or, i8* %arrayidx, align 1
  %indvar.next = add i64 %indvar, 1
  br i1 %tobool7, label %while.end, label %while.body

while.end:                                        ; preds = %while.body, %entry
  ret void
}

define i32 @main() nounwind uwtable {
if.end:
  store i8 -120, i8* getelementptr inbounds ([5 x i8]* @bytes, i64 0, i64 0), align 1
  store i8 7, i8* getelementptr inbounds ([5 x i8]* @bytes, i64 0, i64 1), align 1
  ret i32 0
}
