; ModuleID = '/home/david/src/c-semantics/tests/unitTests/testStdarg.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }
%struct.__va_list_tag = type { i32, i32, i8*, i8* }

@.str = private unnamed_addr constant [11 x i8] c"arg1 = %d\0A\00", align 1
@.str1 = private unnamed_addr constant [5 x i8] c"%d, \00", align 1
@.str3 = private unnamed_addr constant [36 x i8] c"%d, %d, %d, %d, %d, %d, %d, %d, %d\0A\00", align 1
@.str4 = private unnamed_addr constant [8 x i8] c"Hello, \00", align 1
@.str5 = private unnamed_addr constant [7 x i8] c"world!\00", align 1
@.str6 = private unnamed_addr constant [2 x i8] c"1\00", align 1
@.str7 = private unnamed_addr constant [3 x i8] c"23\00", align 1
@.str8 = private unnamed_addr constant [4 x i8] c"456\00", align 1
@.str9 = private unnamed_addr constant [4 x i8] c"789\00", align 1
@stdout = external global %struct._IO_FILE*
@str = private unnamed_addr constant [14 x i8] c"first == NULL\00"

define void @printargs(i32 %arg1, ...) nounwind uwtable {
entry:
  %ap = alloca [1 x %struct.__va_list_tag], align 16
  %call = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([11 x i8]* @.str, i64 0, i64 0), i32 %arg1) nounwind
  %arraydecay = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i64 0, i64 0
  %arraydecay1 = bitcast [1 x %struct.__va_list_tag]* %ap to i8*
  call void @llvm.va_start(i8* %arraydecay1)
  %cmp7 = icmp eq i32 %arg1, -1
  br i1 %cmp7, label %for.end, label %for.body

for.body:                                         ; preds = %entry, %for.body
  %i.08 = phi i32 [ %0, %for.body ], [ %arg1, %entry ]
  %call2 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]* @.str1, i64 0, i64 0), i32 %i.08) nounwind
  %0 = va_arg %struct.__va_list_tag* %arraydecay, i32
  %cmp = icmp eq i32 %0, -1
  br i1 %cmp, label %for.end, label %for.body

for.end:                                          ; preds = %for.body, %entry
  call void @llvm.va_end(i8* %arraydecay1)
  %1 = load %struct._IO_FILE** @stdout, align 8, !tbaa !0
  %call.i = call i32 @_IO_putc(i32 10, %struct._IO_FILE* %1) nounwind
  ret void
}

declare i32 @printf(i8* nocapture, ...) nounwind

declare void @llvm.va_start(i8*) nounwind

declare void @llvm.va_end(i8*) nounwind

define i8* @vstrcat(i8* %first, ...) nounwind uwtable {
entry:
  %argp = alloca [1 x %struct.__va_list_tag], align 16
  %cmp = icmp eq i8* %first, null
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %puts = call i32 @puts(i8* getelementptr inbounds ([14 x i8]* @str, i64 0, i64 0))
  br label %return

if.end:                                           ; preds = %entry
  %call1 = call i64 @strlen(i8* %first) nounwind readonly
  %arraydecay = getelementptr inbounds [1 x %struct.__va_list_tag]* %argp, i64 0, i64 0
  %arraydecay2 = bitcast [1 x %struct.__va_list_tag]* %argp to i8*
  call void @llvm.va_start(i8* %arraydecay2)
  %0 = va_arg %struct.__va_list_tag* %arraydecay, i8*
  %cmp425 = icmp eq i8* %0, null
  br i1 %cmp425, label %while.end, label %while.body

while.body:                                       ; preds = %if.end, %while.body
  %1 = phi i8* [ %2, %while.body ], [ %0, %if.end ]
  %len.026 = phi i64 [ %add, %while.body ], [ %call1, %if.end ]
  %call5 = call i64 @strlen(i8* %1) nounwind readonly
  %add = add i64 %call5, %len.026
  %2 = va_arg %struct.__va_list_tag* %arraydecay, i8*
  %cmp4 = icmp eq i8* %2, null
  br i1 %cmp4, label %while.end, label %while.body

while.end:                                        ; preds = %while.body, %if.end
  %len.0.lcssa = phi i64 [ %call1, %if.end ], [ %add, %while.body ]
  call void @llvm.va_end(i8* %arraydecay2)
  %add8 = add i64 %len.0.lcssa, 1
  %call9 = call noalias i8* @malloc(i64 %add8) nounwind
  %cmp10 = icmp eq i8* %call9, null
  br i1 %cmp10, label %return, label %if.end12

if.end12:                                         ; preds = %while.end
  %call13 = call i8* @strcpy(i8* %call9, i8* %first) nounwind
  call void @llvm.va_start(i8* %arraydecay2)
  %3 = va_arg %struct.__va_list_tag* %arraydecay, i8*
  %cmp1824 = icmp eq i8* %3, null
  br i1 %cmp1824, label %while.end21, label %while.body19

while.body19:                                     ; preds = %if.end12, %while.body19
  %4 = phi i8* [ %5, %while.body19 ], [ %3, %if.end12 ]
  %call20 = call i8* @strcat(i8* %call9, i8* %4) nounwind
  %5 = va_arg %struct.__va_list_tag* %arraydecay, i8*
  %cmp18 = icmp eq i8* %5, null
  br i1 %cmp18, label %while.end21, label %while.body19

while.end21:                                      ; preds = %while.body19, %if.end12
  call void @llvm.va_end(i8* %arraydecay2)
  br label %return

return:                                           ; preds = %while.end, %while.end21, %if.then
  %retval.0 = phi i8* [ null, %if.then ], [ %call9, %while.end21 ], [ null, %while.end ]
  ret i8* %retval.0
}

declare i64 @strlen(i8* nocapture) nounwind readonly

declare noalias i8* @malloc(i64) nounwind

declare i8* @strcpy(i8*, i8* nocapture) nounwind

declare i8* @strcat(i8*, i8* nocapture) nounwind

define i32 @testDifferent(i32 %x, ...) nounwind uwtable {
entry:
  %argp = alloca [1 x %struct.__va_list_tag], align 16
  %arraydecay = getelementptr inbounds [1 x %struct.__va_list_tag]* %argp, i64 0, i64 0
  %arraydecay1 = bitcast [1 x %struct.__va_list_tag]* %argp to i8*
  call void @llvm.va_start(i8* %arraydecay1)
  %0 = va_arg %struct.__va_list_tag* %arraydecay, i32
  %1 = va_arg %struct.__va_list_tag* %arraydecay, i32
  %2 = va_arg %struct.__va_list_tag* %arraydecay, i32
  %3 = va_arg %struct.__va_list_tag* %arraydecay, i64
  %4 = va_arg %struct.__va_list_tag* %arraydecay, i64
  %5 = va_arg %struct.__va_list_tag* %arraydecay, double
  %6 = va_arg %struct.__va_list_tag* %arraydecay, double
  %mul = fmul double %5, 1.000000e+04
  %conv = fptosi double %mul to i32
  %mul9 = fmul double %6, 1.000000e+02
  %conv10 = fptosi double %mul9 to i32
  %gp_offset_p = getelementptr inbounds [1 x %struct.__va_list_tag]* %argp, i64 0, i64 0, i32 0
  %gp_offset = load i32* %gp_offset_p, align 16
  %fits_in_gp = icmp ult i32 %gp_offset, 41
  br i1 %fits_in_gp, label %vaarg.in_reg, label %vaarg.in_mem

vaarg.in_reg:                                     ; preds = %entry
  %7 = getelementptr inbounds [1 x %struct.__va_list_tag]* %argp, i64 0, i64 0, i32 3
  %reg_save_area = load i8** %7, align 16
  %8 = sext i32 %gp_offset to i64
  %9 = getelementptr i8* %reg_save_area, i64 %8
  %10 = add i32 %gp_offset, 8
  store i32 %10, i32* %gp_offset_p, align 16
  br label %vaarg.end

vaarg.in_mem:                                     ; preds = %entry
  %overflow_arg_area_p = getelementptr inbounds [1 x %struct.__va_list_tag]* %argp, i64 0, i64 0, i32 2
  %overflow_arg_area = load i8** %overflow_arg_area_p, align 8
  %overflow_arg_area.next = getelementptr i8* %overflow_arg_area, i64 8
  store i8* %overflow_arg_area.next, i8** %overflow_arg_area_p, align 8
  br label %vaarg.end

vaarg.end:                                        ; preds = %vaarg.in_mem, %vaarg.in_reg
  %vaarg.addr.in = phi i8* [ %9, %vaarg.in_reg ], [ %overflow_arg_area, %vaarg.in_mem ]
  %vaarg.addr.0 = bitcast i8* %vaarg.addr.in to i32*
  %tmp = load i32* %vaarg.addr.0, align 4
  %vaarg.addr.1 = getelementptr inbounds i8* %vaarg.addr.in, i64 4
  %11 = bitcast i8* %vaarg.addr.1 to i32*
  %tmp17 = load i32* %11, align 4
  %conv12 = trunc i64 %3 to i32
  %conv13 = trunc i64 %4 to i32
  %call = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([36 x i8]* @.str3, i64 0, i64 0), i32 %0, i32 %1, i32 %2, i32 %conv12, i32 %conv13, i32 %conv, i32 %conv10, i32 %tmp, i32 %tmp17) nounwind
  call void @llvm.va_end(i8* %arraydecay1)
  ret i32 0
}

define i32 @main() nounwind uwtable {
entry:
  tail call void (i32, ...)* @printargs(i32 5, i32 2, i32 14, i32 84, i32 97, i32 15, i32 24, i32 48, i32 -1)
  tail call void (i32, ...)* @printargs(i32 84, i32 51, i32 -1)
  tail call void (i32, ...)* @printargs(i32 -1)
  tail call void (i32, ...)* @printargs(i32 1, i32 -1)
  %call = tail call i8* (i8*, ...)* @vstrcat(i8* getelementptr inbounds ([8 x i8]* @.str4, i64 0, i64 0), i8* getelementptr inbounds ([7 x i8]* @.str5, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8]* @.str6, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8]* @.str7, i64 0, i64 0), i8* getelementptr inbounds ([4 x i8]* @.str8, i64 0, i64 0), i8* getelementptr inbounds ([4 x i8]* @.str9, i64 0, i64 0), i8* null)
  %puts = tail call i32 @puts(i8* %call)
  %call4 = tail call i32 (i32, ...)* @testDifferent(i32 undef, i32 5, i32 10, i32 15, i64 20, i64 25, double 3.050000e+01, double 7.223400e+01, i64 858993459300)
  ret i32 0
}

declare i32 @_IO_putc(i32, %struct._IO_FILE* nocapture) nounwind

declare i32 @puts(i8* nocapture) nounwind

!0 = metadata !{metadata !"any pointer", metadata !1}
!1 = metadata !{metadata !"omnipotent char", metadata !2}
!2 = metadata !{metadata !"Simple C/C++ TBAA", null}
