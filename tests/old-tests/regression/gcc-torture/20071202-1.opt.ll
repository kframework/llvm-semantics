; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/20071202-1.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

%struct.S = type { i32, i32, [6 x i32], %struct.T }
%struct.T = type { i32, [8 x i32] }

@main.s = internal unnamed_addr constant %struct.S { i32 6, i32 12, [6 x i32] [i32 1, i32 2, i32 3, i32 4, i32 5, i32 6], %struct.T { i32 7, [8 x i32] [i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15] } }, align 4

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

define void @foo(%struct.S* %s) nounwind uwtable noinline {
entry:
  %b = getelementptr inbounds %struct.S* %s, i64 0, i32 1
  %tmp2 = load i32* %b, align 4
  %a5 = getelementptr inbounds %struct.S* %s, i64 0, i32 0
  %tmp6 = load i32* %a5, align 4
  store i32 %tmp2, i32* %a5, align 4
  store i32 %tmp6, i32* %b, align 4
  %s.2.0 = getelementptr inbounds %struct.S* %s, i64 0, i32 2, i64 0
  %0 = bitcast i32* %s.2.0 to i8*
  call void @llvm.memset.p0i8.i64(i8* %0, i8 0, i64 24, i32 4, i1 false)
  ret void
}

declare void @llvm.memset.p0i8.i64(i8* nocapture, i8, i64, i32, i1) nounwind

declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture, i64, i32, i1) nounwind

define i32 @main() nounwind uwtable {
entry:
  %s = alloca %struct.S, align 4
  %tmp = bitcast %struct.S* %s to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %tmp, i8* bitcast (%struct.S* @main.s to i8*), i64 68, i32 4, i1 false)
  call void @foo(%struct.S* %s)
  %a = getelementptr inbounds %struct.S* %s, i64 0, i32 0
  %tmp1 = load i32* %a, align 4
  %cmp = icmp eq i32 %tmp1, 12
  br i1 %cmp, label %lor.lhs.false, label %if.then

lor.lhs.false:                                    ; preds = %entry
  %b = getelementptr inbounds %struct.S* %s, i64 0, i32 1
  %tmp2 = load i32* %b, align 4
  %cmp3 = icmp eq i32 %tmp2, 6
  br i1 %cmp3, label %lor.lhs.false4, label %if.then

lor.lhs.false4:                                   ; preds = %lor.lhs.false
  %arrayidx = getelementptr inbounds %struct.S* %s, i64 0, i32 2, i64 0
  %tmp5 = load i32* %arrayidx, align 4
  %tobool = icmp eq i32 %tmp5, 0
  br i1 %tobool, label %lor.lhs.false6, label %if.then

lor.lhs.false6:                                   ; preds = %lor.lhs.false4
  %arrayidx8 = getelementptr inbounds %struct.S* %s, i64 0, i32 2, i64 1
  %tmp9 = load i32* %arrayidx8, align 4
  %tobool10 = icmp eq i32 %tmp9, 0
  br i1 %tobool10, label %lor.lhs.false11, label %if.then

lor.lhs.false11:                                  ; preds = %lor.lhs.false6
  %arrayidx13 = getelementptr inbounds %struct.S* %s, i64 0, i32 2, i64 2
  %tmp14 = load i32* %arrayidx13, align 4
  %tobool15 = icmp eq i32 %tmp14, 0
  br i1 %tobool15, label %lor.lhs.false16, label %if.then

lor.lhs.false16:                                  ; preds = %lor.lhs.false11
  %arrayidx18 = getelementptr inbounds %struct.S* %s, i64 0, i32 2, i64 3
  %tmp19 = load i32* %arrayidx18, align 4
  %tobool20 = icmp eq i32 %tmp19, 0
  br i1 %tobool20, label %lor.lhs.false21, label %if.then

lor.lhs.false21:                                  ; preds = %lor.lhs.false16
  %arrayidx23 = getelementptr inbounds %struct.S* %s, i64 0, i32 2, i64 4
  %tmp24 = load i32* %arrayidx23, align 4
  %tobool25 = icmp eq i32 %tmp24, 0
  br i1 %tobool25, label %lor.lhs.false26, label %if.then

lor.lhs.false26:                                  ; preds = %lor.lhs.false21
  %arrayidx28 = getelementptr inbounds %struct.S* %s, i64 0, i32 2, i64 5
  %tmp29 = load i32* %arrayidx28, align 4
  %tobool30 = icmp eq i32 %tmp29, 0
  br i1 %tobool30, label %if.end, label %if.then

if.then:                                          ; preds = %lor.lhs.false26, %lor.lhs.false21, %lor.lhs.false16, %lor.lhs.false11, %lor.lhs.false6, %lor.lhs.false4, %lor.lhs.false, %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %lor.lhs.false26
  %t = getelementptr inbounds %struct.S* %s, i64 0, i32 3, i32 0
  %tmp31 = load i32* %t, align 4
  %cmp32 = icmp eq i32 %tmp31, 7
  br i1 %cmp32, label %lor.lhs.false33, label %if.then80

lor.lhs.false33:                                  ; preds = %if.end
  %arrayidx35 = getelementptr inbounds %struct.S* %s, i64 0, i32 3, i32 1, i64 0
  %tmp36 = load i32* %arrayidx35, align 4
  %cmp37 = icmp eq i32 %tmp36, 8
  br i1 %cmp37, label %lor.lhs.false38, label %if.then80

lor.lhs.false38:                                  ; preds = %lor.lhs.false33
  %arrayidx41 = getelementptr inbounds %struct.S* %s, i64 0, i32 3, i32 1, i64 1
  %tmp42 = load i32* %arrayidx41, align 4
  %cmp43 = icmp eq i32 %tmp42, 9
  br i1 %cmp43, label %lor.lhs.false44, label %if.then80

lor.lhs.false44:                                  ; preds = %lor.lhs.false38
  %arrayidx47 = getelementptr inbounds %struct.S* %s, i64 0, i32 3, i32 1, i64 2
  %tmp48 = load i32* %arrayidx47, align 4
  %cmp49 = icmp eq i32 %tmp48, 10
  br i1 %cmp49, label %lor.lhs.false50, label %if.then80

lor.lhs.false50:                                  ; preds = %lor.lhs.false44
  %arrayidx53 = getelementptr inbounds %struct.S* %s, i64 0, i32 3, i32 1, i64 3
  %tmp54 = load i32* %arrayidx53, align 4
  %cmp55 = icmp eq i32 %tmp54, 11
  br i1 %cmp55, label %lor.lhs.false56, label %if.then80

lor.lhs.false56:                                  ; preds = %lor.lhs.false50
  %arrayidx59 = getelementptr inbounds %struct.S* %s, i64 0, i32 3, i32 1, i64 4
  %tmp60 = load i32* %arrayidx59, align 4
  %cmp61 = icmp eq i32 %tmp60, 12
  br i1 %cmp61, label %lor.lhs.false62, label %if.then80

lor.lhs.false62:                                  ; preds = %lor.lhs.false56
  %arrayidx65 = getelementptr inbounds %struct.S* %s, i64 0, i32 3, i32 1, i64 5
  %tmp66 = load i32* %arrayidx65, align 4
  %cmp67 = icmp eq i32 %tmp66, 13
  br i1 %cmp67, label %lor.lhs.false68, label %if.then80

lor.lhs.false68:                                  ; preds = %lor.lhs.false62
  %arrayidx71 = getelementptr inbounds %struct.S* %s, i64 0, i32 3, i32 1, i64 6
  %tmp72 = load i32* %arrayidx71, align 4
  %cmp73 = icmp eq i32 %tmp72, 14
  br i1 %cmp73, label %lor.lhs.false74, label %if.then80

lor.lhs.false74:                                  ; preds = %lor.lhs.false68
  %arrayidx77 = getelementptr inbounds %struct.S* %s, i64 0, i32 3, i32 1, i64 7
  %tmp78 = load i32* %arrayidx77, align 4
  %cmp79 = icmp eq i32 %tmp78, 15
  br i1 %cmp79, label %if.end81, label %if.then80

if.then80:                                        ; preds = %lor.lhs.false74, %lor.lhs.false68, %lor.lhs.false62, %lor.lhs.false56, %lor.lhs.false50, %lor.lhs.false44, %lor.lhs.false38, %lor.lhs.false33, %if.end
  call void @abort() noreturn nounwind
  unreachable

if.end81:                                         ; preds = %lor.lhs.false74
  ret i32 0
}

declare void @abort() noreturn nounwind
