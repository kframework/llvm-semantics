; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/pr42142.ll'
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

define i32 @sort(i32 %L) nounwind uwtable readnone noinline {
entry:
  %end = alloca i64, align 8
  %end2 = bitcast i64* %end to i8*
  store i64 42949672970, i64* %end, align 8
  br label %while.cond

while.cond:                                       ; preds = %if.then, %entry
  %indvar = phi i64 [ %indvar.next, %if.then ], [ 0, %entry ]
  %tmp161 = trunc i64 %indvar to i32
  %tmp = shl i64 %indvar, 2
  %tmp3 = add i64 %tmp, 4
  %uglygep = getelementptr i8* %end2, i64 %tmp3
  %arrayidx11 = bitcast i8* %uglygep to i32*
  %uglygep5 = getelementptr i8* %end2, i64 %tmp
  %arrayidx = bitcast i8* %uglygep5 to i32*
  %cmp = icmp slt i32 %tmp161, 2
  br i1 %cmp, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %tmp5 = load i32* %arrayidx, align 4
  %cmp8 = icmp sgt i32 %tmp5, %L
  br i1 %cmp8, label %if.then, label %while.end

if.then:                                          ; preds = %while.body
  store i32 1, i32* %arrayidx11, align 4
  store i32 10, i32* %arrayidx, align 4
  %indvar.next = add i64 %indvar, 1
  br label %while.cond

while.end:                                        ; preds = %while.body, %while.cond
  ret i32 %tmp161
}

define i32 @main() nounwind uwtable {
entry:
  %call = tail call i32 @sort(i32 5)
  %cmp = icmp eq i32 %call, 1
  br i1 %cmp, label %if.end, label %if.then

if.then:                                          ; preds = %entry
  tail call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  ret i32 0
}

declare void @abort() noreturn nounwind
