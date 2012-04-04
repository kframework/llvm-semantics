; ModuleID = '/home/grosu/celliso2/c-semantics/tests/unitTests/declarations.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

%struct.point = type { i32, i32 }
%struct.s1 = type { [2 x %struct.point], [2 x %struct.s3] }
%struct.s2 = type { %struct.s1, %struct.s1 }
%struct.s3 = type { [3 x %struct.point] }
%struct.s4 = type { i32, i32 }
%struct.str = type { [2 x i32 ()*], [2 x [2 x i32 ()*]] }
%struct.that = type { %struct.str }

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
  %retval1 = alloca i32, align 4
  %w = alloca i32, align 4
  %x = alloca i32*, align 8
  %y = alloca i32**, align 8
  %z = alloca i32, align 4
  %d1 = alloca [2 x i32], align 4
  %d2 = alloca [2 x [2 x i32]], align 16
  %d3 = alloca [2 x [2 x [2 x i32]]], align 16
  %funcpt = alloca i32 ()*, align 8
  %funcArr = alloca [2 x i32 ()*], align 16
  %funcArr2D = alloca [2 x [2 x i32 ()*]], align 16
  %funArrofArr = alloca [2 x i32* (i32*)*], align 16
  %mys1 = alloca %struct.s1, align 4
  %mys2 = alloca %struct.s2, align 4
  %t = alloca %struct.that, align 8
  store i32 0, i32* %retval
  store i32 0, i32* %retval1, align 4
  store i32* %w, i32** %x, align 8
  %tmp = load i32** %x, align 8
  store i32 5, i32* %tmp
  store i32** %x, i32*** %y, align 8
  %tmp4 = load i32*** %y, align 8
  %tmp5 = load i32** %tmp4
  %tmp6 = load i32* %tmp5
  store i32 %tmp6, i32* %z, align 4
  store i32 ()* @main, i32 ()** %funcpt, align 8
  %arrayidx = getelementptr inbounds [2 x i32]* %d1, i32 0, i64 0
  store i32 5, i32* %arrayidx, align 4
  %arrayidx14 = getelementptr inbounds [2 x [2 x i32]]* %d2, i32 0, i64 0
  %arrayidx15 = getelementptr inbounds [2 x i32]* %arrayidx14, i32 0, i64 0
  store i32 5, i32* %arrayidx15, align 4
  %arrayidx16 = getelementptr inbounds [2 x [2 x [2 x i32]]]* %d3, i32 0, i64 0
  %arrayidx17 = getelementptr inbounds [2 x [2 x i32]]* %arrayidx16, i32 0, i64 0
  %arrayidx18 = getelementptr inbounds [2 x i32]* %arrayidx17, i32 0, i64 0
  store i32 5, i32* %arrayidx18, align 4
  %arrayidx19 = getelementptr inbounds [2 x i32 ()*]* %funcArr, i32 0, i64 0
  store i32 ()* @main, i32 ()** %arrayidx19, align 8
  %arrayidx20 = getelementptr inbounds [2 x [2 x i32 ()*]]* %funcArr2D, i32 0, i64 0
  %arrayidx21 = getelementptr inbounds [2 x i32 ()*]* %arrayidx20, i32 0, i64 0
  store i32 ()* @main, i32 ()** %arrayidx21, align 8
  %arrayidx22 = getelementptr inbounds [2 x i32* (i32*)*]* %funArrofArr, i32 0, i64 0
  store i32* (i32*)* @f, i32* (i32*)** %arrayidx22, align 8
  %a = getelementptr inbounds %struct.s1* %mys1, i32 0, i32 0
  %arrayidx25 = getelementptr inbounds [2 x %struct.point]* %a, i32 0, i64 0
  %x26 = getelementptr inbounds %struct.point* %arrayidx25, i32 0, i32 0
  store i32 5, i32* %x26, align 4
  %a27 = getelementptr inbounds %struct.s1* %mys1, i32 0, i32 0
  %arrayidx28 = getelementptr inbounds [2 x %struct.point]* %a27, i32 0, i64 0
  %y29 = getelementptr inbounds %struct.point* %arrayidx28, i32 0, i32 1
  store i32 -5, i32* %y29, align 4
  %a30 = getelementptr inbounds %struct.s1* %mys1, i32 0, i32 0
  %arrayidx31 = getelementptr inbounds [2 x %struct.point]* %a30, i32 0, i64 1
  %x32 = getelementptr inbounds %struct.point* %arrayidx31, i32 0, i32 0
  store i32 10, i32* %x32, align 4
  %a33 = getelementptr inbounds %struct.s1* %mys1, i32 0, i32 0
  %arrayidx34 = getelementptr inbounds [2 x %struct.point]* %a33, i32 0, i64 1
  %y35 = getelementptr inbounds %struct.point* %arrayidx34, i32 0, i32 1
  store i32 -10, i32* %y35, align 4
  %a36 = getelementptr inbounds %struct.s2* %mys2, i32 0, i32 0
  %tmp37 = bitcast %struct.s1* %a36 to i8*
  %tmp38 = bitcast %struct.s1* %mys1 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %tmp37, i8* %tmp38, i64 64, i32 4, i1 false)
  %b = getelementptr inbounds %struct.s2* %mys2, i32 0, i32 1
  %tmp39 = bitcast %struct.s1* %b to i8*
  %tmp40 = bitcast %struct.s1* %mys1 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %tmp39, i8* %tmp40, i64 64, i32 4, i1 false)
  %a41 = getelementptr inbounds %struct.s1* %mys1, i32 0, i32 0
  %arrayidx42 = getelementptr inbounds [2 x %struct.point]* %a41, i32 0, i64 0
  %x43 = getelementptr inbounds %struct.point* %arrayidx42, i32 0, i32 0
  store i32 30, i32* %x43, align 4
  %a44 = getelementptr inbounds %struct.s1* %mys1, i32 0, i32 0
  %arrayidx45 = getelementptr inbounds [2 x %struct.point]* %a44, i32 0, i64 1
  %y46 = getelementptr inbounds %struct.point* %arrayidx45, i32 0, i32 1
  store i32 30, i32* %y46, align 4
  %a47 = getelementptr inbounds %struct.s2* %mys2, i32 0, i32 0
  %a48 = getelementptr inbounds %struct.s1* %a47, i32 0, i32 0
  %arrayidx49 = getelementptr inbounds [2 x %struct.point]* %a48, i32 0, i64 0
  %x50 = getelementptr inbounds %struct.point* %arrayidx49, i32 0, i32 0
  %tmp51 = load i32* %x50, align 4
  %a52 = getelementptr inbounds %struct.s2* %mys2, i32 0, i32 0
  %a53 = getelementptr inbounds %struct.s1* %a52, i32 0, i32 0
  %arrayidx54 = getelementptr inbounds [2 x %struct.point]* %a53, i32 0, i64 1
  %y55 = getelementptr inbounds %struct.point* %arrayidx54, i32 0, i32 1
  %tmp56 = load i32* %y55, align 4
  %add = add nsw i32 %tmp51, %tmp56
  %tmp57 = load i32* %retval1, align 4
  %add58 = add nsw i32 %tmp57, %add
  store i32 %add58, i32* %retval1, align 4
  %arrayidx60 = getelementptr inbounds [2 x i32 ()*]* %funcArr, i32 0, i64 0
  %tmp61 = load i32 ()** %arrayidx60, align 8
  %this = getelementptr inbounds %struct.that* %t, i32 0, i32 0
  %funcArr62 = getelementptr inbounds %struct.str* %this, i32 0, i32 0
  %arrayidx63 = getelementptr inbounds [2 x i32 ()*]* %funcArr62, i32 0, i64 0
  store i32 ()* %tmp61, i32 ()** %arrayidx63, align 8
  %tmp64 = load i32* %retval1, align 4
  ret i32 %tmp64
}

define i32* @f(i32* %x) nounwind uwtable {
entry:
  %x.addr = alloca i32*, align 8
  store i32* %x, i32** %x.addr, align 8
  ret i32* null
}

declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture, i64, i32, i1) nounwind
