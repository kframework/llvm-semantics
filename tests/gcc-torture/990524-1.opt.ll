; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/990524-1.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@a = global [6 x i8] c"12345\00", align 1
@b = global [6 x i8] c"12345\00", align 1

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

define void @loop(i8* %pz, i8* %pzDta) nounwind uwtable {
entry:
  br label %for.cond

for.cond:                                         ; preds = %for.cond, %sw.bb4, %entry
  %indvar = phi i64 [ 0, %entry ], [ %tmp, %sw.bb4 ], [ %tmp, %for.cond ]
  %tmp111 = phi i8* [ %pz, %entry ], [ %incdec.ptr10, %sw.bb4 ], [ %incdec.ptr3, %for.cond ]
  %tmp122 = getelementptr i8* %pzDta, i64 %indvar
  %tmp = add i64 %indvar, 1
  %tmp1 = load i8* %tmp122, align 1
  %incdec.ptr3 = getelementptr inbounds i8* %tmp111, i64 1
  store i8 %tmp1, i8* %tmp111, align 1
  %conv = sext i8 %tmp1 to i32
  switch i32 %conv, label %for.cond [
    i32 0, label %loopDone2
    i32 34, label %sw.bb4
    i32 92, label %sw.bb4
  ]

sw.bb4:                                           ; preds = %for.cond, %for.cond
  store i8 92, i8* %tmp111, align 1
  %tmp8 = load i8* %tmp122, align 1
  %incdec.ptr10 = getelementptr inbounds i8* %tmp111, i64 2
  store i8 %tmp8, i8* %incdec.ptr3, align 1
  br label %for.cond

loopDone2:                                        ; preds = %for.cond
  %incdec.ptr = getelementptr i8* %pzDta, i64 %tmp
  %sub.ptr.rhs.cast = ptrtoint i8* %incdec.ptr3 to i64
  %sub.ptr.sub = sub i64 ptrtoint ([6 x i8]* @a to i64), %sub.ptr.rhs.cast
  %sub.ptr.rhs.cast13 = ptrtoint i8* %incdec.ptr to i64
  %sub.ptr.sub14 = sub i64 ptrtoint ([6 x i8]* @b to i64), %sub.ptr.rhs.cast13
  %cmp = icmp eq i64 %sub.ptr.sub, %sub.ptr.sub14
  br i1 %cmp, label %if.end, label %if.then

if.then:                                          ; preds = %loopDone2
  tail call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %loopDone2
  ret void
}

declare void @abort() noreturn nounwind

define i32 @main() noreturn nounwind uwtable {
entry:
  br label %for.cond.i

for.cond.i:                                       ; preds = %sw.bb4.i, %for.cond.i, %entry
  %0 = phi i64 [ 0, %entry ], [ %tmp.i, %for.cond.i ], [ %tmp.i, %sw.bb4.i ]
  %tmp111.i = phi i8* [ getelementptr inbounds ([6 x i8]* @a, i64 0, i64 0), %entry ], [ %incdec.ptr3.i, %for.cond.i ], [ %incdec.ptr10.i, %sw.bb4.i ]
  %tmp122.i = getelementptr [6 x i8]* @b, i64 0, i64 %0
  %tmp.i = add i64 %0, 1
  %tmp1.i = load i8* %tmp122.i, align 1
  %incdec.ptr3.i = getelementptr inbounds i8* %tmp111.i, i64 1
  store i8 %tmp1.i, i8* %tmp111.i, align 1
  %conv.i = sext i8 %tmp1.i to i32
  switch i32 %conv.i, label %for.cond.i [
    i32 0, label %loopDone2.i
    i32 34, label %sw.bb4.i
    i32 92, label %sw.bb4.i
  ]

sw.bb4.i:                                         ; preds = %for.cond.i, %for.cond.i
  store i8 92, i8* %tmp111.i, align 1
  %tmp8.i = load i8* %tmp122.i, align 1
  %incdec.ptr10.i = getelementptr inbounds i8* %tmp111.i, i64 2
  store i8 %tmp8.i, i8* %incdec.ptr3.i, align 1
  br label %for.cond.i

loopDone2.i:                                      ; preds = %for.cond.i
  %sub.ptr.rhs.cast.i = ptrtoint i8* %incdec.ptr3.i to i64
  %sub.ptr.sub.i = sub i64 ptrtoint ([6 x i8]* @a to i64), %sub.ptr.rhs.cast.i
  %diff.neg = xor i64 %0, -1
  %cmp.i = icmp eq i64 %sub.ptr.sub.i, %diff.neg
  br i1 %cmp.i, label %loop.exit, label %if.then.i

if.then.i:                                        ; preds = %loopDone2.i
  tail call void @abort() noreturn nounwind
  unreachable

loop.exit:                                        ; preds = %loopDone2.i
  tail call void @exit(i32 0) noreturn nounwind
  unreachable
}

declare void @exit(i32) noreturn nounwind
