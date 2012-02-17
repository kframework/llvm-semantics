; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/20041126-1.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@main.a = internal unnamed_addr constant [10 x i32] [i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10], align 16

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

define void @check(i32* %p) nounwind uwtable {
entry:
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %0 = phi i64 [ %indvar.next4, %for.inc ], [ 0, %entry ]
  %storemerge = trunc i64 %0 to i32
  %cmp = icmp slt i32 %storemerge, 5
  br i1 %cmp, label %for.body, label %for.cond5.preheader

for.cond5.preheader:                              ; preds = %for.cond
  %tmp = add i64 %0, 1
  br label %for.cond5

for.body:                                         ; preds = %for.cond
  %arrayidx = getelementptr i32* %p, i64 %0
  %tmp3 = load i32* %arrayidx, align 4
  %tobool = icmp eq i32 %tmp3, 0
  br i1 %tobool, label %for.inc, label %if.then

if.then:                                          ; preds = %for.body
  tail call void @abort() noreturn nounwind
  unreachable

for.inc:                                          ; preds = %for.body
  %indvar.next4 = add i64 %0, 1
  br label %for.cond

for.cond5:                                        ; preds = %for.cond5.preheader, %for.body8
  %indvar = phi i64 [ 0, %for.cond5.preheader ], [ %indvar.next, %for.body8 ]
  %tmp7 = add i64 %0, %indvar
  %storemerge1 = trunc i64 %tmp7 to i32
  %cmp7 = icmp slt i32 %storemerge1, 10
  br i1 %cmp7, label %for.body8, label %for.end21

for.body8:                                        ; preds = %for.cond5
  %tmp5 = add i64 %tmp, %indvar
  %arrayidx12 = getelementptr i32* %p, i64 %tmp7
  %add = trunc i64 %tmp5 to i32
  %tmp13 = load i32* %arrayidx12, align 4
  %cmp15 = icmp eq i32 %tmp13, %add
  %indvar.next = add i64 %indvar, 1
  br i1 %cmp15, label %for.cond5, label %if.then16

if.then16:                                        ; preds = %for.body8
  tail call void @abort() noreturn nounwind
  unreachable

for.end21:                                        ; preds = %for.cond5
  ret void
}

declare void @abort() noreturn nounwind

define i32 @main() nounwind uwtable {
entry:
  %a = alloca [10 x i32], align 16
  %tmp = bitcast [10 x i32]* %a to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %tmp, i8* bitcast ([10 x i32]* @main.a to i8*), i64 40, i32 16, i1 false)
  %0 = bitcast [10 x i32]* %a to i8*
  call void @llvm.memset.p0i8.i64(i8* %0, i8 0, i64 20, i32 16, i1 false)
  br label %for.cond.i

for.cond.i:                                       ; preds = %entry, %for.inc.i
  %1 = phi i64 [ %indvar.next4.i, %for.inc.i ], [ 0, %entry ]
  %storemerge.i = trunc i64 %1 to i32
  %cmp.i = icmp slt i32 %storemerge.i, 5
  br i1 %cmp.i, label %for.body.i, label %for.cond5.preheader.i

for.cond5.preheader.i:                            ; preds = %for.cond.i
  %tmp.i = add i64 %1, 1
  br label %for.cond5.i

for.body.i:                                       ; preds = %for.cond.i
  %arrayidx.i = getelementptr [10 x i32]* %a, i64 0, i64 %1
  %tmp3.i = load i32* %arrayidx.i, align 4
  %tobool.i = icmp eq i32 %tmp3.i, 0
  br i1 %tobool.i, label %for.inc.i, label %if.then.i

if.then.i:                                        ; preds = %for.body.i
  call void @abort() noreturn nounwind
  unreachable

for.inc.i:                                        ; preds = %for.body.i
  %indvar.next4.i = add i64 %1, 1
  br label %for.cond.i

for.cond5.i:                                      ; preds = %for.body8.i, %for.cond5.preheader.i
  %indvar.i = phi i64 [ 0, %for.cond5.preheader.i ], [ %indvar.next.i, %for.body8.i ]
  %tmp5 = add i64 %1, %indvar.i
  %storemerge1.i = trunc i64 %tmp5 to i32
  %cmp7.i = icmp slt i32 %storemerge1.i, 10
  br i1 %cmp7.i, label %for.body8.i, label %check.exit

for.body8.i:                                      ; preds = %for.cond5.i
  %tmp3 = add i64 %tmp.i, %indvar.i
  %arrayidx12.i = getelementptr [10 x i32]* %a, i64 0, i64 %tmp5
  %add.i = trunc i64 %tmp3 to i32
  %tmp13.i = load i32* %arrayidx12.i, align 4
  %cmp15.i = icmp eq i32 %tmp13.i, %add.i
  %indvar.next.i = add i64 %indvar.i, 1
  br i1 %cmp15.i, label %for.cond5.i, label %if.then16.i

if.then16.i:                                      ; preds = %for.body8.i
  call void @abort() noreturn nounwind
  unreachable

check.exit:                                       ; preds = %for.cond5.i
  ret i32 0
}

declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture, i64, i32, i1) nounwind

declare void @llvm.memset.p0i8.i64(i8* nocapture, i8, i64, i32, i1) nounwind
