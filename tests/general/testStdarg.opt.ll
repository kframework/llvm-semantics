; ModuleID = '/home/grosu/celliso2/c-semantics/tests/unitTests/testStdarg.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

%struct.__va_list_tag = type { i32, i32, i8*, i8* }
%struct.s = type { i32, i32 }

@.str = private unnamed_addr constant [11 x i8] c"arg1 = %d\0A\00", align 1
@.str1 = private unnamed_addr constant [5 x i8] c"%d, \00", align 1
@.str3 = private unnamed_addr constant [36 x i8] c"%d, %d, %d, %d, %d, %d, %d, %d, %d\0A\00", align 1
@.str4 = private unnamed_addr constant [8 x i8] c"Hello, \00", align 1
@.str5 = private unnamed_addr constant [7 x i8] c"world!\00", align 1
@.str6 = private unnamed_addr constant [2 x i8] c"1\00", align 1
@.str7 = private unnamed_addr constant [3 x i8] c"23\00", align 1
@.str8 = private unnamed_addr constant [4 x i8] c"456\00", align 1
@.str9 = private unnamed_addr constant [4 x i8] c"789\00", align 1
@str = internal constant [14 x i8] c"first == NULL\00"

define i32 @gnu_dev_major(i64 %__dev) nounwind uwtable readnone inlinehint {
entry:
  %shr = lshr i64 %__dev, 8
  %and = and i64 %shr, 4095
  %shr2 = lshr i64 %__dev, 32
  %and3 = and i64 %shr2, 4294963200
  %or = or i64 %and, %and3
  %conv5 = trunc i64 %or to i32
  ret i32 %conv5
}

define i32 @gnu_dev_minor(i64 %__dev) nounwind uwtable readnone inlinehint {
entry:
  %and = and i64 %__dev, 255
  %shr = lshr i64 %__dev, 12
  %and2 = and i64 %shr, 4294967040
  %or = or i64 %and2, %and
  %conv4 = trunc i64 %or to i32
  ret i32 %conv4
}

define i64 @gnu_dev_makedev(i32 %__major, i32 %__minor) nounwind uwtable readnone inlinehint {
entry:
  %and = and i32 %__minor, 255
  %and2 = shl i32 %__major, 8
  %shl = and i32 %and2, 1048320
  %or = or i32 %and, %shl
  %conv = zext i32 %or to i64
  %and4 = and i32 %__minor, -256
  %conv5 = zext i32 %and4 to i64
  %shl6 = shl nuw nsw i64 %conv5, 12
  %and9 = and i32 %__major, -4096
  %conv10 = zext i32 %and9 to i64
  %shl11 = shl nuw i64 %conv10, 32
  %or7 = or i64 %shl6, %shl11
  %or12 = or i64 %or7, %conv
  ret i64 %or12
}

define void @printargs(i32 %arg1, ...) nounwind uwtable {
entry:
  %ap = alloca [1 x %struct.__va_list_tag], align 16
  %call = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([11 x i8]* @.str, i64 0, i64 0), i32 %arg1) nounwind
  %arraydecay1 = bitcast [1 x %struct.__va_list_tag]* %ap to i8*
  call void @llvm.va_start(i8* %arraydecay1)
  %cmp1 = icmp eq i32 %arg1, -1
  br i1 %cmp1, label %for.end, label %for.body.lr.ph

for.body.lr.ph:                                   ; preds = %entry
  %gp_offset_p = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i64 0, i64 0, i32 0
  %0 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i64 0, i64 0, i32 3
  %overflow_arg_area_p = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i64 0, i64 0, i32 2
  br label %for.body

for.body:                                         ; preds = %for.body.lr.ph, %vaarg.end
  %storemerge2 = phi i32 [ %arg1, %for.body.lr.ph ], [ %4, %vaarg.end ]
  %call5 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]* @.str1, i64 0, i64 0), i32 %storemerge2) nounwind
  %gp_offset = load i32* %gp_offset_p, align 16
  %fits_in_gp = icmp ult i32 %gp_offset, 41
  br i1 %fits_in_gp, label %vaarg.in_reg, label %vaarg.in_mem

vaarg.in_reg:                                     ; preds = %for.body
  %reg_save_area = load i8** %0, align 16
  %1 = sext i32 %gp_offset to i64
  %2 = getelementptr i8* %reg_save_area, i64 %1
  %3 = add i32 %gp_offset, 8
  store i32 %3, i32* %gp_offset_p, align 16
  br label %vaarg.end

vaarg.in_mem:                                     ; preds = %for.body
  %overflow_arg_area = load i8** %overflow_arg_area_p, align 8
  %overflow_arg_area.next = getelementptr i8* %overflow_arg_area, i64 8
  store i8* %overflow_arg_area.next, i8** %overflow_arg_area_p, align 8
  br label %vaarg.end

vaarg.end:                                        ; preds = %vaarg.in_mem, %vaarg.in_reg
  %vaarg.addr.in = phi i8* [ %2, %vaarg.in_reg ], [ %overflow_arg_area, %vaarg.in_mem ]
  %vaarg.addr = bitcast i8* %vaarg.addr.in to i32*
  %4 = load i32* %vaarg.addr, align 4
  %cmp = icmp eq i32 %4, -1
  br i1 %cmp, label %for.end, label %for.body

for.end:                                          ; preds = %vaarg.end, %entry
  call void @llvm.va_end(i8* %arraydecay1)
  %call9 = call i32 @putchar(i32 10) nounwind
  ret void
}

declare i32 @printf(i8* nocapture, ...) nounwind

declare void @llvm.va_start(i8*) nounwind

declare void @llvm.va_end(i8*) nounwind

declare i32 @putchar(i32) nounwind

define i8* @vstrcat(i8* %first, ...) nounwind uwtable {
entry:
  %argp = alloca [1 x %struct.__va_list_tag], align 16
  %cmp = icmp eq i8* %first, null
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %puts = call i32 @puts(i8* getelementptr inbounds ([14 x i8]* @str, i64 0, i64 0))
  br label %return

if.end:                                           ; preds = %entry
  %call2 = call i64 @strlen(i8* %first) nounwind readonly
  %arraydecay3 = bitcast [1 x %struct.__va_list_tag]* %argp to i8*
  call void @llvm.va_start(i8* %arraydecay3)
  %gp_offset_p = getelementptr inbounds [1 x %struct.__va_list_tag]* %argp, i64 0, i64 0, i32 0
  %0 = getelementptr inbounds [1 x %struct.__va_list_tag]* %argp, i64 0, i64 0, i32 3
  %overflow_arg_area_p = getelementptr inbounds [1 x %struct.__va_list_tag]* %argp, i64 0, i64 0, i32 2
  %gp_offset.pre = load i32* %gp_offset_p, align 16
  br label %while.cond

while.cond:                                       ; preds = %while.body, %if.end
  %gp_offset = phi i32 [ %gp_offset2, %while.body ], [ %gp_offset.pre, %if.end ]
  %tmp111 = phi i64 [ %add, %while.body ], [ %call2, %if.end ]
  %fits_in_gp = icmp ult i32 %gp_offset, 41
  br i1 %fits_in_gp, label %vaarg.in_reg, label %vaarg.in_mem

vaarg.in_reg:                                     ; preds = %while.cond
  %reg_save_area = load i8** %0, align 16
  %1 = sext i32 %gp_offset to i64
  %2 = getelementptr i8* %reg_save_area, i64 %1
  %3 = add i32 %gp_offset, 8
  store i32 %3, i32* %gp_offset_p, align 16
  br label %vaarg.end

vaarg.in_mem:                                     ; preds = %while.cond
  %overflow_arg_area = load i8** %overflow_arg_area_p, align 8
  %overflow_arg_area.next = getelementptr i8* %overflow_arg_area, i64 8
  store i8* %overflow_arg_area.next, i8** %overflow_arg_area_p, align 8
  br label %vaarg.end

vaarg.end:                                        ; preds = %vaarg.in_mem, %vaarg.in_reg
  %gp_offset2 = phi i32 [ %3, %vaarg.in_reg ], [ %gp_offset, %vaarg.in_mem ]
  %vaarg.addr.in = phi i8* [ %2, %vaarg.in_reg ], [ %overflow_arg_area, %vaarg.in_mem ]
  %vaarg.addr = bitcast i8* %vaarg.addr.in to i8**
  %4 = load i8** %vaarg.addr, align 8
  %cmp5 = icmp eq i8* %4, null
  br i1 %cmp5, label %while.end, label %while.body

while.body:                                       ; preds = %vaarg.end
  %call7 = call i64 @strlen(i8* %4) nounwind readonly
  %add = add i64 %call7, %tmp111
  br label %while.cond

while.end:                                        ; preds = %vaarg.end
  call void @llvm.va_end(i8* %arraydecay3)
  %add12 = add i64 %tmp111, 1
  %call13 = call noalias i8* @malloc(i64 %add12) nounwind
  %cmp15 = icmp eq i8* %call13, null
  br i1 %cmp15, label %return, label %if.end17

if.end17:                                         ; preds = %while.end
  %call20 = call i8* @strcpy(i8* %call13, i8* %first) nounwind
  call void @llvm.va_start(i8* %arraydecay3)
  br label %while.cond23

while.cond23:                                     ; preds = %while.body37, %if.end17
  %gp_offset26 = load i32* %gp_offset_p, align 16
  %fits_in_gp27 = icmp ult i32 %gp_offset26, 41
  br i1 %fits_in_gp27, label %vaarg.in_reg28, label %vaarg.in_mem30

vaarg.in_reg28:                                   ; preds = %while.cond23
  %reg_save_area29 = load i8** %0, align 16
  %5 = sext i32 %gp_offset26 to i64
  %6 = getelementptr i8* %reg_save_area29, i64 %5
  %7 = add i32 %gp_offset26, 8
  store i32 %7, i32* %gp_offset_p, align 16
  br label %vaarg.end34

vaarg.in_mem30:                                   ; preds = %while.cond23
  %overflow_arg_area32 = load i8** %overflow_arg_area_p, align 8
  %overflow_arg_area.next33 = getelementptr i8* %overflow_arg_area32, i64 8
  store i8* %overflow_arg_area.next33, i8** %overflow_arg_area_p, align 8
  br label %vaarg.end34

vaarg.end34:                                      ; preds = %vaarg.in_mem30, %vaarg.in_reg28
  %vaarg.addr35.in = phi i8* [ %6, %vaarg.in_reg28 ], [ %overflow_arg_area32, %vaarg.in_mem30 ]
  %vaarg.addr35 = bitcast i8* %vaarg.addr35.in to i8**
  %8 = load i8** %vaarg.addr35, align 8
  %cmp36 = icmp eq i8* %8, null
  br i1 %cmp36, label %while.end41, label %while.body37

while.body37:                                     ; preds = %vaarg.end34
  %call40 = call i8* @strcat(i8* %call13, i8* %8) nounwind
  br label %while.cond23

while.end41:                                      ; preds = %vaarg.end34
  call void @llvm.va_end(i8* %arraydecay3)
  br label %return

return:                                           ; preds = %while.end, %while.end41, %if.then
  %9 = phi i8* [ %call13, %while.end41 ], [ null, %if.then ], [ null, %while.end ]
  ret i8* %9
}

declare i64 @strlen(i8* nocapture) nounwind readonly

declare noalias i8* @malloc(i64) nounwind

declare i8* @strcpy(i8*, i8* nocapture) nounwind

declare i8* @strcat(i8*, i8* nocapture) nounwind

define i32 @testDifferent(i32 %x, ...) nounwind uwtable {
entry:
  %argp = alloca [1 x %struct.__va_list_tag], align 16
  %arraydecay1 = bitcast [1 x %struct.__va_list_tag]* %argp to i8*
  call void @llvm.va_start(i8* %arraydecay1)
  %gp_offset_p = getelementptr inbounds [1 x %struct.__va_list_tag]* %argp, i64 0, i64 0, i32 0
  %0 = bitcast [1 x %struct.__va_list_tag]* %argp to i64*
  %1 = load i64* %0, align 16
  %2 = trunc i64 %1 to i32
  %fits_in_gp = icmp ult i32 %2, 41
  br i1 %fits_in_gp, label %vaarg.end, label %vaarg.end.thread

vaarg.end.thread:                                 ; preds = %entry
  %overflow_arg_area_p = getelementptr inbounds [1 x %struct.__va_list_tag]* %argp, i64 0, i64 0, i32 2
  %overflow_arg_area = load i8** %overflow_arg_area_p, align 8
  %overflow_arg_area.next = getelementptr i8* %overflow_arg_area, i64 8
  store i8* %overflow_arg_area.next, i8** %overflow_arg_area_p, align 8
  %vaarg.addr35 = bitcast i8* %overflow_arg_area to i32*
  %3 = load i32* %vaarg.addr35, align 4
  br label %vaarg.in_mem9

vaarg.end:                                        ; preds = %entry
  %4 = getelementptr inbounds [1 x %struct.__va_list_tag]* %argp, i64 0, i64 0, i32 3
  %reg_save_area = load i8** %4, align 16
  %5 = sext i32 %2 to i64
  %6 = getelementptr i8* %reg_save_area, i64 %5
  %7 = add i32 %2, 8
  store i32 %7, i32* %gp_offset_p, align 16
  %vaarg.addr = bitcast i8* %6 to i32*
  %8 = load i32* %vaarg.addr, align 4
  %fits_in_gp6 = icmp ult i32 %7, 41
  br i1 %fits_in_gp6, label %vaarg.in_reg7, label %vaarg.in_mem9

vaarg.in_reg7:                                    ; preds = %vaarg.end
  %9 = getelementptr inbounds [1 x %struct.__va_list_tag]* %argp, i64 0, i64 0, i32 3
  %reg_save_area8 = load i8** %9, align 16
  %10 = sext i32 %7 to i64
  %11 = getelementptr i8* %reg_save_area8, i64 %10
  %12 = add i32 %2, 16
  store i32 %12, i32* %gp_offset_p, align 16
  br label %vaarg.end13

vaarg.in_mem9:                                    ; preds = %vaarg.end.thread, %vaarg.end
  %13 = phi i32 [ %3, %vaarg.end.thread ], [ %8, %vaarg.end ]
  %overflow_arg_area_p10 = getelementptr inbounds [1 x %struct.__va_list_tag]* %argp, i64 0, i64 0, i32 2
  %overflow_arg_area11 = load i8** %overflow_arg_area_p10, align 8
  %overflow_arg_area.next12 = getelementptr i8* %overflow_arg_area11, i64 8
  store i8* %overflow_arg_area.next12, i8** %overflow_arg_area_p10, align 8
  %14 = load i64* %0, align 16
  %15 = trunc i64 %14 to i32
  br label %vaarg.end13

vaarg.end13:                                      ; preds = %vaarg.in_mem9, %vaarg.in_reg7
  %16 = phi i32 [ %13, %vaarg.in_mem9 ], [ %8, %vaarg.in_reg7 ]
  %fp_offset62.pr33.in.in = phi i64 [ %14, %vaarg.in_mem9 ], [ %1, %vaarg.in_reg7 ]
  %gp_offset17 = phi i32 [ %15, %vaarg.in_mem9 ], [ %12, %vaarg.in_reg7 ]
  %vaarg.addr14.in = phi i8* [ %overflow_arg_area11, %vaarg.in_mem9 ], [ %11, %vaarg.in_reg7 ]
  %vaarg.addr14 = bitcast i8* %vaarg.addr14.in to i32*
  %17 = load i32* %vaarg.addr14, align 4
  %fits_in_gp18 = icmp ult i32 %gp_offset17, 41
  br i1 %fits_in_gp18, label %vaarg.in_reg19, label %vaarg.in_mem21

vaarg.in_reg19:                                   ; preds = %vaarg.end13
  %18 = getelementptr inbounds [1 x %struct.__va_list_tag]* %argp, i64 0, i64 0, i32 3
  %reg_save_area20 = load i8** %18, align 16
  %19 = sext i32 %gp_offset17 to i64
  %20 = getelementptr i8* %reg_save_area20, i64 %19
  %21 = add i32 %gp_offset17, 8
  store i32 %21, i32* %gp_offset_p, align 16
  br label %vaarg.end25

vaarg.in_mem21:                                   ; preds = %vaarg.end13
  %overflow_arg_area_p22 = getelementptr inbounds [1 x %struct.__va_list_tag]* %argp, i64 0, i64 0, i32 2
  %overflow_arg_area23 = load i8** %overflow_arg_area_p22, align 8
  %overflow_arg_area.next24 = getelementptr i8* %overflow_arg_area23, i64 8
  store i8* %overflow_arg_area.next24, i8** %overflow_arg_area_p22, align 8
  %22 = load i64* %0, align 16
  %23 = trunc i64 %22 to i32
  br label %vaarg.end25

vaarg.end25:                                      ; preds = %vaarg.in_mem21, %vaarg.in_reg19
  %fp_offset62.pr32.in.in = phi i64 [ %22, %vaarg.in_mem21 ], [ %fp_offset62.pr33.in.in, %vaarg.in_reg19 ]
  %gp_offset29 = phi i32 [ %23, %vaarg.in_mem21 ], [ %21, %vaarg.in_reg19 ]
  %vaarg.addr26.in = phi i8* [ %overflow_arg_area23, %vaarg.in_mem21 ], [ %20, %vaarg.in_reg19 ]
  %vaarg.addr26 = bitcast i8* %vaarg.addr26.in to i32*
  %24 = load i32* %vaarg.addr26, align 4
  %fits_in_gp30 = icmp ult i32 %gp_offset29, 41
  br i1 %fits_in_gp30, label %vaarg.in_reg31, label %vaarg.in_mem33

vaarg.in_reg31:                                   ; preds = %vaarg.end25
  %25 = getelementptr inbounds [1 x %struct.__va_list_tag]* %argp, i64 0, i64 0, i32 3
  %reg_save_area32 = load i8** %25, align 16
  %26 = sext i32 %gp_offset29 to i64
  %27 = getelementptr i8* %reg_save_area32, i64 %26
  %28 = add i32 %gp_offset29, 8
  store i32 %28, i32* %gp_offset_p, align 16
  br label %vaarg.end37

vaarg.in_mem33:                                   ; preds = %vaarg.end25
  %overflow_arg_area_p34 = getelementptr inbounds [1 x %struct.__va_list_tag]* %argp, i64 0, i64 0, i32 2
  %overflow_arg_area35 = load i8** %overflow_arg_area_p34, align 8
  %overflow_arg_area.next36 = getelementptr i8* %overflow_arg_area35, i64 8
  store i8* %overflow_arg_area.next36, i8** %overflow_arg_area_p34, align 8
  %29 = load i64* %0, align 16
  %30 = trunc i64 %29 to i32
  br label %vaarg.end37

vaarg.end37:                                      ; preds = %vaarg.in_mem33, %vaarg.in_reg31
  %fp_offset62.pr.in.in = phi i64 [ %29, %vaarg.in_mem33 ], [ %fp_offset62.pr32.in.in, %vaarg.in_reg31 ]
  %gp_offset7920 = phi i32 [ %30, %vaarg.in_mem33 ], [ %28, %vaarg.in_reg31 ]
  %vaarg.addr38.in = phi i8* [ %overflow_arg_area35, %vaarg.in_mem33 ], [ %27, %vaarg.in_reg31 ]
  %fp_offset62.pr.in = lshr i64 %fp_offset62.pr.in.in, 32
  %fp_offset62.pr = trunc i64 %fp_offset62.pr.in to i32
  %vaarg.addr38 = bitcast i8* %vaarg.addr38.in to i64*
  %31 = load i64* %vaarg.addr38, align 8
  %fits_in_gp42 = icmp ult i32 %gp_offset7920, 41
  br i1 %fits_in_gp42, label %vaarg.in_reg43, label %vaarg.in_mem45

vaarg.in_reg43:                                   ; preds = %vaarg.end37
  %32 = getelementptr inbounds [1 x %struct.__va_list_tag]* %argp, i64 0, i64 0, i32 3
  %reg_save_area44 = load i8** %32, align 16
  %33 = sext i32 %gp_offset7920 to i64
  %34 = getelementptr i8* %reg_save_area44, i64 %33
  %35 = add i32 %gp_offset7920, 8
  store i32 %35, i32* %gp_offset_p, align 16
  br label %vaarg.end49

vaarg.in_mem45:                                   ; preds = %vaarg.end37
  %overflow_arg_area_p46 = getelementptr inbounds [1 x %struct.__va_list_tag]* %argp, i64 0, i64 0, i32 2
  %overflow_arg_area47 = load i8** %overflow_arg_area_p46, align 8
  %overflow_arg_area.next48 = getelementptr i8* %overflow_arg_area47, i64 8
  store i8* %overflow_arg_area.next48, i8** %overflow_arg_area_p46, align 8
  br label %vaarg.end49

vaarg.end49:                                      ; preds = %vaarg.in_mem45, %vaarg.in_reg43
  %gp_offset79 = phi i32 [ %35, %vaarg.in_reg43 ], [ %gp_offset7920, %vaarg.in_mem45 ]
  %vaarg.addr50.in = phi i8* [ %34, %vaarg.in_reg43 ], [ %overflow_arg_area47, %vaarg.in_mem45 ]
  %vaarg.addr50 = bitcast i8* %vaarg.addr50.in to i64*
  %36 = load i64* %vaarg.addr50, align 8
  %fp_offset_p = getelementptr inbounds [1 x %struct.__va_list_tag]* %argp, i64 0, i64 0, i32 1
  %fits_in_fp = icmp ult i32 %fp_offset62.pr, 161
  br i1 %fits_in_fp, label %vaarg.in_reg52, label %vaarg.in_mem54

vaarg.in_reg52:                                   ; preds = %vaarg.end49
  %37 = getelementptr inbounds [1 x %struct.__va_list_tag]* %argp, i64 0, i64 0, i32 3
  %reg_save_area53 = load i8** %37, align 16
  %38 = sext i32 %fp_offset62.pr to i64
  %39 = getelementptr i8* %reg_save_area53, i64 %38
  %40 = add i32 %fp_offset62.pr, 16
  store i32 %40, i32* %fp_offset_p, align 4
  br label %vaarg.end58

vaarg.in_mem54:                                   ; preds = %vaarg.end49
  %overflow_arg_area_p55 = getelementptr inbounds [1 x %struct.__va_list_tag]* %argp, i64 0, i64 0, i32 2
  %overflow_arg_area56 = load i8** %overflow_arg_area_p55, align 8
  %overflow_arg_area.next57 = getelementptr i8* %overflow_arg_area56, i64 8
  store i8* %overflow_arg_area.next57, i8** %overflow_arg_area_p55, align 8
  br label %vaarg.end58

vaarg.end58:                                      ; preds = %vaarg.in_mem54, %vaarg.in_reg52
  %fp_offset62 = phi i32 [ %fp_offset62.pr, %vaarg.in_mem54 ], [ %40, %vaarg.in_reg52 ]
  %vaarg.addr59.in = phi i8* [ %overflow_arg_area56, %vaarg.in_mem54 ], [ %39, %vaarg.in_reg52 ]
  %vaarg.addr59 = bitcast i8* %vaarg.addr59.in to double*
  %41 = load double* %vaarg.addr59, align 8
  %fits_in_fp63 = icmp ult i32 %fp_offset62, 161
  br i1 %fits_in_fp63, label %vaarg.in_reg64, label %vaarg.in_mem66

vaarg.in_reg64:                                   ; preds = %vaarg.end58
  %42 = getelementptr inbounds [1 x %struct.__va_list_tag]* %argp, i64 0, i64 0, i32 3
  %reg_save_area65 = load i8** %42, align 16
  %43 = sext i32 %fp_offset62 to i64
  %44 = getelementptr i8* %reg_save_area65, i64 %43
  %45 = add i32 %fp_offset62, 16
  store i32 %45, i32* %fp_offset_p, align 4
  br label %vaarg.end70

vaarg.in_mem66:                                   ; preds = %vaarg.end58
  %overflow_arg_area_p67 = getelementptr inbounds [1 x %struct.__va_list_tag]* %argp, i64 0, i64 0, i32 2
  %overflow_arg_area68 = load i8** %overflow_arg_area_p67, align 8
  %overflow_arg_area.next69 = getelementptr i8* %overflow_arg_area68, i64 8
  store i8* %overflow_arg_area.next69, i8** %overflow_arg_area_p67, align 8
  br label %vaarg.end70

vaarg.end70:                                      ; preds = %vaarg.in_mem66, %vaarg.in_reg64
  %vaarg.addr71.in = phi i8* [ %44, %vaarg.in_reg64 ], [ %overflow_arg_area68, %vaarg.in_mem66 ]
  %vaarg.addr71 = bitcast i8* %vaarg.addr71.in to double*
  %46 = load double* %vaarg.addr71, align 8
  %mul = fmul double %41, 1.000000e+04
  %conv = fptosi double %mul to i32
  %mul74 = fmul double %46, 1.000000e+02
  %conv75 = fptosi double %mul74 to i32
  %fits_in_gp80 = icmp ult i32 %gp_offset79, 41
  br i1 %fits_in_gp80, label %vaarg.in_reg81, label %vaarg.in_mem83

vaarg.in_reg81:                                   ; preds = %vaarg.end70
  %47 = getelementptr inbounds [1 x %struct.__va_list_tag]* %argp, i64 0, i64 0, i32 3
  %reg_save_area82 = load i8** %47, align 16
  %48 = sext i32 %gp_offset79 to i64
  %49 = getelementptr i8* %reg_save_area82, i64 %48
  %50 = add i32 %gp_offset79, 8
  store i32 %50, i32* %gp_offset_p, align 16
  br label %vaarg.end87

vaarg.in_mem83:                                   ; preds = %vaarg.end70
  %overflow_arg_area_p84 = getelementptr inbounds [1 x %struct.__va_list_tag]* %argp, i64 0, i64 0, i32 2
  %overflow_arg_area85 = load i8** %overflow_arg_area_p84, align 8
  %overflow_arg_area.next86 = getelementptr i8* %overflow_arg_area85, i64 8
  store i8* %overflow_arg_area.next86, i8** %overflow_arg_area_p84, align 8
  br label %vaarg.end87

vaarg.end87:                                      ; preds = %vaarg.in_mem83, %vaarg.in_reg81
  %vaarg.addr88.in = phi i8* [ %49, %vaarg.in_reg81 ], [ %overflow_arg_area85, %vaarg.in_mem83 ]
  %51 = bitcast i8* %vaarg.addr88.in to i64*
  %52 = load i64* %51, align 4
  %conv95 = trunc i64 %31 to i32
  %conv97 = trunc i64 %36 to i32
  %tmp1 = trunc i64 %52 to i32
  %tmp3 = lshr i64 %52, 32
  %tmp4 = trunc i64 %tmp3 to i32
  %call = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([36 x i8]* @.str3, i64 0, i64 0), i32 %16, i32 %17, i32 %24, i32 %conv95, i32 %conv97, i32 %conv, i32 %conv75, i32 %tmp1, i32 %tmp4) nounwind
  call void @llvm.va_end(i8* %arraydecay1)
  ret i32 0
}

define i32 @main() nounwind uwtable {
entry:
  %mys = alloca %struct.s, align 4
  call void (i32, ...)* @printargs(i32 5, i32 2, i32 14, i32 84, i32 97, i32 15, i32 24, i32 48, i32 -1)
  call void (i32, ...)* @printargs(i32 84, i32 51, i32 -1)
  call void (i32, ...)* @printargs(i32 -1)
  call void (i32, ...)* @printargs(i32 1, i32 -1)
  %call = call i8* (i8*, ...)* @vstrcat(i8* getelementptr inbounds ([8 x i8]* @.str4, i64 0, i64 0), i8* getelementptr inbounds ([7 x i8]* @.str5, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8]* @.str6, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8]* @.str7, i64 0, i64 0), i8* getelementptr inbounds ([4 x i8]* @.str8, i64 0, i64 0), i8* getelementptr inbounds ([4 x i8]* @.str9, i64 0, i64 0), i8* null)
  %puts = call i32 @puts(i8* %call)
  %x = getelementptr inbounds %struct.s* %mys, i64 0, i32 0
  store i32 100, i32* %x, align 4
  %y = getelementptr inbounds %struct.s* %mys, i64 0, i32 1
  store i32 200, i32* %y, align 4
  %call13 = call i32 (i32, ...)* @testDifferent(i32 0, i32 5, i32 10, i32 15, i64 20, i64 25, double 3.050000e+01, double 7.223400e+01, %struct.s* byval align 8 %mys)
  ret i32 0
}

declare i32 @puts(i8* nocapture) nounwind
