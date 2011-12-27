; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/pr27260.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@buf = common global [65 x i8] zeroinitializer, align 16

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

define void @foo(i32 %x) nounwind uwtable {
entry:
  %cmp = icmp ne i32 %x, 2
  %0 = zext i1 %cmp to i8
  tail call void @llvm.memset.p0i8.i64(i8* getelementptr inbounds ([65 x i8]* @buf, i64 0, i64 0), i8 %0, i64 64, i32 16, i1 false)
  ret void
}

declare void @llvm.memset.p0i8.i64(i8* nocapture, i8, i64, i32, i1) nounwind

define i32 @main() nounwind uwtable {
entry:
  store i8 2, i8* getelementptr inbounds ([65 x i8]* @buf, i64 0, i64 64), align 16
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %indvar5 = phi i64 [ %indvar.next6, %for.inc ], [ 0, %entry ]
  %storemerge = trunc i64 %indvar5 to i32
  %cmp = icmp slt i32 %storemerge, 64
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %arrayidx = getelementptr [65 x i8]* @buf, i64 0, i64 %indvar5
  %tmp2 = load i8* %arrayidx, align 1
  %cmp3 = icmp eq i8 %tmp2, 0
  br i1 %cmp3, label %for.inc, label %if.then

if.then:                                          ; preds = %for.body
  tail call void @abort() noreturn nounwind
  unreachable

for.inc:                                          ; preds = %for.body
  %indvar.next6 = add i64 %indvar5, 1
  br label %for.cond

for.end:                                          ; preds = %for.cond
  tail call void @llvm.memset.p0i8.i64(i8* getelementptr inbounds ([65 x i8]* @buf, i64 0, i64 0), i8 1, i64 64, i32 16, i1 false) nounwind
  br label %for.cond6

for.cond6:                                        ; preds = %for.inc20, %for.end
  %indvar3 = phi i64 [ %indvar.next4, %for.inc20 ], [ 0, %for.end ]
  %storemerge1 = trunc i64 %indvar3 to i32
  %cmp8 = icmp slt i32 %storemerge1, 64
  br i1 %cmp8, label %for.body10, label %for.end23

for.body10:                                       ; preds = %for.cond6
  %arrayidx13 = getelementptr [65 x i8]* @buf, i64 0, i64 %indvar3
  %tmp14 = load i8* %arrayidx13, align 1
  %cmp16 = icmp eq i8 %tmp14, 1
  br i1 %cmp16, label %for.inc20, label %if.then18

if.then18:                                        ; preds = %for.body10
  tail call void @abort() noreturn nounwind
  unreachable

for.inc20:                                        ; preds = %for.body10
  %indvar.next4 = add i64 %indvar3, 1
  br label %for.cond6

for.end23:                                        ; preds = %for.cond6
  tail call void @llvm.memset.p0i8.i64(i8* getelementptr inbounds ([65 x i8]* @buf, i64 0, i64 0), i8 0, i64 64, i32 16, i1 false) nounwind
  br label %for.cond24

for.cond24:                                       ; preds = %for.inc38, %for.end23
  %indvar = phi i64 [ %indvar.next, %for.inc38 ], [ 0, %for.end23 ]
  %storemerge2 = trunc i64 %indvar to i32
  %cmp26 = icmp slt i32 %storemerge2, 64
  br i1 %cmp26, label %for.body28, label %if.end47

for.body28:                                       ; preds = %for.cond24
  %arrayidx31 = getelementptr [65 x i8]* @buf, i64 0, i64 %indvar
  %tmp32 = load i8* %arrayidx31, align 1
  %cmp34 = icmp eq i8 %tmp32, 0
  br i1 %cmp34, label %for.inc38, label %if.then36

if.then36:                                        ; preds = %for.body28
  tail call void @abort() noreturn nounwind
  unreachable

for.inc38:                                        ; preds = %for.body28
  %indvar.next = add i64 %indvar, 1
  br label %for.cond24

if.end47:                                         ; preds = %for.cond24
  ret i32 0
}

declare void @abort() noreturn nounwind
