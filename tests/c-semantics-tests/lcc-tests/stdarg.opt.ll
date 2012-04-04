; ModuleID = '/home/david/src/c-semantics/tests/lcc-tests/stdarg.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.node = type { [4 x i32] }
%struct.__va_list_tag = type { i32, i32, i8*, i8* }

@x = global %struct.node { [4 x i32] [i32 1, i32 2, i32 3, i32 4] }, align 8
@.str = private unnamed_addr constant [8 x i8] c"test 1\0A\00", align 1
@.str1 = private unnamed_addr constant [9 x i8] c"test %s\0A\00", align 1
@.str2 = private unnamed_addr constant [2 x i8] c"2\00", align 1
@.str3 = private unnamed_addr constant [10 x i8] c"test %d%c\00", align 1
@.str4 = private unnamed_addr constant [10 x i8] c"%s%s %d%c\00", align 1
@.str5 = private unnamed_addr constant [3 x i8] c"te\00", align 1
@.str6 = private unnamed_addr constant [3 x i8] c"st\00", align 1
@.str7 = private unnamed_addr constant [10 x i8] c"%s%s %f%c\00", align 1
@.str8 = private unnamed_addr constant [19 x i8] c"%b %b %b %b %b %b\0A\00", align 1
@.str9 = private unnamed_addr constant [14 x i8] c"{%d %d %d %d}\00", align 1
@.str11 = private unnamed_addr constant [3 x i8] c"%d\00", align 1
@.str12 = private unnamed_addr constant [5 x i8] c"%02x\00", align 1
@.str13 = private unnamed_addr constant [3 x i8] c"%s\00", align 1

define i32 @main() nounwind uwtable {
entry:
  tail call void (i8*, ...)* @print(i8* getelementptr inbounds ([8 x i8]* @.str, i64 0, i64 0))
  tail call void (i8*, ...)* @print(i8* getelementptr inbounds ([9 x i8]* @.str1, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8]* @.str2, i64 0, i64 0))
  tail call void (i8*, ...)* @print(i8* getelementptr inbounds ([10 x i8]* @.str3, i64 0, i64 0), i32 3, i32 10)
  tail call void (i8*, ...)* @print(i8* getelementptr inbounds ([10 x i8]* @.str4, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8]* @.str5, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8]* @.str6, i64 0, i64 0), i32 4, i32 10)
  tail call void (i8*, ...)* @print(i8* getelementptr inbounds ([10 x i8]* @.str7, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8]* @.str5, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8]* @.str6, i64 0, i64 0), double 5.000000e+00, i32 10)
  %0 = load i64* bitcast (%struct.node* @x to i64*), align 8
  %1 = load i64* bitcast (i32* getelementptr inbounds (%struct.node* @x, i64 0, i32 0, i64 2) to i64*), align 8
  tail call void (i8*, ...)* @print(i8* getelementptr inbounds ([19 x i8]* @.str8, i64 0, i64 0), i64 %0, i64 %1, i64 %0, i64 %1, %struct.node* byval align 8 @x, %struct.node* byval align 8 @x, %struct.node* byval align 8 @x, %struct.node* byval align 8 @x)
  ret i32 0
}

define void @print(i8* nocapture %fmt, ...) nounwind uwtable {
entry:
  %ap = alloca [1 x %struct.__va_list_tag], align 16
  %arraydecay = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i64 0, i64 0
  %arraydecay1 = bitcast [1 x %struct.__va_list_tag]* %ap to i8*
  call void @llvm.va_start(i8* %arraydecay1)
  %gp_offset_p = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i64 0, i64 0, i32 0
  %0 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i64 0, i64 0, i32 3
  %overflow_arg_area_p = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i64 0, i64 0, i32 2
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %fmt.addr.0 = phi i8* [ %fmt, %entry ], [ %incdec.ptr31, %for.inc ]
  %1 = load i8* %fmt.addr.0, align 1, !tbaa !0
  switch i8 %1, label %if.else [
    i8 0, label %for.end
    i8 37, label %if.then
  ]

if.then:                                          ; preds = %for.cond
  %incdec.ptr = getelementptr inbounds i8* %fmt.addr.0, i64 1
  %2 = load i8* %incdec.ptr, align 1, !tbaa !0
  %conv3 = sext i8 %2 to i32
  switch i32 %conv3, label %sw.default [
    i32 98, label %sw.bb
    i32 99, label %sw.bb11
    i32 100, label %sw.bb14
    i32 119, label %sw.bb17
    i32 115, label %sw.bb20
    i32 102, label %sw.bb23
  ]

sw.bb:                                            ; preds = %if.then
  %gp_offset = load i32* %gp_offset_p, align 16
  %fits_in_gp = icmp ult i32 %gp_offset, 33
  br i1 %fits_in_gp, label %vaarg.in_reg, label %vaarg.in_mem

vaarg.in_reg:                                     ; preds = %sw.bb
  %reg_save_area = load i8** %0, align 16
  %3 = sext i32 %gp_offset to i64
  %4 = getelementptr i8* %reg_save_area, i64 %3
  %5 = add i32 %gp_offset, 16
  store i32 %5, i32* %gp_offset_p, align 16
  br label %vaarg.end

vaarg.in_mem:                                     ; preds = %sw.bb
  %overflow_arg_area = load i8** %overflow_arg_area_p, align 8
  %overflow_arg_area.next = getelementptr i8* %overflow_arg_area, i64 16
  store i8* %overflow_arg_area.next, i8** %overflow_arg_area_p, align 8
  br label %vaarg.end

vaarg.end:                                        ; preds = %vaarg.in_mem, %vaarg.in_reg
  %vaarg.addr.in = phi i8* [ %4, %vaarg.in_reg ], [ %overflow_arg_area, %vaarg.in_mem ]
  %vaarg.addr34.0 = bitcast i8* %vaarg.addr.in to i32*
  %tmp = load i32* %vaarg.addr34.0, align 4
  %vaarg.addr34.1 = getelementptr inbounds i8* %vaarg.addr.in, i64 4
  %6 = bitcast i8* %vaarg.addr34.1 to i32*
  %tmp35 = load i32* %6, align 4
  %vaarg.addr34.2 = getelementptr inbounds i8* %vaarg.addr.in, i64 8
  %7 = bitcast i8* %vaarg.addr34.2 to i32*
  %tmp36 = load i32* %7, align 4
  %vaarg.addr34.3 = getelementptr inbounds i8* %vaarg.addr.in, i64 12
  %8 = bitcast i8* %vaarg.addr34.3 to i32*
  %tmp37 = load i32* %8, align 4
  %call = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([14 x i8]* @.str9, i64 0, i64 0), i32 %tmp, i32 %tmp35, i32 %tmp36, i32 %tmp37) nounwind
  br label %for.inc

sw.bb11:                                          ; preds = %if.then
  %9 = va_arg %struct.__va_list_tag* %arraydecay, i32
  %putchar = call i32 @putchar(i32 %9) nounwind
  br label %for.inc

sw.bb14:                                          ; preds = %if.then
  %10 = va_arg %struct.__va_list_tag* %arraydecay, i32
  %call16 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([3 x i8]* @.str11, i64 0, i64 0), i32 %10) nounwind
  br label %for.inc

sw.bb17:                                          ; preds = %if.then
  %11 = va_arg %struct.__va_list_tag* %arraydecay, i32
  %call19 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]* @.str12, i64 0, i64 0), i32 %11) nounwind
  br label %for.inc

sw.bb20:                                          ; preds = %if.then
  %12 = va_arg %struct.__va_list_tag* %arraydecay, i8*
  %call22 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([3 x i8]* @.str13, i64 0, i64 0), i8* %12) nounwind
  br label %for.inc

sw.bb23:                                          ; preds = %if.then
  %13 = va_arg %struct.__va_list_tag* %arraydecay, double
  %conv25 = fptosi double %13 to i32
  %call26 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([3 x i8]* @.str11, i64 0, i64 0), i32 %conv25) nounwind
  br label %for.inc

sw.default:                                       ; preds = %if.then
  %putchar38 = call i32 @putchar(i32 %conv3) nounwind
  br label %for.inc

if.else:                                          ; preds = %for.cond
  %conv = sext i8 %1 to i32
  %putchar39 = call i32 @putchar(i32 %conv) nounwind
  br label %for.inc

for.inc:                                          ; preds = %if.else, %sw.default, %sw.bb23, %sw.bb20, %sw.bb17, %sw.bb14, %sw.bb11, %vaarg.end
  %fmt.addr.1 = phi i8* [ %incdec.ptr, %sw.default ], [ %incdec.ptr, %sw.bb23 ], [ %incdec.ptr, %sw.bb20 ], [ %incdec.ptr, %sw.bb17 ], [ %incdec.ptr, %sw.bb14 ], [ %incdec.ptr, %sw.bb11 ], [ %incdec.ptr, %vaarg.end ], [ %fmt.addr.0, %if.else ]
  %incdec.ptr31 = getelementptr inbounds i8* %fmt.addr.1, i64 1
  br label %for.cond

for.end:                                          ; preds = %for.cond
  call void @llvm.va_end(i8* %arraydecay1)
  ret void
}

declare void @llvm.va_start(i8*) nounwind

declare i32 @printf(i8* nocapture, ...) nounwind

declare void @llvm.va_end(i8*) nounwind

declare i32 @putchar(i32)

!0 = metadata !{metadata !"omnipotent char", metadata !1}
!1 = metadata !{metadata !"Simple C/C++ TBAA", null}
