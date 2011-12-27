; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/loop-12.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@p = common global i8* null, align 8
@.str = private unnamed_addr constant [5 x i8] c"abc\0A\00", align 1

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

define void @foo() nounwind uwtable {
entry:
  %tmp.i.pre = load i8** @p, align 8
  br label %while.cond

while.cond:                                       ; preds = %while.body, %entry
  %tmp = phi i8* [ %incdec.ptr, %while.body ], [ %tmp.i.pre, %entry ]
  %tmp1.i = load i8* %tmp, align 1
  switch i8 %tmp1.i, label %while.body [
    i8 10, label %while.end
    i8 59, label %while.end
    i8 33, label %while.end
  ]

while.body:                                       ; preds = %while.cond
  %incdec.ptr = getelementptr inbounds i8* %tmp, i64 1
  store i8* %incdec.ptr, i8** @p, align 8
  br label %while.cond

while.end:                                        ; preds = %while.cond, %while.cond, %while.cond
  ret void
}

define i32 @main() nounwind uwtable {
entry:
  br label %while.cond.i

while.cond.i:                                     ; preds = %while.body.i, %entry
  %indvar = phi i64 [ %indvar.next, %while.body.i ], [ 0, %entry ]
  %storemerge = getelementptr [5 x i8]* @.str, i64 0, i64 %indvar
  store i8* %storemerge, i8** @p, align 8
  %tmp1.i.i = load i8* %storemerge, align 1
  switch i8 %tmp1.i.i, label %while.body.i [
    i8 10, label %foo.exit
    i8 59, label %foo.exit
    i8 33, label %foo.exit
  ]

while.body.i:                                     ; preds = %while.cond.i
  %indvar.next = add i64 %indvar, 1
  br label %while.cond.i

foo.exit:                                         ; preds = %while.cond.i, %while.cond.i, %while.cond.i
  ret i32 0
}
