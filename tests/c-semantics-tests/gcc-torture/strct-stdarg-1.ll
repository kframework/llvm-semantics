; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/strct-stdarg-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.tiny = type { i8, i8, i8, i8, i8 }
%struct.__va_list_tag = type { i32, i32, i8*, i8* }

define void @f(i32 %n, ...) nounwind uwtable {
entry:
  %n.addr = alloca i32, align 4
  %x = alloca %struct.tiny, align 1
  %i = alloca i32, align 4
  %ap = alloca [1 x %struct.__va_list_tag], align 16
  %x29 = alloca i64, align 8
  store i32 %n, i32* %n.addr, align 4
  %arraydecay = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %arraydecay1 = bitcast %struct.__va_list_tag* %arraydecay to i8*
  call void @llvm.va_start(i8* %arraydecay1)
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32* %i, align 4
  %1 = load i32* %n.addr, align 4
  %cmp = icmp slt i32 %0, %1
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %arraydecay2 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %gp_offset_p = getelementptr inbounds %struct.__va_list_tag* %arraydecay2, i32 0, i32 0
  %gp_offset = load i32* %gp_offset_p
  %fits_in_gp = icmp ule i32 %gp_offset, 40
  br i1 %fits_in_gp, label %vaarg.in_reg, label %vaarg.in_mem

vaarg.in_reg:                                     ; preds = %for.body
  %2 = getelementptr inbounds %struct.__va_list_tag* %arraydecay2, i32 0, i32 3
  %reg_save_area = load i8** %2
  %3 = getelementptr i8* %reg_save_area, i32 %gp_offset
  %4 = bitcast i8* %3 to %struct.tiny*
  %5 = add i32 %gp_offset, 8
  store i32 %5, i32* %gp_offset_p
  br label %vaarg.end

vaarg.in_mem:                                     ; preds = %for.body
  %overflow_arg_area_p = getelementptr inbounds %struct.__va_list_tag* %arraydecay2, i32 0, i32 2
  %overflow_arg_area = load i8** %overflow_arg_area_p
  %6 = bitcast i8* %overflow_arg_area to %struct.tiny*
  %overflow_arg_area.next = getelementptr i8* %overflow_arg_area, i32 8
  store i8* %overflow_arg_area.next, i8** %overflow_arg_area_p
  br label %vaarg.end

vaarg.end:                                        ; preds = %vaarg.in_mem, %vaarg.in_reg
  %vaarg.addr = phi %struct.tiny* [ %4, %vaarg.in_reg ], [ %6, %vaarg.in_mem ]
  %7 = bitcast %struct.tiny* %x to i8*
  %8 = bitcast %struct.tiny* %vaarg.addr to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %7, i8* %8, i64 5, i32 1, i1 false)
  %c = getelementptr inbounds %struct.tiny* %x, i32 0, i32 0
  %9 = load i8* %c, align 1
  %conv = sext i8 %9 to i32
  %10 = load i32* %i, align 4
  %add = add nsw i32 %10, 10
  %cmp3 = icmp ne i32 %conv, %add
  br i1 %cmp3, label %if.then, label %if.end

if.then:                                          ; preds = %vaarg.end
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %vaarg.end
  %d = getelementptr inbounds %struct.tiny* %x, i32 0, i32 1
  %11 = load i8* %d, align 1
  %conv5 = sext i8 %11 to i32
  %12 = load i32* %i, align 4
  %add6 = add nsw i32 %12, 20
  %cmp7 = icmp ne i32 %conv5, %add6
  br i1 %cmp7, label %if.then9, label %if.end10

if.then9:                                         ; preds = %if.end
  call void @abort() noreturn nounwind
  unreachable

if.end10:                                         ; preds = %if.end
  %e = getelementptr inbounds %struct.tiny* %x, i32 0, i32 2
  %13 = load i8* %e, align 1
  %conv11 = sext i8 %13 to i32
  %14 = load i32* %i, align 4
  %add12 = add nsw i32 %14, 30
  %cmp13 = icmp ne i32 %conv11, %add12
  br i1 %cmp13, label %if.then15, label %if.end16

if.then15:                                        ; preds = %if.end10
  call void @abort() noreturn nounwind
  unreachable

if.end16:                                         ; preds = %if.end10
  %f = getelementptr inbounds %struct.tiny* %x, i32 0, i32 3
  %15 = load i8* %f, align 1
  %conv17 = sext i8 %15 to i32
  %16 = load i32* %i, align 4
  %add18 = add nsw i32 %16, 40
  %cmp19 = icmp ne i32 %conv17, %add18
  br i1 %cmp19, label %if.then21, label %if.end22

if.then21:                                        ; preds = %if.end16
  call void @abort() noreturn nounwind
  unreachable

if.end22:                                         ; preds = %if.end16
  %g = getelementptr inbounds %struct.tiny* %x, i32 0, i32 4
  %17 = load i8* %g, align 1
  %conv23 = sext i8 %17 to i32
  %18 = load i32* %i, align 4
  %add24 = add nsw i32 %18, 50
  %cmp25 = icmp ne i32 %conv23, %add24
  br i1 %cmp25, label %if.then27, label %if.end28

if.then27:                                        ; preds = %if.end22
  call void @abort() noreturn nounwind
  unreachable

if.end28:                                         ; preds = %if.end22
  br label %for.inc

for.inc:                                          ; preds = %if.end28
  %19 = load i32* %i, align 4
  %inc = add nsw i32 %19, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %arraydecay30 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %20 = va_arg %struct.__va_list_tag* %arraydecay30, i64
  store i64 %20, i64* %x29, align 8
  %21 = load i64* %x29, align 8
  %cmp31 = icmp ne i64 %21, 123
  br i1 %cmp31, label %if.then33, label %if.end34

if.then33:                                        ; preds = %for.end
  call void @abort() noreturn nounwind
  unreachable

if.end34:                                         ; preds = %for.end
  %arraydecay35 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %arraydecay3536 = bitcast %struct.__va_list_tag* %arraydecay35 to i8*
  call void @llvm.va_end(i8* %arraydecay3536)
  ret void
}

declare void @llvm.va_start(i8*) nounwind

declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture, i64, i32, i1) nounwind

declare void @abort() noreturn nounwind

declare void @llvm.va_end(i8*) nounwind

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %x = alloca [3 x %struct.tiny], align 1
  %tmp = alloca i40
  %tmp28 = alloca i40
  %tmp29 = alloca i40
  store i32 0, i32* %retval
  %arrayidx = getelementptr inbounds [3 x %struct.tiny]* %x, i32 0, i64 0
  %c = getelementptr inbounds %struct.tiny* %arrayidx, i32 0, i32 0
  store i8 10, i8* %c, align 1
  %arrayidx1 = getelementptr inbounds [3 x %struct.tiny]* %x, i32 0, i64 1
  %c2 = getelementptr inbounds %struct.tiny* %arrayidx1, i32 0, i32 0
  store i8 11, i8* %c2, align 1
  %arrayidx3 = getelementptr inbounds [3 x %struct.tiny]* %x, i32 0, i64 2
  %c4 = getelementptr inbounds %struct.tiny* %arrayidx3, i32 0, i32 0
  store i8 12, i8* %c4, align 1
  %arrayidx5 = getelementptr inbounds [3 x %struct.tiny]* %x, i32 0, i64 0
  %d = getelementptr inbounds %struct.tiny* %arrayidx5, i32 0, i32 1
  store i8 20, i8* %d, align 1
  %arrayidx6 = getelementptr inbounds [3 x %struct.tiny]* %x, i32 0, i64 1
  %d7 = getelementptr inbounds %struct.tiny* %arrayidx6, i32 0, i32 1
  store i8 21, i8* %d7, align 1
  %arrayidx8 = getelementptr inbounds [3 x %struct.tiny]* %x, i32 0, i64 2
  %d9 = getelementptr inbounds %struct.tiny* %arrayidx8, i32 0, i32 1
  store i8 22, i8* %d9, align 1
  %arrayidx10 = getelementptr inbounds [3 x %struct.tiny]* %x, i32 0, i64 0
  %e = getelementptr inbounds %struct.tiny* %arrayidx10, i32 0, i32 2
  store i8 30, i8* %e, align 1
  %arrayidx11 = getelementptr inbounds [3 x %struct.tiny]* %x, i32 0, i64 1
  %e12 = getelementptr inbounds %struct.tiny* %arrayidx11, i32 0, i32 2
  store i8 31, i8* %e12, align 1
  %arrayidx13 = getelementptr inbounds [3 x %struct.tiny]* %x, i32 0, i64 2
  %e14 = getelementptr inbounds %struct.tiny* %arrayidx13, i32 0, i32 2
  store i8 32, i8* %e14, align 1
  %arrayidx15 = getelementptr inbounds [3 x %struct.tiny]* %x, i32 0, i64 0
  %f = getelementptr inbounds %struct.tiny* %arrayidx15, i32 0, i32 3
  store i8 40, i8* %f, align 1
  %arrayidx16 = getelementptr inbounds [3 x %struct.tiny]* %x, i32 0, i64 1
  %f17 = getelementptr inbounds %struct.tiny* %arrayidx16, i32 0, i32 3
  store i8 41, i8* %f17, align 1
  %arrayidx18 = getelementptr inbounds [3 x %struct.tiny]* %x, i32 0, i64 2
  %f19 = getelementptr inbounds %struct.tiny* %arrayidx18, i32 0, i32 3
  store i8 42, i8* %f19, align 1
  %arrayidx20 = getelementptr inbounds [3 x %struct.tiny]* %x, i32 0, i64 0
  %g = getelementptr inbounds %struct.tiny* %arrayidx20, i32 0, i32 4
  store i8 50, i8* %g, align 1
  %arrayidx21 = getelementptr inbounds [3 x %struct.tiny]* %x, i32 0, i64 1
  %g22 = getelementptr inbounds %struct.tiny* %arrayidx21, i32 0, i32 4
  store i8 51, i8* %g22, align 1
  %arrayidx23 = getelementptr inbounds [3 x %struct.tiny]* %x, i32 0, i64 2
  %g24 = getelementptr inbounds %struct.tiny* %arrayidx23, i32 0, i32 4
  store i8 52, i8* %g24, align 1
  %arrayidx25 = getelementptr inbounds [3 x %struct.tiny]* %x, i32 0, i64 0
  %arrayidx26 = getelementptr inbounds [3 x %struct.tiny]* %x, i32 0, i64 1
  %arrayidx27 = getelementptr inbounds [3 x %struct.tiny]* %x, i32 0, i64 2
  %0 = bitcast i40* %tmp to %struct.tiny*
  %1 = load %struct.tiny* %arrayidx25
  store %struct.tiny %1, %struct.tiny* %0, align 1
  %2 = load i40* %tmp
  %3 = bitcast i40* %tmp28 to %struct.tiny*
  %4 = load %struct.tiny* %arrayidx26
  store %struct.tiny %4, %struct.tiny* %3, align 1
  %5 = load i40* %tmp28
  %6 = bitcast i40* %tmp29 to %struct.tiny*
  %7 = load %struct.tiny* %arrayidx27
  store %struct.tiny %7, %struct.tiny* %6, align 1
  %8 = load i40* %tmp29
  call void (i32, ...)* @f(i32 3, i40 %2, i40 %5, i40 %8, i64 123)
  call void @exit(i32 0) noreturn nounwind
  unreachable

return:                                           ; No predecessors!
  %9 = load i32* %retval
  ret i32 %9
}

declare void @exit(i32) noreturn nounwind
