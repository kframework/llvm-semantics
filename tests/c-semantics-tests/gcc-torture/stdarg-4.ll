; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/stdarg-4.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.__va_list_tag = type { i32, i32, i8*, i8* }

@y = common global i64 0, align 8
@x = common global i64 0, align 8

define void @f1(i32 %i, ...) nounwind uwtable {
entry:
  %ap.addr.i = alloca %struct.__va_list_tag*, align 8
  %i.addr = alloca i32, align 4
  %ap = alloca [1 x %struct.__va_list_tag], align 16
  store i32 %i, i32* %i.addr, align 4
  %arraydecay = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %arraydecay1 = bitcast %struct.__va_list_tag* %arraydecay to i8*
  call void @llvm.va_start(i8* %arraydecay1)
  %arraydecay2 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  store %struct.__va_list_tag* %arraydecay2, %struct.__va_list_tag** %ap.addr.i, align 8
  %0 = load %struct.__va_list_tag** %ap.addr.i, align 8
  %1 = va_arg %struct.__va_list_tag* %0, double
  %conv.i = fptosi double %1 to i64
  store i64 %conv.i, i64* @x, align 8
  %2 = load %struct.__va_list_tag** %ap.addr.i, align 8
  %3 = va_arg %struct.__va_list_tag* %2, i64
  %4 = load i64* @x, align 8
  %add.i = add nsw i64 %4, %3
  store i64 %add.i, i64* @x, align 8
  %5 = load %struct.__va_list_tag** %ap.addr.i, align 8
  %6 = va_arg %struct.__va_list_tag* %5, double
  %7 = load i64* @x, align 8
  %conv1.i = sitofp i64 %7 to double
  %add2.i = fadd double %conv1.i, %6
  %conv3.i = fptosi double %add2.i to i64
  store i64 %conv3.i, i64* @x, align 8
  %arraydecay3 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %arraydecay34 = bitcast %struct.__va_list_tag* %arraydecay3 to i8*
  call void @llvm.va_end(i8* %arraydecay34)
  ret void
}

declare void @llvm.va_start(i8*) nounwind

declare void @llvm.va_end(i8*) nounwind

define void @f2(i32 %i, ...) nounwind uwtable {
entry:
  %ap.addr.i.i = alloca %struct.__va_list_tag*, align 8
  %ap.addr.i = alloca %struct.__va_list_tag*, align 8
  %i.addr = alloca i32, align 4
  %ap = alloca [1 x %struct.__va_list_tag], align 16
  store i32 %i, i32* %i.addr, align 4
  %arraydecay = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %arraydecay1 = bitcast %struct.__va_list_tag* %arraydecay to i8*
  call void @llvm.va_start(i8* %arraydecay1)
  %arraydecay2 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  store %struct.__va_list_tag* %arraydecay2, %struct.__va_list_tag** %ap.addr.i, align 8
  %0 = load %struct.__va_list_tag** %ap.addr.i, align 8
  %1 = va_arg %struct.__va_list_tag* %0, i32
  %conv.i = sext i32 %1 to i64
  store i64 %conv.i, i64* @y, align 8
  %2 = load %struct.__va_list_tag** %ap.addr.i, align 8
  %3 = va_arg %struct.__va_list_tag* %2, i64
  %4 = load i64* @y, align 8
  %add.i = add nsw i64 %4, %3
  store i64 %add.i, i64* @y, align 8
  %5 = load %struct.__va_list_tag** %ap.addr.i, align 8
  %6 = va_arg %struct.__va_list_tag* %5, double
  %7 = load i64* @y, align 8
  %conv1.i = sitofp i64 %7 to double
  %add2.i = fadd double %conv1.i, %6
  %conv3.i = fptosi double %add2.i to i64
  store i64 %conv3.i, i64* @y, align 8
  %8 = load %struct.__va_list_tag** %ap.addr.i, align 8
  store %struct.__va_list_tag* %8, %struct.__va_list_tag** %ap.addr.i.i, align 8
  %9 = load %struct.__va_list_tag** %ap.addr.i.i, align 8
  %10 = va_arg %struct.__va_list_tag* %9, double
  %conv.i.i = fptosi double %10 to i64
  store i64 %conv.i.i, i64* @x, align 8
  %11 = load %struct.__va_list_tag** %ap.addr.i.i, align 8
  %12 = va_arg %struct.__va_list_tag* %11, i64
  %13 = load i64* @x, align 8
  %add.i.i = add nsw i64 %13, %12
  store i64 %add.i.i, i64* @x, align 8
  %14 = load %struct.__va_list_tag** %ap.addr.i.i, align 8
  %15 = va_arg %struct.__va_list_tag* %14, double
  %16 = load i64* @x, align 8
  %conv1.i.i = sitofp i64 %16 to double
  %add2.i.i = fadd double %conv1.i.i, %15
  %conv3.i.i = fptosi double %add2.i.i to i64
  store i64 %conv3.i.i, i64* @x, align 8
  %arraydecay3 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %arraydecay34 = bitcast %struct.__va_list_tag* %arraydecay3 to i8*
  call void @llvm.va_end(i8* %arraydecay34)
  ret void
}

define i64 @f3h(i32 %i, i64 %arg0, i64 %arg1, i64 %arg2, i64 %arg3) nounwind uwtable {
entry:
  %i.addr = alloca i32, align 4
  %arg0.addr = alloca i64, align 8
  %arg1.addr = alloca i64, align 8
  %arg2.addr = alloca i64, align 8
  %arg3.addr = alloca i64, align 8
  store i32 %i, i32* %i.addr, align 4
  store i64 %arg0, i64* %arg0.addr, align 8
  store i64 %arg1, i64* %arg1.addr, align 8
  store i64 %arg2, i64* %arg2.addr, align 8
  store i64 %arg3, i64* %arg3.addr, align 8
  %0 = load i32* %i.addr, align 4
  %conv = sext i32 %0 to i64
  %1 = load i64* %arg0.addr, align 8
  %add = add nsw i64 %conv, %1
  %2 = load i64* %arg1.addr, align 8
  %add1 = add nsw i64 %add, %2
  %3 = load i64* %arg2.addr, align 8
  %add2 = add nsw i64 %add1, %3
  %4 = load i64* %arg3.addr, align 8
  %add3 = add nsw i64 %add2, %4
  ret i64 %add3
}

define i64 @f3(i32 %i, ...) nounwind uwtable {
entry:
  %i.addr = alloca i32, align 4
  %t = alloca i64, align 8
  %arg0 = alloca i64, align 8
  %arg1 = alloca i64, align 8
  %arg2 = alloca i64, align 8
  %arg3 = alloca i64, align 8
  %ap = alloca [1 x %struct.__va_list_tag], align 16
  store i32 %i, i32* %i.addr, align 4
  %arraydecay = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %arraydecay1 = bitcast %struct.__va_list_tag* %arraydecay to i8*
  call void @llvm.va_start(i8* %arraydecay1)
  %0 = load i32* %i.addr, align 4
  switch i32 %0, label %sw.default [
    i32 0, label %sw.bb
    i32 1, label %sw.bb2
    i32 2, label %sw.bb5
    i32 3, label %sw.bb9
    i32 4, label %sw.bb14
  ]

sw.bb:                                            ; preds = %entry
  %1 = load i32* %i.addr, align 4
  %call = call i64 @f3h(i32 %1, i64 0, i64 0, i64 0, i64 0)
  store i64 %call, i64* %t, align 8
  br label %sw.epilog

sw.bb2:                                           ; preds = %entry
  %arraydecay3 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %2 = va_arg %struct.__va_list_tag* %arraydecay3, i64
  store i64 %2, i64* %arg0, align 8
  %3 = load i32* %i.addr, align 4
  %4 = load i64* %arg0, align 8
  %call4 = call i64 @f3h(i32 %3, i64 %4, i64 0, i64 0, i64 0)
  store i64 %call4, i64* %t, align 8
  br label %sw.epilog

sw.bb5:                                           ; preds = %entry
  %arraydecay6 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %5 = va_arg %struct.__va_list_tag* %arraydecay6, i64
  store i64 %5, i64* %arg0, align 8
  %arraydecay7 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %6 = va_arg %struct.__va_list_tag* %arraydecay7, i64
  store i64 %6, i64* %arg1, align 8
  %7 = load i32* %i.addr, align 4
  %8 = load i64* %arg0, align 8
  %9 = load i64* %arg1, align 8
  %call8 = call i64 @f3h(i32 %7, i64 %8, i64 %9, i64 0, i64 0)
  store i64 %call8, i64* %t, align 8
  br label %sw.epilog

sw.bb9:                                           ; preds = %entry
  %arraydecay10 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %10 = va_arg %struct.__va_list_tag* %arraydecay10, i64
  store i64 %10, i64* %arg0, align 8
  %arraydecay11 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %11 = va_arg %struct.__va_list_tag* %arraydecay11, i64
  store i64 %11, i64* %arg1, align 8
  %arraydecay12 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %12 = va_arg %struct.__va_list_tag* %arraydecay12, i64
  store i64 %12, i64* %arg2, align 8
  %13 = load i32* %i.addr, align 4
  %14 = load i64* %arg0, align 8
  %15 = load i64* %arg1, align 8
  %16 = load i64* %arg2, align 8
  %call13 = call i64 @f3h(i32 %13, i64 %14, i64 %15, i64 %16, i64 0)
  store i64 %call13, i64* %t, align 8
  br label %sw.epilog

sw.bb14:                                          ; preds = %entry
  %arraydecay15 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %17 = va_arg %struct.__va_list_tag* %arraydecay15, i64
  store i64 %17, i64* %arg0, align 8
  %arraydecay16 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %18 = va_arg %struct.__va_list_tag* %arraydecay16, i64
  store i64 %18, i64* %arg1, align 8
  %arraydecay17 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %19 = va_arg %struct.__va_list_tag* %arraydecay17, i64
  store i64 %19, i64* %arg2, align 8
  %arraydecay18 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %20 = va_arg %struct.__va_list_tag* %arraydecay18, i64
  store i64 %20, i64* %arg3, align 8
  %21 = load i32* %i.addr, align 4
  %22 = load i64* %arg0, align 8
  %23 = load i64* %arg1, align 8
  %24 = load i64* %arg2, align 8
  %25 = load i64* %arg3, align 8
  %call19 = call i64 @f3h(i32 %21, i64 %22, i64 %23, i64 %24, i64 %25)
  store i64 %call19, i64* %t, align 8
  br label %sw.epilog

sw.default:                                       ; preds = %entry
  call void @abort() noreturn nounwind
  unreachable

sw.epilog:                                        ; preds = %sw.bb14, %sw.bb9, %sw.bb5, %sw.bb2, %sw.bb
  %arraydecay20 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %arraydecay2021 = bitcast %struct.__va_list_tag* %arraydecay20 to i8*
  call void @llvm.va_end(i8* %arraydecay2021)
  %26 = load i64* %t, align 8
  ret i64 %26
}

declare void @abort() noreturn nounwind

define void @f4(i32 %i, ...) nounwind uwtable {
entry:
  %ap.addr.i = alloca %struct.__va_list_tag*, align 8
  %i.addr = alloca i32, align 4
  %ap = alloca [1 x %struct.__va_list_tag], align 16
  store i32 %i, i32* %i.addr, align 4
  %arraydecay = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %arraydecay1 = bitcast %struct.__va_list_tag* %arraydecay to i8*
  call void @llvm.va_start(i8* %arraydecay1)
  %0 = load i32* %i.addr, align 4
  switch i32 %0, label %sw.default [
    i32 4, label %sw.bb
    i32 5, label %sw.bb3
  ]

sw.bb:                                            ; preds = %entry
  %arraydecay2 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %1 = va_arg %struct.__va_list_tag* %arraydecay2, double
  %conv = fptosi double %1 to i64
  store i64 %conv, i64* @y, align 8
  br label %sw.epilog

sw.bb3:                                           ; preds = %entry
  %arraydecay4 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %2 = va_arg %struct.__va_list_tag* %arraydecay4, double
  %conv5 = fptosi double %2 to i64
  store i64 %conv5, i64* @y, align 8
  %arraydecay6 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %3 = va_arg %struct.__va_list_tag* %arraydecay6, double
  %4 = load i64* @y, align 8
  %conv7 = sitofp i64 %4 to double
  %add = fadd double %conv7, %3
  %conv8 = fptosi double %add to i64
  store i64 %conv8, i64* @y, align 8
  br label %sw.epilog

sw.default:                                       ; preds = %entry
  call void @abort() noreturn nounwind
  unreachable

sw.epilog:                                        ; preds = %sw.bb3, %sw.bb
  %arraydecay9 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  store %struct.__va_list_tag* %arraydecay9, %struct.__va_list_tag** %ap.addr.i, align 8
  %5 = load %struct.__va_list_tag** %ap.addr.i, align 8
  %6 = va_arg %struct.__va_list_tag* %5, double
  %conv.i = fptosi double %6 to i64
  store i64 %conv.i, i64* @x, align 8
  %7 = load %struct.__va_list_tag** %ap.addr.i, align 8
  %8 = va_arg %struct.__va_list_tag* %7, i64
  %9 = load i64* @x, align 8
  %add.i = add nsw i64 %9, %8
  store i64 %add.i, i64* @x, align 8
  %10 = load %struct.__va_list_tag** %ap.addr.i, align 8
  %11 = va_arg %struct.__va_list_tag* %10, double
  %12 = load i64* @x, align 8
  %conv1.i = sitofp i64 %12 to double
  %add2.i = fadd double %conv1.i, %11
  %conv3.i = fptosi double %add2.i to i64
  store i64 %conv3.i, i64* @x, align 8
  %arraydecay10 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %arraydecay1011 = bitcast %struct.__va_list_tag* %arraydecay10 to i8*
  call void @llvm.va_end(i8* %arraydecay1011)
  ret void
}

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval
  call void (i32, ...)* @f1(i32 3, double 1.600000e+01, i64 128, double 3.200000e+01)
  %0 = load i64* @x, align 8
  %cmp = icmp ne i64 %0, 176
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  call void (i32, ...)* @f2(i32 6, i32 5, i64 7, double 1.800000e+01, double 1.900000e+01, i64 17, double 6.400000e+01)
  %1 = load i64* @x, align 8
  %cmp1 = icmp ne i64 %1, 100
  br i1 %cmp1, label %if.then3, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %if.end
  %2 = load i64* @y, align 8
  %cmp2 = icmp ne i64 %2, 30
  br i1 %cmp2, label %if.then3, label %if.end4

if.then3:                                         ; preds = %lor.lhs.false, %if.end
  call void @abort() noreturn nounwind
  unreachable

if.end4:                                          ; preds = %lor.lhs.false
  %call = call i64 (i32, ...)* @f3(i32 0)
  %cmp5 = icmp ne i64 %call, 0
  br i1 %cmp5, label %if.then6, label %if.end7

if.then6:                                         ; preds = %if.end4
  call void @abort() noreturn nounwind
  unreachable

if.end7:                                          ; preds = %if.end4
  %call8 = call i64 (i32, ...)* @f3(i32 1, i64 18)
  %cmp9 = icmp ne i64 %call8, 19
  br i1 %cmp9, label %if.then10, label %if.end11

if.then10:                                        ; preds = %if.end7
  call void @abort() noreturn nounwind
  unreachable

if.end11:                                         ; preds = %if.end7
  %call12 = call i64 (i32, ...)* @f3(i32 2, i64 18, i64 100)
  %cmp13 = icmp ne i64 %call12, 120
  br i1 %cmp13, label %if.then14, label %if.end15

if.then14:                                        ; preds = %if.end11
  call void @abort() noreturn nounwind
  unreachable

if.end15:                                         ; preds = %if.end11
  %call16 = call i64 (i32, ...)* @f3(i32 3, i64 18, i64 100, i64 300)
  %cmp17 = icmp ne i64 %call16, 421
  br i1 %cmp17, label %if.then18, label %if.end19

if.then18:                                        ; preds = %if.end15
  call void @abort() noreturn nounwind
  unreachable

if.end19:                                         ; preds = %if.end15
  %call20 = call i64 (i32, ...)* @f3(i32 4, i64 18, i64 71, i64 64, i64 86)
  %cmp21 = icmp ne i64 %call20, 243
  br i1 %cmp21, label %if.then22, label %if.end23

if.then22:                                        ; preds = %if.end19
  call void @abort() noreturn nounwind
  unreachable

if.end23:                                         ; preds = %if.end19
  call void (i32, ...)* @f4(i32 4, double 6.000000e+00, double 9.000000e+00, i64 16, double 1.800000e+01)
  %3 = load i64* @x, align 8
  %cmp24 = icmp ne i64 %3, 43
  br i1 %cmp24, label %if.then27, label %lor.lhs.false25

lor.lhs.false25:                                  ; preds = %if.end23
  %4 = load i64* @y, align 8
  %cmp26 = icmp ne i64 %4, 6
  br i1 %cmp26, label %if.then27, label %if.end28

if.then27:                                        ; preds = %lor.lhs.false25, %if.end23
  call void @abort() noreturn nounwind
  unreachable

if.end28:                                         ; preds = %lor.lhs.false25
  call void (i32, ...)* @f4(i32 5, double 7.000000e+00, double 2.100000e+01, double 1.000000e+00, i64 17, double 1.260000e+02)
  %5 = load i64* @x, align 8
  %cmp29 = icmp ne i64 %5, 144
  br i1 %cmp29, label %if.then32, label %lor.lhs.false30

lor.lhs.false30:                                  ; preds = %if.end28
  %6 = load i64* @y, align 8
  %cmp31 = icmp ne i64 %6, 28
  br i1 %cmp31, label %if.then32, label %if.end33

if.then32:                                        ; preds = %lor.lhs.false30, %if.end28
  call void @abort() noreturn nounwind
  unreachable

if.end33:                                         ; preds = %lor.lhs.false30
  ret i32 0
}
