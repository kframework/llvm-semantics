; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/990127-1.ll'
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

define i32 @main() noreturn nounwind uwtable {
entry:
  %a = alloca i32, align 4
  %b = alloca i32, align 4
  store i32 10, i32* %a, align 4
  store i32 20, i32* %b, align 4
  br label %for.body

for.body:                                         ; preds = %while.end, %entry
  %storemerge10 = phi i32 [ 0, %entry ], [ %0, %while.end ]
  %b.a39 = phi i32* [ %a, %entry ], [ %b, %while.end ]
  %tmp2348 = phi i32 [ 0, %entry ], [ %inc13, %while.end ]
  %cmp2 = icmp eq i32* %b.a39, %a
  %b.a = select i1 %cmp2, i32* %b, i32* %a
  %tmp = add i32 %tmp2348, 1
  br label %while.cond

while.cond:                                       ; preds = %while.body, %for.body
  %indvar = phi i32 [ %indvar.next, %while.body ], [ 0, %for.body ]
  %b.a2 = phi i32* [ %b, %while.body ], [ %b.a, %for.body ]
  %tmp4 = load i32* %b.a2, align 4
  %dec = add nsw i32 %tmp4, -1
  store i32 %dec, i32* %b.a2, align 4
  %tobool = icmp eq i32 %tmp4, 0
  br i1 %tobool, label %while.end, label %while.body

while.body:                                       ; preds = %while.cond
  %cmp8 = icmp slt i32 %dec, 3
  %indvar.next = add i32 %indvar, 1
  br i1 %cmp8, label %while.end, label %while.cond

while.end:                                        ; preds = %while.body, %while.cond
  %tmp.pn = phi i32 [ %tmp, %while.body ], [ %tmp2348, %while.cond ]
  %tmp236 = add i32 %tmp.pn, %indvar
  %inc13 = add nsw i32 %tmp236, 1
  %0 = add nsw i32 %storemerge10, 1
  %exitcond = icmp eq i32 %0, 10
  br i1 %exitcond, label %for.end, label %for.body

for.end:                                          ; preds = %while.end
  %tmp17 = load i32* %b, align 4
  %1 = icmp eq i32 %tmp17, -5
  %cmp24 = icmp eq i32 %inc13, 43
  %or.cond7 = and i1 %1, %cmp24
  br i1 %or.cond7, label %if.end26, label %if.then25

if.then25:                                        ; preds = %for.end
  call void @abort() noreturn nounwind
  unreachable

if.end26:                                         ; preds = %for.end
  call void @exit(i32 0) noreturn nounwind
  unreachable
}

declare void @abort() noreturn nounwind

declare void @exit(i32) noreturn nounwind
