; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/pr27073.ll'
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

define void @foo(i32* %p, i32 %d1, i32 %d2, i32 %d3, i16 signext %count, i32 %s1, i32 %s2, i32 %s3, i32 %s4, i32 %s5) nounwind uwtable noinline {
entry:
  %tobool3 = icmp eq i16 %count, 0
  br i1 %tobool3, label %while.end, label %while.body.lr.ph

while.body.lr.ph:                                 ; preds = %entry
  %tmp = sext i16 %count to i64
  %tmp6 = add i64 %tmp, 4294967295
  %tmp7 = and i64 %tmp6, 4294967295
  %tmp8 = add i64 %tmp7, 1
  br label %while.body

while.body:                                       ; preds = %while.body.lr.ph, %while.body
  %indvar = phi i64 [ 0, %while.body.lr.ph ], [ %indvar.next, %while.body ]
  %tmp9 = mul i64 %indvar, 5
  %incdec.ptr1515 = getelementptr i32* %p, i64 %tmp9
  %tmp10 = add i64 %tmp9, 1
  %incdec.ptr = getelementptr i32* %p, i64 %tmp10
  %tmp11 = add i64 %tmp9, 2
  %incdec.ptr6 = getelementptr i32* %p, i64 %tmp11
  %tmp12 = add i64 %tmp9, 3
  %incdec.ptr9 = getelementptr i32* %p, i64 %tmp12
  %tmp13 = add i64 %tmp9, 4
  %incdec.ptr12 = getelementptr i32* %p, i64 %tmp13
  store i32 %s1, i32* %incdec.ptr1515, align 4
  store i32 %s2, i32* %incdec.ptr, align 4
  store i32 %s3, i32* %incdec.ptr6, align 4
  store i32 %s4, i32* %incdec.ptr9, align 4
  store i32 %s5, i32* %incdec.ptr12, align 4
  %indvar.next = add i64 %indvar, 1
  %exitcond = icmp eq i64 %indvar.next, %tmp8
  br i1 %exitcond, label %while.end, label %while.body

while.end:                                        ; preds = %while.body, %entry
  ret void
}

define i32 @main() noreturn nounwind uwtable {
entry:
  %x = alloca [10 x i32], align 16
  %arraydecay = getelementptr inbounds [10 x i32]* %x, i64 0, i64 0
  call void @foo(i32* %arraydecay, i32 0, i32 0, i32 0, i16 signext 2, i32 100, i32 200, i32 300, i32 400, i32 500)
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %indvar = phi i64 [ %indvar.next, %for.inc ], [ 0, %entry ]
  %storemerge = trunc i64 %indvar to i32
  %cmp = icmp slt i32 %storemerge, 10
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %arrayidx = getelementptr [10 x i32]* %x, i64 0, i64 %indvar
  %tmp2 = load i32* %arrayidx, align 4
  %rem = srem i32 %storemerge, 5
  %tmp = mul i32 %rem, 100
  %mul = add i32 %tmp, 100
  %cmp4 = icmp eq i32 %tmp2, %mul
  br i1 %cmp4, label %for.inc, label %if.then

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
