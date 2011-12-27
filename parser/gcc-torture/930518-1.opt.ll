; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/930518-1.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@bar = global i32 0, align 4

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

define void @f(i32* %p) nounwind uwtable {
entry:
  %tmp13 = load i32* @bar, align 4
  %cmp4 = icmp slt i32 %tmp13, 2
  br i1 %cmp4, label %while.body, label %while.end

while.body:                                       ; preds = %entry, %while.body
  %indvar = phi i64 [ %indvar.next, %while.body ], [ 0, %entry ]
  %tmp17 = phi i32 [ 1, %while.body ], [ %tmp13, %entry ]
  %sub25 = phi i32 [ %sub, %while.body ], [ 2, %entry ]
  %incdec.ptr16 = getelementptr i32* %p, i64 %indvar
  %sub = sub nsw i32 %sub25, %tmp17
  store i32 %sub, i32* %incdec.ptr16, align 4
  store i32 1, i32* @bar, align 4
  %cmp = icmp sgt i32 %sub, 1
  %indvar.next = add i64 %indvar, 1
  br i1 %cmp, label %while.body, label %while.end

while.end:                                        ; preds = %while.body, %entry
  ret void
}

define i32 @main() noreturn nounwind uwtable {
entry:
  %tab = alloca [2 x i32], align 4
  %arrayidx = getelementptr inbounds [2 x i32]* %tab, i64 0, i64 1
  store i32 0, i32* %arrayidx, align 4
  %arrayidx1 = getelementptr inbounds [2 x i32]* %tab, i64 0, i64 0
  store i32 0, i32* %arrayidx1, align 4
  %tmp13.i = load i32* @bar, align 4
  %cmp4.i = icmp slt i32 %tmp13.i, 2
  br i1 %cmp4.i, label %while.body.i, label %if.then

while.body.i:                                     ; preds = %entry, %while.body.i
  %indvar.i = phi i64 [ %indvar.next.i, %while.body.i ], [ 0, %entry ]
  %tmp17.i = phi i32 [ 1, %while.body.i ], [ %tmp13.i, %entry ]
  %sub25.i = phi i32 [ %sub.i, %while.body.i ], [ 2, %entry ]
  %incdec.ptr16.i = getelementptr [2 x i32]* %tab, i64 0, i64 %indvar.i
  %sub.i = sub nsw i32 %sub25.i, %tmp17.i
  store i32 %sub.i, i32* %incdec.ptr16.i, align 4
  %cmp.i = icmp sgt i32 %sub.i, 1
  %indvar.next.i = add i64 %indvar.i, 1
  br i1 %cmp.i, label %while.body.i, label %f.exit

f.exit:                                           ; preds = %while.body.i
  store i32 1, i32* @bar, align 4
  %tmp.pr = load i32* %arrayidx1, align 4
  %cmp = icmp eq i32 %tmp.pr, 2
  br i1 %cmp, label %lor.lhs.false, label %if.then

lor.lhs.false:                                    ; preds = %f.exit
  %tmp4 = load i32* %arrayidx, align 4
  %cmp5 = icmp eq i32 %tmp4, 1
  br i1 %cmp5, label %if.end, label %if.then

if.then:                                          ; preds = %entry, %lor.lhs.false, %f.exit
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %lor.lhs.false
  call void @exit(i32 0) noreturn nounwind
  unreachable
}

declare void @abort() noreturn nounwind

declare void @exit(i32) noreturn nounwind
