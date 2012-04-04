; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/stdarg-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.__va_list_tag = type { i32, i32, i8*, i8* }

@foo_arg = common global i32 0, align 4
@gap = common global [1 x %struct.__va_list_tag] zeroinitializer, align 16
@pap = common global [1 x %struct.__va_list_tag]* null, align 8
@bar_arg = common global i32 0, align 4
@d = common global double 0.000000e+00, align 8
@x = common global i64 0, align 8

define void @foo(i32 %v, %struct.__va_list_tag* %ap) nounwind uwtable {
entry:
  %v.addr = alloca i32, align 4
  %ap.addr = alloca %struct.__va_list_tag*, align 8
  store i32 %v, i32* %v.addr, align 4
  store %struct.__va_list_tag* %ap, %struct.__va_list_tag** %ap.addr, align 8
  %0 = load i32* %v.addr, align 4
  switch i32 %0, label %sw.default [
    i32 5, label %sw.bb
  ]

sw.bb:                                            ; preds = %entry
  %1 = load %struct.__va_list_tag** %ap.addr, align 8
  %2 = va_arg %struct.__va_list_tag* %1, i32
  store i32 %2, i32* @foo_arg, align 4
  br label %sw.epilog

sw.default:                                       ; preds = %entry
  call void @abort() noreturn nounwind
  unreachable

sw.epilog:                                        ; preds = %sw.bb
  ret void
}

declare void @abort() noreturn nounwind

define void @bar(i32 %v) nounwind uwtable {
entry:
  %v.addr = alloca i32, align 4
  store i32 %v, i32* %v.addr, align 4
  %0 = load i32* %v.addr, align 4
  %cmp = icmp eq i32 %0, 16390
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  %1 = va_arg %struct.__va_list_tag* getelementptr inbounds ([1 x %struct.__va_list_tag]* @gap, i32 0, i32 0), double
  %cmp1 = fcmp une double %1, 1.700000e+01
  br i1 %cmp1, label %if.then3, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %if.then
  %2 = va_arg %struct.__va_list_tag* getelementptr inbounds ([1 x %struct.__va_list_tag]* @gap, i32 0, i32 0), i64
  %cmp2 = icmp ne i64 %2, 129
  br i1 %cmp2, label %if.then3, label %if.end

if.then3:                                         ; preds = %lor.lhs.false, %if.then
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %lor.lhs.false
  br label %if.end16

if.else:                                          ; preds = %entry
  %3 = load i32* %v.addr, align 4
  %cmp4 = icmp eq i32 %3, 16392
  br i1 %cmp4, label %if.then5, label %if.end15

if.then5:                                         ; preds = %if.else
  %4 = load [1 x %struct.__va_list_tag]** @pap, align 8
  %arraydecay = getelementptr inbounds [1 x %struct.__va_list_tag]* %4, i32 0, i32 0
  %5 = va_arg %struct.__va_list_tag* %arraydecay, i64
  %cmp6 = icmp ne i64 %5, 14
  br i1 %cmp6, label %if.then13, label %lor.lhs.false7

lor.lhs.false7:                                   ; preds = %if.then5
  %6 = load [1 x %struct.__va_list_tag]** @pap, align 8
  %arraydecay8 = getelementptr inbounds [1 x %struct.__va_list_tag]* %6, i32 0, i32 0
  %7 = va_arg %struct.__va_list_tag* %arraydecay8, x86_fp80
  %cmp9 = fcmp une x86_fp80 %7, 0xK40068300000000000000
  br i1 %cmp9, label %if.then13, label %lor.lhs.false10

lor.lhs.false10:                                  ; preds = %lor.lhs.false7
  %8 = load [1 x %struct.__va_list_tag]** @pap, align 8
  %arraydecay11 = getelementptr inbounds [1 x %struct.__va_list_tag]* %8, i32 0, i32 0
  %9 = va_arg %struct.__va_list_tag* %arraydecay11, i32
  %cmp12 = icmp ne i32 %9, 17
  br i1 %cmp12, label %if.then13, label %if.end14

if.then13:                                        ; preds = %lor.lhs.false10, %lor.lhs.false7, %if.then5
  call void @abort() noreturn nounwind
  unreachable

if.end14:                                         ; preds = %lor.lhs.false10
  br label %if.end15

if.end15:                                         ; preds = %if.end14, %if.else
  br label %if.end16

if.end16:                                         ; preds = %if.end15, %if.end
  %10 = load i32* %v.addr, align 4
  store i32 %10, i32* @bar_arg, align 4
  ret void
}

define void @f0(i32 %i, ...) nounwind uwtable {
entry:
  %i.addr = alloca i32, align 4
  store i32 %i, i32* %i.addr, align 4
  ret void
}

define void @f1(i32 %i, ...) nounwind uwtable {
entry:
  %i.addr = alloca i32, align 4
  %ap = alloca [1 x %struct.__va_list_tag], align 16
  store i32 %i, i32* %i.addr, align 4
  %arraydecay = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %arraydecay1 = bitcast %struct.__va_list_tag* %arraydecay to i8*
  call void @llvm.va_start(i8* %arraydecay1)
  %arraydecay2 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %arraydecay23 = bitcast %struct.__va_list_tag* %arraydecay2 to i8*
  call void @llvm.va_end(i8* %arraydecay23)
  ret void
}

declare void @llvm.va_start(i8*) nounwind

declare void @llvm.va_end(i8*) nounwind

define void @f2(i32 %i, ...) nounwind uwtable {
entry:
  %i.addr = alloca i32, align 4
  %ap = alloca [1 x %struct.__va_list_tag], align 16
  store i32 %i, i32* %i.addr, align 4
  %arraydecay = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %arraydecay1 = bitcast %struct.__va_list_tag* %arraydecay to i8*
  call void @llvm.va_start(i8* %arraydecay1)
  %0 = load double* @d, align 8
  %conv = fptosi double %0 to i32
  call void @bar(i32 %conv)
  %arraydecay2 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %1 = va_arg %struct.__va_list_tag* %arraydecay2, i64
  store i64 %1, i64* @x, align 8
  %2 = load i64* @x, align 8
  %conv3 = trunc i64 %2 to i32
  call void @bar(i32 %conv3)
  %arraydecay4 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %arraydecay45 = bitcast %struct.__va_list_tag* %arraydecay4 to i8*
  call void @llvm.va_end(i8* %arraydecay45)
  ret void
}

define void @f3(i32 %i, ...) nounwind uwtable {
entry:
  %i.addr = alloca i32, align 4
  %ap = alloca [1 x %struct.__va_list_tag], align 16
  store i32 %i, i32* %i.addr, align 4
  %arraydecay = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %arraydecay1 = bitcast %struct.__va_list_tag* %arraydecay to i8*
  call void @llvm.va_start(i8* %arraydecay1)
  %arraydecay2 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %0 = va_arg %struct.__va_list_tag* %arraydecay2, double
  store double %0, double* @d, align 8
  %arraydecay3 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %arraydecay34 = bitcast %struct.__va_list_tag* %arraydecay3 to i8*
  call void @llvm.va_end(i8* %arraydecay34)
  ret void
}

define void @f4(i32 %i, ...) nounwind uwtable {
entry:
  %i.addr = alloca i32, align 4
  %ap = alloca [1 x %struct.__va_list_tag], align 16
  store i32 %i, i32* %i.addr, align 4
  %arraydecay = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %arraydecay1 = bitcast %struct.__va_list_tag* %arraydecay to i8*
  call void @llvm.va_start(i8* %arraydecay1)
  %arraydecay2 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %0 = va_arg %struct.__va_list_tag* %arraydecay2, double
  %conv = fptosi double %0 to i64
  store i64 %conv, i64* @x, align 8
  %1 = load i32* %i.addr, align 4
  %arraydecay3 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  call void @foo(i32 %1, %struct.__va_list_tag* %arraydecay3)
  %arraydecay4 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %arraydecay45 = bitcast %struct.__va_list_tag* %arraydecay4 to i8*
  call void @llvm.va_end(i8* %arraydecay45)
  ret void
}

define void @f5(i32 %i, ...) nounwind uwtable {
entry:
  %i.addr = alloca i32, align 4
  %ap = alloca [1 x %struct.__va_list_tag], align 16
  store i32 %i, i32* %i.addr, align 4
  %arraydecay = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %arraydecay1 = bitcast %struct.__va_list_tag* %arraydecay to i8*
  call void @llvm.va_start(i8* %arraydecay1)
  %arraydecay2 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %0 = bitcast %struct.__va_list_tag* %arraydecay2 to i8*
  call void @llvm.va_copy(i8* bitcast ([1 x %struct.__va_list_tag]* @gap to i8*), i8* %0)
  %1 = load i32* %i.addr, align 4
  call void @bar(i32 %1)
  %arraydecay3 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %arraydecay34 = bitcast %struct.__va_list_tag* %arraydecay3 to i8*
  call void @llvm.va_end(i8* %arraydecay34)
  call void @llvm.va_end(i8* bitcast ([1 x %struct.__va_list_tag]* @gap to i8*))
  ret void
}

declare void @llvm.va_copy(i8*, i8*) nounwind

define void @f6(i32 %i, ...) nounwind uwtable {
entry:
  %i.addr = alloca i32, align 4
  %ap = alloca [1 x %struct.__va_list_tag], align 16
  store i32 %i, i32* %i.addr, align 4
  %arraydecay = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %arraydecay1 = bitcast %struct.__va_list_tag* %arraydecay to i8*
  call void @llvm.va_start(i8* %arraydecay1)
  %0 = load double* @d, align 8
  %conv = fptosi double %0 to i32
  call void @bar(i32 %conv)
  %arraydecay2 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %1 = va_arg %struct.__va_list_tag* %arraydecay2, i64
  %arraydecay3 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %2 = va_arg %struct.__va_list_tag* %arraydecay3, i64
  %arraydecay4 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %3 = va_arg %struct.__va_list_tag* %arraydecay4, i64
  store i64 %3, i64* @x, align 8
  %4 = load i64* @x, align 8
  %conv5 = trunc i64 %4 to i32
  call void @bar(i32 %conv5)
  %arraydecay6 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %arraydecay67 = bitcast %struct.__va_list_tag* %arraydecay6 to i8*
  call void @llvm.va_end(i8* %arraydecay67)
  ret void
}

define void @f7(i32 %i, ...) nounwind uwtable {
entry:
  %i.addr = alloca i32, align 4
  %ap = alloca [1 x %struct.__va_list_tag], align 16
  store i32 %i, i32* %i.addr, align 4
  %arraydecay = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %arraydecay1 = bitcast %struct.__va_list_tag* %arraydecay to i8*
  call void @llvm.va_start(i8* %arraydecay1)
  store [1 x %struct.__va_list_tag]* %ap, [1 x %struct.__va_list_tag]** @pap, align 8
  %0 = load i32* %i.addr, align 4
  call void @bar(i32 %0)
  %arraydecay2 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %arraydecay23 = bitcast %struct.__va_list_tag* %arraydecay2 to i8*
  call void @llvm.va_end(i8* %arraydecay23)
  ret void
}

define void @f8(i32 %i, ...) nounwind uwtable {
entry:
  %i.addr = alloca i32, align 4
  %ap = alloca [1 x %struct.__va_list_tag], align 16
  store i32 %i, i32* %i.addr, align 4
  %arraydecay = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %arraydecay1 = bitcast %struct.__va_list_tag* %arraydecay to i8*
  call void @llvm.va_start(i8* %arraydecay1)
  store [1 x %struct.__va_list_tag]* %ap, [1 x %struct.__va_list_tag]** @pap, align 8
  %0 = load i32* %i.addr, align 4
  call void @bar(i32 %0)
  %arraydecay2 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %1 = va_arg %struct.__va_list_tag* %arraydecay2, double
  store double %1, double* @d, align 8
  %arraydecay3 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %arraydecay34 = bitcast %struct.__va_list_tag* %arraydecay3 to i8*
  call void @llvm.va_end(i8* %arraydecay34)
  ret void
}

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval
  call void (i32, ...)* @f0(i32 1)
  call void (i32, ...)* @f1(i32 2)
  store double 3.100000e+01, double* @d, align 8
  call void (i32, ...)* @f2(i32 3, i64 28)
  %0 = load i32* @bar_arg, align 4
  %cmp = icmp ne i32 %0, 28
  br i1 %cmp, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %1 = load i64* @x, align 8
  %cmp1 = icmp ne i64 %1, 28
  br i1 %cmp1, label %if.then, label %if.end

if.then:                                          ; preds = %lor.lhs.false, %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %lor.lhs.false
  call void (i32, ...)* @f3(i32 4, double 1.310000e+02)
  %2 = load double* @d, align 8
  %cmp2 = fcmp une double %2, 1.310000e+02
  br i1 %cmp2, label %if.then3, label %if.end4

if.then3:                                         ; preds = %if.end
  call void @abort() noreturn nounwind
  unreachable

if.end4:                                          ; preds = %if.end
  call void (i32, ...)* @f4(i32 5, double 1.600000e+01, i32 128)
  %3 = load i64* @x, align 8
  %cmp5 = icmp ne i64 %3, 16
  br i1 %cmp5, label %if.then8, label %lor.lhs.false6

lor.lhs.false6:                                   ; preds = %if.end4
  %4 = load i32* @foo_arg, align 4
  %cmp7 = icmp ne i32 %4, 128
  br i1 %cmp7, label %if.then8, label %if.end9

if.then8:                                         ; preds = %lor.lhs.false6, %if.end4
  call void @abort() noreturn nounwind
  unreachable

if.end9:                                          ; preds = %lor.lhs.false6
  call void (i32, ...)* @f5(i32 16390, double 1.700000e+01, i64 129)
  %5 = load i32* @bar_arg, align 4
  %cmp10 = icmp ne i32 %5, 16390
  br i1 %cmp10, label %if.then11, label %if.end12

if.then11:                                        ; preds = %if.end9
  call void @abort() noreturn nounwind
  unreachable

if.end12:                                         ; preds = %if.end9
  call void (i32, ...)* @f6(i32 7, i64 12, i64 14, i64 -31)
  %6 = load i32* @bar_arg, align 4
  %cmp13 = icmp ne i32 %6, -31
  br i1 %cmp13, label %if.then14, label %if.end15

if.then14:                                        ; preds = %if.end12
  call void @abort() noreturn nounwind
  unreachable

if.end15:                                         ; preds = %if.end12
  call void (i32, ...)* @f7(i32 16392, i64 14, x86_fp80 0xK40068300000000000000, i32 17, double 2.600000e+01)
  %7 = load i32* @bar_arg, align 4
  %cmp16 = icmp ne i32 %7, 16392
  br i1 %cmp16, label %if.then17, label %if.end18

if.then17:                                        ; preds = %if.end15
  call void @abort() noreturn nounwind
  unreachable

if.end18:                                         ; preds = %if.end15
  call void (i32, ...)* @f8(i32 16392, i64 14, x86_fp80 0xK40068300000000000000, i32 17, double 2.700000e+01)
  %8 = load i32* @bar_arg, align 4
  %cmp19 = icmp ne i32 %8, 16392
  br i1 %cmp19, label %if.then22, label %lor.lhs.false20

lor.lhs.false20:                                  ; preds = %if.end18
  %9 = load double* @d, align 8
  %cmp21 = fcmp une double %9, 2.700000e+01
  br i1 %cmp21, label %if.then22, label %if.end23

if.then22:                                        ; preds = %lor.lhs.false20, %if.end18
  call void @abort() noreturn nounwind
  unreachable

if.end23:                                         ; preds = %lor.lhs.false20
  ret i32 0
}
