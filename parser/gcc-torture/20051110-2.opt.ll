; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/20051110-2.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@bytes = common global [5 x i8] zeroinitializer, align 1
@flag = common global i32 0, align 4

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
  %tmp1.tr4 = trunc i64 %shr to i8
  %conv5 = and i8 %tmp1.tr4, 127
  store i8 %conv5, i8* getelementptr inbounds ([5 x i8]* @bytes, i64 0, i64 0), align 1
  %shr46 = lshr i64 %shr, 7
  %tobool7 = icmp eq i64 %shr46, 0
  br i1 %tobool7, label %do.end, label %if.then.lr.ph

if.then.lr.ph:                                    ; preds = %entry
  %tmp12 = load i32* @flag, align 4
  %tobool13 = icmp eq i32 %tmp12, 0
  %tmp = zext i1 %tobool13 to i64
  br label %if.then

if.then:                                          ; preds = %if.then.lr.ph, %if.then
  %indvar = phi i64 [ 0, %if.then.lr.ph ], [ %indvar.next, %if.then ]
  %shr411 = phi i64 [ %shr46, %if.then.lr.ph ], [ %shr4, %if.then ]
  %tmp1.tr9 = phi i8 [ %tmp1.tr4, %if.then.lr.ph ], [ %tmp1.tr, %if.then ]
  %tmp15 = sext i1 %tobool13 to i64
  %tmp13 = and i64 %indvar, %tmp15
  %arrayidx10 = getelementptr [5 x i8]* @bytes, i64 0, i64 %tmp13
  %tmp14 = add i64 %tmp, %tmp13
  %arrayidx = getelementptr [5 x i8]* @bytes, i64 0, i64 %tmp14
  %or = or i8 %tmp1.tr9, -128
  store i8 %or, i8* %arrayidx10, align 1
  %tmp1.tr = trunc i64 %shr411 to i8
  %conv = and i8 %tmp1.tr, 127
  store i8 %conv, i8* %arrayidx, align 1
  %shr4 = lshr i64 %shr411, 7
  %tobool = icmp eq i64 %shr4, 0
  %indvar.next = add i64 %indvar, 1
  br i1 %tobool, label %do.end, label %if.then

do.end:                                           ; preds = %if.then, %entry
  ret void
}

define i32 @main() nounwind uwtable {
add_unwind_adjustsp.exit:
  %tmp12.i = load i32* @flag, align 4
  %tobool13.i = icmp eq i32 %tmp12.i, 0
  %tmp.i = zext i1 %tobool13.i to i64
  %arrayidx.i = getelementptr [5 x i8]* @bytes, i64 0, i64 %tmp.i
  store i8 -120, i8* getelementptr inbounds ([5 x i8]* @bytes, i64 0, i64 0), align 1
  store i8 7, i8* %arrayidx.i, align 1
  %tmp = load i8* getelementptr inbounds ([5 x i8]* @bytes, i64 0, i64 0), align 1
  %cmp = icmp eq i8 %tmp, -120
  %tmp2 = load i8* getelementptr inbounds ([5 x i8]* @bytes, i64 0, i64 1), align 1
  %cmp4 = icmp eq i8 %tmp2, 7
  %or.cond = and i1 %cmp, %cmp4
  br i1 %or.cond, label %if.end, label %if.then

if.then:                                          ; preds = %add_unwind_adjustsp.exit
  tail call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %add_unwind_adjustsp.exit
  ret i32 0
}

declare void @abort() noreturn nounwind
