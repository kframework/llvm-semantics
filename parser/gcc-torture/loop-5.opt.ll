; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/loop-5.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@a = internal unnamed_addr global [4 x i32] zeroinitializer, align 16
@testit.ir = internal unnamed_addr constant [4 x i32] [i32 0, i32 1, i32 2, i32 3], align 16
@t = internal unnamed_addr global i32 0, align 4

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
  %t.promoted.i = load i32* @t, align 4
  %tmp.i = add i32 %t.promoted.i, -1
  %tmp6.i = icmp sgt i32 %t.promoted.i, 4
  %smax.i = select i1 %tmp6.i, i32 %t.promoted.i, i32 4
  %tmp7.i = sub i32 %tmp.i, %smax.i
  %tmp8.i = icmp ugt i32 %tmp7.i, -5
  %umax.i = select i1 %tmp8.i, i32 %tmp7.i, i32 -5
  %tmp9.i = sub i32 %tmp.i, %umax.i
  %tmp2 = zext i32 %t.promoted.i to i64
  %tmp8 = sext i32 %t.promoted.i to i64
  br label %for.cond.i

for.cond.i:                                       ; preds = %ap.exit.i, %entry
  %indvar.i = phi i64 [ %tmp6, %ap.exit.i ], [ 0, %entry ]
  %tmp112.i = phi i32 [ %.sub.i, %ap.exit.i ], [ 1, %entry ]
  %tmp6 = add i64 %indvar.i, 1
  %storemerge.i = trunc i64 %tmp6 to i32
  %tmp10 = add i64 %tmp8, %indvar.i
  %arrayidx.i.i = getelementptr [4 x i32]* @a, i64 0, i64 %tmp10
  %cmp.i = icmp slt i32 %storemerge.i, 5
  br i1 %cmp.i, label %for.body.i, label %testit.exit

for.body.i:                                       ; preds = %for.cond.i
  %tmp3 = add i64 %tmp2, %indvar.i
  %inc.i3.i = trunc i64 %tmp3 to i32
  %cmp.i.i = icmp sgt i32 %inc.i3.i, 3
  br i1 %cmp.i.i, label %if.then.i.i, label %ap.exit.i

if.then.i.i:                                      ; preds = %for.body.i
  store i32 %tmp9.i, i32* @t, align 4
  tail call void @abort() noreturn nounwind
  unreachable

ap.exit.i:                                        ; preds = %for.body.i
  %sub9.i = add nsw i32 %tmp112.i, -1
  %idxprom.i = sext i32 %sub9.i to i64
  %arrayidx.i = getelementptr inbounds [4 x i32]* @testit.ir, i64 0, i64 %idxprom.i
  %cmp6.i = icmp eq i32 %tmp112.i, 1
  %tmp10.i = load i32* %arrayidx.i, align 4
  %.sub.i = select i1 %cmp6.i, i32 4, i32 %sub9.i
  store i32 %tmp10.i, i32* %arrayidx.i.i, align 4
  br label %for.cond.i

testit.exit:                                      ; preds = %for.cond.i
  store i32 %tmp9.i, i32* @t, align 4
  %tmp = load i64* bitcast ([4 x i32]* @a to i64*), align 16
  %0 = trunc i64 %tmp to i32
  %cmp = icmp eq i32 %0, 0
  br i1 %cmp, label %if.end, label %if.then

if.then:                                          ; preds = %testit.exit
  tail call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %testit.exit
  %tmp11.mask = and i64 %tmp, -4294967296
  %cmp2 = icmp eq i64 %tmp11.mask, 12884901888
  br i1 %cmp2, label %if.end4, label %if.then3

if.then3:                                         ; preds = %if.end
  tail call void @abort() noreturn nounwind
  unreachable

if.end4:                                          ; preds = %if.end
  %tmp5 = load i64* bitcast (i32* getelementptr inbounds ([4 x i32]* @a, i64 0, i64 2) to i64*), align 8
  %1 = trunc i64 %tmp5 to i32
  %cmp6 = icmp eq i32 %1, 2
  br i1 %cmp6, label %if.end8, label %if.then7

if.then7:                                         ; preds = %if.end4
  tail call void @abort() noreturn nounwind
  unreachable

if.end8:                                          ; preds = %if.end4
  %tmp13.mask = and i64 %tmp5, -4294967296
  %cmp10 = icmp eq i64 %tmp13.mask, 4294967296
  br i1 %cmp10, label %if.end12, label %if.then11

if.then11:                                        ; preds = %if.end8
  tail call void @abort() noreturn nounwind
  unreachable

if.end12:                                         ; preds = %if.end8
  tail call void @exit(i32 0) noreturn nounwind
  unreachable
}

declare void @abort() noreturn nounwind

declare void @exit(i32) noreturn nounwind
