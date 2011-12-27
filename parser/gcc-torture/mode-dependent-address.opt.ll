; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/mode-dependent-address.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@main.correct = internal unnamed_addr constant [96 x i32] [i32 0, i32 1, i32 2, i32 3, i32 0, i32 1, i32 2, i32 3, i32 8, i32 9, i32 10, i32 11, i32 8, i32 9, i32 10, i32 11, i32 16, i32 17, i32 18, i32 19, i32 16, i32 17, i32 18, i32 19, i32 24, i32 25, i32 26, i32 27, i32 24, i32 25, i32 26, i32 27, i32 32, i32 33, i32 34, i32 35, i32 32, i32 33, i32 34, i32 35, i32 40, i32 41, i32 42, i32 43, i32 40, i32 41, i32 42, i32 43, i32 48, i32 49, i32 50, i32 51, i32 48, i32 49, i32 50, i32 51, i32 56, i32 57, i32 58, i32 59, i32 56, i32 57, i32 58, i32 59, i32 64, i32 65, i32 66, i32 67, i32 64, i32 65, i32 66, i32 67, i32 72, i32 73, i32 74, i32 75, i32 72, i32 73, i32 74, i32 75, i32 80, i32 81, i32 82, i32 83, i32 80, i32 81, i32 82, i32 83, i32 88, i32 89, i32 90, i32 91, i32 88, i32 89, i32 90, i32 91], align 16
@arg4 = common global [96 x i8] zeroinitializer, align 16
@arg1 = common global [96 x i16] zeroinitializer, align 16
@arg2 = common global [96 x i32] zeroinitializer, align 16
@arg3 = common global [96 x i64] zeroinitializer, align 16
@result = common global [96 x i8] zeroinitializer, align 16

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

define void @f883b(i8* %result, i16* noalias %arg1, i32* noalias %arg2, i64* noalias %arg3, i8* noalias nocapture %arg4) nounwind uwtable {
entry:
  br label %for.body

for.body:                                         ; preds = %for.body, %entry
  %indvar = phi i64 [ 0, %entry ], [ %indvar.next, %for.body ]
  %arrayidx29 = getelementptr i8* %result, i64 %indvar
  %arrayidx22 = getelementptr i64* %arg3, i64 %indvar
  %arrayidx15 = getelementptr i32* %arg2, i64 %indvar
  %arrayidx = getelementptr i16* %arg1, i64 %indvar
  %tmp3 = load i16* %arrayidx, align 2
  %cmp4 = icmp sgt i16 %tmp3, 1
  %conv11 = sext i16 %tmp3 to i32
  %cond = select i1 %cmp4, i32 1, i32 %conv11
  %tmp16 = load i32* %arrayidx15, align 4
  %and = and i32 %tmp16, 31
  %shr = ashr i32 %cond, %and
  %xor = xor i32 %shr, 1
  %sub = add nsw i32 %xor, 32
  %shr171 = lshr i32 %sub, 7
  %or = or i32 %shr171, 251
  %conv182 = zext i32 %or to i64
  %tmp23 = load i64* %arrayidx22, align 8
  %and24 = and i64 %conv182, %tmp23
  %conv25 = trunc i64 %and24 to i8
  store i8 %conv25, i8* %arrayidx29, align 1
  %indvar.next = add i64 %indvar, 1
  %exitcond = icmp eq i64 %indvar.next, 96
  br i1 %exitcond, label %for.end, label %for.body

for.end:                                          ; preds = %for.body
  ret void
}

define i32 @main() nounwind uwtable {
entry:
  br label %for.body

for.body:                                         ; preds = %for.body, %entry
  %conv12 = phi i64 [ 0, %entry ], [ %indvar.next7, %for.body ]
  %conv84 = trunc i64 %conv12 to i32
  %conv4 = trunc i64 %conv12 to i16
  %arrayidx15 = getelementptr [96 x i64]* @arg3, i64 0, i64 %conv12
  %arrayidx11 = getelementptr [96 x i32]* @arg2, i64 0, i64 %conv12
  %arrayidx7 = getelementptr [96 x i16]* @arg1, i64 0, i64 %conv12
  %arrayidx = getelementptr [96 x i8]* @arg4, i64 0, i64 %conv12
  %conv = trunc i64 %conv12 to i8
  store i8 %conv, i8* %arrayidx, align 1
  store i16 %conv4, i16* %arrayidx7, align 2
  store i32 %conv84, i32* %arrayidx11, align 4
  store i64 %conv12, i64* %arrayidx15, align 8
  %indvar.next7 = add i64 %conv12, 1
  %exitcond8 = icmp eq i64 %indvar.next7, 96
  br i1 %exitcond8, label %for.body.i, label %for.body

for.body.i:                                       ; preds = %for.body, %for.body.i
  %indvar.i = phi i64 [ %0, %for.body.i ], [ 0, %for.body ]
  %arrayidx.i = getelementptr [96 x i16]* @arg1, i64 0, i64 %indvar.i
  %arrayidx15.i = getelementptr [96 x i32]* @arg2, i64 0, i64 %indvar.i
  %arrayidx22.i = getelementptr [96 x i64]* @arg3, i64 0, i64 %indvar.i
  %arrayidx29.i = getelementptr [96 x i8]* @result, i64 0, i64 %indvar.i
  %tmp3.i = load i16* %arrayidx.i, align 2
  %cmp4.i = icmp sgt i16 %tmp3.i, 1
  %conv11.i = sext i16 %tmp3.i to i32
  %cond.i = select i1 %cmp4.i, i32 1, i32 %conv11.i
  %tmp16.i = load i32* %arrayidx15.i, align 4
  %and.i = and i32 %tmp16.i, 31
  %shr.i = ashr i32 %cond.i, %and.i
  %xor.i = xor i32 %shr.i, 1
  %sub.i = add nsw i32 %xor.i, 32
  %shr171.i = lshr i32 %sub.i, 7
  %or.i = or i32 %shr171.i, 251
  %conv182.i = zext i32 %or.i to i64
  %tmp23.i = load i64* %arrayidx22.i, align 8
  %and24.i = and i64 %conv182.i, %tmp23.i
  %conv25.i = trunc i64 %and24.i to i8
  store i8 %conv25.i, i8* %arrayidx29.i, align 1
  %0 = add i64 %indvar.i, 1
  %exitcond = icmp eq i64 %0, 96
  br i1 %exitcond, label %for.cond17, label %for.body.i

for.cond17:                                       ; preds = %for.body.i, %for.inc33
  %indvar = phi i64 [ %indvar.next, %for.inc33 ], [ 0, %for.body.i ]
  %storemerge1 = trunc i64 %indvar to i32
  %cmp19 = icmp slt i32 %storemerge1, 96
  br i1 %cmp19, label %for.body21, label %for.end36

for.body21:                                       ; preds = %for.cond17
  %arrayidx24 = getelementptr [96 x i8]* @result, i64 0, i64 %indvar
  %arrayidx29 = getelementptr [96 x i32]* @main.correct, i64 0, i64 %indvar
  %tmp25 = load i8* %arrayidx24, align 1
  %conv26 = sext i8 %tmp25 to i32
  %tmp30 = load i32* %arrayidx29, align 4
  %cmp31 = icmp eq i32 %conv26, %tmp30
  br i1 %cmp31, label %for.inc33, label %if.then

if.then:                                          ; preds = %for.body21
  tail call void @abort() noreturn nounwind
  unreachable

for.inc33:                                        ; preds = %for.body21
  %indvar.next = add i64 %indvar, 1
  br label %for.cond17

for.end36:                                        ; preds = %for.cond17
  ret i32 0
}

declare void @abort() noreturn nounwind
