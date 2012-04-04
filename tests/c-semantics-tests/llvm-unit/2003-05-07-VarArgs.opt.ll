; ModuleID = '/home/david/src/c-semantics/tests/llvm-unit/2003-05-07-VarArgs.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.__va_list_tag = type { i32, i32, i8*, i8* }
%struct.QuadWordS_struct = type { i32, double }
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
@.str8 = private unnamed_addr constant [11 x i8] c"ssiciiiiis\00", align 1
@.str9 = private unnamed_addr constant [4 x i8] c"abc\00", align 1
@.str10 = private unnamed_addr constant [4 x i8] c"def\00", align 1
@.str11 = private unnamed_addr constant [14 x i8] c"10 args done!\00", align 1
@.str12 = private unnamed_addr constant [5 x i8] c"ddil\00", align 1
@.str13 = private unnamed_addr constant [4 x i8] c"DQL\00", align 1

define void @test(i8* nocapture %fmt, ...) nounwind uwtable {
entry:
  %ap = alloca [1 x %struct.__va_list_tag], align 16
  %aq = alloca [1 x %struct.__va_list_tag], align 16
  %tmp = alloca { i32, double }, align 8
  %arraydecay = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i64 0, i64 0
  %arraydecay1 = bitcast [1 x %struct.__va_list_tag]* %ap to i8*
  call void @llvm.va_start(i8* %arraydecay1)
  %0 = bitcast [1 x %struct.__va_list_tag]* %aq to i8*
  call void @llvm.va_copy(i8* %0, i8* %arraydecay1)
  call void @llvm.va_end(i8* %0)
  %1 = load i8* %fmt, align 1, !tbaa !0
  %tobool67 = icmp eq i8 %1, 0
  br i1 %tobool67, label %while.end, label %while.body.lr.ph

while.body.lr.ph:                                 ; preds = %entry
  %gp_offset_p = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i64 0, i64 0, i32 0
  %2 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i64 0, i64 0, i32 3
  %overflow_arg_area_p = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i64 0, i64 0, i32 2
  %fp_offset_p = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i64 0, i64 0, i32 1
  %3 = getelementptr inbounds { i32, double }* %tmp, i64 0, i32 0
  %4 = getelementptr inbounds { i32, double }* %tmp, i64 0, i32 1
  %5 = bitcast { i32, double }* %tmp to %struct.QuadWordS_struct*
  br label %while.body

while.body:                                       ; preds = %while.body.lr.ph, %while.cond.backedge
  %6 = phi i8 [ %1, %while.body.lr.ph ], [ %7, %while.cond.backedge ]
  %fmt.addr.068 = phi i8* [ %fmt, %while.body.lr.ph ], [ %incdec.ptr, %while.cond.backedge ]
  %incdec.ptr = getelementptr inbounds i8* %fmt.addr.068, i64 1
  %conv = sext i8 %6 to i32
  switch i32 %conv, label %while.cond.backedge [
    i32 115, label %sw.bb
    i32 105, label %sw.bb7
    i32 100, label %sw.bb10
    i32 108, label %sw.bb14
    i32 99, label %sw.bb17
    i32 68, label %sw.bb22
    i32 81, label %sw.bb27
    i32 76, label %sw.bb45
  ]

while.cond.backedge:                              ; preds = %while.body, %sw.bb45, %vaarg.end38, %vaarg.end, %sw.bb17, %sw.bb14, %sw.bb10, %sw.bb7, %sw.bb
  %7 = load i8* %incdec.ptr, align 1, !tbaa !0
  %tobool = icmp eq i8 %7, 0
  br i1 %tobool, label %while.end, label %while.body

sw.bb:                                            ; preds = %while.body
  %8 = va_arg %struct.__va_list_tag* %arraydecay, i8*
  %call = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([11 x i8]* @.str, i64 0, i64 0), i8* %8) nounwind
  br label %while.cond.backedge

sw.bb7:                                           ; preds = %while.body
  %9 = va_arg %struct.__va_list_tag* %arraydecay, i32
  %call9 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([8 x i8]* @.str1, i64 0, i64 0), i32 %9) nounwind
  br label %while.cond.backedge

sw.bb10:                                          ; preds = %while.body
  %10 = va_arg %struct.__va_list_tag* %arraydecay, double
  %mul = fmul double %10, 1.000000e+04
  %conv12 = fptosi double %mul to i32
  %call13 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([11 x i8]* @.str2, i64 0, i64 0), i32 %conv12) nounwind
  br label %while.cond.backedge

sw.bb14:                                          ; preds = %while.body
  %11 = va_arg %struct.__va_list_tag* %arraydecay, i64
  %call16 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([16 x i8]* @.str3, i64 0, i64 0), i64 %11) nounwind
  br label %while.cond.backedge

sw.bb17:                                          ; preds = %while.body
  %12 = va_arg %struct.__va_list_tag* %arraydecay, i32
  %sext = shl i32 %12, 24
  %conv20 = ashr exact i32 %sext, 24
  %call21 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([9 x i8]* @.str4, i64 0, i64 0), i32 %conv20) nounwind
  br label %while.cond.backedge

sw.bb22:                                          ; preds = %while.body
  %gp_offset = load i32* %gp_offset_p, align 16
  %fits_in_gp = icmp ult i32 %gp_offset, 41
  br i1 %fits_in_gp, label %vaarg.in_reg, label %vaarg.in_mem

vaarg.in_reg:                                     ; preds = %sw.bb22
  %reg_save_area = load i8** %2, align 16
  %13 = sext i32 %gp_offset to i64
  %14 = getelementptr i8* %reg_save_area, i64 %13
  %15 = add i32 %gp_offset, 8
  store i32 %15, i32* %gp_offset_p, align 16
  br label %vaarg.end

vaarg.in_mem:                                     ; preds = %sw.bb22
  %overflow_arg_area = load i8** %overflow_arg_area_p, align 8
  %overflow_arg_area.next = getelementptr i8* %overflow_arg_area, i64 8
  store i8* %overflow_arg_area.next, i8** %overflow_arg_area_p, align 8
  br label %vaarg.end

vaarg.end:                                        ; preds = %vaarg.in_mem, %vaarg.in_reg
  %vaarg.addr.in = phi i8* [ %14, %vaarg.in_reg ], [ %overflow_arg_area, %vaarg.in_mem ]
  %vaarg.addr.0 = bitcast i8* %vaarg.addr.in to i32*
  %tmp65 = load i32* %vaarg.addr.0, align 4
  %16 = getelementptr inbounds i8* %vaarg.addr.in, i64 4
  %tmp66 = load i8* %16, align 4
  %conv25 = sext i8 %tmp66 to i32
  %call26 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([18 x i8]* @.str5, i64 0, i64 0), i32 %tmp65, i32 %conv25) nounwind
  br label %while.cond.backedge

sw.bb27:                                          ; preds = %while.body
  %17 = bitcast [1 x %struct.__va_list_tag]* %ap to i64*
  %gp_offset30 = load i64* %17, align 16
  %18 = trunc i64 %gp_offset30 to i32
  %fits_in_gp31 = icmp ult i32 %18, 41
  %19 = lshr i64 %gp_offset30, 32
  %20 = trunc i64 %19 to i32
  %fits_in_fp = icmp ult i32 %20, 161
  %21 = and i1 %fits_in_gp31, %fits_in_fp
  br i1 %21, label %vaarg.in_reg32, label %vaarg.in_mem34

vaarg.in_reg32:                                   ; preds = %sw.bb27
  %reg_save_area33 = load i8** %2, align 16
  %22 = sext i32 %18 to i64
  %23 = getelementptr i8* %reg_save_area33, i64 %22
  %24 = sext i32 %20 to i64
  %25 = getelementptr i8* %reg_save_area33, i64 %24
  %26 = bitcast i8* %23 to i32*
  %27 = load i32* %26, align 4
  store i32 %27, i32* %3, align 8
  %28 = bitcast i8* %25 to double*
  %29 = load double* %28, align 8
  store double %29, double* %4, align 8
  %30 = add i32 %18, 8
  store i32 %30, i32* %gp_offset_p, align 16
  %31 = add i32 %20, 16
  store i32 %31, i32* %fp_offset_p, align 4
  br label %vaarg.end38

vaarg.in_mem34:                                   ; preds = %sw.bb27
  %overflow_arg_area36 = load i8** %overflow_arg_area_p, align 8
  %32 = bitcast i8* %overflow_arg_area36 to %struct.QuadWordS_struct*
  %overflow_arg_area.next37 = getelementptr i8* %overflow_arg_area36, i64 16
  store i8* %overflow_arg_area.next37, i8** %overflow_arg_area_p, align 8
  br label %vaarg.end38

vaarg.end38:                                      ; preds = %vaarg.in_mem34, %vaarg.in_reg32
  %vaarg.addr39 = phi %struct.QuadWordS_struct* [ %5, %vaarg.in_reg32 ], [ %32, %vaarg.in_mem34 ]
  %vaarg.addr39.0 = getelementptr inbounds %struct.QuadWordS_struct* %vaarg.addr39, i64 0, i32 0
  %tmp63 = load i32* %vaarg.addr39.0, align 8
  %vaarg.addr39.1 = getelementptr inbounds %struct.QuadWordS_struct* %vaarg.addr39, i64 0, i32 1
  %tmp64 = load double* %vaarg.addr39.1, align 8
  %mul42 = fmul double %tmp64, 1.000000e+04
  %conv43 = fptosi double %mul42 to i32
  %call44 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([21 x i8]* @.str6, i64 0, i64 0), i32 %tmp63, i32 %conv43) nounwind
  br label %while.cond.backedge

sw.bb45:                                          ; preds = %while.body
  %overflow_arg_area48 = load i8** %overflow_arg_area_p, align 8
  %overflow_arg_area.next49 = getelementptr i8* %overflow_arg_area48, i64 32
  store i8* %overflow_arg_area.next49, i8** %overflow_arg_area_p, align 8
  %overflow_arg_area4858.0 = bitcast i8* %overflow_arg_area48 to i32*
  %tmp59 = load i32* %overflow_arg_area4858.0, align 8
  %overflow_arg_area4858.1 = getelementptr inbounds i8* %overflow_arg_area48, i64 8
  %33 = bitcast i8* %overflow_arg_area4858.1 to double*
  %tmp60 = load double* %33, align 8
  %overflow_arg_area4858.2 = getelementptr inbounds i8* %overflow_arg_area48, i64 16
  %34 = bitcast i8* %overflow_arg_area4858.2 to %struct.DWordS_struct**
  %tmp61 = load %struct.DWordS_struct** %34, align 8
  %overflow_arg_area4858.3 = getelementptr inbounds i8* %overflow_arg_area48, i64 24
  %35 = bitcast i8* %overflow_arg_area4858.3 to i32*
  %tmp62 = load i32* %35, align 8
  %mul52 = fmul double %tmp60, 1.000000e+04
  %conv53 = fptosi double %mul52 to i32
  %cmp = icmp ne %struct.DWordS_struct* %tmp61, null
  %conv54 = zext i1 %cmp to i32
  %call55 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str7, i64 0, i64 0), i32 %tmp59, i32 %conv53, i32 %conv54, i32 %tmp62) nounwind
  br label %while.cond.backedge

while.end:                                        ; preds = %while.cond.backedge, %entry
  call void @llvm.va_end(i8* %arraydecay1)
  ret void
}

declare void @llvm.va_start(i8*) nounwind

declare void @llvm.va_copy(i8*, i8*) nounwind

declare void @llvm.va_end(i8*) nounwind

declare i32 @printf(i8* nocapture, ...) nounwind

define i32 @main() nounwind uwtable {
entry:
  %dw = alloca i64, align 8
  %tmpcast = bitcast i64* %dw to %struct.DWordS_struct*
  %ls = alloca %struct.LargeS_struct, align 8
  store i64 416611827730, i64* %dw, align 8
  %i = getelementptr inbounds %struct.LargeS_struct* %ls, i64 0, i32 0
  store i32 21, i32* %i, align 8, !tbaa !2
  %d = getelementptr inbounds %struct.LargeS_struct* %ls, i64 0, i32 1
  store double 2.200000e+01, double* %d, align 8, !tbaa !3
  %ptr = getelementptr inbounds %struct.LargeS_struct* %ls, i64 0, i32 2
  store %struct.DWordS_struct* %tmpcast, %struct.DWordS_struct** %ptr, align 8, !tbaa !4
  %j = getelementptr inbounds %struct.LargeS_struct* %ls, i64 0, i32 3
  store i32 23, i32* %j, align 8, !tbaa !2
  call void (i8*, ...)* @test(i8* getelementptr inbounds ([11 x i8]* @.str8, i64 0, i64 0), i8* getelementptr inbounds ([4 x i8]* @.str9, i64 0, i64 0), i8* getelementptr inbounds ([4 x i8]* @.str10, i64 0, i64 0), i32 -123, i32 97, i32 123, i32 6, i32 7, i32 8, i32 9, i8* getelementptr inbounds ([14 x i8]* @.str11, i64 0, i64 0))
  call void (i8*, ...)* @test(i8* getelementptr inbounds ([5 x i8]* @.str12, i64 0, i64 0), double 1.000000e+00, double 2.000000e+00, i32 32764, i64 12345677823423)
  %0 = load i64* %dw, align 8
  call void (i8*, ...)* @test(i8* getelementptr inbounds ([4 x i8]* @.str13, i64 0, i64 0), i64 %0, i32 19, double 2.000000e+01, %struct.LargeS_struct* byval align 8 %ls)
  ret i32 0
}

!0 = metadata !{metadata !"omnipotent char", metadata !1}
!1 = metadata !{metadata !"Simple C/C++ TBAA", null}
!2 = metadata !{metadata !"int", metadata !0}
!3 = metadata !{metadata !"double", metadata !0}
!4 = metadata !{metadata !"any pointer", metadata !0}
