; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/20040703-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

%0 = type { i64, i64 }
%struct.cpp_num = type { i32, i32, i32, i32 }

@precision = global i32 64, align 4
@n = global i32 16, align 4
@num = global %struct.cpp_num { i32 0, i32 3, i32 0, i32 0 }, align 4

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

define %0 @num_lshift(i64 %num.coerce0, i64 %num.coerce1, i32 %precision, i32 %n) nounwind uwtable {
entry:
  %retval = alloca %struct.cpp_num, align 4
  %num = alloca %struct.cpp_num, align 8
  %precision.addr = alloca i32, align 4
  %n.addr = alloca i32, align 4
  %orig = alloca %struct.cpp_num, align 4
  %m = alloca i32, align 4
  %maybe_orig = alloca %struct.cpp_num, align 4
  %0 = bitcast %struct.cpp_num* %num to %0*
  %1 = getelementptr %0* %0, i32 0, i32 0
  store i64 %num.coerce0, i64* %1
  %2 = getelementptr %0* %0, i32 0, i32 1
  store i64 %num.coerce1, i64* %2
  store i32 %precision, i32* %precision.addr, align 4
  store i32 %n, i32* %n.addr, align 4
  %tmp = load i32* %n.addr, align 4
  %tmp1 = load i32* %precision.addr, align 4
  %cmp = icmp uge i32 %tmp, %tmp1
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  %unsignedp = getelementptr inbounds %struct.cpp_num* %num, i32 0, i32 2
  %tmp2 = load i32* %unsignedp, align 4
  %tobool = icmp ne i32 %tmp2, 0
  br i1 %tobool, label %land.end, label %land.rhs

land.rhs:                                         ; preds = %if.then
  %low = getelementptr inbounds %struct.cpp_num* %num, i32 0, i32 1
  %tmp3 = load i32* %low, align 4
  %high = getelementptr inbounds %struct.cpp_num* %num, i32 0, i32 0
  %tmp4 = load i32* %high, align 4
  %or = or i32 %tmp3, %tmp4
  %cmp5 = icmp eq i32 %or, 0
  %lnot = xor i1 %cmp5, true
  br label %land.end

land.end:                                         ; preds = %land.rhs, %if.then
  %3 = phi i1 [ false, %if.then ], [ %lnot, %land.rhs ]
  %land.ext = zext i1 %3 to i32
  %overflow = getelementptr inbounds %struct.cpp_num* %num, i32 0, i32 3
  store i32 %land.ext, i32* %overflow, align 4
  %low6 = getelementptr inbounds %struct.cpp_num* %num, i32 0, i32 1
  store i32 0, i32* %low6, align 4
  %high7 = getelementptr inbounds %struct.cpp_num* %num, i32 0, i32 0
  store i32 0, i32* %high7, align 4
  br label %if.end71

if.else:                                          ; preds = %entry
  %tmp10 = load i32* %n.addr, align 4
  store i32 %tmp10, i32* %m, align 4
  %tmp11 = bitcast %struct.cpp_num* %orig to i8*
  %tmp12 = bitcast %struct.cpp_num* %num to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %tmp11, i8* %tmp12, i64 16, i32 4, i1 false)
  %tmp13 = load i32* %m, align 4
  %conv = zext i32 %tmp13 to i64
  %cmp14 = icmp uge i64 %conv, 32
  br i1 %cmp14, label %if.then16, label %if.end

if.then16:                                        ; preds = %if.else
  %tmp17 = load i32* %m, align 4
  %conv18 = zext i32 %tmp17 to i64
  %sub = sub i64 %conv18, 32
  %conv19 = trunc i64 %sub to i32
  store i32 %conv19, i32* %m, align 4
  %low20 = getelementptr inbounds %struct.cpp_num* %num, i32 0, i32 1
  %tmp21 = load i32* %low20, align 4
  %high22 = getelementptr inbounds %struct.cpp_num* %num, i32 0, i32 0
  store i32 %tmp21, i32* %high22, align 4
  %low23 = getelementptr inbounds %struct.cpp_num* %num, i32 0, i32 1
  store i32 0, i32* %low23, align 4
  br label %if.end

if.end:                                           ; preds = %if.then16, %if.else
  %tmp24 = load i32* %m, align 4
  %tobool25 = icmp ne i32 %tmp24, 0
  br i1 %tobool25, label %if.then26, label %if.end41

if.then26:                                        ; preds = %if.end
  %high27 = getelementptr inbounds %struct.cpp_num* %num, i32 0, i32 0
  %tmp28 = load i32* %high27, align 4
  %tmp29 = load i32* %m, align 4
  %shl = shl i32 %tmp28, %tmp29
  %low30 = getelementptr inbounds %struct.cpp_num* %num, i32 0, i32 1
  %tmp31 = load i32* %low30, align 4
  %tmp32 = load i32* %m, align 4
  %conv33 = zext i32 %tmp32 to i64
  %sub34 = sub i64 32, %conv33
  %sh_prom = trunc i64 %sub34 to i32
  %shr = lshr i32 %tmp31, %sh_prom
  %or35 = or i32 %shl, %shr
  %high36 = getelementptr inbounds %struct.cpp_num* %num, i32 0, i32 0
  store i32 %or35, i32* %high36, align 4
  %tmp37 = load i32* %m, align 4
  %low38 = getelementptr inbounds %struct.cpp_num* %num, i32 0, i32 1
  %tmp39 = load i32* %low38, align 4
  %shl40 = shl i32 %tmp39, %tmp37
  store i32 %shl40, i32* %low38, align 4
  br label %if.end41

if.end41:                                         ; preds = %if.then26, %if.end
  %tmp42 = load i32* %precision.addr, align 4
  %4 = bitcast %struct.cpp_num* %num to %0*
  %5 = getelementptr %0* %4, i32 0, i32 0
  %6 = load i64* %5, align 1
  %7 = getelementptr %0* %4, i32 0, i32 1
  %8 = load i64* %7, align 1
  %call = call %0 @num_trim(i64 %6, i64 %8, i32 %tmp42)
  %9 = bitcast %struct.cpp_num* %num to %0*
  %10 = getelementptr %0* %9, i32 0, i32 0
  %11 = extractvalue %0 %call, 0
  store i64 %11, i64* %10, align 1
  %12 = getelementptr %0* %9, i32 0, i32 1
  %13 = extractvalue %0 %call, 1
  store i64 %13, i64* %12, align 1
  %unsignedp43 = getelementptr inbounds %struct.cpp_num* %num, i32 0, i32 2
  %tmp44 = load i32* %unsignedp43, align 4
  %tobool45 = icmp ne i32 %tmp44, 0
  br i1 %tobool45, label %if.then46, label %if.else48

if.then46:                                        ; preds = %if.end41
  %overflow47 = getelementptr inbounds %struct.cpp_num* %num, i32 0, i32 3
  store i32 0, i32* %overflow47, align 4
  br label %if.end70

if.else48:                                        ; preds = %if.end41
  %tmp50 = load i32* %precision.addr, align 4
  %tmp51 = load i32* %n.addr, align 4
  %14 = bitcast %struct.cpp_num* %num to %0*
  %15 = getelementptr %0* %14, i32 0, i32 0
  %16 = load i64* %15, align 1
  %17 = getelementptr %0* %14, i32 0, i32 1
  %18 = load i64* %17, align 1
  %call52 = call %0 @num_rshift(i64 %16, i64 %18, i32 %tmp50, i32 %tmp51)
  %19 = bitcast %struct.cpp_num* %maybe_orig to %0*
  %20 = getelementptr %0* %19, i32 0, i32 0
  %21 = extractvalue %0 %call52, 0
  store i64 %21, i64* %20, align 1
  %22 = getelementptr %0* %19, i32 0, i32 1
  %23 = extractvalue %0 %call52, 1
  store i64 %23, i64* %22, align 1
  %low53 = getelementptr inbounds %struct.cpp_num* %orig, i32 0, i32 1
  %tmp54 = load i32* %low53, align 4
  %low55 = getelementptr inbounds %struct.cpp_num* %maybe_orig, i32 0, i32 1
  %tmp56 = load i32* %low55, align 4
  %cmp57 = icmp eq i32 %tmp54, %tmp56
  br i1 %cmp57, label %land.rhs59, label %land.end66

land.rhs59:                                       ; preds = %if.else48
  %high60 = getelementptr inbounds %struct.cpp_num* %orig, i32 0, i32 0
  %tmp61 = load i32* %high60, align 4
  %high62 = getelementptr inbounds %struct.cpp_num* %maybe_orig, i32 0, i32 0
  %tmp63 = load i32* %high62, align 4
  %cmp64 = icmp eq i32 %tmp61, %tmp63
  br label %land.end66

land.end66:                                       ; preds = %land.rhs59, %if.else48
  %24 = phi i1 [ false, %if.else48 ], [ %cmp64, %land.rhs59 ]
  %lnot68 = xor i1 %24, true
  %lnot.ext = zext i1 %lnot68 to i32
  %overflow69 = getelementptr inbounds %struct.cpp_num* %num, i32 0, i32 3
  store i32 %lnot.ext, i32* %overflow69, align 4
  br label %if.end70

if.end70:                                         ; preds = %land.end66, %if.then46
  br label %if.end71

if.end71:                                         ; preds = %if.end70, %land.end
  %tmp72 = bitcast %struct.cpp_num* %retval to i8*
  %tmp73 = bitcast %struct.cpp_num* %num to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %tmp72, i8* %tmp73, i64 16, i32 4, i1 false)
  %25 = bitcast %struct.cpp_num* %retval to %0*
  %26 = load %0* %25, align 1
  ret %0 %26
}

declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture, i64, i32, i1) nounwind

define internal %0 @num_trim(i64 %num.coerce0, i64 %num.coerce1, i32 %precision) nounwind uwtable {
entry:
  %retval = alloca %struct.cpp_num, align 4
  %num = alloca %struct.cpp_num, align 8
  %precision.addr = alloca i32, align 4
  %0 = bitcast %struct.cpp_num* %num to %0*
  %1 = getelementptr %0* %0, i32 0, i32 0
  store i64 %num.coerce0, i64* %1
  %2 = getelementptr %0* %0, i32 0, i32 1
  store i64 %num.coerce1, i64* %2
  store i32 %precision, i32* %precision.addr, align 4
  %tmp = load i32* %precision.addr, align 4
  %conv = zext i32 %tmp to i64
  %cmp = icmp ugt i64 %conv, 32
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  %tmp2 = load i32* %precision.addr, align 4
  %conv3 = zext i32 %tmp2 to i64
  %sub = sub i64 %conv3, 32
  %conv4 = trunc i64 %sub to i32
  store i32 %conv4, i32* %precision.addr, align 4
  %tmp5 = load i32* %precision.addr, align 4
  %conv6 = zext i32 %tmp5 to i64
  %cmp7 = icmp ult i64 %conv6, 32
  br i1 %cmp7, label %if.then9, label %if.end

if.then9:                                         ; preds = %if.then
  %tmp10 = load i32* %precision.addr, align 4
  %shl = shl i32 1, %tmp10
  %sub11 = sub i32 %shl, 1
  %high = getelementptr inbounds %struct.cpp_num* %num, i32 0, i32 0
  %tmp12 = load i32* %high, align 4
  %and = and i32 %tmp12, %sub11
  store i32 %and, i32* %high, align 4
  br label %if.end

if.end:                                           ; preds = %if.then9, %if.then
  br label %if.end25

if.else:                                          ; preds = %entry
  %tmp13 = load i32* %precision.addr, align 4
  %conv14 = zext i32 %tmp13 to i64
  %cmp15 = icmp ult i64 %conv14, 32
  br i1 %cmp15, label %if.then17, label %if.end23

if.then17:                                        ; preds = %if.else
  %tmp18 = load i32* %precision.addr, align 4
  %shl19 = shl i32 1, %tmp18
  %sub20 = sub i32 %shl19, 1
  %low = getelementptr inbounds %struct.cpp_num* %num, i32 0, i32 1
  %tmp21 = load i32* %low, align 4
  %and22 = and i32 %tmp21, %sub20
  store i32 %and22, i32* %low, align 4
  br label %if.end23

if.end23:                                         ; preds = %if.then17, %if.else
  %high24 = getelementptr inbounds %struct.cpp_num* %num, i32 0, i32 0
  store i32 0, i32* %high24, align 4
  br label %if.end25

if.end25:                                         ; preds = %if.end23, %if.end
  %tmp26 = bitcast %struct.cpp_num* %retval to i8*
  %tmp27 = bitcast %struct.cpp_num* %num to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %tmp26, i8* %tmp27, i64 16, i32 4, i1 false)
  %3 = bitcast %struct.cpp_num* %retval to %0*
  %4 = load %0* %3, align 1
  ret %0 %4
}

define internal %0 @num_rshift(i64 %num.coerce0, i64 %num.coerce1, i32 %precision, i32 %n) nounwind uwtable {
entry:
  %retval = alloca %struct.cpp_num, align 4
  %num = alloca %struct.cpp_num, align 8
  %precision.addr = alloca i32, align 4
  %n.addr = alloca i32, align 4
  %sign_mask = alloca i32, align 4
  %x = alloca i32, align 4
  %0 = bitcast %struct.cpp_num* %num to %0*
  %1 = getelementptr %0* %0, i32 0, i32 0
  store i64 %num.coerce0, i64* %1
  %2 = getelementptr %0* %0, i32 0, i32 1
  store i64 %num.coerce1, i64* %2
  store i32 %precision, i32* %precision.addr, align 4
  store i32 %n, i32* %n.addr, align 4
  %tmp = load i32* %precision.addr, align 4
  %3 = bitcast %struct.cpp_num* %num to %0*
  %4 = getelementptr %0* %3, i32 0, i32 0
  %5 = load i64* %4, align 1
  %6 = getelementptr %0* %3, i32 0, i32 1
  %7 = load i64* %6, align 1
  %call = call i32 @num_positive(i64 %5, i64 %7, i32 %tmp)
  store i32 %call, i32* %x, align 4
  %unsignedp = getelementptr inbounds %struct.cpp_num* %num, i32 0, i32 2
  %tmp1 = load i32* %unsignedp, align 4
  %tobool = icmp ne i32 %tmp1, 0
  br i1 %tobool, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %tmp2 = load i32* %x, align 4
  %tobool3 = icmp ne i32 %tmp2, 0
  br i1 %tobool3, label %if.then, label %if.else

if.then:                                          ; preds = %lor.lhs.false, %entry
  store i32 0, i32* %sign_mask, align 4
  br label %if.end

if.else:                                          ; preds = %lor.lhs.false
  store i32 -1, i32* %sign_mask, align 4
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %tmp4 = load i32* %n.addr, align 4
  %tmp5 = load i32* %precision.addr, align 4
  %cmp = icmp uge i32 %tmp4, %tmp5
  br i1 %cmp, label %if.then6, label %if.else8

if.then6:                                         ; preds = %if.end
  %tmp7 = load i32* %sign_mask, align 4
  %low = getelementptr inbounds %struct.cpp_num* %num, i32 0, i32 1
  store i32 %tmp7, i32* %low, align 4
  %high = getelementptr inbounds %struct.cpp_num* %num, i32 0, i32 0
  store i32 %tmp7, i32* %high, align 4
  br label %if.end77

if.else8:                                         ; preds = %if.end
  %tmp9 = load i32* %precision.addr, align 4
  %conv = zext i32 %tmp9 to i64
  %cmp10 = icmp ult i64 %conv, 32
  br i1 %cmp10, label %if.then12, label %if.else19

if.then12:                                        ; preds = %if.else8
  %tmp13 = load i32* %sign_mask, align 4
  %high14 = getelementptr inbounds %struct.cpp_num* %num, i32 0, i32 0
  store i32 %tmp13, i32* %high14, align 4
  %tmp15 = load i32* %sign_mask, align 4
  %tmp16 = load i32* %precision.addr, align 4
  %shl = shl i32 %tmp15, %tmp16
  %low17 = getelementptr inbounds %struct.cpp_num* %num, i32 0, i32 1
  %tmp18 = load i32* %low17, align 4
  %or = or i32 %tmp18, %shl
  store i32 %or, i32* %low17, align 4
  br label %if.end33

if.else19:                                        ; preds = %if.else8
  %tmp20 = load i32* %precision.addr, align 4
  %conv21 = zext i32 %tmp20 to i64
  %cmp22 = icmp ult i64 %conv21, 64
  br i1 %cmp22, label %if.then24, label %if.end32

if.then24:                                        ; preds = %if.else19
  %tmp25 = load i32* %sign_mask, align 4
  %tmp26 = load i32* %precision.addr, align 4
  %conv27 = zext i32 %tmp26 to i64
  %sub = sub i64 %conv27, 32
  %sh_prom = trunc i64 %sub to i32
  %shl28 = shl i32 %tmp25, %sh_prom
  %high29 = getelementptr inbounds %struct.cpp_num* %num, i32 0, i32 0
  %tmp30 = load i32* %high29, align 4
  %or31 = or i32 %tmp30, %shl28
  store i32 %or31, i32* %high29, align 4
  br label %if.end32

if.end32:                                         ; preds = %if.then24, %if.else19
  br label %if.end33

if.end33:                                         ; preds = %if.end32, %if.then12
  %tmp34 = load i32* %n.addr, align 4
  %conv35 = zext i32 %tmp34 to i64
  %cmp36 = icmp uge i64 %conv35, 32
  br i1 %cmp36, label %if.then38, label %if.end48

if.then38:                                        ; preds = %if.end33
  %tmp39 = load i32* %n.addr, align 4
  %conv40 = zext i32 %tmp39 to i64
  %sub41 = sub i64 %conv40, 32
  %conv42 = trunc i64 %sub41 to i32
  store i32 %conv42, i32* %n.addr, align 4
  %high43 = getelementptr inbounds %struct.cpp_num* %num, i32 0, i32 0
  %tmp44 = load i32* %high43, align 4
  %low45 = getelementptr inbounds %struct.cpp_num* %num, i32 0, i32 1
  store i32 %tmp44, i32* %low45, align 4
  %tmp46 = load i32* %sign_mask, align 4
  %high47 = getelementptr inbounds %struct.cpp_num* %num, i32 0, i32 0
  store i32 %tmp46, i32* %high47, align 4
  br label %if.end48

if.end48:                                         ; preds = %if.then38, %if.end33
  %tmp49 = load i32* %n.addr, align 4
  %tobool50 = icmp ne i32 %tmp49, 0
  br i1 %tobool50, label %if.then51, label %if.end76

if.then51:                                        ; preds = %if.end48
  %low52 = getelementptr inbounds %struct.cpp_num* %num, i32 0, i32 1
  %tmp53 = load i32* %low52, align 4
  %tmp54 = load i32* %n.addr, align 4
  %shr = lshr i32 %tmp53, %tmp54
  %high55 = getelementptr inbounds %struct.cpp_num* %num, i32 0, i32 0
  %tmp56 = load i32* %high55, align 4
  %tmp57 = load i32* %n.addr, align 4
  %conv58 = zext i32 %tmp57 to i64
  %sub59 = sub i64 32, %conv58
  %sh_prom60 = trunc i64 %sub59 to i32
  %shl61 = shl i32 %tmp56, %sh_prom60
  %or62 = or i32 %shr, %shl61
  %low63 = getelementptr inbounds %struct.cpp_num* %num, i32 0, i32 1
  store i32 %or62, i32* %low63, align 4
  %high64 = getelementptr inbounds %struct.cpp_num* %num, i32 0, i32 0
  %tmp65 = load i32* %high64, align 4
  %tmp66 = load i32* %n.addr, align 4
  %shr67 = lshr i32 %tmp65, %tmp66
  %tmp68 = load i32* %sign_mask, align 4
  %tmp69 = load i32* %n.addr, align 4
  %conv70 = zext i32 %tmp69 to i64
  %sub71 = sub i64 32, %conv70
  %sh_prom72 = trunc i64 %sub71 to i32
  %shl73 = shl i32 %tmp68, %sh_prom72
  %or74 = or i32 %shr67, %shl73
  %high75 = getelementptr inbounds %struct.cpp_num* %num, i32 0, i32 0
  store i32 %or74, i32* %high75, align 4
  br label %if.end76

if.end76:                                         ; preds = %if.then51, %if.end48
  br label %if.end77

if.end77:                                         ; preds = %if.end76, %if.then6
  %tmp78 = load i32* %precision.addr, align 4
  %8 = bitcast %struct.cpp_num* %num to %0*
  %9 = getelementptr %0* %8, i32 0, i32 0
  %10 = load i64* %9, align 1
  %11 = getelementptr %0* %8, i32 0, i32 1
  %12 = load i64* %11, align 1
  %call79 = call %0 @num_trim(i64 %10, i64 %12, i32 %tmp78)
  %13 = bitcast %struct.cpp_num* %num to %0*
  %14 = getelementptr %0* %13, i32 0, i32 0
  %15 = extractvalue %0 %call79, 0
  store i64 %15, i64* %14, align 1
  %16 = getelementptr %0* %13, i32 0, i32 1
  %17 = extractvalue %0 %call79, 1
  store i64 %17, i64* %16, align 1
  %overflow = getelementptr inbounds %struct.cpp_num* %num, i32 0, i32 3
  store i32 0, i32* %overflow, align 4
  %tmp80 = bitcast %struct.cpp_num* %retval to i8*
  %tmp81 = bitcast %struct.cpp_num* %num to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %tmp80, i8* %tmp81, i64 16, i32 4, i1 false)
  %18 = bitcast %struct.cpp_num* %retval to %0*
  %19 = load %0* %18, align 1
  ret %0 %19
}

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %res = alloca %struct.cpp_num, align 4
  store i32 0, i32* %retval
  %tmp = load i32* @n, align 4
  %0 = load i64* getelementptr (%0* bitcast (%struct.cpp_num* @num to %0*), i32 0, i32 0), align 1
  %1 = load i64* getelementptr (%0* bitcast (%struct.cpp_num* @num to %0*), i32 0, i32 1), align 1
  %call = call %0 @num_lshift(i64 %0, i64 %1, i32 64, i32 %tmp)
  %2 = bitcast %struct.cpp_num* %res to %0*
  %3 = getelementptr %0* %2, i32 0, i32 0
  %4 = extractvalue %0 %call, 0
  store i64 %4, i64* %3, align 1
  %5 = getelementptr %0* %2, i32 0, i32 1
  %6 = extractvalue %0 %call, 1
  store i64 %6, i64* %5, align 1
  %low = getelementptr inbounds %struct.cpp_num* %res, i32 0, i32 1
  %tmp1 = load i32* %low, align 4
  %cmp = icmp ne i32 %tmp1, 196608
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  %high = getelementptr inbounds %struct.cpp_num* %res, i32 0, i32 0
  %tmp2 = load i32* %high, align 4
  %cmp3 = icmp ne i32 %tmp2, 0
  br i1 %cmp3, label %if.then4, label %if.end5

if.then4:                                         ; preds = %if.end
  call void @abort() noreturn nounwind
  unreachable

if.end5:                                          ; preds = %if.end
  %overflow = getelementptr inbounds %struct.cpp_num* %res, i32 0, i32 3
  %tmp6 = load i32* %overflow, align 4
  %cmp7 = icmp ne i32 %tmp6, 0
  br i1 %cmp7, label %if.then8, label %if.end9

if.then8:                                         ; preds = %if.end5
  call void @abort() noreturn nounwind
  unreachable

if.end9:                                          ; preds = %if.end5
  call void @exit(i32 0) noreturn nounwind
  unreachable

return:                                           ; No predecessors!
  %7 = load i32* %retval
  ret i32 %7
}

declare void @abort() noreturn nounwind

declare void @exit(i32) noreturn nounwind

define internal i32 @num_positive(i64 %num.coerce0, i64 %num.coerce1, i32 %precision) nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %num = alloca %struct.cpp_num, align 8
  %precision.addr = alloca i32, align 4
  %0 = bitcast %struct.cpp_num* %num to %0*
  %1 = getelementptr %0* %0, i32 0, i32 0
  store i64 %num.coerce0, i64* %1
  %2 = getelementptr %0* %0, i32 0, i32 1
  store i64 %num.coerce1, i64* %2
  store i32 %precision, i32* %precision.addr, align 4
  %tmp = load i32* %precision.addr, align 4
  %conv = zext i32 %tmp to i64
  %cmp = icmp ugt i64 %conv, 32
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %tmp2 = load i32* %precision.addr, align 4
  %conv3 = zext i32 %tmp2 to i64
  %sub = sub i64 %conv3, 32
  %conv4 = trunc i64 %sub to i32
  store i32 %conv4, i32* %precision.addr, align 4
  %high = getelementptr inbounds %struct.cpp_num* %num, i32 0, i32 0
  %tmp5 = load i32* %high, align 4
  %tmp6 = load i32* %precision.addr, align 4
  %sub7 = sub i32 %tmp6, 1
  %shl = shl i32 1, %sub7
  %and = and i32 %tmp5, %shl
  %cmp8 = icmp eq i32 %and, 0
  %conv9 = zext i1 %cmp8 to i32
  store i32 %conv9, i32* %retval
  br label %return

if.end:                                           ; preds = %entry
  %low = getelementptr inbounds %struct.cpp_num* %num, i32 0, i32 1
  %tmp10 = load i32* %low, align 4
  %tmp11 = load i32* %precision.addr, align 4
  %sub12 = sub i32 %tmp11, 1
  %shl13 = shl i32 1, %sub12
  %and14 = and i32 %tmp10, %shl13
  %cmp15 = icmp eq i32 %and14, 0
  %conv16 = zext i1 %cmp15 to i32
  store i32 %conv16, i32* %retval
  br label %return

return:                                           ; preds = %if.end, %if.then
  %3 = load i32* %retval
  ret i32 %3
}
