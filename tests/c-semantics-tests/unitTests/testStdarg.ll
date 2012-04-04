; ModuleID = '/home/david/src/c-semantics/tests/unitTests/testStdarg.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.__va_list_tag = type { i32, i32, i8*, i8* }
%struct.s = type { i32, i32 }

@.str = private unnamed_addr constant [11 x i8] c"arg1 = %d\0A\00", align 1
@.str1 = private unnamed_addr constant [5 x i8] c"%d, \00", align 1
@.str2 = private unnamed_addr constant [15 x i8] c"first == NULL\0A\00", align 1
@.str3 = private unnamed_addr constant [36 x i8] c"%d, %d, %d, %d, %d, %d, %d, %d, %d\0A\00", align 1
@.str4 = private unnamed_addr constant [8 x i8] c"Hello, \00", align 1
@.str5 = private unnamed_addr constant [7 x i8] c"world!\00", align 1
@.str6 = private unnamed_addr constant [2 x i8] c"1\00", align 1
@.str7 = private unnamed_addr constant [3 x i8] c"23\00", align 1
@.str8 = private unnamed_addr constant [4 x i8] c"456\00", align 1
@.str9 = private unnamed_addr constant [4 x i8] c"789\00", align 1
@.str10 = private unnamed_addr constant [4 x i8] c"%s\0A\00", align 1

define void @printargs(i32 %arg1, ...) nounwind uwtable {
entry:
  %arg1.addr = alloca i32, align 4
  %ap = alloca [1 x %struct.__va_list_tag], align 16
  %i = alloca i32, align 4
  store i32 %arg1, i32* %arg1.addr, align 4
  %0 = load i32* %arg1.addr, align 4
  %call = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([11 x i8]* @.str, i32 0, i32 0), i32 %0)
  %arraydecay = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %arraydecay1 = bitcast %struct.__va_list_tag* %arraydecay to i8*
  call void @llvm.va_start(i8* %arraydecay1)
  %1 = load i32* %arg1.addr, align 4
  store i32 %1, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %2 = load i32* %i, align 4
  %cmp = icmp ne i32 %2, -1
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %3 = load i32* %i, align 4
  %call2 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]* @.str1, i32 0, i32 0), i32 %3)
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %arraydecay3 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %4 = va_arg %struct.__va_list_tag* %arraydecay3, i32
  store i32 %4, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %arraydecay4 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %arraydecay45 = bitcast %struct.__va_list_tag* %arraydecay4 to i8*
  call void @llvm.va_end(i8* %arraydecay45)
  %call6 = call i32 @putchar(i32 10)
  ret void
}

declare i32 @printf(i8*, ...)

declare void @llvm.va_start(i8*) nounwind

declare void @llvm.va_end(i8*) nounwind

declare i32 @putchar(i32)

define i8* @vstrcat(i8* %first, ...) nounwind uwtable {
entry:
  %retval = alloca i8*, align 8
  %first.addr = alloca i8*, align 8
  %len = alloca i64, align 8
  %retbuf = alloca i8*, align 8
  %argp = alloca [1 x %struct.__va_list_tag], align 16
  %p = alloca i8*, align 8
  store i8* %first, i8** %first.addr, align 8
  %0 = load i8** %first.addr, align 8
  %cmp = icmp eq i8* %0, null
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %call = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([15 x i8]* @.str2, i32 0, i32 0))
  store i8* null, i8** %retval
  br label %return

if.end:                                           ; preds = %entry
  %1 = load i8** %first.addr, align 8
  %call1 = call i64 @strlen(i8* %1) nounwind readonly
  store i64 %call1, i64* %len, align 8
  %arraydecay = getelementptr inbounds [1 x %struct.__va_list_tag]* %argp, i32 0, i32 0
  %arraydecay2 = bitcast %struct.__va_list_tag* %arraydecay to i8*
  call void @llvm.va_start(i8* %arraydecay2)
  br label %while.cond

while.cond:                                       ; preds = %while.body, %if.end
  %arraydecay3 = getelementptr inbounds [1 x %struct.__va_list_tag]* %argp, i32 0, i32 0
  %2 = va_arg %struct.__va_list_tag* %arraydecay3, i8*
  store i8* %2, i8** %p, align 8
  %cmp4 = icmp ne i8* %2, null
  br i1 %cmp4, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %3 = load i8** %p, align 8
  %call5 = call i64 @strlen(i8* %3) nounwind readonly
  %4 = load i64* %len, align 8
  %add = add i64 %4, %call5
  store i64 %add, i64* %len, align 8
  br label %while.cond

while.end:                                        ; preds = %while.cond
  %arraydecay6 = getelementptr inbounds [1 x %struct.__va_list_tag]* %argp, i32 0, i32 0
  %arraydecay67 = bitcast %struct.__va_list_tag* %arraydecay6 to i8*
  call void @llvm.va_end(i8* %arraydecay67)
  %5 = load i64* %len, align 8
  %add8 = add i64 %5, 1
  %call9 = call noalias i8* @malloc(i64 %add8) nounwind
  store i8* %call9, i8** %retbuf, align 8
  %6 = load i8** %retbuf, align 8
  %cmp10 = icmp eq i8* %6, null
  br i1 %cmp10, label %if.then11, label %if.end12

if.then11:                                        ; preds = %while.end
  store i8* null, i8** %retval
  br label %return

if.end12:                                         ; preds = %while.end
  %7 = load i8** %retbuf, align 8
  %8 = load i8** %first.addr, align 8
  %call13 = call i8* @strcpy(i8* %7, i8* %8) nounwind
  %arraydecay14 = getelementptr inbounds [1 x %struct.__va_list_tag]* %argp, i32 0, i32 0
  %arraydecay1415 = bitcast %struct.__va_list_tag* %arraydecay14 to i8*
  call void @llvm.va_start(i8* %arraydecay1415)
  br label %while.cond16

while.cond16:                                     ; preds = %while.body19, %if.end12
  %arraydecay17 = getelementptr inbounds [1 x %struct.__va_list_tag]* %argp, i32 0, i32 0
  %9 = va_arg %struct.__va_list_tag* %arraydecay17, i8*
  store i8* %9, i8** %p, align 8
  %cmp18 = icmp ne i8* %9, null
  br i1 %cmp18, label %while.body19, label %while.end21

while.body19:                                     ; preds = %while.cond16
  %10 = load i8** %retbuf, align 8
  %11 = load i8** %p, align 8
  %call20 = call i8* @strcat(i8* %10, i8* %11) nounwind
  br label %while.cond16

while.end21:                                      ; preds = %while.cond16
  %arraydecay22 = getelementptr inbounds [1 x %struct.__va_list_tag]* %argp, i32 0, i32 0
  %arraydecay2223 = bitcast %struct.__va_list_tag* %arraydecay22 to i8*
  call void @llvm.va_end(i8* %arraydecay2223)
  %12 = load i8** %retbuf, align 8
  store i8* %12, i8** %retval
  br label %return

return:                                           ; preds = %while.end21, %if.then11, %if.then
  %13 = load i8** %retval
  ret i8* %13
}

declare i64 @strlen(i8*) nounwind readonly

declare noalias i8* @malloc(i64) nounwind

declare i8* @strcpy(i8*, i8*) nounwind

declare i8* @strcat(i8*, i8*) nounwind

define i32 @testDifferent(i32 %x, ...) nounwind uwtable {
entry:
  %x.addr = alloca i32, align 4
  %argp = alloca [1 x %struct.__va_list_tag], align 16
  %y1 = alloca i32, align 4
  %y2 = alloca i32, align 4
  %y3 = alloca i32, align 4
  %y4 = alloca i64, align 8
  %y5 = alloca i64, align 8
  %y6 = alloca double, align 8
  %y7 = alloca double, align 8
  %y6a = alloca i32, align 4
  %y7a = alloca i32, align 4
  %mys = alloca %struct.s, align 4
  store i32 %x, i32* %x.addr, align 4
  %arraydecay = getelementptr inbounds [1 x %struct.__va_list_tag]* %argp, i32 0, i32 0
  %arraydecay1 = bitcast %struct.__va_list_tag* %arraydecay to i8*
  call void @llvm.va_start(i8* %arraydecay1)
  %arraydecay2 = getelementptr inbounds [1 x %struct.__va_list_tag]* %argp, i32 0, i32 0
  %0 = va_arg %struct.__va_list_tag* %arraydecay2, i32
  store i32 %0, i32* %y1, align 4
  %arraydecay3 = getelementptr inbounds [1 x %struct.__va_list_tag]* %argp, i32 0, i32 0
  %1 = va_arg %struct.__va_list_tag* %arraydecay3, i32
  store i32 %1, i32* %y2, align 4
  %arraydecay4 = getelementptr inbounds [1 x %struct.__va_list_tag]* %argp, i32 0, i32 0
  %2 = va_arg %struct.__va_list_tag* %arraydecay4, i32
  store i32 %2, i32* %y3, align 4
  %arraydecay5 = getelementptr inbounds [1 x %struct.__va_list_tag]* %argp, i32 0, i32 0
  %3 = va_arg %struct.__va_list_tag* %arraydecay5, i64
  store i64 %3, i64* %y4, align 8
  %arraydecay6 = getelementptr inbounds [1 x %struct.__va_list_tag]* %argp, i32 0, i32 0
  %4 = va_arg %struct.__va_list_tag* %arraydecay6, i64
  store i64 %4, i64* %y5, align 8
  %arraydecay7 = getelementptr inbounds [1 x %struct.__va_list_tag]* %argp, i32 0, i32 0
  %5 = va_arg %struct.__va_list_tag* %arraydecay7, double
  store double %5, double* %y6, align 8
  %arraydecay8 = getelementptr inbounds [1 x %struct.__va_list_tag]* %argp, i32 0, i32 0
  %6 = va_arg %struct.__va_list_tag* %arraydecay8, double
  store double %6, double* %y7, align 8
  %7 = load double* %y6, align 8
  %mul = fmul double %7, 1.000000e+04
  %conv = fptosi double %mul to i32
  store i32 %conv, i32* %y6a, align 4
  %8 = load double* %y7, align 8
  %mul9 = fmul double %8, 1.000000e+02
  %conv10 = fptosi double %mul9 to i32
  store i32 %conv10, i32* %y7a, align 4
  %arraydecay11 = getelementptr inbounds [1 x %struct.__va_list_tag]* %argp, i32 0, i32 0
  %gp_offset_p = getelementptr inbounds %struct.__va_list_tag* %arraydecay11, i32 0, i32 0
  %gp_offset = load i32* %gp_offset_p
  %fits_in_gp = icmp ule i32 %gp_offset, 40
  br i1 %fits_in_gp, label %vaarg.in_reg, label %vaarg.in_mem

vaarg.in_reg:                                     ; preds = %entry
  %9 = getelementptr inbounds %struct.__va_list_tag* %arraydecay11, i32 0, i32 3
  %reg_save_area = load i8** %9
  %10 = getelementptr i8* %reg_save_area, i32 %gp_offset
  %11 = bitcast i8* %10 to %struct.s*
  %12 = add i32 %gp_offset, 8
  store i32 %12, i32* %gp_offset_p
  br label %vaarg.end

vaarg.in_mem:                                     ; preds = %entry
  %overflow_arg_area_p = getelementptr inbounds %struct.__va_list_tag* %arraydecay11, i32 0, i32 2
  %overflow_arg_area = load i8** %overflow_arg_area_p
  %13 = bitcast i8* %overflow_arg_area to %struct.s*
  %overflow_arg_area.next = getelementptr i8* %overflow_arg_area, i32 8
  store i8* %overflow_arg_area.next, i8** %overflow_arg_area_p
  br label %vaarg.end

vaarg.end:                                        ; preds = %vaarg.in_mem, %vaarg.in_reg
  %vaarg.addr = phi %struct.s* [ %11, %vaarg.in_reg ], [ %13, %vaarg.in_mem ]
  %14 = bitcast %struct.s* %mys to i8*
  %15 = bitcast %struct.s* %vaarg.addr to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %14, i8* %15, i64 8, i32 4, i1 false)
  %16 = load i32* %y1, align 4
  %17 = load i32* %y2, align 4
  %18 = load i32* %y3, align 4
  %19 = load i64* %y4, align 8
  %conv12 = trunc i64 %19 to i32
  %20 = load i64* %y5, align 8
  %conv13 = trunc i64 %20 to i32
  %21 = load i32* %y6a, align 4
  %22 = load i32* %y7a, align 4
  %x14 = getelementptr inbounds %struct.s* %mys, i32 0, i32 0
  %23 = load i32* %x14, align 4
  %y = getelementptr inbounds %struct.s* %mys, i32 0, i32 1
  %24 = load i32* %y, align 4
  %call = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([36 x i8]* @.str3, i32 0, i32 0), i32 %16, i32 %17, i32 %18, i32 %conv12, i32 %conv13, i32 %21, i32 %22, i32 %23, i32 %24)
  %arraydecay15 = getelementptr inbounds [1 x %struct.__va_list_tag]* %argp, i32 0, i32 0
  %arraydecay1516 = bitcast %struct.__va_list_tag* %arraydecay15 to i8*
  call void @llvm.va_end(i8* %arraydecay1516)
  ret i32 0
}

declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture, i64, i32, i1) nounwind

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %str = alloca i8*, align 8
  %mys = alloca %struct.s, align 4
  %mychar = alloca i8, align 1
  %myshort = alloca i16, align 2
  %myfloat = alloca float, align 4
  %mydouble = alloca double, align 8
  store i32 0, i32* %retval
  call void (i32, ...)* @printargs(i32 5, i32 2, i32 14, i32 84, i32 97, i32 15, i32 24, i32 48, i32 -1)
  call void (i32, ...)* @printargs(i32 84, i32 51, i32 -1)
  call void (i32, ...)* @printargs(i32 -1)
  call void (i32, ...)* @printargs(i32 1, i32 -1)
  %call = call i8* (i8*, ...)* @vstrcat(i8* getelementptr inbounds ([8 x i8]* @.str4, i32 0, i32 0), i8* getelementptr inbounds ([7 x i8]* @.str5, i32 0, i32 0), i8* getelementptr inbounds ([2 x i8]* @.str6, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8]* @.str7, i32 0, i32 0), i8* getelementptr inbounds ([4 x i8]* @.str8, i32 0, i32 0), i8* getelementptr inbounds ([4 x i8]* @.str9, i32 0, i32 0), i8* null)
  store i8* %call, i8** %str, align 8
  %0 = load i8** %str, align 8
  %call1 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str10, i32 0, i32 0), i8* %0)
  %x = getelementptr inbounds %struct.s* %mys, i32 0, i32 0
  store i32 100, i32* %x, align 4
  %y = getelementptr inbounds %struct.s* %mys, i32 0, i32 1
  store i32 200, i32* %y, align 4
  store i8 5, i8* %mychar, align 1
  store i16 10, i16* %myshort, align 2
  store float 3.050000e+01, float* %myfloat, align 4
  store double 7.223400e+01, double* %mydouble, align 8
  %1 = load i8* %mychar, align 1
  %conv = sext i8 %1 to i32
  %2 = load i16* %myshort, align 2
  %conv2 = sext i16 %2 to i32
  %3 = load float* %myfloat, align 4
  %conv3 = fpext float %3 to double
  %4 = load double* %mydouble, align 8
  %5 = bitcast %struct.s* %mys to i64*
  %6 = load i64* %5, align 1
  %call4 = call i32 (i32, ...)* @testDifferent(i32 0, i32 %conv, i32 %conv2, i32 15, i64 20, i64 25, double %conv3, double %4, i64 %6)
  ret i32 0
}
