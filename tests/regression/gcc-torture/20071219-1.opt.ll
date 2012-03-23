; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/20071219-1.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

%struct.S = type { [25 x i8] }

@p = common global %struct.S* null, align 8

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

define void @foo(%struct.S* %x, i32 %set) nounwind uwtable noinline {
entry:
  %tobool = icmp eq i32 %set, 0
  %conv11 = trunc i32 %set to i8
  br i1 %tobool, label %for.cond.us, label %for.cond

for.cond.us:                                      ; preds = %entry, %for.inc.us
  %indvar = phi i64 [ %indvar.next, %for.inc.us ], [ 0, %entry ]
  %storemerge.us = trunc i64 %indvar to i32
  %cmp.us = icmp ult i32 %storemerge.us, 25
  br i1 %cmp.us, label %for.body.us, label %for.end

for.inc.us:                                       ; preds = %for.body.us
  %indvar.next = add i64 %indvar, 1
  br label %for.cond.us

for.body.us:                                      ; preds = %for.cond.us
  %arrayidx.us = getelementptr %struct.S* %x, i64 0, i32 0, i64 %indvar
  %tmp4.us = load i8* %arrayidx.us, align 1
  %cmp6.us = icmp eq i8 %tmp4.us, 0
  br i1 %cmp6.us, label %for.inc.us, label %if.then

for.cond:                                         ; preds = %entry, %for.inc
  %indvar1 = phi i64 [ %indvar.next2, %for.inc ], [ 0, %entry ]
  %arrayidx = getelementptr %struct.S* %x, i64 0, i32 0, i64 %indvar1
  %storemerge = trunc i64 %indvar1 to i32
  %cmp = icmp ult i32 %storemerge, 25
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %tmp4 = load i8* %arrayidx, align 1
  %cmp6 = icmp eq i8 %tmp4, 0
  br i1 %cmp6, label %for.inc, label %if.then

if.then:                                          ; preds = %for.body, %for.body.us
  tail call void @abort() noreturn nounwind
  unreachable

for.inc:                                          ; preds = %for.body
  store i8 %conv11, i8* %arrayidx, align 1
  %indvar.next2 = add i64 %indvar1, 1
  br label %for.cond

for.end:                                          ; preds = %for.cond, %for.cond.us
  store %struct.S* %x, %struct.S** @p, align 8
  ret void
}

declare void @abort() noreturn nounwind

define void @test1() nounwind uwtable noinline {
entry:
  %a = alloca %struct.S, align 1
  %b = alloca %struct.S, align 1
  %0 = getelementptr inbounds %struct.S* %a, i64 0, i32 0, i64 0
  call void @llvm.memset.p0i8.i64(i8* %0, i8 0, i64 25, i32 1, i1 false)
  call void @foo(%struct.S* %a, i32 0)
  %tmp = getelementptr inbounds %struct.S* %b, i64 0, i32 0, i64 0
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %tmp, i8* %0, i64 25, i32 1, i1 false)
  call void @foo(%struct.S* %b, i32 1)
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %tmp, i8* %0, i64 25, i32 1, i1 false)
  call void @foo(%struct.S* %b, i32 0)
  ret void
}

declare void @llvm.memset.p0i8.i64(i8* nocapture, i8, i64, i32, i1) nounwind

declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture, i64, i32, i1) nounwind

define void @test2() nounwind uwtable noinline {
entry:
  %a = alloca %struct.S, align 1
  %b = alloca %struct.S, align 1
  %0 = getelementptr inbounds %struct.S* %a, i64 0, i32 0, i64 0
  call void @llvm.memset.p0i8.i64(i8* %0, i8 0, i64 25, i32 1, i1 false)
  call void @foo(%struct.S* %a, i32 0)
  %tmp = getelementptr inbounds %struct.S* %b, i64 0, i32 0, i64 0
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %tmp, i8* %0, i64 25, i32 1, i1 false)
  call void @foo(%struct.S* %b, i32 1)
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %tmp, i8* %0, i64 25, i32 1, i1 false)
  %tmp4 = load %struct.S** @p, align 8
  %tmp6 = getelementptr inbounds %struct.S* %tmp4, i64 0, i32 0, i64 0
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %tmp, i8* %tmp6, i64 25, i32 1, i1 false)
  call void @foo(%struct.S* %b, i32 0)
  ret void
}

define void @test3() nounwind uwtable noinline {
entry:
  %a = alloca %struct.S, align 1
  %b = alloca %struct.S, align 1
  %0 = getelementptr inbounds %struct.S* %a, i64 0, i32 0, i64 0
  call void @llvm.memset.p0i8.i64(i8* %0, i8 0, i64 25, i32 1, i1 false)
  call void @foo(%struct.S* %a, i32 0)
  %tmp = getelementptr inbounds %struct.S* %b, i64 0, i32 0, i64 0
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %tmp, i8* %0, i64 25, i32 1, i1 false)
  call void @foo(%struct.S* %b, i32 1)
  %tmp2 = load %struct.S** @p, align 8
  %tmp3 = getelementptr inbounds %struct.S* %tmp2, i64 0, i32 0, i64 0
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %tmp3, i8* %0, i64 25, i32 1, i1 false)
  %tmp5 = load %struct.S** @p, align 8
  %tmp6 = getelementptr inbounds %struct.S* %tmp5, i64 0, i32 0, i64 0
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %tmp6, i8* %tmp, i64 25, i32 1, i1 false)
  call void @foo(%struct.S* %b, i32 0)
  ret void
}

define i32 @main() nounwind uwtable {
entry:
  tail call void @test1()
  tail call void @test2()
  tail call void @test3()
  ret i32 0
}
