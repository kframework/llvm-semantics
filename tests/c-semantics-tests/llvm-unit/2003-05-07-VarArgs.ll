; ModuleID = '/home/david/src/c-semantics/tests/llvm-unit/2003-05-07-VarArgs.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.QuadWordS_struct = type { i32, double }
%struct.__va_list_tag = type { i32, i32, i8*, i8* }
%struct.DWordS_struct = type { i32, i8 }
%struct.LargeS_struct = type { i32, double, %struct.DWordS_struct*, i32 }

@.str = private unnamed_addr constant [11 x i8] c"string %s\0A\00", align 1
@.str1 = private unnamed_addr constant [8 x i8] c"int %d\0A\00", align 1
@.str2 = private unnamed_addr constant [11 x i8] c"double %d\0A\00", align 1
@.str3 = private unnamed_addr constant [16 x i8] c"long long %lld\0A\00", align 1
@.str4 = private unnamed_addr constant [9 x i8] c"char %c\0A\00", align 1
@.str5 = private unnamed_addr constant [18 x i8] c"DWord { %d, %c }\0A\00", align 1
@.str6 = private unnamed_addr constant [21 x i8] c"QuadWord { %d, %d }\0A\00", align 1
@.str7 = private unnamed_addr constant [29 x i8] c"LargeS { %d, %d, 0x%d, %d }\0A\00", align 1
@main.dw = private unnamed_addr constant { i32, i8, [3 x i8] } { i32 18, i8 97, [3 x i8] undef }, align 4
@main.qw = private unnamed_addr constant %struct.QuadWordS_struct { i32 19, double 2.000000e+01 }, align 8
@.str8 = private unnamed_addr constant [11 x i8] c"ssiciiiiis\00", align 1
@.str9 = private unnamed_addr constant [4 x i8] c"abc\00", align 1
@.str10 = private unnamed_addr constant [4 x i8] c"def\00", align 1
@.str11 = private unnamed_addr constant [14 x i8] c"10 args done!\00", align 1
@.str12 = private unnamed_addr constant [5 x i8] c"ddil\00", align 1
@.str13 = private unnamed_addr constant [4 x i8] c"DQL\00", align 1

define void @test(i8* %fmt, ...) nounwind uwtable {
entry:
  %fmt.addr = alloca i8*, align 8
  %ap = alloca [1 x %struct.__va_list_tag], align 16
  %aq = alloca [1 x %struct.__va_list_tag], align 16
  %d = alloca i32, align 4
  %c = alloca i8, align 1
  %s = alloca i8*, align 8
  %dw = alloca %struct.DWordS_struct, align 4
  %qw = alloca %struct.QuadWordS_struct, align 8
  %ls = alloca %struct.LargeS_struct, align 8
  %tmp = alloca { i32, double }
  store i8* %fmt, i8** %fmt.addr, align 8
  %arraydecay = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %arraydecay1 = bitcast %struct.__va_list_tag* %arraydecay to i8*
  call void @llvm.va_start(i8* %arraydecay1)
  %arraydecay2 = getelementptr inbounds [1 x %struct.__va_list_tag]* %aq, i32 0, i32 0
  %arraydecay3 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %0 = bitcast %struct.__va_list_tag* %arraydecay2 to i8*
  %1 = bitcast %struct.__va_list_tag* %arraydecay3 to i8*
  call void @llvm.va_copy(i8* %0, i8* %1)
  %arraydecay4 = getelementptr inbounds [1 x %struct.__va_list_tag]* %aq, i32 0, i32 0
  %arraydecay45 = bitcast %struct.__va_list_tag* %arraydecay4 to i8*
  call void @llvm.va_end(i8* %arraydecay45)
  br label %while.cond

while.cond:                                       ; preds = %sw.epilog, %entry
  %2 = load i8** %fmt.addr, align 8
  %3 = load i8* %2, align 1
  %tobool = icmp ne i8 %3, 0
  br i1 %tobool, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %4 = load i8** %fmt.addr, align 8
  %incdec.ptr = getelementptr inbounds i8* %4, i32 1
  store i8* %incdec.ptr, i8** %fmt.addr, align 8
  %5 = load i8* %4, align 1
  %conv = sext i8 %5 to i32
  switch i32 %conv, label %sw.epilog [
    i32 115, label %sw.bb
    i32 105, label %sw.bb7
    i32 100, label %sw.bb10
    i32 108, label %sw.bb14
    i32 99, label %sw.bb17
    i32 68, label %sw.bb22
    i32 81, label %sw.bb27
    i32 76, label %sw.bb45
  ]

sw.bb:                                            ; preds = %while.body
  %arraydecay6 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %6 = va_arg %struct.__va_list_tag* %arraydecay6, i8*
  store i8* %6, i8** %s, align 8
  %7 = load i8** %s, align 8
  %call = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([11 x i8]* @.str, i32 0, i32 0), i8* %7)
  br label %sw.epilog

sw.bb7:                                           ; preds = %while.body
  %arraydecay8 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %8 = va_arg %struct.__va_list_tag* %arraydecay8, i32
  store i32 %8, i32* %d, align 4
  %9 = load i32* %d, align 4
  %call9 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([8 x i8]* @.str1, i32 0, i32 0), i32 %9)
  br label %sw.epilog

sw.bb10:                                          ; preds = %while.body
  %arraydecay11 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %10 = va_arg %struct.__va_list_tag* %arraydecay11, double
  %mul = fmul double 1.000000e+04, %10
  %conv12 = fptosi double %mul to i32
  %call13 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([11 x i8]* @.str2, i32 0, i32 0), i32 %conv12)
  br label %sw.epilog

sw.bb14:                                          ; preds = %while.body
  %arraydecay15 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %11 = va_arg %struct.__va_list_tag* %arraydecay15, i64
  %call16 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([16 x i8]* @.str3, i32 0, i32 0), i64 %11)
  br label %sw.epilog

sw.bb17:                                          ; preds = %while.body
  %arraydecay18 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %12 = va_arg %struct.__va_list_tag* %arraydecay18, i32
  %conv19 = trunc i32 %12 to i8
  store i8 %conv19, i8* %c, align 1
  %13 = load i8* %c, align 1
  %conv20 = sext i8 %13 to i32
  %call21 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([9 x i8]* @.str4, i32 0, i32 0), i32 %conv20)
  br label %sw.epilog

sw.bb22:                                          ; preds = %while.body
  %arraydecay23 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %gp_offset_p = getelementptr inbounds %struct.__va_list_tag* %arraydecay23, i32 0, i32 0
  %gp_offset = load i32* %gp_offset_p
  %fits_in_gp = icmp ule i32 %gp_offset, 40
  br i1 %fits_in_gp, label %vaarg.in_reg, label %vaarg.in_mem

vaarg.in_reg:                                     ; preds = %sw.bb22
  %14 = getelementptr inbounds %struct.__va_list_tag* %arraydecay23, i32 0, i32 3
  %reg_save_area = load i8** %14
  %15 = getelementptr i8* %reg_save_area, i32 %gp_offset
  %16 = bitcast i8* %15 to %struct.DWordS_struct*
  %17 = add i32 %gp_offset, 8
  store i32 %17, i32* %gp_offset_p
  br label %vaarg.end

vaarg.in_mem:                                     ; preds = %sw.bb22
  %overflow_arg_area_p = getelementptr inbounds %struct.__va_list_tag* %arraydecay23, i32 0, i32 2
  %overflow_arg_area = load i8** %overflow_arg_area_p
  %18 = bitcast i8* %overflow_arg_area to %struct.DWordS_struct*
  %overflow_arg_area.next = getelementptr i8* %overflow_arg_area, i32 8
  store i8* %overflow_arg_area.next, i8** %overflow_arg_area_p
  br label %vaarg.end

vaarg.end:                                        ; preds = %vaarg.in_mem, %vaarg.in_reg
  %vaarg.addr = phi %struct.DWordS_struct* [ %16, %vaarg.in_reg ], [ %18, %vaarg.in_mem ]
  %19 = bitcast %struct.DWordS_struct* %dw to i8*
  %20 = bitcast %struct.DWordS_struct* %vaarg.addr to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %19, i8* %20, i64 8, i32 4, i1 false)
  %i = getelementptr inbounds %struct.DWordS_struct* %dw, i32 0, i32 0
  %21 = load i32* %i, align 4
  %c24 = getelementptr inbounds %struct.DWordS_struct* %dw, i32 0, i32 1
  %22 = load i8* %c24, align 1
  %conv25 = sext i8 %22 to i32
  %call26 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([18 x i8]* @.str5, i32 0, i32 0), i32 %21, i32 %conv25)
  br label %sw.epilog

sw.bb27:                                          ; preds = %while.body
  %arraydecay28 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %gp_offset_p29 = getelementptr inbounds %struct.__va_list_tag* %arraydecay28, i32 0, i32 0
  %gp_offset30 = load i32* %gp_offset_p29
  %fits_in_gp31 = icmp ule i32 %gp_offset30, 40
  %fp_offset_p = getelementptr inbounds %struct.__va_list_tag* %arraydecay28, i32 0, i32 1
  %fp_offset = load i32* %fp_offset_p
  %fits_in_fp = icmp ule i32 %fp_offset, 160
  %23 = and i1 %fits_in_gp31, %fits_in_fp
  br i1 %23, label %vaarg.in_reg32, label %vaarg.in_mem34

vaarg.in_reg32:                                   ; preds = %sw.bb27
  %24 = getelementptr inbounds %struct.__va_list_tag* %arraydecay28, i32 0, i32 3
  %reg_save_area33 = load i8** %24
  %25 = getelementptr i8* %reg_save_area33, i32 %gp_offset30
  %26 = getelementptr i8* %reg_save_area33, i32 %fp_offset
  %27 = bitcast i8* %25 to i32*
  %28 = load i32* %27
  %29 = getelementptr inbounds { i32, double }* %tmp, i32 0, i32 0
  store i32 %28, i32* %29
  %30 = bitcast i8* %26 to double*
  %31 = load double* %30
  %32 = getelementptr inbounds { i32, double }* %tmp, i32 0, i32 1
  store double %31, double* %32
  %33 = bitcast { i32, double }* %tmp to %struct.QuadWordS_struct*
  %34 = add i32 %gp_offset30, 8
  store i32 %34, i32* %gp_offset_p29
  %35 = add i32 %fp_offset, 16
  store i32 %35, i32* %fp_offset_p
  br label %vaarg.end38

vaarg.in_mem34:                                   ; preds = %sw.bb27
  %overflow_arg_area_p35 = getelementptr inbounds %struct.__va_list_tag* %arraydecay28, i32 0, i32 2
  %overflow_arg_area36 = load i8** %overflow_arg_area_p35
  %36 = bitcast i8* %overflow_arg_area36 to %struct.QuadWordS_struct*
  %overflow_arg_area.next37 = getelementptr i8* %overflow_arg_area36, i32 16
  store i8* %overflow_arg_area.next37, i8** %overflow_arg_area_p35
  br label %vaarg.end38

vaarg.end38:                                      ; preds = %vaarg.in_mem34, %vaarg.in_reg32
  %vaarg.addr39 = phi %struct.QuadWordS_struct* [ %33, %vaarg.in_reg32 ], [ %36, %vaarg.in_mem34 ]
  %37 = bitcast %struct.QuadWordS_struct* %qw to i8*
  %38 = bitcast %struct.QuadWordS_struct* %vaarg.addr39 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %37, i8* %38, i64 16, i32 8, i1 false)
  %i40 = getelementptr inbounds %struct.QuadWordS_struct* %qw, i32 0, i32 0
  %39 = load i32* %i40, align 4
  %d41 = getelementptr inbounds %struct.QuadWordS_struct* %qw, i32 0, i32 1
  %40 = load double* %d41, align 8
  %mul42 = fmul double 1.000000e+04, %40
  %conv43 = fptosi double %mul42 to i32
  %call44 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([21 x i8]* @.str6, i32 0, i32 0), i32 %39, i32 %conv43)
  br label %sw.epilog

sw.bb45:                                          ; preds = %while.body
  %arraydecay46 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %overflow_arg_area_p47 = getelementptr inbounds %struct.__va_list_tag* %arraydecay46, i32 0, i32 2
  %overflow_arg_area48 = load i8** %overflow_arg_area_p47
  %41 = bitcast i8* %overflow_arg_area48 to %struct.LargeS_struct*
  %overflow_arg_area.next49 = getelementptr i8* %overflow_arg_area48, i32 32
  store i8* %overflow_arg_area.next49, i8** %overflow_arg_area_p47
  %42 = bitcast %struct.LargeS_struct* %ls to i8*
  %43 = bitcast %struct.LargeS_struct* %41 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %42, i8* %43, i64 32, i32 8, i1 false)
  %i50 = getelementptr inbounds %struct.LargeS_struct* %ls, i32 0, i32 0
  %44 = load i32* %i50, align 4
  %d51 = getelementptr inbounds %struct.LargeS_struct* %ls, i32 0, i32 1
  %45 = load double* %d51, align 8
  %mul52 = fmul double 1.000000e+04, %45
  %conv53 = fptosi double %mul52 to i32
  %ptr = getelementptr inbounds %struct.LargeS_struct* %ls, i32 0, i32 2
  %46 = load %struct.DWordS_struct** %ptr, align 8
  %cmp = icmp ne %struct.DWordS_struct* %46, null
  %conv54 = zext i1 %cmp to i32
  %j = getelementptr inbounds %struct.LargeS_struct* %ls, i32 0, i32 3
  %47 = load i32* %j, align 4
  %call55 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str7, i32 0, i32 0), i32 %44, i32 %conv53, i32 %conv54, i32 %47)
  br label %sw.epilog

sw.epilog:                                        ; preds = %while.body, %sw.bb45, %vaarg.end38, %vaarg.end, %sw.bb17, %sw.bb14, %sw.bb10, %sw.bb7, %sw.bb
  br label %while.cond

while.end:                                        ; preds = %while.cond
  %arraydecay56 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %arraydecay5657 = bitcast %struct.__va_list_tag* %arraydecay56 to i8*
  call void @llvm.va_end(i8* %arraydecay5657)
  ret void
}

declare void @llvm.va_start(i8*) nounwind

declare void @llvm.va_copy(i8*, i8*) nounwind

declare void @llvm.va_end(i8*) nounwind

declare i32 @printf(i8*, ...)

declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture, i64, i32, i1) nounwind

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %dw = alloca %struct.DWordS_struct, align 4
  %qw = alloca %struct.QuadWordS_struct, align 8
  %ls = alloca %struct.LargeS_struct, align 8
  store i32 0, i32* %retval
  %0 = bitcast %struct.DWordS_struct* %dw to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %0, i8* bitcast ({ i32, i8, [3 x i8] }* @main.dw to i8*), i64 8, i32 4, i1 false)
  %1 = bitcast %struct.QuadWordS_struct* %qw to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %1, i8* bitcast (%struct.QuadWordS_struct* @main.qw to i8*), i64 16, i32 8, i1 false)
  %i = getelementptr inbounds %struct.LargeS_struct* %ls, i32 0, i32 0
  store i32 21, i32* %i, align 4
  %d = getelementptr inbounds %struct.LargeS_struct* %ls, i32 0, i32 1
  store double 2.200000e+01, double* %d, align 8
  %ptr = getelementptr inbounds %struct.LargeS_struct* %ls, i32 0, i32 2
  store %struct.DWordS_struct* %dw, %struct.DWordS_struct** %ptr, align 8
  %j = getelementptr inbounds %struct.LargeS_struct* %ls, i32 0, i32 3
  store i32 23, i32* %j, align 4
  call void (i8*, ...)* @test(i8* getelementptr inbounds ([11 x i8]* @.str8, i32 0, i32 0), i8* getelementptr inbounds ([4 x i8]* @.str9, i32 0, i32 0), i8* getelementptr inbounds ([4 x i8]* @.str10, i32 0, i32 0), i32 -123, i32 97, i32 123, i32 6, i32 7, i32 8, i32 9, i8* getelementptr inbounds ([14 x i8]* @.str11, i32 0, i32 0))
  call void (i8*, ...)* @test(i8* getelementptr inbounds ([5 x i8]* @.str12, i32 0, i32 0), double 1.000000e+00, double 2.000000e+00, i32 32764, i64 12345677823423)
  %2 = bitcast %struct.DWordS_struct* %dw to i64*
  %3 = load i64* %2, align 1
  %4 = bitcast %struct.QuadWordS_struct* %qw to { i32, double }*
  %5 = getelementptr { i32, double }* %4, i32 0, i32 0
  %6 = load i32* %5, align 1
  %7 = getelementptr { i32, double }* %4, i32 0, i32 1
  %8 = load double* %7, align 1
  call void (i8*, ...)* @test(i8* getelementptr inbounds ([4 x i8]* @.str13, i32 0, i32 0), i64 %3, i32 %6, double %8, %struct.LargeS_struct* byval align 8 %ls)
  ret i32 0
}
