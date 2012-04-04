; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/pr44575.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.S = type { [3 x float] }
%struct.__va_list_tag = type { i32, i32, i8*, i8* }

@fails = global i32 0, align 4
@a = common global [5 x %struct.S] zeroinitializer, align 16

define void @check(i32 %z, ...) nounwind uwtable {
entry:
  %ap = alloca [1 x %struct.__va_list_tag], align 16
  %tmp = alloca { double, double }, align 8
  %arraydecay1 = bitcast [1 x %struct.__va_list_tag]* %ap to i8*
  call void @llvm.va_start(i8* %arraydecay1)
  %shl = shl i32 %z, 4
  %fp_offset_p = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i64 0, i64 0, i32 1
  %0 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i64 0, i64 0, i32 3
  %1 = getelementptr inbounds { double, double }* %tmp, i64 0, i32 0
  %2 = getelementptr inbounds { double, double }* %tmp, i64 0, i32 1
  %3 = bitcast { double, double }* %tmp to %struct.S*
  %overflow_arg_area_p = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i64 0, i64 0, i32 2
  br label %for.cond

for.cond:                                         ; preds = %if.end, %entry
  %i.0 = phi i32 [ 2, %entry ], [ %inc11, %if.end ]
  %cmp = icmp slt i32 %i.0, 4
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %or = or i32 %i.0, %shl
  %or.off = add i32 %or, -18
  %switch = icmp ult i32 %or.off, 2
  br i1 %switch, label %sw.bb, label %sw.epilog.thread

sw.bb:                                            ; preds = %for.body
  %fp_offset = load i32* %fp_offset_p, align 4
  %fits_in_fp = icmp ult i32 %fp_offset, 145
  br i1 %fits_in_fp, label %vaarg.in_reg, label %vaarg.in_mem

vaarg.in_reg:                                     ; preds = %sw.bb
  %reg_save_area = load i8** %0, align 16
  %4 = sext i32 %fp_offset to i64
  %5 = getelementptr i8* %reg_save_area, i64 %4
  %.sum = add i64 %4, 16
  %6 = getelementptr i8* %reg_save_area, i64 %.sum
  %7 = bitcast i8* %5 to double*
  %8 = load double* %7, align 8
  store double %8, double* %1, align 8
  %9 = bitcast i8* %6 to double*
  %10 = load double* %9, align 8
  store double %10, double* %2, align 8
  %11 = add i32 %fp_offset, 32
  store i32 %11, i32* %fp_offset_p, align 4
  br label %land.lhs.true

vaarg.in_mem:                                     ; preds = %sw.bb
  %overflow_arg_area = load i8** %overflow_arg_area_p, align 8
  %12 = bitcast i8* %overflow_arg_area to %struct.S*
  %overflow_arg_area.next = getelementptr i8* %overflow_arg_area, i64 16
  store i8* %overflow_arg_area.next, i8** %overflow_arg_area_p, align 8
  br label %land.lhs.true

sw.epilog.thread:                                 ; preds = %for.body
  %13 = load i32* @fails, align 4, !tbaa !0
  %inc3 = add nsw i32 %13, 1
  store i32 %inc3, i32* @fails, align 4, !tbaa !0
  br label %if.end

land.lhs.true:                                    ; preds = %vaarg.in_mem, %vaarg.in_reg
  %vaarg.addr = phi %struct.S* [ %3, %vaarg.in_reg ], [ %12, %vaarg.in_mem ]
  %vaarg.addr14.2 = getelementptr inbounds %struct.S* %vaarg.addr, i64 0, i32 0, i64 2
  %tmp17 = load float* %vaarg.addr14.2, align 4
  %14 = load float* getelementptr inbounds ([5 x %struct.S]* @a, i64 0, i64 2, i32 0, i64 2), align 8, !tbaa !3
  %cmp6 = fcmp une float %14, %tmp17
  %15 = load i32* @fails, align 4, !tbaa !0
  br i1 %cmp6, label %if.then, label %if.end

if.then:                                          ; preds = %land.lhs.true
  %inc7 = add nsw i32 %15, 1
  store i32 %inc7, i32* @fails, align 4, !tbaa !0
  br label %if.end

if.end:                                           ; preds = %land.lhs.true, %sw.epilog.thread, %if.then
  %16 = phi i32 [ %inc7, %if.then ], [ %inc3, %sw.epilog.thread ], [ %15, %land.lhs.true ]
  %tobool8 = icmp eq i32 %16, 0
  %inc11 = add nsw i32 %i.0, 1
  br i1 %tobool8, label %for.cond, label %for.end

for.end:                                          ; preds = %if.end, %for.cond
  call void @llvm.va_end(i8* %arraydecay1)
  ret void
}

declare void @llvm.va_start(i8*) nounwind

declare void @llvm.va_end(i8*) nounwind

define i32 @main() nounwind uwtable {
entry:
  store float -4.902600e+04, float* getelementptr inbounds ([5 x %struct.S]* @a, i64 0, i64 2, i32 0, i64 2), align 8, !tbaa !3
  %0 = load <2 x float>* bitcast (float* getelementptr inbounds ([5 x %struct.S]* @a, i64 0, i64 2, i32 0, i64 0) to <2 x float>*), align 8
  tail call void (i32, ...)* @check(i32 1, <2 x float> %0, float -4.902600e+04, <2 x float> %0, float -4.902600e+04)
  %1 = load i32* @fails, align 4, !tbaa !0
  %tobool = icmp eq i32 %1, 0
  br i1 %tobool, label %if.end, label %if.then

if.then:                                          ; preds = %entry
  tail call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  ret i32 0
}

declare void @abort() noreturn nounwind

!0 = metadata !{metadata !"int", metadata !1}
!1 = metadata !{metadata !"omnipotent char", metadata !2}
!2 = metadata !{metadata !"Simple C/C++ TBAA", null}
!3 = metadata !{metadata !"float", metadata !1}
