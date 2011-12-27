; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/loop-2b.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@a = common global [2 x i32] zeroinitializer, align 4

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

define void @f(i32 %i) nounwind uwtable {
entry:
  %tmp = sext i32 %i to i64
  %tmp2 = zext i32 %i to i64
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %indvar = phi i64 [ %indvar.next, %for.inc ], [ 0, %entry ]
  %tmp3 = add i64 %tmp2, %indvar
  %storemerge = trunc i64 %tmp3 to i32
  %cmp = icmp eq i32 %storemerge, 2147483647
  br i1 %cmp, label %for.end, label %for.body

for.body:                                         ; preds = %for.cond
  %tmp1 = add i64 %tmp, %indvar
  %arrayidx = getelementptr [2 x i32]* @a, i64 0, i64 %tmp1
  store i32 -2, i32* %arrayidx, align 4
  %cmp5 = icmp eq i32 %storemerge, 1
  br i1 %cmp5, label %for.end, label %for.inc

for.inc:                                          ; preds = %for.body
  %indvar.next = add i64 %indvar, 1
  br label %for.cond

for.end:                                          ; preds = %for.body, %for.cond
  ret void
}

define i32 @main() noreturn nounwind uwtable {
entry:
  store i32 0, i32* getelementptr inbounds ([2 x i32]* @a, i64 0, i64 1), align 4
  store i32 0, i32* getelementptr inbounds ([2 x i32]* @a, i64 0, i64 0), align 4
  br label %for.body.i

for.body.i:                                       ; preds = %entry, %for.inc.i
  %indvar.i = phi i64 [ %indvar.next.i, %for.inc.i ], [ 0, %entry ]
  %storemerge.i = trunc i64 %indvar.i to i32
  %arrayidx.i = getelementptr [2 x i32]* @a, i64 0, i64 %indvar.i
  store i32 -2, i32* %arrayidx.i, align 4
  %cmp5.i = icmp eq i32 %storemerge.i, 1
  br i1 %cmp5.i, label %f.exit, label %for.inc.i

for.inc.i:                                        ; preds = %for.body.i
  %indvar.next.i = add i64 %indvar.i, 1
  br label %for.body.i

f.exit:                                           ; preds = %for.body.i
  %tmp = load i32* getelementptr inbounds ([2 x i32]* @a, i64 0, i64 0), align 4
  %cmp = icmp eq i32 %tmp, -2
  %tmp1 = load i32* getelementptr inbounds ([2 x i32]* @a, i64 0, i64 1), align 4
  %cmp2 = icmp eq i32 %tmp1, -2
  %or.cond = and i1 %cmp, %cmp2
  br i1 %or.cond, label %if.end, label %if.then

if.then:                                          ; preds = %f.exit
  tail call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %f.exit
  tail call void @exit(i32 0) noreturn nounwind
  unreachable
}

declare void @abort() noreturn nounwind

declare void @exit(i32) noreturn nounwind
