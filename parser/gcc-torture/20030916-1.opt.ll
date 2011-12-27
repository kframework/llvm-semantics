; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/20030916-1.ll'
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

define void @f(i32* %x) nounwind uwtable {
entry:
  %arrayidx = getelementptr inbounds i32* %x, i64 248
  %0 = bitcast i32* %x to i8*
  call void @llvm.memset.p0i8.i64(i8* %0, i8 0, i64 32, i32 4, i1 false)
  %1 = bitcast i32* %arrayidx to i8*
  call void @llvm.memset.p0i8.i64(i8* %1, i8 0, i64 32, i32 4, i1 false)
  ret void
}

define i32 @main() noreturn nounwind uwtable {
entry:
  %x = alloca [256 x i32], align 16
  br label %for.body

for.body:                                         ; preds = %for.body, %entry
  %indvar5 = phi i64 [ 0, %entry ], [ %indvar.next6, %for.body ]
  %arrayidx = getelementptr [256 x i32]* %x, i64 0, i64 %indvar5
  store i32 1, i32* %arrayidx, align 4
  %indvar.next6 = add i64 %indvar5, 1
  %exitcond = icmp eq i64 %indvar.next6, 256
  br i1 %exitcond, label %for.end, label %for.body

for.end:                                          ; preds = %for.body
  %arrayidx.i = getelementptr inbounds [256 x i32]* %x, i64 0, i64 248
  %0 = bitcast [256 x i32]* %x to i8*
  call void @llvm.memset.p0i8.i64(i8* %0, i8 0, i64 32, i32 16, i1 false) nounwind
  %1 = bitcast i32* %arrayidx.i to i8*
  call void @llvm.memset.p0i8.i64(i8* %1, i8 0, i64 32, i32 16, i1 false) nounwind
  br label %for.cond3

for.cond3:                                        ; preds = %for.inc16, %for.end
  %indvar = phi i64 [ %indvar.next, %for.inc16 ], [ 0, %for.end ]
  %storemerge1 = trunc i64 %indvar to i32
  %cmp5 = icmp slt i32 %storemerge1, 256
  br i1 %cmp5, label %for.body6, label %for.end19

for.body6:                                        ; preds = %for.cond3
  %tmp = add i64 %indvar, 4294967288
  %arrayidx9 = getelementptr [256 x i32]* %x, i64 0, i64 %indvar
  %storemerge1.off = trunc i64 %tmp to i32
  %tmp10 = load i32* %arrayidx9, align 4
  %2 = icmp ult i32 %storemerge1.off, 240
  %land.ext = zext i1 %2 to i32
  %cmp15 = icmp eq i32 %tmp10, %land.ext
  br i1 %cmp15, label %for.inc16, label %if.then

if.then:                                          ; preds = %for.body6
  call void @abort() noreturn nounwind
  unreachable

for.inc16:                                        ; preds = %for.body6
  %indvar.next = add i64 %indvar, 1
  br label %for.cond3

for.end19:                                        ; preds = %for.cond3
  call void @exit(i32 0) noreturn nounwind
  unreachable
}

declare void @abort() noreturn nounwind

declare void @exit(i32) noreturn nounwind

declare void @llvm.memset.p0i8.i64(i8* nocapture, i8, i64, i32, i1) nounwind
