; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/20000422-1.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@ops = global [13 x i32] [i32 11, i32 12, i32 46, i32 3, i32 2, i32 2, i32 3, i32 2, i32 1, i32 3, i32 2, i32 1, i32 2], align 16
@correct = global [13 x i32] [i32 46, i32 12, i32 11, i32 3, i32 3, i32 3, i32 2, i32 2, i32 2, i32 2, i32 2, i32 1, i32 1], align 16
@num = global i32 13, align 4

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

define i32 @main() noreturn nounwind uwtable {
entry:
  %tmp17 = load i32* @num, align 4
  %cmp8 = icmp sgt i32 %tmp17, 0
  br i1 %cmp8, label %for.cond4.preheader.lr.ph, label %for.cond39

for.cond4.preheader.lr.ph:                        ; preds = %entry
  %tmp29 = icmp sgt i32 %tmp17, 1
  %smax = select i1 %tmp29, i32 %tmp17, i32 1
  br label %for.cond4.preheader

for.cond4.preheader:                              ; preds = %for.inc36, %for.cond4.preheader.lr.ph
  %0 = phi i32 [ 0, %for.cond4.preheader.lr.ph ], [ %1, %for.inc36 ]
  %storemerge23 = add nsw i32 %tmp17, -1
  %cmp74 = icmp sgt i32 %storemerge23, %0
  br i1 %cmp74, label %for.body8.lr.ph, label %for.inc36

for.body8.lr.ph:                                  ; preds = %for.cond4.preheader
  %tmp32 = sub i32 -2, %0
  %tmp14 = add i32 %tmp17, %tmp32
  %tmp16 = zext i32 %tmp14 to i64
  %tmp18 = add i64 %tmp16, 1
  %tmp20 = add i32 %tmp17, -2
  %tmp24 = sext i32 %tmp20 to i64
  %tmp27 = sext i32 %storemerge23 to i64
  br label %for.body8

for.body8:                                        ; preds = %for.cond4.backedge, %for.body8.lr.ph
  %indvar11 = phi i64 [ 0, %for.body8.lr.ph ], [ %indvar.next12, %for.cond4.backedge ]
  %tmp25 = sub i64 %tmp24, %indvar11
  %arrayidx = getelementptr [13 x i32]* @ops, i64 0, i64 %tmp25
  %tmp28 = sub i64 %tmp27, %indvar11
  %arrayidx14 = getelementptr [13 x i32]* @ops, i64 0, i64 %tmp28
  %tmp11 = load i32* %arrayidx, align 4
  %tmp15 = load i32* %arrayidx14, align 4
  %cmp16 = icmp slt i32 %tmp11, %tmp15
  br i1 %cmp16, label %if.then, label %for.cond4.backedge

for.cond4.backedge:                               ; preds = %for.body8, %if.then
  %indvar.next12 = add i64 %indvar11, 1
  %exitcond = icmp eq i64 %indvar.next12, %tmp18
  br i1 %exitcond, label %for.inc36, label %for.body8

if.then:                                          ; preds = %for.body8
  store i32 %tmp11, i32* %arrayidx14, align 4
  store i32 %tmp15, i32* %arrayidx, align 4
  br label %for.cond4.backedge

for.inc36:                                        ; preds = %for.cond4.backedge, %for.cond4.preheader
  %1 = add nsw i32 %0, 1
  %exitcond30 = icmp eq i32 %1, %smax
  br i1 %exitcond30, label %for.cond39, label %for.cond4.preheader

for.cond39:                                       ; preds = %entry, %for.inc36, %for.inc55
  %indvar = phi i64 [ %indvar.next, %for.inc55 ], [ 0, %for.inc36 ], [ 0, %entry ]
  %storemerge1 = trunc i64 %indvar to i32
  %cmp42 = icmp slt i32 %storemerge1, %tmp17
  br i1 %cmp42, label %for.body43, label %for.end58

for.body43:                                       ; preds = %for.cond39
  %arrayidx46 = getelementptr [13 x i32]* @ops, i64 0, i64 %indvar
  %arrayidx50 = getelementptr [13 x i32]* @correct, i64 0, i64 %indvar
  %tmp47 = load i32* %arrayidx46, align 4
  %tmp51 = load i32* %arrayidx50, align 4
  %cmp52 = icmp eq i32 %tmp47, %tmp51
  br i1 %cmp52, label %for.inc55, label %if.then53

if.then53:                                        ; preds = %for.body43
  tail call void @abort() noreturn nounwind
  unreachable

for.inc55:                                        ; preds = %for.body43
  %indvar.next = add i64 %indvar, 1
  br label %for.cond39

for.end58:                                        ; preds = %for.cond39
  tail call void @exit(i32 0) noreturn nounwind
  unreachable
}

declare void @abort() noreturn nounwind

declare void @exit(i32) noreturn nounwind
