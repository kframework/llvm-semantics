; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/20010518-2.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

%struct.a_struct = type <{ i16, i64, i16, i16, %struct.b_struct }>
%struct.b_struct = type <{ i8, i8, i8, i8, i8, i8 }>

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

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %a = alloca %struct.a_struct*, align 8
  %b = alloca %struct.a_struct, align 1
  %.compoundliteral = alloca %struct.a_struct, align 1
  store i32 0, i32* %retval
  store %struct.a_struct* %b, %struct.a_struct** %a, align 8
  %tmp = load %struct.a_struct** %a, align 8
  %a1 = getelementptr inbounds %struct.a_struct* %.compoundliteral, i32 0, i32 0
  store i16 1, i16* %a1, align 1
  %b2 = getelementptr inbounds %struct.a_struct* %.compoundliteral, i32 0, i32 1
  store i64 2, i64* %b2, align 1
  %c = getelementptr inbounds %struct.a_struct* %.compoundliteral, i32 0, i32 2
  store i16 3, i16* %c, align 1
  %d = getelementptr inbounds %struct.a_struct* %.compoundliteral, i32 0, i32 3
  store i16 4, i16* %d, align 1
  %e = getelementptr inbounds %struct.a_struct* %.compoundliteral, i32 0, i32 4
  %tmp3 = bitcast %struct.b_struct* %e to i8*
  call void @llvm.memset.p0i8.i64(i8* %tmp3, i8 0, i64 6, i32 1, i1 false)
  %tmp4 = bitcast %struct.a_struct* %tmp to i8*
  %tmp5 = bitcast %struct.a_struct* %.compoundliteral to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %tmp4, i8* %tmp5, i64 20, i32 1, i1 true)
  %tmp6 = load %struct.a_struct** %a, align 8
  %e7 = getelementptr inbounds %struct.a_struct* %tmp6, i32 0, i32 4
  %b4 = getelementptr inbounds %struct.b_struct* %e7, i32 0, i32 4
  volatile store i8 99, i8* %b4, align 1
  %tmp8 = load %struct.a_struct** %a, align 8
  %a9 = getelementptr inbounds %struct.a_struct* %tmp8, i32 0, i32 0
  %tmp10 = volatile load i16* %a9, align 1
  %conv = sext i16 %tmp10 to i32
  %cmp = icmp ne i32 %conv, 1
  br i1 %cmp, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %tmp12 = load %struct.a_struct** %a, align 8
  %b13 = getelementptr inbounds %struct.a_struct* %tmp12, i32 0, i32 1
  %tmp14 = volatile load i64* %b13, align 1
  %cmp15 = icmp ne i64 %tmp14, 2
  br i1 %cmp15, label %if.then, label %lor.lhs.false17

lor.lhs.false17:                                  ; preds = %lor.lhs.false
  %tmp18 = load %struct.a_struct** %a, align 8
  %c19 = getelementptr inbounds %struct.a_struct* %tmp18, i32 0, i32 2
  %tmp20 = volatile load i16* %c19, align 1
  %conv21 = sext i16 %tmp20 to i32
  %cmp22 = icmp ne i32 %conv21, 3
  br i1 %cmp22, label %if.then, label %lor.lhs.false24

lor.lhs.false24:                                  ; preds = %lor.lhs.false17
  %tmp25 = load %struct.a_struct** %a, align 8
  %d26 = getelementptr inbounds %struct.a_struct* %tmp25, i32 0, i32 3
  %tmp27 = volatile load i16* %d26, align 1
  %conv28 = sext i16 %tmp27 to i32
  %cmp29 = icmp ne i32 %conv28, 4
  br i1 %cmp29, label %if.then, label %lor.lhs.false31

lor.lhs.false31:                                  ; preds = %lor.lhs.false24
  %tmp32 = load %struct.a_struct** %a, align 8
  %e33 = getelementptr inbounds %struct.a_struct* %tmp32, i32 0, i32 4
  %b434 = getelementptr inbounds %struct.b_struct* %e33, i32 0, i32 4
  %tmp35 = volatile load i8* %b434, align 1
  %conv36 = sext i8 %tmp35 to i32
  %cmp37 = icmp ne i32 %conv36, 99
  br i1 %cmp37, label %if.then, label %if.end

if.then:                                          ; preds = %lor.lhs.false31, %lor.lhs.false24, %lor.lhs.false17, %lor.lhs.false, %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %lor.lhs.false31
  call void @exit(i32 0) noreturn nounwind
  unreachable

return:                                           ; No predecessors!
  %0 = load i32* %retval
  ret i32 %0
}

declare void @llvm.memset.p0i8.i64(i8* nocapture, i8, i64, i32, i1) nounwind

declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture, i64, i32, i1) nounwind

declare void @abort() noreturn nounwind

declare void @exit(i32) noreturn nounwind
