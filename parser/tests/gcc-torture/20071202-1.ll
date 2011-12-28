; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/20071202-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

%struct.S = type { i32, i32, [6 x i32], %struct.T }
%struct.T = type { i32, [8 x i32] }

@main.s = internal unnamed_addr constant %struct.S { i32 6, i32 12, [6 x i32] [i32 1, i32 2, i32 3, i32 4, i32 5, i32 6], %struct.T { i32 7, [8 x i32] [i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15] } }, align 4

define i32 @gnu_dev_major(i64 %__dev) nounwind uwtable inlinehint {
entry:
  %__dev.addr = alloca i64, align 8
  store i64 %__dev, i64* %__dev.addr, align 8
  %tmp = load i64* %__dev.addr, align 8
  %shr = lshr i64 %tmp, 8
  %and = and i64 %shr, 4095
  %tmp1 = load i64* %__dev.addr, align 8
  %shr2 = lshr i64 %tmp1, 32
  %conv = trunc i64 %shr2 to i32
  %and3 = and i32 %conv, -4096
  %conv4 = zext i32 %and3 to i64
  %or = or i64 %and, %conv4
  %conv5 = trunc i64 %or to i32
  ret i32 %conv5
}

define i32 @gnu_dev_minor(i64 %__dev) nounwind uwtable inlinehint {
entry:
  %__dev.addr = alloca i64, align 8
  store i64 %__dev, i64* %__dev.addr, align 8
  %tmp = load i64* %__dev.addr, align 8
  %and = and i64 %tmp, 255
  %tmp1 = load i64* %__dev.addr, align 8
  %shr = lshr i64 %tmp1, 12
  %conv = trunc i64 %shr to i32
  %and2 = and i32 %conv, -256
  %conv3 = zext i32 %and2 to i64
  %or = or i64 %and, %conv3
  %conv4 = trunc i64 %or to i32
  ret i32 %conv4
}

define i64 @gnu_dev_makedev(i32 %__major, i32 %__minor) nounwind uwtable inlinehint {
entry:
  %__major.addr = alloca i32, align 4
  %__minor.addr = alloca i32, align 4
  store i32 %__major, i32* %__major.addr, align 4
  store i32 %__minor, i32* %__minor.addr, align 4
  %tmp = load i32* %__minor.addr, align 4
  %and = and i32 %tmp, 255
  %tmp1 = load i32* %__major.addr, align 4
  %and2 = and i32 %tmp1, 4095
  %shl = shl i32 %and2, 8
  %or = or i32 %and, %shl
  %conv = zext i32 %or to i64
  %tmp3 = load i32* %__minor.addr, align 4
  %and4 = and i32 %tmp3, -256
  %conv5 = zext i32 %and4 to i64
  %shl6 = shl i64 %conv5, 12
  %or7 = or i64 %conv, %shl6
  %tmp8 = load i32* %__major.addr, align 4
  %and9 = and i32 %tmp8, -4096
  %conv10 = zext i32 %and9 to i64
  %shl11 = shl i64 %conv10, 32
  %or12 = or i64 %or7, %shl11
  ret i64 %or12
}

define void @foo(%struct.S* %s) nounwind uwtable noinline {
entry:
  %s.addr = alloca %struct.S*, align 8
  %.compoundliteral = alloca %struct.S, align 4
  store %struct.S* %s, %struct.S** %s.addr, align 8
  %tmp = load %struct.S** %s.addr, align 8
  %a = getelementptr inbounds %struct.S* %.compoundliteral, i32 0, i32 0
  %tmp1 = load %struct.S** %s.addr, align 8
  %b = getelementptr inbounds %struct.S* %tmp1, i32 0, i32 1
  %tmp2 = load i32* %b, align 4
  store i32 %tmp2, i32* %a, align 4
  %b3 = getelementptr inbounds %struct.S* %.compoundliteral, i32 0, i32 1
  %tmp4 = load %struct.S** %s.addr, align 8
  %a5 = getelementptr inbounds %struct.S* %tmp4, i32 0, i32 0
  %tmp6 = load i32* %a5, align 4
  store i32 %tmp6, i32* %b3, align 4
  %c = getelementptr inbounds %struct.S* %.compoundliteral, i32 0, i32 2
  %0 = bitcast [6 x i32]* %c to i8*
  call void @llvm.memset.p0i8.i64(i8* %0, i8 0, i64 24, i32 4, i1 false)
  %d = getelementptr inbounds %struct.S* %.compoundliteral, i32 0, i32 3
  %tmp7 = load %struct.S** %s.addr, align 8
  %d8 = getelementptr inbounds %struct.S* %tmp7, i32 0, i32 3
  %tmp9 = bitcast %struct.T* %d to i8*
  %tmp10 = bitcast %struct.T* %d8 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %tmp9, i8* %tmp10, i64 36, i32 4, i1 false)
  %tmp11 = bitcast %struct.S* %tmp to i8*
  %tmp12 = bitcast %struct.S* %.compoundliteral to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %tmp11, i8* %tmp12, i64 68, i32 4, i1 false)
  ret void
}

declare void @llvm.memset.p0i8.i64(i8* nocapture, i8, i64, i32, i1) nounwind

declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture, i64, i32, i1) nounwind

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %s = alloca %struct.S, align 4
  store i32 0, i32* %retval
  %tmp = bitcast %struct.S* %s to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %tmp, i8* bitcast (%struct.S* @main.s to i8*), i64 68, i32 4, i1 false)
  call void @foo(%struct.S* %s)
  %a = getelementptr inbounds %struct.S* %s, i32 0, i32 0
  %tmp1 = load i32* %a, align 4
  %cmp = icmp ne i32 %tmp1, 12
  br i1 %cmp, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %b = getelementptr inbounds %struct.S* %s, i32 0, i32 1
  %tmp2 = load i32* %b, align 4
  %cmp3 = icmp ne i32 %tmp2, 6
  br i1 %cmp3, label %if.then, label %lor.lhs.false4

lor.lhs.false4:                                   ; preds = %lor.lhs.false
  %c = getelementptr inbounds %struct.S* %s, i32 0, i32 2
  %arrayidx = getelementptr inbounds [6 x i32]* %c, i32 0, i64 0
  %tmp5 = load i32* %arrayidx, align 4
  %tobool = icmp ne i32 %tmp5, 0
  br i1 %tobool, label %if.then, label %lor.lhs.false6

lor.lhs.false6:                                   ; preds = %lor.lhs.false4
  %c7 = getelementptr inbounds %struct.S* %s, i32 0, i32 2
  %arrayidx8 = getelementptr inbounds [6 x i32]* %c7, i32 0, i64 1
  %tmp9 = load i32* %arrayidx8, align 4
  %tobool10 = icmp ne i32 %tmp9, 0
  br i1 %tobool10, label %if.then, label %lor.lhs.false11

lor.lhs.false11:                                  ; preds = %lor.lhs.false6
  %c12 = getelementptr inbounds %struct.S* %s, i32 0, i32 2
  %arrayidx13 = getelementptr inbounds [6 x i32]* %c12, i32 0, i64 2
  %tmp14 = load i32* %arrayidx13, align 4
  %tobool15 = icmp ne i32 %tmp14, 0
  br i1 %tobool15, label %if.then, label %lor.lhs.false16

lor.lhs.false16:                                  ; preds = %lor.lhs.false11
  %c17 = getelementptr inbounds %struct.S* %s, i32 0, i32 2
  %arrayidx18 = getelementptr inbounds [6 x i32]* %c17, i32 0, i64 3
  %tmp19 = load i32* %arrayidx18, align 4
  %tobool20 = icmp ne i32 %tmp19, 0
  br i1 %tobool20, label %if.then, label %lor.lhs.false21

lor.lhs.false21:                                  ; preds = %lor.lhs.false16
  %c22 = getelementptr inbounds %struct.S* %s, i32 0, i32 2
  %arrayidx23 = getelementptr inbounds [6 x i32]* %c22, i32 0, i64 4
  %tmp24 = load i32* %arrayidx23, align 4
  %tobool25 = icmp ne i32 %tmp24, 0
  br i1 %tobool25, label %if.then, label %lor.lhs.false26

lor.lhs.false26:                                  ; preds = %lor.lhs.false21
  %c27 = getelementptr inbounds %struct.S* %s, i32 0, i32 2
  %arrayidx28 = getelementptr inbounds [6 x i32]* %c27, i32 0, i64 5
  %tmp29 = load i32* %arrayidx28, align 4
  %tobool30 = icmp ne i32 %tmp29, 0
  br i1 %tobool30, label %if.then, label %if.end

if.then:                                          ; preds = %lor.lhs.false26, %lor.lhs.false21, %lor.lhs.false16, %lor.lhs.false11, %lor.lhs.false6, %lor.lhs.false4, %lor.lhs.false, %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %lor.lhs.false26
  %d = getelementptr inbounds %struct.S* %s, i32 0, i32 3
  %t = getelementptr inbounds %struct.T* %d, i32 0, i32 0
  %tmp31 = load i32* %t, align 4
  %cmp32 = icmp ne i32 %tmp31, 7
  br i1 %cmp32, label %if.then80, label %lor.lhs.false33

lor.lhs.false33:                                  ; preds = %if.end
  %d34 = getelementptr inbounds %struct.S* %s, i32 0, i32 3
  %r = getelementptr inbounds %struct.T* %d34, i32 0, i32 1
  %arrayidx35 = getelementptr inbounds [8 x i32]* %r, i32 0, i64 0
  %tmp36 = load i32* %arrayidx35, align 4
  %cmp37 = icmp ne i32 %tmp36, 8
  br i1 %cmp37, label %if.then80, label %lor.lhs.false38

lor.lhs.false38:                                  ; preds = %lor.lhs.false33
  %d39 = getelementptr inbounds %struct.S* %s, i32 0, i32 3
  %r40 = getelementptr inbounds %struct.T* %d39, i32 0, i32 1
  %arrayidx41 = getelementptr inbounds [8 x i32]* %r40, i32 0, i64 1
  %tmp42 = load i32* %arrayidx41, align 4
  %cmp43 = icmp ne i32 %tmp42, 9
  br i1 %cmp43, label %if.then80, label %lor.lhs.false44

lor.lhs.false44:                                  ; preds = %lor.lhs.false38
  %d45 = getelementptr inbounds %struct.S* %s, i32 0, i32 3
  %r46 = getelementptr inbounds %struct.T* %d45, i32 0, i32 1
  %arrayidx47 = getelementptr inbounds [8 x i32]* %r46, i32 0, i64 2
  %tmp48 = load i32* %arrayidx47, align 4
  %cmp49 = icmp ne i32 %tmp48, 10
  br i1 %cmp49, label %if.then80, label %lor.lhs.false50

lor.lhs.false50:                                  ; preds = %lor.lhs.false44
  %d51 = getelementptr inbounds %struct.S* %s, i32 0, i32 3
  %r52 = getelementptr inbounds %struct.T* %d51, i32 0, i32 1
  %arrayidx53 = getelementptr inbounds [8 x i32]* %r52, i32 0, i64 3
  %tmp54 = load i32* %arrayidx53, align 4
  %cmp55 = icmp ne i32 %tmp54, 11
  br i1 %cmp55, label %if.then80, label %lor.lhs.false56

lor.lhs.false56:                                  ; preds = %lor.lhs.false50
  %d57 = getelementptr inbounds %struct.S* %s, i32 0, i32 3
  %r58 = getelementptr inbounds %struct.T* %d57, i32 0, i32 1
  %arrayidx59 = getelementptr inbounds [8 x i32]* %r58, i32 0, i64 4
  %tmp60 = load i32* %arrayidx59, align 4
  %cmp61 = icmp ne i32 %tmp60, 12
  br i1 %cmp61, label %if.then80, label %lor.lhs.false62

lor.lhs.false62:                                  ; preds = %lor.lhs.false56
  %d63 = getelementptr inbounds %struct.S* %s, i32 0, i32 3
  %r64 = getelementptr inbounds %struct.T* %d63, i32 0, i32 1
  %arrayidx65 = getelementptr inbounds [8 x i32]* %r64, i32 0, i64 5
  %tmp66 = load i32* %arrayidx65, align 4
  %cmp67 = icmp ne i32 %tmp66, 13
  br i1 %cmp67, label %if.then80, label %lor.lhs.false68

lor.lhs.false68:                                  ; preds = %lor.lhs.false62
  %d69 = getelementptr inbounds %struct.S* %s, i32 0, i32 3
  %r70 = getelementptr inbounds %struct.T* %d69, i32 0, i32 1
  %arrayidx71 = getelementptr inbounds [8 x i32]* %r70, i32 0, i64 6
  %tmp72 = load i32* %arrayidx71, align 4
  %cmp73 = icmp ne i32 %tmp72, 14
  br i1 %cmp73, label %if.then80, label %lor.lhs.false74

lor.lhs.false74:                                  ; preds = %lor.lhs.false68
  %d75 = getelementptr inbounds %struct.S* %s, i32 0, i32 3
  %r76 = getelementptr inbounds %struct.T* %d75, i32 0, i32 1
  %arrayidx77 = getelementptr inbounds [8 x i32]* %r76, i32 0, i64 7
  %tmp78 = load i32* %arrayidx77, align 4
  %cmp79 = icmp ne i32 %tmp78, 15
  br i1 %cmp79, label %if.then80, label %if.end81

if.then80:                                        ; preds = %lor.lhs.false74, %lor.lhs.false68, %lor.lhs.false62, %lor.lhs.false56, %lor.lhs.false50, %lor.lhs.false44, %lor.lhs.false38, %lor.lhs.false33, %if.end
  call void @abort() noreturn nounwind
  unreachable

if.end81:                                         ; preds = %lor.lhs.false74
  ret i32 0
}

declare void @abort() noreturn nounwind
