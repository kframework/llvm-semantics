; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/921013-1.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@main.a = internal unnamed_addr constant [4 x float] [float 5.000000e+00, float 1.000000e+00, float 3.000000e+00, float 5.000000e+00], align 16
@main.b = internal unnamed_addr constant [4 x float] [float 2.000000e+00, float 4.000000e+00, float 3.000000e+00, float 0.000000e+00], align 16

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

define void @f(i32* %d, float* %x, float* %y, i32 %n) nounwind uwtable {
entry:
  %tobool5 = icmp eq i32 %n, 0
  br i1 %tobool5, label %while.end, label %while.body.lr.ph

while.body.lr.ph:                                 ; preds = %entry
  %tmp = zext i32 %n to i64
  br label %while.body

while.body:                                       ; preds = %while.body.lr.ph, %while.body
  %indvar = phi i64 [ 0, %while.body.lr.ph ], [ %indvar.next, %while.body ]
  %incdec.ptr719 = getelementptr i32* %d, i64 %indvar
  %incdec.ptr28 = getelementptr float* %x, i64 %indvar
  %incdec.ptr437 = getelementptr float* %y, i64 %indvar
  %tmp2 = load float* %incdec.ptr28, align 4
  %tmp5 = load float* %incdec.ptr437, align 4
  %cmp = fcmp oeq float %tmp2, %tmp5
  %conv = zext i1 %cmp to i32
  store i32 %conv, i32* %incdec.ptr719, align 4
  %indvar.next = add i64 %indvar, 1
  %exitcond = icmp eq i64 %indvar.next, %tmp
  br i1 %exitcond, label %while.end, label %while.body

while.end:                                        ; preds = %while.body, %entry
  ret void
}

define i32 @main() noreturn nounwind uwtable {
entry:
  %r = alloca [4 x i32], align 16
  %incdec.ptr719.i = getelementptr [4 x i32]* %r, i64 0, i64 0
  store i32 0, i32* %incdec.ptr719.i, align 16
  %incdec.ptr719.i.1 = getelementptr [4 x i32]* %r, i64 0, i64 1
  store i32 0, i32* %incdec.ptr719.i.1, align 4
  %incdec.ptr719.i.2 = getelementptr [4 x i32]* %r, i64 0, i64 2
  store i32 1, i32* %incdec.ptr719.i.2, align 8
  %incdec.ptr719.i.3 = getelementptr [4 x i32]* %r, i64 0, i64 3
  store i32 0, i32* %incdec.ptr719.i.3, align 4
  br label %for.cond

for.cond:                                         ; preds = %entry, %for.inc
  %indvar = phi i64 [ 0, %entry ], [ %indvar.next, %for.inc ]
  %storemerge = trunc i64 %indvar to i32
  %cmp = icmp slt i32 %storemerge, 4
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %arrayidx = getelementptr [4 x float]* @main.a, i64 0, i64 %indvar
  %arrayidx11 = getelementptr [4 x float]* @main.b, i64 0, i64 %indvar
  %arrayidx16 = getelementptr [4 x i32]* %r, i64 0, i64 %indvar
  %tmp8 = load float* %arrayidx, align 4
  %tmp12 = load float* %arrayidx11, align 4
  %cmp13 = fcmp oeq float %tmp8, %tmp12
  %conv = zext i1 %cmp13 to i32
  %tmp17 = load i32* %arrayidx16, align 4
  %cmp18 = icmp eq i32 %conv, %tmp17
  br i1 %cmp18, label %for.inc, label %if.then

if.then:                                          ; preds = %for.body
  call void @abort() noreturn nounwind
  unreachable

for.inc:                                          ; preds = %for.body
  %indvar.next = add i64 %indvar, 1
  br label %for.cond

for.end:                                          ; preds = %for.cond
  call void @exit(i32 0) noreturn nounwind
  unreachable
}

declare void @abort() noreturn nounwind

declare void @exit(i32) noreturn nounwind
