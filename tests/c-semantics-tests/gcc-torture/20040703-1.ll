; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/20040703-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.cpp_num = type { i32, i32, i32, i32 }

@precision = global i32 64, align 4
@n = global i32 16, align 4
@num = global %struct.cpp_num { i32 0, i32 3, i32 0, i32 0 }, align 4

define { i64, i64 } @num_lshift(i64 %num.coerce0, i64 %num.coerce1, i32 %precision, i32 %n) nounwind uwtable {
entry:
  %retval = alloca %struct.cpp_num, align 4
  %num = alloca %struct.cpp_num, align 8
  %precision.addr = alloca i32, align 4
  %n.addr = alloca i32, align 4
  %orig = alloca %struct.cpp_num, align 4
  %m = alloca i32, align 4
  %coerce = alloca %struct.cpp_num, align 4
  %maybe_orig = alloca %struct.cpp_num, align 4
  %0 = bitcast %struct.cpp_num* %num to { i64, i64 }*
  %1 = getelementptr { i64, i64 }* %0, i32 0, i32 0
  store i64 %num.coerce0, i64* %1
  %2 = getelementptr { i64, i64 }* %0, i32 0, i32 1
  store i64 %num.coerce1, i64* %2
  store i32 %precision, i32* %precision.addr, align 4
  store i32 %n, i32* %n.addr, align 4
  %3 = load i32* %n.addr, align 4
  %4 = load i32* %precision.addr, align 4
  %cmp = icmp uge i32 %3, %4
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  %unsignedp = getelementptr inbounds %struct.cpp_num* %num, i32 0, i32 2
  %5 = load i32* %unsignedp, align 4
  %tobool = icmp ne i32 %5, 0
  br i1 %tobool, label %land.end, label %land.rhs

land.rhs:                                         ; preds = %if.then
  %low = getelementptr inbounds %struct.cpp_num* %num, i32 0, i32 1
  %6 = load i32* %low, align 4
  %high = getelementptr inbounds %struct.cpp_num* %num, i32 0, i32 0
  %7 = load i32* %high, align 4
  %or = or i32 %6, %7
  %cmp1 = icmp eq i32 %or, 0
  %lnot = xor i1 %cmp1, true
  br label %land.end

land.end:                                         ; preds = %land.rhs, %if.then
  %8 = phi i1 [ false, %if.then ], [ %lnot, %land.rhs ]
  %land.ext = zext i1 %8 to i32
  %overflow = getelementptr inbounds %struct.cpp_num* %num, i32 0, i32 3
  store i32 %land.ext, i32* %overflow, align 4
  %low2 = getelementptr inbounds %struct.cpp_num* %num, i32 0, i32 1
  store i32 0, i32* %low2, align 4
  %high3 = getelementptr inbounds %struct.cpp_num* %num, i32 0, i32 0
  store i32 0, i32* %high3, align 4
  br label %if.end43

if.else:                                          ; preds = %entry
  %9 = load i32* %n.addr, align 4
  store i32 %9, i32* %m, align 4
  %10 = bitcast %struct.cpp_num* %orig to i8*
  %11 = bitcast %struct.cpp_num* %num to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %10, i8* %11, i64 16, i32 4, i1 false)
  %12 = load i32* %m, align 4
  %conv = zext i32 %12 to i64
  %cmp4 = icmp uge i64 %conv, 32
  br i1 %cmp4, label %if.then6, label %if.end

if.then6:                                         ; preds = %if.else
  %13 = load i32* %m, align 4
  %conv7 = zext i32 %13 to i64
  %sub = sub i64 %conv7, 32
  %conv8 = trunc i64 %sub to i32
  store i32 %conv8, i32* %m, align 4
  %low9 = getelementptr inbounds %struct.cpp_num* %num, i32 0, i32 1
  %14 = load i32* %low9, align 4
  %high10 = getelementptr inbounds %struct.cpp_num* %num, i32 0, i32 0
  store i32 %14, i32* %high10, align 4
  %low11 = getelementptr inbounds %struct.cpp_num* %num, i32 0, i32 1
  store i32 0, i32* %low11, align 4
  br label %if.end

if.end:                                           ; preds = %if.then6, %if.else
  %15 = load i32* %m, align 4
  %tobool12 = icmp ne i32 %15, 0
  br i1 %tobool12, label %if.then13, label %if.end22

if.then13:                                        ; preds = %if.end
  %high14 = getelementptr inbounds %struct.cpp_num* %num, i32 0, i32 0
  %16 = load i32* %high14, align 4
  %17 = load i32* %m, align 4
  %shl = shl i32 %16, %17
  %low15 = getelementptr inbounds %struct.cpp_num* %num, i32 0, i32 1
  %18 = load i32* %low15, align 4
  %19 = load i32* %m, align 4
  %conv16 = zext i32 %19 to i64
  %sub17 = sub i64 32, %conv16
  %sh_prom = trunc i64 %sub17 to i32
  %shr = lshr i32 %18, %sh_prom
  %or18 = or i32 %shl, %shr
  %high19 = getelementptr inbounds %struct.cpp_num* %num, i32 0, i32 0
  store i32 %or18, i32* %high19, align 4
  %20 = load i32* %m, align 4
  %low20 = getelementptr inbounds %struct.cpp_num* %num, i32 0, i32 1
  %21 = load i32* %low20, align 4
  %shl21 = shl i32 %21, %20
  store i32 %shl21, i32* %low20, align 4
  br label %if.end22

if.end22:                                         ; preds = %if.then13, %if.end
  %22 = load i32* %precision.addr, align 4
  %23 = bitcast %struct.cpp_num* %num to { i64, i64 }*
  %24 = getelementptr { i64, i64 }* %23, i32 0, i32 0
  %25 = load i64* %24, align 1
  %26 = getelementptr { i64, i64 }* %23, i32 0, i32 1
  %27 = load i64* %26, align 1
  %call = call { i64, i64 } @num_trim(i64 %25, i64 %27, i32 %22)
  %28 = bitcast %struct.cpp_num* %coerce to { i64, i64 }*
  %29 = getelementptr { i64, i64 }* %28, i32 0, i32 0
  %30 = extractvalue { i64, i64 } %call, 0
  store i64 %30, i64* %29, align 1
  %31 = getelementptr { i64, i64 }* %28, i32 0, i32 1
  %32 = extractvalue { i64, i64 } %call, 1
  store i64 %32, i64* %31, align 1
  %33 = bitcast %struct.cpp_num* %num to i8*
  %34 = bitcast %struct.cpp_num* %coerce to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %33, i8* %34, i64 16, i32 4, i1 false)
  %unsignedp23 = getelementptr inbounds %struct.cpp_num* %num, i32 0, i32 2
  %35 = load i32* %unsignedp23, align 4
  %tobool24 = icmp ne i32 %35, 0
  br i1 %tobool24, label %if.then25, label %if.else27

if.then25:                                        ; preds = %if.end22
  %overflow26 = getelementptr inbounds %struct.cpp_num* %num, i32 0, i32 3
  store i32 0, i32* %overflow26, align 4
  br label %if.end42

if.else27:                                        ; preds = %if.end22
  %36 = load i32* %precision.addr, align 4
  %37 = load i32* %n.addr, align 4
  %38 = bitcast %struct.cpp_num* %num to { i64, i64 }*
  %39 = getelementptr { i64, i64 }* %38, i32 0, i32 0
  %40 = load i64* %39, align 1
  %41 = getelementptr { i64, i64 }* %38, i32 0, i32 1
  %42 = load i64* %41, align 1
  %call28 = call { i64, i64 } @num_rshift(i64 %40, i64 %42, i32 %36, i32 %37)
  %43 = bitcast %struct.cpp_num* %maybe_orig to { i64, i64 }*
  %44 = getelementptr { i64, i64 }* %43, i32 0, i32 0
  %45 = extractvalue { i64, i64 } %call28, 0
  store i64 %45, i64* %44, align 1
  %46 = getelementptr { i64, i64 }* %43, i32 0, i32 1
  %47 = extractvalue { i64, i64 } %call28, 1
  store i64 %47, i64* %46, align 1
  %low29 = getelementptr inbounds %struct.cpp_num* %orig, i32 0, i32 1
  %48 = load i32* %low29, align 4
  %low30 = getelementptr inbounds %struct.cpp_num* %maybe_orig, i32 0, i32 1
  %49 = load i32* %low30, align 4
  %cmp31 = icmp eq i32 %48, %49
  br i1 %cmp31, label %land.rhs33, label %land.end38

land.rhs33:                                       ; preds = %if.else27
  %high34 = getelementptr inbounds %struct.cpp_num* %orig, i32 0, i32 0
  %50 = load i32* %high34, align 4
  %high35 = getelementptr inbounds %struct.cpp_num* %maybe_orig, i32 0, i32 0
  %51 = load i32* %high35, align 4
  %cmp36 = icmp eq i32 %50, %51
  br label %land.end38

land.end38:                                       ; preds = %land.rhs33, %if.else27
  %52 = phi i1 [ false, %if.else27 ], [ %cmp36, %land.rhs33 ]
  %lnot40 = xor i1 %52, true
  %lnot.ext = zext i1 %lnot40 to i32
  %overflow41 = getelementptr inbounds %struct.cpp_num* %num, i32 0, i32 3
  store i32 %lnot.ext, i32* %overflow41, align 4
  br label %if.end42

if.end42:                                         ; preds = %land.end38, %if.then25
  br label %if.end43

if.end43:                                         ; preds = %if.end42, %land.end
  %53 = bitcast %struct.cpp_num* %retval to i8*
  %54 = bitcast %struct.cpp_num* %num to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %53, i8* %54, i64 16, i32 4, i1 false)
  %55 = bitcast %struct.cpp_num* %retval to { i64, i64 }*
  %56 = load { i64, i64 }* %55, align 1
  ret { i64, i64 } %56
}

declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture, i64, i32, i1) nounwind

define internal { i64, i64 } @num_trim(i64 %num.coerce0, i64 %num.coerce1, i32 %precision) nounwind uwtable {
entry:
  %retval = alloca %struct.cpp_num, align 4
  %num = alloca %struct.cpp_num, align 8
  %precision.addr = alloca i32, align 4
  %0 = bitcast %struct.cpp_num* %num to { i64, i64 }*
  %1 = getelementptr { i64, i64 }* %0, i32 0, i32 0
  store i64 %num.coerce0, i64* %1
  %2 = getelementptr { i64, i64 }* %0, i32 0, i32 1
  store i64 %num.coerce1, i64* %2
  store i32 %precision, i32* %precision.addr, align 4
  %3 = load i32* %precision.addr, align 4
  %conv = zext i32 %3 to i64
  %cmp = icmp ugt i64 %conv, 32
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  %4 = load i32* %precision.addr, align 4
  %conv2 = zext i32 %4 to i64
  %sub = sub i64 %conv2, 32
  %conv3 = trunc i64 %sub to i32
  store i32 %conv3, i32* %precision.addr, align 4
  %5 = load i32* %precision.addr, align 4
  %conv4 = zext i32 %5 to i64
  %cmp5 = icmp ult i64 %conv4, 32
  br i1 %cmp5, label %if.then7, label %if.end

if.then7:                                         ; preds = %if.then
  %6 = load i32* %precision.addr, align 4
  %shl = shl i32 1, %6
  %sub8 = sub i32 %shl, 1
  %high = getelementptr inbounds %struct.cpp_num* %num, i32 0, i32 0
  %7 = load i32* %high, align 4
  %and = and i32 %7, %sub8
  store i32 %and, i32* %high, align 4
  br label %if.end

if.end:                                           ; preds = %if.then7, %if.then
  br label %if.end18

if.else:                                          ; preds = %entry
  %8 = load i32* %precision.addr, align 4
  %conv9 = zext i32 %8 to i64
  %cmp10 = icmp ult i64 %conv9, 32
  br i1 %cmp10, label %if.then12, label %if.end16

if.then12:                                        ; preds = %if.else
  %9 = load i32* %precision.addr, align 4
  %shl13 = shl i32 1, %9
  %sub14 = sub i32 %shl13, 1
  %low = getelementptr inbounds %struct.cpp_num* %num, i32 0, i32 1
  %10 = load i32* %low, align 4
  %and15 = and i32 %10, %sub14
  store i32 %and15, i32* %low, align 4
  br label %if.end16

if.end16:                                         ; preds = %if.then12, %if.else
  %high17 = getelementptr inbounds %struct.cpp_num* %num, i32 0, i32 0
  store i32 0, i32* %high17, align 4
  br label %if.end18

if.end18:                                         ; preds = %if.end16, %if.end
  %11 = bitcast %struct.cpp_num* %retval to i8*
  %12 = bitcast %struct.cpp_num* %num to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %11, i8* %12, i64 16, i32 4, i1 false)
  %13 = bitcast %struct.cpp_num* %retval to { i64, i64 }*
  %14 = load { i64, i64 }* %13, align 1
  ret { i64, i64 } %14
}

define internal { i64, i64 } @num_rshift(i64 %num.coerce0, i64 %num.coerce1, i32 %precision, i32 %n) nounwind uwtable {
entry:
  %retval = alloca %struct.cpp_num, align 4
  %num = alloca %struct.cpp_num, align 8
  %precision.addr = alloca i32, align 4
  %n.addr = alloca i32, align 4
  %sign_mask = alloca i32, align 4
  %x = alloca i32, align 4
  %coerce = alloca %struct.cpp_num, align 4
  %0 = bitcast %struct.cpp_num* %num to { i64, i64 }*
  %1 = getelementptr { i64, i64 }* %0, i32 0, i32 0
  store i64 %num.coerce0, i64* %1
  %2 = getelementptr { i64, i64 }* %0, i32 0, i32 1
  store i64 %num.coerce1, i64* %2
  store i32 %precision, i32* %precision.addr, align 4
  store i32 %n, i32* %n.addr, align 4
  %3 = load i32* %precision.addr, align 4
  %4 = bitcast %struct.cpp_num* %num to { i64, i64 }*
  %5 = getelementptr { i64, i64 }* %4, i32 0, i32 0
  %6 = load i64* %5, align 1
  %7 = getelementptr { i64, i64 }* %4, i32 0, i32 1
  %8 = load i64* %7, align 1
  %call = call i32 @num_positive(i64 %6, i64 %8, i32 %3)
  store i32 %call, i32* %x, align 4
  %unsignedp = getelementptr inbounds %struct.cpp_num* %num, i32 0, i32 2
  %9 = load i32* %unsignedp, align 4
  %tobool = icmp ne i32 %9, 0
  br i1 %tobool, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %10 = load i32* %x, align 4
  %tobool1 = icmp ne i32 %10, 0
  br i1 %tobool1, label %if.then, label %if.else

if.then:                                          ; preds = %lor.lhs.false, %entry
  store i32 0, i32* %sign_mask, align 4
  br label %if.end

if.else:                                          ; preds = %lor.lhs.false
  store i32 -1, i32* %sign_mask, align 4
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %11 = load i32* %n.addr, align 4
  %12 = load i32* %precision.addr, align 4
  %cmp = icmp uge i32 %11, %12
  br i1 %cmp, label %if.then2, label %if.else3

if.then2:                                         ; preds = %if.end
  %13 = load i32* %sign_mask, align 4
  %low = getelementptr inbounds %struct.cpp_num* %num, i32 0, i32 1
  store i32 %13, i32* %low, align 4
  %high = getelementptr inbounds %struct.cpp_num* %num, i32 0, i32 0
  store i32 %13, i32* %high, align 4
  br label %if.end50

if.else3:                                         ; preds = %if.end
  %14 = load i32* %precision.addr, align 4
  %conv = zext i32 %14 to i64
  %cmp4 = icmp ult i64 %conv, 32
  br i1 %cmp4, label %if.then6, label %if.else9

if.then6:                                         ; preds = %if.else3
  %15 = load i32* %sign_mask, align 4
  %high7 = getelementptr inbounds %struct.cpp_num* %num, i32 0, i32 0
  store i32 %15, i32* %high7, align 4
  %16 = load i32* %sign_mask, align 4
  %17 = load i32* %precision.addr, align 4
  %shl = shl i32 %16, %17
  %low8 = getelementptr inbounds %struct.cpp_num* %num, i32 0, i32 1
  %18 = load i32* %low8, align 4
  %or = or i32 %18, %shl
  store i32 %or, i32* %low8, align 4
  br label %if.end19

if.else9:                                         ; preds = %if.else3
  %19 = load i32* %precision.addr, align 4
  %conv10 = zext i32 %19 to i64
  %cmp11 = icmp ult i64 %conv10, 64
  br i1 %cmp11, label %if.then13, label %if.end18

if.then13:                                        ; preds = %if.else9
  %20 = load i32* %sign_mask, align 4
  %21 = load i32* %precision.addr, align 4
  %conv14 = zext i32 %21 to i64
  %sub = sub i64 %conv14, 32
  %sh_prom = trunc i64 %sub to i32
  %shl15 = shl i32 %20, %sh_prom
  %high16 = getelementptr inbounds %struct.cpp_num* %num, i32 0, i32 0
  %22 = load i32* %high16, align 4
  %or17 = or i32 %22, %shl15
  store i32 %or17, i32* %high16, align 4
  br label %if.end18

if.end18:                                         ; preds = %if.then13, %if.else9
  br label %if.end19

if.end19:                                         ; preds = %if.end18, %if.then6
  %23 = load i32* %n.addr, align 4
  %conv20 = zext i32 %23 to i64
  %cmp21 = icmp uge i64 %conv20, 32
  br i1 %cmp21, label %if.then23, label %if.end30

if.then23:                                        ; preds = %if.end19
  %24 = load i32* %n.addr, align 4
  %conv24 = zext i32 %24 to i64
  %sub25 = sub i64 %conv24, 32
  %conv26 = trunc i64 %sub25 to i32
  store i32 %conv26, i32* %n.addr, align 4
  %high27 = getelementptr inbounds %struct.cpp_num* %num, i32 0, i32 0
  %25 = load i32* %high27, align 4
  %low28 = getelementptr inbounds %struct.cpp_num* %num, i32 0, i32 1
  store i32 %25, i32* %low28, align 4
  %26 = load i32* %sign_mask, align 4
  %high29 = getelementptr inbounds %struct.cpp_num* %num, i32 0, i32 0
  store i32 %26, i32* %high29, align 4
  br label %if.end30

if.end30:                                         ; preds = %if.then23, %if.end19
  %27 = load i32* %n.addr, align 4
  %tobool31 = icmp ne i32 %27, 0
  br i1 %tobool31, label %if.then32, label %if.end49

if.then32:                                        ; preds = %if.end30
  %low33 = getelementptr inbounds %struct.cpp_num* %num, i32 0, i32 1
  %28 = load i32* %low33, align 4
  %29 = load i32* %n.addr, align 4
  %shr = lshr i32 %28, %29
  %high34 = getelementptr inbounds %struct.cpp_num* %num, i32 0, i32 0
  %30 = load i32* %high34, align 4
  %31 = load i32* %n.addr, align 4
  %conv35 = zext i32 %31 to i64
  %sub36 = sub i64 32, %conv35
  %sh_prom37 = trunc i64 %sub36 to i32
  %shl38 = shl i32 %30, %sh_prom37
  %or39 = or i32 %shr, %shl38
  %low40 = getelementptr inbounds %struct.cpp_num* %num, i32 0, i32 1
  store i32 %or39, i32* %low40, align 4
  %high41 = getelementptr inbounds %struct.cpp_num* %num, i32 0, i32 0
  %32 = load i32* %high41, align 4
  %33 = load i32* %n.addr, align 4
  %shr42 = lshr i32 %32, %33
  %34 = load i32* %sign_mask, align 4
  %35 = load i32* %n.addr, align 4
  %conv43 = zext i32 %35 to i64
  %sub44 = sub i64 32, %conv43
  %sh_prom45 = trunc i64 %sub44 to i32
  %shl46 = shl i32 %34, %sh_prom45
  %or47 = or i32 %shr42, %shl46
  %high48 = getelementptr inbounds %struct.cpp_num* %num, i32 0, i32 0
  store i32 %or47, i32* %high48, align 4
  br label %if.end49

if.end49:                                         ; preds = %if.then32, %if.end30
  br label %if.end50

if.end50:                                         ; preds = %if.end49, %if.then2
  %36 = load i32* %precision.addr, align 4
  %37 = bitcast %struct.cpp_num* %num to { i64, i64 }*
  %38 = getelementptr { i64, i64 }* %37, i32 0, i32 0
  %39 = load i64* %38, align 1
  %40 = getelementptr { i64, i64 }* %37, i32 0, i32 1
  %41 = load i64* %40, align 1
  %call51 = call { i64, i64 } @num_trim(i64 %39, i64 %41, i32 %36)
  %42 = bitcast %struct.cpp_num* %coerce to { i64, i64 }*
  %43 = getelementptr { i64, i64 }* %42, i32 0, i32 0
  %44 = extractvalue { i64, i64 } %call51, 0
  store i64 %44, i64* %43, align 1
  %45 = getelementptr { i64, i64 }* %42, i32 0, i32 1
  %46 = extractvalue { i64, i64 } %call51, 1
  store i64 %46, i64* %45, align 1
  %47 = bitcast %struct.cpp_num* %num to i8*
  %48 = bitcast %struct.cpp_num* %coerce to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %47, i8* %48, i64 16, i32 4, i1 false)
  %overflow = getelementptr inbounds %struct.cpp_num* %num, i32 0, i32 3
  store i32 0, i32* %overflow, align 4
  %49 = bitcast %struct.cpp_num* %retval to i8*
  %50 = bitcast %struct.cpp_num* %num to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %49, i8* %50, i64 16, i32 4, i1 false)
  %51 = bitcast %struct.cpp_num* %retval to { i64, i64 }*
  %52 = load { i64, i64 }* %51, align 1
  ret { i64, i64 } %52
}

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %res = alloca %struct.cpp_num, align 4
  store i32 0, i32* %retval
  %0 = load i32* @n, align 4
  %1 = load i64* getelementptr ({ i64, i64 }* bitcast (%struct.cpp_num* @num to { i64, i64 }*), i32 0, i32 0), align 1
  %2 = load i64* getelementptr ({ i64, i64 }* bitcast (%struct.cpp_num* @num to { i64, i64 }*), i32 0, i32 1), align 1
  %call = call { i64, i64 } @num_lshift(i64 %1, i64 %2, i32 64, i32 %0)
  %3 = bitcast %struct.cpp_num* %res to { i64, i64 }*
  %4 = getelementptr { i64, i64 }* %3, i32 0, i32 0
  %5 = extractvalue { i64, i64 } %call, 0
  store i64 %5, i64* %4, align 1
  %6 = getelementptr { i64, i64 }* %3, i32 0, i32 1
  %7 = extractvalue { i64, i64 } %call, 1
  store i64 %7, i64* %6, align 1
  %low = getelementptr inbounds %struct.cpp_num* %res, i32 0, i32 1
  %8 = load i32* %low, align 4
  %cmp = icmp ne i32 %8, 196608
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  %high = getelementptr inbounds %struct.cpp_num* %res, i32 0, i32 0
  %9 = load i32* %high, align 4
  %cmp1 = icmp ne i32 %9, 0
  br i1 %cmp1, label %if.then2, label %if.end3

if.then2:                                         ; preds = %if.end
  call void @abort() noreturn nounwind
  unreachable

if.end3:                                          ; preds = %if.end
  %overflow = getelementptr inbounds %struct.cpp_num* %res, i32 0, i32 3
  %10 = load i32* %overflow, align 4
  %cmp4 = icmp ne i32 %10, 0
  br i1 %cmp4, label %if.then5, label %if.end6

if.then5:                                         ; preds = %if.end3
  call void @abort() noreturn nounwind
  unreachable

if.end6:                                          ; preds = %if.end3
  call void @exit(i32 0) noreturn nounwind
  unreachable

return:                                           ; No predecessors!
  %11 = load i32* %retval
  ret i32 %11
}

declare void @abort() noreturn nounwind

declare void @exit(i32) noreturn nounwind

define internal i32 @num_positive(i64 %num.coerce0, i64 %num.coerce1, i32 %precision) nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %num = alloca %struct.cpp_num, align 8
  %precision.addr = alloca i32, align 4
  %0 = bitcast %struct.cpp_num* %num to { i64, i64 }*
  %1 = getelementptr { i64, i64 }* %0, i32 0, i32 0
  store i64 %num.coerce0, i64* %1
  %2 = getelementptr { i64, i64 }* %0, i32 0, i32 1
  store i64 %num.coerce1, i64* %2
  store i32 %precision, i32* %precision.addr, align 4
  %3 = load i32* %precision.addr, align 4
  %conv = zext i32 %3 to i64
  %cmp = icmp ugt i64 %conv, 32
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %4 = load i32* %precision.addr, align 4
  %conv2 = zext i32 %4 to i64
  %sub = sub i64 %conv2, 32
  %conv3 = trunc i64 %sub to i32
  store i32 %conv3, i32* %precision.addr, align 4
  %high = getelementptr inbounds %struct.cpp_num* %num, i32 0, i32 0
  %5 = load i32* %high, align 4
  %6 = load i32* %precision.addr, align 4
  %sub4 = sub i32 %6, 1
  %shl = shl i32 1, %sub4
  %and = and i32 %5, %shl
  %cmp5 = icmp eq i32 %and, 0
  %conv6 = zext i1 %cmp5 to i32
  store i32 %conv6, i32* %retval
  br label %return

if.end:                                           ; preds = %entry
  %low = getelementptr inbounds %struct.cpp_num* %num, i32 0, i32 1
  %7 = load i32* %low, align 4
  %8 = load i32* %precision.addr, align 4
  %sub7 = sub i32 %8, 1
  %shl8 = shl i32 1, %sub7
  %and9 = and i32 %7, %shl8
  %cmp10 = icmp eq i32 %and9, 0
  %conv11 = zext i1 %cmp10 to i32
  store i32 %conv11, i32* %retval
  br label %return

return:                                           ; preds = %if.end, %if.then
  %9 = load i32* %retval
  ret i32 %9
}
