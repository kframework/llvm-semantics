; ModuleID = '/home/grosu/celliso2/c-semantics/tests/integration/sumn.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [3 x i8] c"10\00", align 1
@.str1 = private unnamed_addr constant [13 x i8] c"sum(%d)==%d\0A\00", align 1

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
  %call = tail call i32 @atoi(i8* getelementptr inbounds ([3 x i8]* @.str, i64 0, i64 0)) nounwind readonly
  %cmp2.i = icmp slt i32 %call, 1
  br i1 %cmp2.i, label %sum.exit, label %while.body.lr.ph.i

while.body.lr.ph.i:                               ; preds = %entry
  %tmp.i = shl i32 %call, 1
  %tmp5.i = add i32 %call, -1
  %tmp6.i = zext i32 %tmp5.i to i33
  %tmp7.i = add i32 %call, -2
  %tmp8.i = zext i32 %tmp7.i to i33
  %tmp9.i = mul i33 %tmp6.i, %tmp8.i
  %tmp10.i = lshr i33 %tmp9.i, 1
  %tmp11.i = trunc i33 %tmp10.i to i32
  %tmp12.i = add i32 %tmp.i, -1
  %tmp13.i = add i32 %tmp12.i, %tmp11.i
  br label %sum.exit

sum.exit:                                         ; preds = %entry, %while.body.lr.ph.i
  %tmp51.lcssa.i = phi i32 [ %tmp13.i, %while.body.lr.ph.i ], [ 0, %entry ]
  %call4 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([13 x i8]* @.str1, i64 0, i64 0), i32 %call, i32 %tmp51.lcssa.i) nounwind
  ret i32 %tmp51.lcssa.i
}

declare i32 @atoi(i8* nocapture) nounwind readonly

define i32 @sum(i32 %n) nounwind uwtable readnone {
entry:
  %cmp2 = icmp slt i32 %n, 1
  br i1 %cmp2, label %while.end, label %while.body.lr.ph

while.body.lr.ph:                                 ; preds = %entry
  %tmp = shl i32 %n, 1
  %tmp5 = add i32 %n, -1
  %tmp6 = zext i32 %tmp5 to i33
  %tmp7 = add i32 %n, -2
  %tmp8 = zext i32 %tmp7 to i33
  %tmp9 = mul i33 %tmp6, %tmp8
  %tmp10 = lshr i33 %tmp9, 1
  %tmp11 = trunc i33 %tmp10 to i32
  %tmp12 = add i32 %tmp, %tmp11
  %tmp13 = add i32 %tmp12, -1
  br label %while.end

while.end:                                        ; preds = %while.body.lr.ph, %entry
  %tmp51.lcssa = phi i32 [ %tmp13, %while.body.lr.ph ], [ 0, %entry ]
  ret i32 %tmp51.lcssa
}

declare i32 @printf(i8* nocapture, ...) nounwind
