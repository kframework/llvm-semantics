; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/pr44575.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.S = type { [3 x float] }
%struct.__va_list_tag = type { i32, i32, i8*, i8* }

@fails = global i32 0, align 4
@a = common global [5 x %struct.S] zeroinitializer, align 16

define void @check(i32 %z, ...) nounwind uwtable {
entry:
  %z.addr = alloca i32, align 4
  %arg = alloca %struct.S, align 4
  %p = alloca %struct.S*, align 8
  %ap = alloca [1 x %struct.__va_list_tag], align 16
  %j = alloca i32, align 4
  %k = alloca i32, align 4
  %i = alloca i32, align 4
  %tmp = alloca { double, double }
  store i32 %z, i32* %z.addr, align 4
  store i32 0, i32* %j, align 4
  store i32 0, i32* %k, align 4
  %arraydecay = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %arraydecay1 = bitcast %struct.__va_list_tag* %arraydecay to i8*
  call void @llvm.va_start(i8* %arraydecay1)
  store i32 2, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32* %i, align 4
  %cmp = icmp slt i32 %0, 4
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  store %struct.S* null, %struct.S** %p, align 8
  %1 = load i32* %j, align 4
  %inc = add nsw i32 %1, 1
  store i32 %inc, i32* %j, align 4
  %2 = load i32* %k, align 4
  %add = add nsw i32 %2, 2
  store i32 %add, i32* %k, align 4
  %3 = load i32* %z.addr, align 4
  %shl = shl i32 %3, 4
  %4 = load i32* %i, align 4
  %or = or i32 %shl, %4
  switch i32 %or, label %sw.default [
    i32 18, label %sw.bb
    i32 19, label %sw.bb
  ]

sw.bb:                                            ; preds = %for.body, %for.body
  store %struct.S* getelementptr inbounds ([5 x %struct.S]* @a, i32 0, i64 2), %struct.S** %p, align 8
  %arraydecay2 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %fp_offset_p = getelementptr inbounds %struct.__va_list_tag* %arraydecay2, i32 0, i32 1
  %fp_offset = load i32* %fp_offset_p
  %fits_in_fp = icmp ule i32 %fp_offset, 144
  br i1 %fits_in_fp, label %vaarg.in_reg, label %vaarg.in_mem

vaarg.in_reg:                                     ; preds = %sw.bb
  %5 = getelementptr inbounds %struct.__va_list_tag* %arraydecay2, i32 0, i32 3
  %reg_save_area = load i8** %5
  %6 = getelementptr i8* %reg_save_area, i32 %fp_offset
  %7 = getelementptr i8* %6, i32 16
  %8 = bitcast i8* %6 to double*
  %9 = load double* %8
  %10 = getelementptr inbounds { double, double }* %tmp, i32 0, i32 0
  store double %9, double* %10
  %11 = bitcast i8* %7 to double*
  %12 = load double* %11
  %13 = getelementptr inbounds { double, double }* %tmp, i32 0, i32 1
  store double %12, double* %13
  %14 = bitcast { double, double }* %tmp to %struct.S*
  %15 = add i32 %fp_offset, 32
  store i32 %15, i32* %fp_offset_p
  br label %vaarg.end

vaarg.in_mem:                                     ; preds = %sw.bb
  %overflow_arg_area_p = getelementptr inbounds %struct.__va_list_tag* %arraydecay2, i32 0, i32 2
  %overflow_arg_area = load i8** %overflow_arg_area_p
  %16 = bitcast i8* %overflow_arg_area to %struct.S*
  %overflow_arg_area.next = getelementptr i8* %overflow_arg_area, i32 16
  store i8* %overflow_arg_area.next, i8** %overflow_arg_area_p
  br label %vaarg.end

vaarg.end:                                        ; preds = %vaarg.in_mem, %vaarg.in_reg
  %vaarg.addr = phi %struct.S* [ %14, %vaarg.in_reg ], [ %16, %vaarg.in_mem ]
  %17 = bitcast %struct.S* %arg to i8*
  %18 = bitcast %struct.S* %vaarg.addr to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %17, i8* %18, i64 12, i32 4, i1 false)
  br label %sw.epilog

sw.default:                                       ; preds = %for.body
  %19 = load i32* @fails, align 4
  %inc3 = add nsw i32 %19, 1
  store i32 %inc3, i32* @fails, align 4
  br label %sw.epilog

sw.epilog:                                        ; preds = %sw.default, %vaarg.end
  %20 = load %struct.S** %p, align 8
  %tobool = icmp ne %struct.S* %20, null
  br i1 %tobool, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %sw.epilog
  %21 = load %struct.S** %p, align 8
  %a = getelementptr inbounds %struct.S* %21, i32 0, i32 0
  %arrayidx = getelementptr inbounds [3 x float]* %a, i32 0, i64 2
  %22 = load float* %arrayidx, align 4
  %a4 = getelementptr inbounds %struct.S* %arg, i32 0, i32 0
  %arrayidx5 = getelementptr inbounds [3 x float]* %a4, i32 0, i64 2
  %23 = load float* %arrayidx5, align 4
  %cmp6 = fcmp une float %22, %23
  br i1 %cmp6, label %if.then, label %if.end

if.then:                                          ; preds = %land.lhs.true
  %24 = load i32* @fails, align 4
  %inc7 = add nsw i32 %24, 1
  store i32 %inc7, i32* @fails, align 4
  br label %if.end

if.end:                                           ; preds = %if.then, %land.lhs.true, %sw.epilog
  %25 = load i32* @fails, align 4
  %tobool8 = icmp ne i32 %25, 0
  br i1 %tobool8, label %if.then9, label %if.end10

if.then9:                                         ; preds = %if.end
  br label %for.end

if.end10:                                         ; preds = %if.end
  br label %for.inc

for.inc:                                          ; preds = %if.end10
  %26 = load i32* %i, align 4
  %inc11 = add nsw i32 %26, 1
  store i32 %inc11, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %if.then9, %for.cond
  %arraydecay12 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %arraydecay1213 = bitcast %struct.__va_list_tag* %arraydecay12 to i8*
  call void @llvm.va_end(i8* %arraydecay1213)
  ret void
}

declare void @llvm.va_start(i8*) nounwind

declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture, i64, i32, i1) nounwind

declare void @llvm.va_end(i8*) nounwind

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval
  store float -4.902600e+04, float* getelementptr inbounds ([5 x %struct.S]* @a, i32 0, i64 2, i32 0, i64 2), align 4
  %0 = load <2 x float>* getelementptr ({ <2 x float>, float }* bitcast (%struct.S* getelementptr inbounds ([5 x %struct.S]* @a, i32 0, i64 2) to { <2 x float>, float }*), i32 0, i32 0), align 1
  %1 = load float* getelementptr ({ <2 x float>, float }* bitcast (%struct.S* getelementptr inbounds ([5 x %struct.S]* @a, i32 0, i64 2) to { <2 x float>, float }*), i32 0, i32 1), align 1
  %2 = load <2 x float>* getelementptr ({ <2 x float>, float }* bitcast (%struct.S* getelementptr inbounds ([5 x %struct.S]* @a, i32 0, i64 2) to { <2 x float>, float }*), i32 0, i32 0), align 1
  %3 = load float* getelementptr ({ <2 x float>, float }* bitcast (%struct.S* getelementptr inbounds ([5 x %struct.S]* @a, i32 0, i64 2) to { <2 x float>, float }*), i32 0, i32 1), align 1
  call void (i32, ...)* @check(i32 1, <2 x float> %0, float %1, <2 x float> %2, float %3)
  %4 = load i32* @fails, align 4
  %tobool = icmp ne i32 %4, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  ret i32 0
}

declare void @abort() noreturn nounwind
