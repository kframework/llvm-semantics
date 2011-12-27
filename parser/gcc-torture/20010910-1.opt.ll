; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/20010910-1.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

%struct.epic_private = type { %struct.epic_rx_desc*, [5 x i32] }
%struct.epic_rx_desc = type { i32 }

@check_rx_ring = internal unnamed_addr constant [5 x i32] [i32 12, i32 14, i32 16, i32 18, i32 10], align 16

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

define i32 @main() nounwind uwtable {
entry:
  %ep = alloca %struct.epic_private, align 8
  %rx_ring = alloca [5 x %struct.epic_rx_desc], align 16
  %rx_ring10 = bitcast [5 x %struct.epic_rx_desc]* %rx_ring to i8*
  call void @llvm.memset.p0i8.i64(i8* %rx_ring10, i8 0, i64 20, i32 16, i1 false)
  %arrayidx4 = getelementptr %struct.epic_private* %ep, i64 0, i32 1, i64 0
  %arrayidx4.1 = getelementptr %struct.epic_private* %ep, i64 0, i32 1, i64 1
  %arrayidx4.2 = getelementptr %struct.epic_private* %ep, i64 0, i32 1, i64 2
  %arrayidx4.3 = getelementptr %struct.epic_private* %ep, i64 0, i32 1, i64 3
  %arrayidx4.4 = getelementptr %struct.epic_private* %ep, i64 0, i32 1, i64 4
  %arraydecay = getelementptr inbounds [5 x %struct.epic_rx_desc]* %rx_ring, i64 0, i64 0
  %rx_ring6 = getelementptr inbounds %struct.epic_private* %ep, i64 0, i32 0
  store %struct.epic_rx_desc* %arraydecay, %struct.epic_rx_desc** %rx_ring6, align 8
  %next.i = getelementptr inbounds [5 x %struct.epic_rx_desc]* %rx_ring, i64 0, i64 0, i32 0
  store i32 12, i32* %next.i, align 16
  store i32 0, i32* %arrayidx4, align 8
  %next.1.i = getelementptr inbounds [5 x %struct.epic_rx_desc]* %rx_ring, i64 0, i64 1, i32 0
  store i32 14, i32* %next.1.i, align 4
  store i32 0, i32* %arrayidx4.1, align 4
  %next.2.i = getelementptr inbounds [5 x %struct.epic_rx_desc]* %rx_ring, i64 0, i64 2, i32 0
  store i32 16, i32* %next.2.i, align 8
  store i32 0, i32* %arrayidx4.2, align 8
  %next.3.i = getelementptr inbounds [5 x %struct.epic_rx_desc]* %rx_ring, i64 0, i64 3, i32 0
  store i32 18, i32* %next.3.i, align 4
  store i32 0, i32* %arrayidx4.3, align 4
  %next.4.i = getelementptr inbounds [5 x %struct.epic_rx_desc]* %rx_ring, i64 0, i64 4, i32 0
  store i32 0, i32* %arrayidx4.4, align 8
  store i32 10, i32* %next.4.i, align 16
  br label %for.cond7

for.cond7:                                        ; preds = %for.inc29, %entry
  %indvar = phi i64 [ %indvar.next, %for.inc29 ], [ 0, %entry ]
  %arrayidx24 = getelementptr %struct.epic_private* %ep, i64 0, i32 1, i64 %indvar
  %storemerge1 = trunc i64 %indvar to i32
  %cmp9 = icmp slt i32 %storemerge1, 5
  br i1 %cmp9, label %for.body10, label %for.end32

for.body10:                                       ; preds = %for.cond7
  %next14 = getelementptr [5 x %struct.epic_rx_desc]* %rx_ring, i64 0, i64 %indvar, i32 0
  %arrayidx18 = getelementptr [5 x i32]* @check_rx_ring, i64 0, i64 %indvar
  %tmp15 = load i32* %next14, align 4
  %tmp19 = load i32* %arrayidx18, align 4
  %cmp20 = icmp eq i32 %tmp15, %tmp19
  br i1 %cmp20, label %if.end, label %if.then

if.then:                                          ; preds = %for.body10
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %for.body10
  %tmp25 = load i32* %arrayidx24, align 4
  %cmp26 = icmp eq i32 %tmp25, 0
  br i1 %cmp26, label %for.inc29, label %if.then27

if.then27:                                        ; preds = %if.end
  call void @abort() noreturn nounwind
  unreachable

for.inc29:                                        ; preds = %if.end
  %indvar.next = add i64 %indvar, 1
  br label %for.cond7

for.end32:                                        ; preds = %for.cond7
  ret i32 0
}

declare void @abort() noreturn nounwind

declare void @llvm.memset.p0i8.i64(i8* nocapture, i8, i64, i32, i1) nounwind
