; ModuleID = 'smallStdarg.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

%struct.__va_list_tag = type { i32, i32, i8*, i8* }
%struct.s = type { i32, i32 }

@.str = private unnamed_addr constant [8 x i8] c"Hello, \00", align 1
@.str1 = private unnamed_addr constant [7 x i8] c"world!\00", align 1
@.str2 = private unnamed_addr constant [2 x i8] c"1\00", align 1
@.str3 = private unnamed_addr constant [3 x i8] c"23\00", align 1
@.str4 = private unnamed_addr constant [4 x i8] c"456\00", align 1
@.str5 = private unnamed_addr constant [4 x i8] c"789\00", align 1

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

define void @printargs(i32 %arg1, ...) nounwind uwtable {
entry:
  %arg1.addr = alloca i32, align 4
  %ap = alloca [1 x %struct.__va_list_tag], align 16
  %i = alloca i32, align 4
  store i32 %arg1, i32* %arg1.addr, align 4
  %arraydecay = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %arraydecay1 = bitcast %struct.__va_list_tag* %arraydecay to i8*
  call void @llvm.va_start(i8* %arraydecay1)
  %tmp = load i32* %arg1.addr, align 4
  store i32 %tmp, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %vaarg.end, %entry
  %tmp2 = load i32* %i, align 4
  %cmp = icmp ne i32 %tmp2, -1
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %arraydecay3 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %gp_offset_p = getelementptr inbounds %struct.__va_list_tag* %arraydecay3, i32 0, i32 0
  %gp_offset = load i32* %gp_offset_p
  %fits_in_gp = icmp ule i32 %gp_offset, 40
  br i1 %fits_in_gp, label %vaarg.in_reg, label %vaarg.in_mem

vaarg.in_reg:                                     ; preds = %for.inc
  %0 = getelementptr inbounds %struct.__va_list_tag* %arraydecay3, i32 0, i32 3
  %reg_save_area = load i8** %0
  %1 = getelementptr i8* %reg_save_area, i32 %gp_offset
  %2 = bitcast i8* %1 to i32*
  %3 = add i32 %gp_offset, 8
  store i32 %3, i32* %gp_offset_p
  br label %vaarg.end

vaarg.in_mem:                                     ; preds = %for.inc
  %overflow_arg_area_p = getelementptr inbounds %struct.__va_list_tag* %arraydecay3, i32 0, i32 2
  %overflow_arg_area = load i8** %overflow_arg_area_p
  %4 = bitcast i8* %overflow_arg_area to i32*
  %overflow_arg_area.next = getelementptr i8* %overflow_arg_area, i32 8
  store i8* %overflow_arg_area.next, i8** %overflow_arg_area_p
  br label %vaarg.end

vaarg.end:                                        ; preds = %vaarg.in_mem, %vaarg.in_reg
  %vaarg.addr = phi i32* [ %2, %vaarg.in_reg ], [ %4, %vaarg.in_mem ]
  %5 = load i32* %vaarg.addr
  store i32 %5, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %arraydecay4 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %arraydecay45 = bitcast %struct.__va_list_tag* %arraydecay4 to i8*
  call void @llvm.va_end(i8* %arraydecay45)
  ret void
}

declare void @llvm.va_start(i8*) nounwind

declare void @llvm.va_end(i8*) nounwind

define i8* @vstrcat(i8* %first, ...) nounwind uwtable {
entry:
  %retval = alloca i8*, align 8
  %first.addr = alloca i8*, align 8
  %len = alloca i64, align 8
  %retbuf = alloca i8*, align 8
  %argp = alloca [1 x %struct.__va_list_tag], align 16
  %p = alloca i8*, align 8
  store i8* %first, i8** %first.addr, align 8
  %tmp = load i8** %first.addr, align 8
  %cmp = icmp eq i8* %tmp, null
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  store i8* null, i8** %retval
  br label %return

if.end:                                           ; preds = %entry
  %arraydecay = getelementptr inbounds [1 x %struct.__va_list_tag]* %argp, i32 0, i32 0
  %arraydecay1 = bitcast %struct.__va_list_tag* %arraydecay to i8*
  call void @llvm.va_start(i8* %arraydecay1)
  %arraydecay2 = getelementptr inbounds [1 x %struct.__va_list_tag]* %argp, i32 0, i32 0
  %arraydecay23 = bitcast %struct.__va_list_tag* %arraydecay2 to i8*
  call void @llvm.va_end(i8* %arraydecay23)
  %tmp4 = load i8** %retbuf, align 8
  store i8* %tmp4, i8** %retval
  br label %return

return:                                           ; preds = %if.end, %if.then
  %0 = load i8** %retval
  ret i8* %0
}

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
  %gp_offset_p = getelementptr inbounds %struct.__va_list_tag* %arraydecay2, i32 0, i32 0
  %gp_offset = load i32* %gp_offset_p
  %fits_in_gp = icmp ule i32 %gp_offset, 40
  br i1 %fits_in_gp, label %vaarg.in_reg, label %vaarg.in_mem

vaarg.in_reg:                                     ; preds = %entry
  %0 = getelementptr inbounds %struct.__va_list_tag* %arraydecay2, i32 0, i32 3
  %reg_save_area = load i8** %0
  %1 = getelementptr i8* %reg_save_area, i32 %gp_offset
  %2 = bitcast i8* %1 to i32*
  %3 = add i32 %gp_offset, 8
  store i32 %3, i32* %gp_offset_p
  br label %vaarg.end

vaarg.in_mem:                                     ; preds = %entry
  %overflow_arg_area_p = getelementptr inbounds %struct.__va_list_tag* %arraydecay2, i32 0, i32 2
  %overflow_arg_area = load i8** %overflow_arg_area_p
  %4 = bitcast i8* %overflow_arg_area to i32*
  %overflow_arg_area.next = getelementptr i8* %overflow_arg_area, i32 8
  store i8* %overflow_arg_area.next, i8** %overflow_arg_area_p
  br label %vaarg.end

vaarg.end:                                        ; preds = %vaarg.in_mem, %vaarg.in_reg
  %vaarg.addr = phi i32* [ %2, %vaarg.in_reg ], [ %4, %vaarg.in_mem ]
  %5 = load i32* %vaarg.addr
  store i32 %5, i32* %y1, align 4
  %arraydecay3 = getelementptr inbounds [1 x %struct.__va_list_tag]* %argp, i32 0, i32 0
  %gp_offset_p4 = getelementptr inbounds %struct.__va_list_tag* %arraydecay3, i32 0, i32 0
  %gp_offset5 = load i32* %gp_offset_p4
  %fits_in_gp6 = icmp ule i32 %gp_offset5, 40
  br i1 %fits_in_gp6, label %vaarg.in_reg7, label %vaarg.in_mem9

vaarg.in_reg7:                                    ; preds = %vaarg.end
  %6 = getelementptr inbounds %struct.__va_list_tag* %arraydecay3, i32 0, i32 3
  %reg_save_area8 = load i8** %6
  %7 = getelementptr i8* %reg_save_area8, i32 %gp_offset5
  %8 = bitcast i8* %7 to i32*
  %9 = add i32 %gp_offset5, 8
  store i32 %9, i32* %gp_offset_p4
  br label %vaarg.end13

vaarg.in_mem9:                                    ; preds = %vaarg.end
  %overflow_arg_area_p10 = getelementptr inbounds %struct.__va_list_tag* %arraydecay3, i32 0, i32 2
  %overflow_arg_area11 = load i8** %overflow_arg_area_p10
  %10 = bitcast i8* %overflow_arg_area11 to i32*
  %overflow_arg_area.next12 = getelementptr i8* %overflow_arg_area11, i32 8
  store i8* %overflow_arg_area.next12, i8** %overflow_arg_area_p10
  br label %vaarg.end13

vaarg.end13:                                      ; preds = %vaarg.in_mem9, %vaarg.in_reg7
  %vaarg.addr14 = phi i32* [ %8, %vaarg.in_reg7 ], [ %10, %vaarg.in_mem9 ]
  %11 = load i32* %vaarg.addr14
  store i32 %11, i32* %y2, align 4
  %arraydecay15 = getelementptr inbounds [1 x %struct.__va_list_tag]* %argp, i32 0, i32 0
  %gp_offset_p16 = getelementptr inbounds %struct.__va_list_tag* %arraydecay15, i32 0, i32 0
  %gp_offset17 = load i32* %gp_offset_p16
  %fits_in_gp18 = icmp ule i32 %gp_offset17, 40
  br i1 %fits_in_gp18, label %vaarg.in_reg19, label %vaarg.in_mem21

vaarg.in_reg19:                                   ; preds = %vaarg.end13
  %12 = getelementptr inbounds %struct.__va_list_tag* %arraydecay15, i32 0, i32 3
  %reg_save_area20 = load i8** %12
  %13 = getelementptr i8* %reg_save_area20, i32 %gp_offset17
  %14 = bitcast i8* %13 to i32*
  %15 = add i32 %gp_offset17, 8
  store i32 %15, i32* %gp_offset_p16
  br label %vaarg.end25

vaarg.in_mem21:                                   ; preds = %vaarg.end13
  %overflow_arg_area_p22 = getelementptr inbounds %struct.__va_list_tag* %arraydecay15, i32 0, i32 2
  %overflow_arg_area23 = load i8** %overflow_arg_area_p22
  %16 = bitcast i8* %overflow_arg_area23 to i32*
  %overflow_arg_area.next24 = getelementptr i8* %overflow_arg_area23, i32 8
  store i8* %overflow_arg_area.next24, i8** %overflow_arg_area_p22
  br label %vaarg.end25

vaarg.end25:                                      ; preds = %vaarg.in_mem21, %vaarg.in_reg19
  %vaarg.addr26 = phi i32* [ %14, %vaarg.in_reg19 ], [ %16, %vaarg.in_mem21 ]
  %17 = load i32* %vaarg.addr26
  store i32 %17, i32* %y3, align 4
  %arraydecay27 = getelementptr inbounds [1 x %struct.__va_list_tag]* %argp, i32 0, i32 0
  %gp_offset_p28 = getelementptr inbounds %struct.__va_list_tag* %arraydecay27, i32 0, i32 0
  %gp_offset29 = load i32* %gp_offset_p28
  %fits_in_gp30 = icmp ule i32 %gp_offset29, 40
  br i1 %fits_in_gp30, label %vaarg.in_reg31, label %vaarg.in_mem33

vaarg.in_reg31:                                   ; preds = %vaarg.end25
  %18 = getelementptr inbounds %struct.__va_list_tag* %arraydecay27, i32 0, i32 3
  %reg_save_area32 = load i8** %18
  %19 = getelementptr i8* %reg_save_area32, i32 %gp_offset29
  %20 = bitcast i8* %19 to i64*
  %21 = add i32 %gp_offset29, 8
  store i32 %21, i32* %gp_offset_p28
  br label %vaarg.end37

vaarg.in_mem33:                                   ; preds = %vaarg.end25
  %overflow_arg_area_p34 = getelementptr inbounds %struct.__va_list_tag* %arraydecay27, i32 0, i32 2
  %overflow_arg_area35 = load i8** %overflow_arg_area_p34
  %22 = bitcast i8* %overflow_arg_area35 to i64*
  %overflow_arg_area.next36 = getelementptr i8* %overflow_arg_area35, i32 8
  store i8* %overflow_arg_area.next36, i8** %overflow_arg_area_p34
  br label %vaarg.end37

vaarg.end37:                                      ; preds = %vaarg.in_mem33, %vaarg.in_reg31
  %vaarg.addr38 = phi i64* [ %20, %vaarg.in_reg31 ], [ %22, %vaarg.in_mem33 ]
  %23 = load i64* %vaarg.addr38
  store i64 %23, i64* %y4, align 8
  %arraydecay39 = getelementptr inbounds [1 x %struct.__va_list_tag]* %argp, i32 0, i32 0
  %gp_offset_p40 = getelementptr inbounds %struct.__va_list_tag* %arraydecay39, i32 0, i32 0
  %gp_offset41 = load i32* %gp_offset_p40
  %fits_in_gp42 = icmp ule i32 %gp_offset41, 40
  br i1 %fits_in_gp42, label %vaarg.in_reg43, label %vaarg.in_mem45

vaarg.in_reg43:                                   ; preds = %vaarg.end37
  %24 = getelementptr inbounds %struct.__va_list_tag* %arraydecay39, i32 0, i32 3
  %reg_save_area44 = load i8** %24
  %25 = getelementptr i8* %reg_save_area44, i32 %gp_offset41
  %26 = bitcast i8* %25 to i64*
  %27 = add i32 %gp_offset41, 8
  store i32 %27, i32* %gp_offset_p40
  br label %vaarg.end49

vaarg.in_mem45:                                   ; preds = %vaarg.end37
  %overflow_arg_area_p46 = getelementptr inbounds %struct.__va_list_tag* %arraydecay39, i32 0, i32 2
  %overflow_arg_area47 = load i8** %overflow_arg_area_p46
  %28 = bitcast i8* %overflow_arg_area47 to i64*
  %overflow_arg_area.next48 = getelementptr i8* %overflow_arg_area47, i32 8
  store i8* %overflow_arg_area.next48, i8** %overflow_arg_area_p46
  br label %vaarg.end49

vaarg.end49:                                      ; preds = %vaarg.in_mem45, %vaarg.in_reg43
  %vaarg.addr50 = phi i64* [ %26, %vaarg.in_reg43 ], [ %28, %vaarg.in_mem45 ]
  %29 = load i64* %vaarg.addr50
  store i64 %29, i64* %y5, align 8
  %arraydecay51 = getelementptr inbounds [1 x %struct.__va_list_tag]* %argp, i32 0, i32 0
  %fp_offset_p = getelementptr inbounds %struct.__va_list_tag* %arraydecay51, i32 0, i32 1
  %fp_offset = load i32* %fp_offset_p
  %fits_in_fp = icmp ule i32 %fp_offset, 160
  br i1 %fits_in_fp, label %vaarg.in_reg52, label %vaarg.in_mem54

vaarg.in_reg52:                                   ; preds = %vaarg.end49
  %30 = getelementptr inbounds %struct.__va_list_tag* %arraydecay51, i32 0, i32 3
  %reg_save_area53 = load i8** %30
  %31 = getelementptr i8* %reg_save_area53, i32 %fp_offset
  %32 = bitcast i8* %31 to double*
  %33 = add i32 %fp_offset, 16
  store i32 %33, i32* %fp_offset_p
  br label %vaarg.end58

vaarg.in_mem54:                                   ; preds = %vaarg.end49
  %overflow_arg_area_p55 = getelementptr inbounds %struct.__va_list_tag* %arraydecay51, i32 0, i32 2
  %overflow_arg_area56 = load i8** %overflow_arg_area_p55
  %34 = bitcast i8* %overflow_arg_area56 to double*
  %overflow_arg_area.next57 = getelementptr i8* %overflow_arg_area56, i32 8
  store i8* %overflow_arg_area.next57, i8** %overflow_arg_area_p55
  br label %vaarg.end58

vaarg.end58:                                      ; preds = %vaarg.in_mem54, %vaarg.in_reg52
  %vaarg.addr59 = phi double* [ %32, %vaarg.in_reg52 ], [ %34, %vaarg.in_mem54 ]
  %35 = load double* %vaarg.addr59
  store double %35, double* %y6, align 8
  %arraydecay60 = getelementptr inbounds [1 x %struct.__va_list_tag]* %argp, i32 0, i32 0
  %fp_offset_p61 = getelementptr inbounds %struct.__va_list_tag* %arraydecay60, i32 0, i32 1
  %fp_offset62 = load i32* %fp_offset_p61
  %fits_in_fp63 = icmp ule i32 %fp_offset62, 160
  br i1 %fits_in_fp63, label %vaarg.in_reg64, label %vaarg.in_mem66

vaarg.in_reg64:                                   ; preds = %vaarg.end58
  %36 = getelementptr inbounds %struct.__va_list_tag* %arraydecay60, i32 0, i32 3
  %reg_save_area65 = load i8** %36
  %37 = getelementptr i8* %reg_save_area65, i32 %fp_offset62
  %38 = bitcast i8* %37 to double*
  %39 = add i32 %fp_offset62, 16
  store i32 %39, i32* %fp_offset_p61
  br label %vaarg.end70

vaarg.in_mem66:                                   ; preds = %vaarg.end58
  %overflow_arg_area_p67 = getelementptr inbounds %struct.__va_list_tag* %arraydecay60, i32 0, i32 2
  %overflow_arg_area68 = load i8** %overflow_arg_area_p67
  %40 = bitcast i8* %overflow_arg_area68 to double*
  %overflow_arg_area.next69 = getelementptr i8* %overflow_arg_area68, i32 8
  store i8* %overflow_arg_area.next69, i8** %overflow_arg_area_p67
  br label %vaarg.end70

vaarg.end70:                                      ; preds = %vaarg.in_mem66, %vaarg.in_reg64
  %vaarg.addr71 = phi double* [ %38, %vaarg.in_reg64 ], [ %40, %vaarg.in_mem66 ]
  %41 = load double* %vaarg.addr71
  store double %41, double* %y7, align 8
  %tmp = load double* %y6, align 8
  %mul = fmul double %tmp, 1.000000e+04
  %conv = fptosi double %mul to i32
  store i32 %conv, i32* %y6a, align 4
  %tmp73 = load double* %y7, align 8
  %mul74 = fmul double %tmp73, 1.000000e+02
  %conv75 = fptosi double %mul74 to i32
  store i32 %conv75, i32* %y7a, align 4
  %arraydecay77 = getelementptr inbounds [1 x %struct.__va_list_tag]* %argp, i32 0, i32 0
  %gp_offset_p78 = getelementptr inbounds %struct.__va_list_tag* %arraydecay77, i32 0, i32 0
  %gp_offset79 = load i32* %gp_offset_p78
  %fits_in_gp80 = icmp ule i32 %gp_offset79, 40
  br i1 %fits_in_gp80, label %vaarg.in_reg81, label %vaarg.in_mem83

vaarg.in_reg81:                                   ; preds = %vaarg.end70
  %42 = getelementptr inbounds %struct.__va_list_tag* %arraydecay77, i32 0, i32 3
  %reg_save_area82 = load i8** %42
  %43 = getelementptr i8* %reg_save_area82, i32 %gp_offset79
  %44 = bitcast i8* %43 to %struct.s*
  %45 = add i32 %gp_offset79, 8
  store i32 %45, i32* %gp_offset_p78
  br label %vaarg.end87

vaarg.in_mem83:                                   ; preds = %vaarg.end70
  %overflow_arg_area_p84 = getelementptr inbounds %struct.__va_list_tag* %arraydecay77, i32 0, i32 2
  %overflow_arg_area85 = load i8** %overflow_arg_area_p84
  %46 = bitcast i8* %overflow_arg_area85 to %struct.s*
  %overflow_arg_area.next86 = getelementptr i8* %overflow_arg_area85, i32 8
  store i8* %overflow_arg_area.next86, i8** %overflow_arg_area_p84
  br label %vaarg.end87

vaarg.end87:                                      ; preds = %vaarg.in_mem83, %vaarg.in_reg81
  %vaarg.addr88 = phi %struct.s* [ %44, %vaarg.in_reg81 ], [ %46, %vaarg.in_mem83 ]
  %tmp89 = bitcast %struct.s* %mys to i8*
  %tmp90 = bitcast %struct.s* %vaarg.addr88 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %tmp89, i8* %tmp90, i64 8, i32 4, i1 false)
  %arraydecay91 = getelementptr inbounds [1 x %struct.__va_list_tag]* %argp, i32 0, i32 0
  %arraydecay9192 = bitcast %struct.__va_list_tag* %arraydecay91 to i8*
  call void @llvm.va_end(i8* %arraydecay9192)
  ret i32 0
}

declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture, i64, i32, i1) nounwind

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %mys = alloca %struct.s, align 4
  %mychar = alloca i8, align 1
  %myshort = alloca i16, align 2
  store i32 0, i32* %retval
  call void (i32, ...)* @printargs(i32 5, i32 2, i32 14, i32 84, i32 97, i32 15, i32 24, i32 48, i32 -1)
  call void (i32, ...)* @printargs(i32 84, i32 51, i32 -1)
  call void (i32, ...)* @printargs(i32 -1)
  call void (i32, ...)* @printargs(i32 1, i32 -1)
  %call = call i8* (i8*, ...)* @vstrcat(i8* getelementptr inbounds ([8 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([7 x i8]* @.str1, i32 0, i32 0), i8* getelementptr inbounds ([2 x i8]* @.str2, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8]* @.str3, i32 0, i32 0), i8* getelementptr inbounds ([4 x i8]* @.str4, i32 0, i32 0), i8* getelementptr inbounds ([4 x i8]* @.str5, i32 0, i32 0), i8* null)
  %x = getelementptr inbounds %struct.s* %mys, i32 0, i32 0
  store i32 100, i32* %x, align 4
  %y = getelementptr inbounds %struct.s* %mys, i32 0, i32 1
  store i32 200, i32* %y, align 4
  store i8 5, i8* %mychar, align 1
  store i16 10, i16* %myshort, align 2
  %tmp = load i8* %mychar, align 1
  %conv = sext i8 %tmp to i32
  %tmp1 = load i16* %myshort, align 2
  %conv2 = sext i16 %tmp1 to i32
  %call3 = call i32 (i32, ...)* @testDifferent(i32 0, i32 %conv, i32 %conv2, i32 15, i64 20, i64 25, %struct.s* byval align 8 %mys)
  ret i32 0
}
