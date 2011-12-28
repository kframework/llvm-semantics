; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/pr33992.ll'
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

define void @bar(i64 %i) nounwind uwtable noinline {
entry:
  %tobool = icmp eq i64 %i, 0
  br i1 %tobool, label %if.end, label %if.then

if.then:                                          ; preds = %entry
  tail call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  ret void
}

declare void @abort() noreturn nounwind

define void @foo(i64* %r) nounwind uwtable alwaysinline {
entry:
  %tmp11 = load i64* %r, align 8
  %tobool3 = icmp sgt i64 %tmp11, -1
  br i1 %tobool3, label %for.inc, label %for.end

for.inc:                                          ; preds = %entry, %for.inc
  %storemerge4 = phi i32 [ %inc, %for.inc ], [ 0, %entry ]
  %sub = sub i32 62, %storemerge4
  %inc = add i32 %storemerge4, 1
  %sh_prom = zext i32 %sub to i64
  %shl = shl i64 1, %sh_prom
  %and = and i64 %shl, %tmp11
  %tobool = icmp eq i64 %and, 0
  br i1 %tobool, label %for.inc, label %for.cond.for.end_crit_edge

for.cond.for.end_crit_edge:                       ; preds = %for.inc
  %phitmp = sext i32 %inc to i64
  br label %for.end

for.end:                                          ; preds = %for.cond.for.end_crit_edge, %entry
  %storemerge.lcssa = phi i64 [ %phitmp, %for.cond.for.end_crit_edge ], [ 0, %entry ]
  tail call void @bar(i64 %storemerge.lcssa)
  ret void
}

define void @do_test(i64* %r) nounwind uwtable noinline {
entry:
  %r.addr.i = alloca i64*, align 8
  %i.i = alloca i32, align 4
  %0 = bitcast i64** %r.addr.i to i8*
  %1 = bitcast i32* %i.i to i8*
  call void @llvm.lifetime.start(i64 -1, i8* %0) nounwind
  call void @llvm.lifetime.start(i64 -1, i8* %1) nounwind
  store i64* %r, i64** %r.addr.i, align 8
  store i32 0, i32* %i.i, align 4
  %tmp1.i3 = load i64* %r, align 8
  %tobool.i5 = icmp sgt i64 %tmp1.i3, -1
  br i1 %tobool.i5, label %if.end.i, label %foo.exit

if.end.i:                                         ; preds = %entry, %if.end.i
  %storemerge16 = phi i32 [ %inc.i, %if.end.i ], [ 0, %entry ]
  %sub.i = sub i32 62, %storemerge16
  %inc.i = add i32 %storemerge16, 1
  %sh_prom.i = zext i32 %sub.i to i64
  %shl.i = shl i64 1, %sh_prom.i
  %and.i = and i64 %shl.i, %tmp1.i3
  %tobool.i = icmp eq i64 %and.i, 0
  br i1 %tobool.i, label %if.end.i, label %for.cond.i.foo.exit_crit_edge

for.cond.i.foo.exit_crit_edge:                    ; preds = %if.end.i
  store i32 %inc.i, i32* %i.i, align 4
  %phitmp = sext i32 %inc.i to i64
  br label %foo.exit

foo.exit:                                         ; preds = %for.cond.i.foo.exit_crit_edge, %entry
  %storemerge1.lcssa = phi i64 [ %phitmp, %for.cond.i.foo.exit_crit_edge ], [ 0, %entry ]
  call void @bar(i64 %storemerge1.lcssa) nounwind
  call void @llvm.lifetime.end(i64 -1, i8* %0) nounwind
  call void @llvm.lifetime.end(i64 -1, i8* %1) nounwind
  call void @llvm.lifetime.start(i64 -1, i8* %0) nounwind
  call void @llvm.lifetime.start(i64 -1, i8* %1) nounwind
  store i64* %r, i64** %r.addr.i, align 8
  store i32 0, i32* %i.i, align 4
  %tmp1.i3.1 = load i64* %r, align 8
  %tobool.i5.1 = icmp sgt i64 %tmp1.i3.1, -1
  br i1 %tobool.i5.1, label %if.end.i.1, label %foo.exit.1

foo.exit.1:                                       ; preds = %for.cond.i.foo.exit_crit_edge.1, %foo.exit
  %storemerge1.lcssa.1 = phi i64 [ %phitmp.1, %for.cond.i.foo.exit_crit_edge.1 ], [ 0, %foo.exit ]
  call void @bar(i64 %storemerge1.lcssa.1) nounwind
  call void @llvm.lifetime.end(i64 -1, i8* %0) nounwind
  call void @llvm.lifetime.end(i64 -1, i8* %1) nounwind
  ret void

if.end.i.1:                                       ; preds = %foo.exit, %if.end.i.1
  %storemerge16.1 = phi i32 [ %inc.i.1, %if.end.i.1 ], [ 0, %foo.exit ]
  %sub.i.1 = sub i32 62, %storemerge16.1
  %inc.i.1 = add i32 %storemerge16.1, 1
  %sh_prom.i.1 = zext i32 %sub.i.1 to i64
  %shl.i.1 = shl i64 1, %sh_prom.i.1
  %and.i.1 = and i64 %shl.i.1, %tmp1.i3.1
  %tobool.i.1 = icmp eq i64 %and.i.1, 0
  br i1 %tobool.i.1, label %if.end.i.1, label %for.cond.i.foo.exit_crit_edge.1

for.cond.i.foo.exit_crit_edge.1:                  ; preds = %if.end.i.1
  store i32 %inc.i.1, i32* %i.i, align 4
  %phitmp.1 = sext i32 %inc.i.1 to i64
  br label %foo.exit.1
}

define i32 @main() nounwind uwtable {
entry:
  %r = alloca i64, align 8
  store i64 -9223372036854775807, i64* %r, align 8
  call void @do_test(i64* %r)
  ret i32 0
}

declare void @llvm.lifetime.start(i64, i8* nocapture) nounwind

declare void @llvm.lifetime.end(i64, i8* nocapture) nounwind
