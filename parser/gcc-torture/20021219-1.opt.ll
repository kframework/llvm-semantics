; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/20021219-1.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@main.str = internal unnamed_addr constant [11 x i8] c"foo { xx }\00", align 1

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

define void @foo(i8* nocapture %p1, i8** nocapture %p2) nounwind uwtable readnone {
entry:
  ret void
}

define i32 @main() nounwind uwtable readonly {
entry:
  %str = alloca [11 x i8], align 1
  %tmp = getelementptr inbounds [11 x i8]* %str, i64 0, i64 0
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %tmp, i8* getelementptr inbounds ([11 x i8]* @main.str, i64 0, i64 0), i64 11, i32 1, i1 false)
  br label %while.cond

while.cond:                                       ; preds = %while.body, %entry
  %indvar = phi i64 [ %indvar.next, %while.body ], [ 0, %entry ]
  %tmp2 = add i64 %indvar, 5
  %incdec.ptr1 = getelementptr [11 x i8]* %str, i64 0, i64 %tmp2
  %tmp4 = load i8* %incdec.ptr1, align 1
  switch i8 %tmp4, label %while.end [
    i8 32, label %while.body
    i8 13, label %while.body
  ]

while.body:                                       ; preds = %while.cond, %while.cond
  %indvar.next = add i64 %indvar, 1
  br label %while.cond

while.end:                                        ; preds = %while.cond
  ret i32 0
}

declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture, i64, i32, i1) nounwind
