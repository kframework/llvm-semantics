; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/va-arg-24.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

%struct.__va_list_tag = type { i32, i32, i8*, i8* }

@errors = internal unnamed_addr global i32 0, align 4
@.str = private unnamed_addr constant [9 x i8] c"varargs9\00", align 1
@.str1 = private unnamed_addr constant [29 x i8] c" %s: n[%d] = %d expected %d\0A\00", align 1
@.str2 = private unnamed_addr constant [9 x i8] c"varargs8\00", align 1
@.str3 = private unnamed_addr constant [9 x i8] c"varargs7\00", align 1
@.str4 = private unnamed_addr constant [9 x i8] c"varargs6\00", align 1
@.str5 = private unnamed_addr constant [9 x i8] c"varargs5\00", align 1
@.str6 = private unnamed_addr constant [9 x i8] c"varargs4\00", align 1
@.str7 = private unnamed_addr constant [9 x i8] c"varargs3\00", align 1
@.str8 = private unnamed_addr constant [9 x i8] c"varargs2\00", align 1
@.str9 = private unnamed_addr constant [9 x i8] c"varargs1\00", align 1
@.str10 = private unnamed_addr constant [9 x i8] c"varargs0\00", align 1

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

define i32 @main() noreturn nounwind uwtable {
entry:
  tail call void (...)* @varargs0(i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10)
  tail call void (...)* @varargs1(i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10)
  tail call void (...)* @varargs2(i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10)
  tail call void (...)* @varargs3(i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10)
  tail call void (...)* @varargs4(i32 5, i32 6, i32 7, i32 8, i32 9, i32 10)
  tail call void (...)* @varargs5(i32 6, i32 7, i32 8, i32 9, i32 10)
  tail call void (...)* @varargs6(i32 7, i32 8, i32 9, i32 10)
  tail call void (...)* @varargs7(i32 8, i32 9, i32 10)
  tail call void (...)* @varargs8(i32 9, i32 10)
  tail call void (...)* @varargs9(i32 10)
  %tmp = load i32* @errors, align 4
  %tobool = icmp eq i32 %tmp, 0
  br i1 %tobool, label %if.end, label %if.then

if.then:                                          ; preds = %entry
  tail call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  tail call void @exit(i32 0) noreturn nounwind
  unreachable
}

define internal void @varargs0(...) nounwind uwtable {
entry:
  %ap = alloca [1 x %struct.__va_list_tag], align 16
  %n = alloca [11 x i32], align 16
  %arraydecay1 = bitcast [1 x %struct.__va_list_tag]* %ap to i8*
  call void @llvm.va_start(i8* %arraydecay1)
  %arrayidx = getelementptr inbounds [11 x i32]* %n, i64 0, i64 0
  store i32 0, i32* %arrayidx, align 16
  %gp_offset_p = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i64 0, i64 0, i32 0
  %0 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i64 0, i64 0, i32 3
  %overflow_arg_area_p = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i64 0, i64 0, i32 2
  %gp_offset.pre = load i32* %gp_offset_p, align 16
  br label %for.body

for.body:                                         ; preds = %vaarg.end, %entry
  %gp_offset = phi i32 [ %gp_offset.pre, %entry ], [ %gp_offset5, %vaarg.end ]
  %indvar = phi i64 [ 0, %entry ], [ %tmp, %vaarg.end ]
  %tmp = add i64 %indvar, 1
  %arrayidx5 = getelementptr [11 x i32]* %n, i64 0, i64 %tmp
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
  %gp_offset5 = phi i32 [ %3, %vaarg.in_reg ], [ %gp_offset, %vaarg.in_mem ]
  %vaarg.addr.in = phi i8* [ %2, %vaarg.in_reg ], [ %overflow_arg_area, %vaarg.in_mem ]
  %vaarg.addr = bitcast i8* %vaarg.addr.in to i32*
  %4 = load i32* %vaarg.addr, align 4
  store i32 %4, i32* %arrayidx5, align 4
  %exitcond2 = icmp eq i64 %tmp, 10
  br i1 %exitcond2, label %for.end, label %for.body

for.end:                                          ; preds = %vaarg.end
  call void @llvm.va_end(i8* %arraydecay1)
  br label %for.body.i

for.body.i:                                       ; preds = %for.inc.i, %for.end
  %indvar.i = phi i64 [ 0, %for.end ], [ %5, %for.inc.i ]
  %arrayidx.i = getelementptr [11 x i32]* %n, i64 0, i64 %indvar.i
  %storemerge1.i = trunc i64 %indvar.i to i32
  %tmp3.i = load i32* %arrayidx.i, align 4
  %cmp5.i = icmp eq i32 %tmp3.i, %storemerge1.i
  br i1 %cmp5.i, label %for.inc.i, label %if.then.i

if.then.i:                                        ; preds = %for.body.i
  %call.i = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str1, i64 0, i64 0), i8* getelementptr inbounds ([9 x i8]* @.str10, i64 0, i64 0), i32 %storemerge1.i, i32 %tmp3.i, i32 %storemerge1.i) nounwind
  %tmp14.i = load i32* @errors, align 4
  %inc.i = add nsw i32 %tmp14.i, 1
  store i32 %inc.i, i32* @errors, align 4
  br label %for.inc.i

for.inc.i:                                        ; preds = %if.then.i, %for.body.i
  %5 = add i64 %indvar.i, 1
  %exitcond = icmp eq i64 %5, 11
  br i1 %exitcond, label %verify.exit, label %for.body.i

verify.exit:                                      ; preds = %for.inc.i
  ret void
}

define internal void @varargs1(...) nounwind uwtable {
entry:
  %ap = alloca [1 x %struct.__va_list_tag], align 16
  %n = alloca [11 x i32], align 16
  %arraydecay1 = bitcast [1 x %struct.__va_list_tag]* %ap to i8*
  call void @llvm.va_start(i8* %arraydecay1)
  %arrayidx = getelementptr inbounds [11 x i32]* %n, i64 0, i64 0
  store i32 0, i32* %arrayidx, align 16
  %arrayidx3 = getelementptr inbounds [11 x i32]* %n, i64 0, i64 1
  store i32 1, i32* %arrayidx3, align 4
  %gp_offset_p = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i64 0, i64 0, i32 0
  %0 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i64 0, i64 0, i32 3
  %overflow_arg_area_p = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i64 0, i64 0, i32 2
  %gp_offset.pre = load i32* %gp_offset_p, align 16
  br label %for.body

for.body:                                         ; preds = %vaarg.end, %entry
  %gp_offset = phi i32 [ %gp_offset.pre, %entry ], [ %gp_offset5, %vaarg.end ]
  %indvar = phi i64 [ 0, %entry ], [ %indvar.next, %vaarg.end ]
  %tmp = add i64 %indvar, 2
  %arrayidx7 = getelementptr [11 x i32]* %n, i64 0, i64 %tmp
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
  %gp_offset5 = phi i32 [ %3, %vaarg.in_reg ], [ %gp_offset, %vaarg.in_mem ]
  %vaarg.addr.in = phi i8* [ %2, %vaarg.in_reg ], [ %overflow_arg_area, %vaarg.in_mem ]
  %vaarg.addr = bitcast i8* %vaarg.addr.in to i32*
  %4 = load i32* %vaarg.addr, align 4
  store i32 %4, i32* %arrayidx7, align 4
  %indvar.next = add i64 %indvar, 1
  %exitcond2 = icmp eq i64 %indvar.next, 9
  br i1 %exitcond2, label %for.end, label %for.body

for.end:                                          ; preds = %vaarg.end
  call void @llvm.va_end(i8* %arraydecay1)
  br label %for.body.i

for.body.i:                                       ; preds = %for.inc.i, %for.end
  %indvar.i = phi i64 [ 0, %for.end ], [ %5, %for.inc.i ]
  %arrayidx.i = getelementptr [11 x i32]* %n, i64 0, i64 %indvar.i
  %storemerge1.i = trunc i64 %indvar.i to i32
  %tmp3.i = load i32* %arrayidx.i, align 4
  %cmp5.i = icmp eq i32 %tmp3.i, %storemerge1.i
  br i1 %cmp5.i, label %for.inc.i, label %if.then.i

if.then.i:                                        ; preds = %for.body.i
  %call.i = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str1, i64 0, i64 0), i8* getelementptr inbounds ([9 x i8]* @.str9, i64 0, i64 0), i32 %storemerge1.i, i32 %tmp3.i, i32 %storemerge1.i) nounwind
  %tmp14.i = load i32* @errors, align 4
  %inc.i = add nsw i32 %tmp14.i, 1
  store i32 %inc.i, i32* @errors, align 4
  br label %for.inc.i

for.inc.i:                                        ; preds = %if.then.i, %for.body.i
  %5 = add i64 %indvar.i, 1
  %exitcond = icmp eq i64 %5, 11
  br i1 %exitcond, label %verify.exit, label %for.body.i

verify.exit:                                      ; preds = %for.inc.i
  ret void
}

define internal void @varargs2(...) nounwind uwtable {
entry:
  %ap = alloca [1 x %struct.__va_list_tag], align 16
  %n = alloca [11 x i32], align 16
  %arraydecay1 = bitcast [1 x %struct.__va_list_tag]* %ap to i8*
  call void @llvm.va_start(i8* %arraydecay1)
  %arrayidx = getelementptr inbounds [11 x i32]* %n, i64 0, i64 0
  store i32 0, i32* %arrayidx, align 16
  %arrayidx3 = getelementptr inbounds [11 x i32]* %n, i64 0, i64 1
  store i32 1, i32* %arrayidx3, align 4
  %arrayidx5 = getelementptr inbounds [11 x i32]* %n, i64 0, i64 2
  store i32 2, i32* %arrayidx5, align 8
  %gp_offset_p = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i64 0, i64 0, i32 0
  %0 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i64 0, i64 0, i32 3
  %overflow_arg_area_p = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i64 0, i64 0, i32 2
  %gp_offset.pre = load i32* %gp_offset_p, align 16
  br label %for.body

for.body:                                         ; preds = %vaarg.end, %entry
  %gp_offset = phi i32 [ %gp_offset.pre, %entry ], [ %gp_offset5, %vaarg.end ]
  %indvar = phi i64 [ 0, %entry ], [ %indvar.next, %vaarg.end ]
  %tmp = add i64 %indvar, 3
  %arrayidx9 = getelementptr [11 x i32]* %n, i64 0, i64 %tmp
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
  %gp_offset5 = phi i32 [ %3, %vaarg.in_reg ], [ %gp_offset, %vaarg.in_mem ]
  %vaarg.addr.in = phi i8* [ %2, %vaarg.in_reg ], [ %overflow_arg_area, %vaarg.in_mem ]
  %vaarg.addr = bitcast i8* %vaarg.addr.in to i32*
  %4 = load i32* %vaarg.addr, align 4
  store i32 %4, i32* %arrayidx9, align 4
  %indvar.next = add i64 %indvar, 1
  %exitcond2 = icmp eq i64 %indvar.next, 8
  br i1 %exitcond2, label %for.end, label %for.body

for.end:                                          ; preds = %vaarg.end
  call void @llvm.va_end(i8* %arraydecay1)
  br label %for.body.i

for.body.i:                                       ; preds = %for.inc.i, %for.end
  %indvar.i = phi i64 [ 0, %for.end ], [ %5, %for.inc.i ]
  %arrayidx.i = getelementptr [11 x i32]* %n, i64 0, i64 %indvar.i
  %storemerge1.i = trunc i64 %indvar.i to i32
  %tmp3.i = load i32* %arrayidx.i, align 4
  %cmp5.i = icmp eq i32 %tmp3.i, %storemerge1.i
  br i1 %cmp5.i, label %for.inc.i, label %if.then.i

if.then.i:                                        ; preds = %for.body.i
  %call.i = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str1, i64 0, i64 0), i8* getelementptr inbounds ([9 x i8]* @.str8, i64 0, i64 0), i32 %storemerge1.i, i32 %tmp3.i, i32 %storemerge1.i) nounwind
  %tmp14.i = load i32* @errors, align 4
  %inc.i = add nsw i32 %tmp14.i, 1
  store i32 %inc.i, i32* @errors, align 4
  br label %for.inc.i

for.inc.i:                                        ; preds = %if.then.i, %for.body.i
  %5 = add i64 %indvar.i, 1
  %exitcond = icmp eq i64 %5, 11
  br i1 %exitcond, label %verify.exit, label %for.body.i

verify.exit:                                      ; preds = %for.inc.i
  ret void
}

define internal void @varargs3(...) nounwind uwtable {
entry:
  %ap = alloca [1 x %struct.__va_list_tag], align 16
  %n = alloca [11 x i32], align 16
  %arraydecay1 = bitcast [1 x %struct.__va_list_tag]* %ap to i8*
  call void @llvm.va_start(i8* %arraydecay1)
  %arrayidx = getelementptr inbounds [11 x i32]* %n, i64 0, i64 0
  store i32 0, i32* %arrayidx, align 16
  %arrayidx3 = getelementptr inbounds [11 x i32]* %n, i64 0, i64 1
  store i32 1, i32* %arrayidx3, align 4
  %arrayidx5 = getelementptr inbounds [11 x i32]* %n, i64 0, i64 2
  store i32 2, i32* %arrayidx5, align 8
  %arrayidx7 = getelementptr inbounds [11 x i32]* %n, i64 0, i64 3
  store i32 3, i32* %arrayidx7, align 4
  %gp_offset_p = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i64 0, i64 0, i32 0
  %0 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i64 0, i64 0, i32 3
  %overflow_arg_area_p = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i64 0, i64 0, i32 2
  %arrayidx11 = getelementptr [11 x i32]* %n, i64 0, i64 4
  %gp_offset = load i32* %gp_offset_p, align 16
  %fits_in_gp = icmp ult i32 %gp_offset, 41
  br i1 %fits_in_gp, label %vaarg.end, label %vaarg.end.thread

vaarg.end.thread:                                 ; preds = %entry
  %overflow_arg_area = load i8** %overflow_arg_area_p, align 8
  %overflow_arg_area.next = getelementptr i8* %overflow_arg_area, i64 8
  store i8* %overflow_arg_area.next, i8** %overflow_arg_area_p, align 8
  %vaarg.addr12 = bitcast i8* %overflow_arg_area to i32*
  %1 = load i32* %vaarg.addr12, align 4
  store i32 %1, i32* %arrayidx11, align 16
  %arrayidx11.113 = getelementptr [11 x i32]* %n, i64 0, i64 5
  br label %vaarg.in_mem.1

vaarg.end:                                        ; preds = %entry
  %reg_save_area = load i8** %0, align 16
  %2 = sext i32 %gp_offset to i64
  %3 = getelementptr i8* %reg_save_area, i64 %2
  %4 = add i32 %gp_offset, 8
  store i32 %4, i32* %gp_offset_p, align 16
  %vaarg.addr = bitcast i8* %3 to i32*
  %5 = load i32* %vaarg.addr, align 4
  store i32 %5, i32* %arrayidx11, align 16
  %arrayidx11.1 = getelementptr [11 x i32]* %n, i64 0, i64 5
  %fits_in_gp.1 = icmp ult i32 %4, 41
  br i1 %fits_in_gp.1, label %vaarg.in_reg.1, label %vaarg.in_mem.1

for.body.i:                                       ; preds = %for.inc.i.for.body.i_crit_edge, %vaarg.end.6
  %tmp3.i = phi i32 [ 0, %vaarg.end.6 ], [ %tmp3.i.pre, %for.inc.i.for.body.i_crit_edge ]
  %indvar.i = phi i64 [ 0, %vaarg.end.6 ], [ %6, %for.inc.i.for.body.i_crit_edge ]
  %storemerge1.i = trunc i64 %indvar.i to i32
  %cmp5.i = icmp eq i32 %tmp3.i, %storemerge1.i
  br i1 %cmp5.i, label %for.inc.i, label %if.then.i

if.then.i:                                        ; preds = %for.body.i
  %call.i = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str1, i64 0, i64 0), i8* getelementptr inbounds ([9 x i8]* @.str7, i64 0, i64 0), i32 %storemerge1.i, i32 %tmp3.i, i32 %storemerge1.i) nounwind
  %tmp14.i = load i32* @errors, align 4
  %inc.i = add nsw i32 %tmp14.i, 1
  store i32 %inc.i, i32* @errors, align 4
  br label %for.inc.i

for.inc.i:                                        ; preds = %if.then.i, %for.body.i
  %6 = add i64 %indvar.i, 1
  %exitcond = icmp eq i64 %6, 11
  br i1 %exitcond, label %verify.exit, label %for.inc.i.for.body.i_crit_edge

for.inc.i.for.body.i_crit_edge:                   ; preds = %for.inc.i
  %arrayidx.i.phi.trans.insert = getelementptr [11 x i32]* %n, i64 0, i64 %6
  %tmp3.i.pre = load i32* %arrayidx.i.phi.trans.insert, align 4
  br label %for.body.i

verify.exit:                                      ; preds = %for.inc.i
  ret void

vaarg.end.1:                                      ; preds = %vaarg.in_mem.1, %vaarg.in_reg.1
  %arrayidx11.116 = phi i32* [ %arrayidx11.1, %vaarg.in_reg.1 ], [ %arrayidx11.117, %vaarg.in_mem.1 ]
  %gp_offset.2 = phi i32 [ %10, %vaarg.in_reg.1 ], [ %gp_offset.115, %vaarg.in_mem.1 ]
  %vaarg.addr.in.1 = phi i8* [ %9, %vaarg.in_reg.1 ], [ %overflow_arg_area.1, %vaarg.in_mem.1 ]
  %vaarg.addr.1 = bitcast i8* %vaarg.addr.in.1 to i32*
  %7 = load i32* %vaarg.addr.1, align 4
  store i32 %7, i32* %arrayidx11.116, align 4
  %arrayidx11.2 = getelementptr [11 x i32]* %n, i64 0, i64 6
  %fits_in_gp.2 = icmp ult i32 %gp_offset.2, 41
  br i1 %fits_in_gp.2, label %vaarg.end.2, label %vaarg.end.2.thread

vaarg.in_reg.1:                                   ; preds = %vaarg.end
  %reg_save_area.1 = load i8** %0, align 16
  %8 = sext i32 %4 to i64
  %9 = getelementptr i8* %reg_save_area.1, i64 %8
  %10 = add i32 %gp_offset, 16
  store i32 %10, i32* %gp_offset_p, align 16
  br label %vaarg.end.1

vaarg.in_mem.1:                                   ; preds = %vaarg.end.thread, %vaarg.end
  %arrayidx11.117 = phi i32* [ %arrayidx11.113, %vaarg.end.thread ], [ %arrayidx11.1, %vaarg.end ]
  %gp_offset.115 = phi i32 [ %gp_offset, %vaarg.end.thread ], [ %4, %vaarg.end ]
  %overflow_arg_area.1 = load i8** %overflow_arg_area_p, align 8
  %overflow_arg_area.next.1 = getelementptr i8* %overflow_arg_area.1, i64 8
  store i8* %overflow_arg_area.next.1, i8** %overflow_arg_area_p, align 8
  br label %vaarg.end.1

vaarg.end.2:                                      ; preds = %vaarg.end.1
  %reg_save_area.2 = load i8** %0, align 16
  %11 = sext i32 %gp_offset.2 to i64
  %12 = getelementptr i8* %reg_save_area.2, i64 %11
  %13 = add i32 %gp_offset.2, 8
  store i32 %13, i32* %gp_offset_p, align 16
  %vaarg.addr.2 = bitcast i8* %12 to i32*
  %14 = load i32* %vaarg.addr.2, align 4
  store i32 %14, i32* %arrayidx11.2, align 8
  %arrayidx11.3 = getelementptr [11 x i32]* %n, i64 0, i64 7
  %fits_in_gp.3 = icmp ult i32 %13, 41
  br i1 %fits_in_gp.3, label %vaarg.in_reg.3, label %vaarg.in_mem.3

vaarg.end.2.thread:                               ; preds = %vaarg.end.1
  %overflow_arg_area.2 = load i8** %overflow_arg_area_p, align 8
  %overflow_arg_area.next.2 = getelementptr i8* %overflow_arg_area.2, i64 8
  store i8* %overflow_arg_area.next.2, i8** %overflow_arg_area_p, align 8
  %vaarg.addr.218 = bitcast i8* %overflow_arg_area.2 to i32*
  %15 = load i32* %vaarg.addr.218, align 4
  store i32 %15, i32* %arrayidx11.2, align 8
  %arrayidx11.319 = getelementptr [11 x i32]* %n, i64 0, i64 7
  br label %vaarg.in_mem.3

vaarg.end.3:                                      ; preds = %vaarg.in_mem.3, %vaarg.in_reg.3
  %arrayidx11.322 = phi i32* [ %arrayidx11.3, %vaarg.in_reg.3 ], [ %arrayidx11.323, %vaarg.in_mem.3 ]
  %gp_offset.4 = phi i32 [ %19, %vaarg.in_reg.3 ], [ %gp_offset.321, %vaarg.in_mem.3 ]
  %vaarg.addr.in.3 = phi i8* [ %18, %vaarg.in_reg.3 ], [ %overflow_arg_area.3, %vaarg.in_mem.3 ]
  %vaarg.addr.3 = bitcast i8* %vaarg.addr.in.3 to i32*
  %16 = load i32* %vaarg.addr.3, align 4
  store i32 %16, i32* %arrayidx11.322, align 4
  %arrayidx11.4 = getelementptr [11 x i32]* %n, i64 0, i64 8
  %fits_in_gp.4 = icmp ult i32 %gp_offset.4, 41
  br i1 %fits_in_gp.4, label %vaarg.end.4, label %vaarg.end.4.thread

vaarg.in_reg.3:                                   ; preds = %vaarg.end.2
  %reg_save_area.3 = load i8** %0, align 16
  %17 = sext i32 %13 to i64
  %18 = getelementptr i8* %reg_save_area.3, i64 %17
  %19 = add i32 %gp_offset.2, 16
  store i32 %19, i32* %gp_offset_p, align 16
  br label %vaarg.end.3

vaarg.in_mem.3:                                   ; preds = %vaarg.end.2.thread, %vaarg.end.2
  %arrayidx11.323 = phi i32* [ %arrayidx11.319, %vaarg.end.2.thread ], [ %arrayidx11.3, %vaarg.end.2 ]
  %gp_offset.321 = phi i32 [ %gp_offset.2, %vaarg.end.2.thread ], [ %13, %vaarg.end.2 ]
  %overflow_arg_area.3 = load i8** %overflow_arg_area_p, align 8
  %overflow_arg_area.next.3 = getelementptr i8* %overflow_arg_area.3, i64 8
  store i8* %overflow_arg_area.next.3, i8** %overflow_arg_area_p, align 8
  br label %vaarg.end.3

vaarg.end.4:                                      ; preds = %vaarg.end.3
  %reg_save_area.4 = load i8** %0, align 16
  %20 = sext i32 %gp_offset.4 to i64
  %21 = getelementptr i8* %reg_save_area.4, i64 %20
  %22 = add i32 %gp_offset.4, 8
  store i32 %22, i32* %gp_offset_p, align 16
  %vaarg.addr.4 = bitcast i8* %21 to i32*
  %23 = load i32* %vaarg.addr.4, align 4
  store i32 %23, i32* %arrayidx11.4, align 16
  %arrayidx11.5 = getelementptr [11 x i32]* %n, i64 0, i64 9
  %fits_in_gp.5 = icmp ult i32 %22, 41
  br i1 %fits_in_gp.5, label %vaarg.in_reg.5, label %vaarg.in_mem.5

vaarg.end.4.thread:                               ; preds = %vaarg.end.3
  %overflow_arg_area.4 = load i8** %overflow_arg_area_p, align 8
  %overflow_arg_area.next.4 = getelementptr i8* %overflow_arg_area.4, i64 8
  store i8* %overflow_arg_area.next.4, i8** %overflow_arg_area_p, align 8
  %vaarg.addr.424 = bitcast i8* %overflow_arg_area.4 to i32*
  %24 = load i32* %vaarg.addr.424, align 4
  store i32 %24, i32* %arrayidx11.4, align 16
  %arrayidx11.525 = getelementptr [11 x i32]* %n, i64 0, i64 9
  br label %vaarg.in_mem.5

vaarg.end.5:                                      ; preds = %vaarg.in_mem.5, %vaarg.in_reg.5
  %arrayidx11.528 = phi i32* [ %arrayidx11.5, %vaarg.in_reg.5 ], [ %arrayidx11.529, %vaarg.in_mem.5 ]
  %gp_offset.6 = phi i32 [ %28, %vaarg.in_reg.5 ], [ %gp_offset.527, %vaarg.in_mem.5 ]
  %vaarg.addr.in.5 = phi i8* [ %27, %vaarg.in_reg.5 ], [ %overflow_arg_area.5, %vaarg.in_mem.5 ]
  %vaarg.addr.5 = bitcast i8* %vaarg.addr.in.5 to i32*
  %25 = load i32* %vaarg.addr.5, align 4
  store i32 %25, i32* %arrayidx11.528, align 4
  %arrayidx11.6 = getelementptr [11 x i32]* %n, i64 0, i64 10
  %fits_in_gp.6 = icmp ult i32 %gp_offset.6, 41
  br i1 %fits_in_gp.6, label %vaarg.in_reg.6, label %vaarg.in_mem.6

vaarg.in_reg.5:                                   ; preds = %vaarg.end.4
  %reg_save_area.5 = load i8** %0, align 16
  %26 = sext i32 %22 to i64
  %27 = getelementptr i8* %reg_save_area.5, i64 %26
  %28 = add i32 %gp_offset.4, 16
  store i32 %28, i32* %gp_offset_p, align 16
  br label %vaarg.end.5

vaarg.in_mem.5:                                   ; preds = %vaarg.end.4.thread, %vaarg.end.4
  %arrayidx11.529 = phi i32* [ %arrayidx11.525, %vaarg.end.4.thread ], [ %arrayidx11.5, %vaarg.end.4 ]
  %gp_offset.527 = phi i32 [ %gp_offset.4, %vaarg.end.4.thread ], [ %22, %vaarg.end.4 ]
  %overflow_arg_area.5 = load i8** %overflow_arg_area_p, align 8
  %overflow_arg_area.next.5 = getelementptr i8* %overflow_arg_area.5, i64 8
  store i8* %overflow_arg_area.next.5, i8** %overflow_arg_area_p, align 8
  br label %vaarg.end.5

vaarg.end.6:                                      ; preds = %vaarg.in_mem.6, %vaarg.in_reg.6
  %vaarg.addr.in.6 = phi i8* [ %31, %vaarg.in_reg.6 ], [ %overflow_arg_area.6, %vaarg.in_mem.6 ]
  %vaarg.addr.6 = bitcast i8* %vaarg.addr.in.6 to i32*
  %29 = load i32* %vaarg.addr.6, align 4
  store i32 %29, i32* %arrayidx11.6, align 8
  call void @llvm.va_end(i8* %arraydecay1)
  br label %for.body.i

vaarg.in_reg.6:                                   ; preds = %vaarg.end.5
  %reg_save_area.6 = load i8** %0, align 16
  %30 = sext i32 %gp_offset.6 to i64
  %31 = getelementptr i8* %reg_save_area.6, i64 %30
  %32 = add i32 %gp_offset.6, 8
  store i32 %32, i32* %gp_offset_p, align 16
  br label %vaarg.end.6

vaarg.in_mem.6:                                   ; preds = %vaarg.end.5
  %overflow_arg_area.6 = load i8** %overflow_arg_area_p, align 8
  %overflow_arg_area.next.6 = getelementptr i8* %overflow_arg_area.6, i64 8
  store i8* %overflow_arg_area.next.6, i8** %overflow_arg_area_p, align 8
  br label %vaarg.end.6
}

define internal void @varargs4(...) nounwind uwtable {
entry:
  %ap = alloca [1 x %struct.__va_list_tag], align 16
  %n = alloca [11 x i32], align 16
  %arraydecay1 = bitcast [1 x %struct.__va_list_tag]* %ap to i8*
  call void @llvm.va_start(i8* %arraydecay1)
  %arrayidx = getelementptr inbounds [11 x i32]* %n, i64 0, i64 0
  store i32 0, i32* %arrayidx, align 16
  %arrayidx3 = getelementptr inbounds [11 x i32]* %n, i64 0, i64 1
  store i32 1, i32* %arrayidx3, align 4
  %arrayidx5 = getelementptr inbounds [11 x i32]* %n, i64 0, i64 2
  store i32 2, i32* %arrayidx5, align 8
  %arrayidx7 = getelementptr inbounds [11 x i32]* %n, i64 0, i64 3
  store i32 3, i32* %arrayidx7, align 4
  %arrayidx9 = getelementptr inbounds [11 x i32]* %n, i64 0, i64 4
  store i32 4, i32* %arrayidx9, align 16
  %gp_offset_p = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i64 0, i64 0, i32 0
  %0 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i64 0, i64 0, i32 3
  %overflow_arg_area_p = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i64 0, i64 0, i32 2
  %arrayidx13 = getelementptr [11 x i32]* %n, i64 0, i64 5
  %gp_offset = load i32* %gp_offset_p, align 16
  %fits_in_gp = icmp ult i32 %gp_offset, 41
  br i1 %fits_in_gp, label %vaarg.end, label %vaarg.end.thread

vaarg.end.thread:                                 ; preds = %entry
  %overflow_arg_area = load i8** %overflow_arg_area_p, align 8
  %overflow_arg_area.next = getelementptr i8* %overflow_arg_area, i64 8
  store i8* %overflow_arg_area.next, i8** %overflow_arg_area_p, align 8
  %vaarg.addr11 = bitcast i8* %overflow_arg_area to i32*
  %1 = load i32* %vaarg.addr11, align 4
  store i32 %1, i32* %arrayidx13, align 4
  %arrayidx13.112 = getelementptr [11 x i32]* %n, i64 0, i64 6
  br label %vaarg.in_mem.1

vaarg.end:                                        ; preds = %entry
  %reg_save_area = load i8** %0, align 16
  %2 = sext i32 %gp_offset to i64
  %3 = getelementptr i8* %reg_save_area, i64 %2
  %4 = add i32 %gp_offset, 8
  store i32 %4, i32* %gp_offset_p, align 16
  %vaarg.addr = bitcast i8* %3 to i32*
  %5 = load i32* %vaarg.addr, align 4
  store i32 %5, i32* %arrayidx13, align 4
  %arrayidx13.1 = getelementptr [11 x i32]* %n, i64 0, i64 6
  %fits_in_gp.1 = icmp ult i32 %4, 41
  br i1 %fits_in_gp.1, label %vaarg.in_reg.1, label %vaarg.in_mem.1

for.body.i:                                       ; preds = %for.inc.i.for.body.i_crit_edge, %vaarg.end.5
  %tmp3.i = phi i32 [ 0, %vaarg.end.5 ], [ %tmp3.i.pre, %for.inc.i.for.body.i_crit_edge ]
  %indvar.i = phi i64 [ 0, %vaarg.end.5 ], [ %6, %for.inc.i.for.body.i_crit_edge ]
  %storemerge1.i = trunc i64 %indvar.i to i32
  %cmp5.i = icmp eq i32 %tmp3.i, %storemerge1.i
  br i1 %cmp5.i, label %for.inc.i, label %if.then.i

if.then.i:                                        ; preds = %for.body.i
  %call.i = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str1, i64 0, i64 0), i8* getelementptr inbounds ([9 x i8]* @.str6, i64 0, i64 0), i32 %storemerge1.i, i32 %tmp3.i, i32 %storemerge1.i) nounwind
  %tmp14.i = load i32* @errors, align 4
  %inc.i = add nsw i32 %tmp14.i, 1
  store i32 %inc.i, i32* @errors, align 4
  br label %for.inc.i

for.inc.i:                                        ; preds = %if.then.i, %for.body.i
  %6 = add i64 %indvar.i, 1
  %exitcond = icmp eq i64 %6, 11
  br i1 %exitcond, label %verify.exit, label %for.inc.i.for.body.i_crit_edge

for.inc.i.for.body.i_crit_edge:                   ; preds = %for.inc.i
  %arrayidx.i.phi.trans.insert = getelementptr [11 x i32]* %n, i64 0, i64 %6
  %tmp3.i.pre = load i32* %arrayidx.i.phi.trans.insert, align 4
  br label %for.body.i

verify.exit:                                      ; preds = %for.inc.i
  ret void

vaarg.end.1:                                      ; preds = %vaarg.in_mem.1, %vaarg.in_reg.1
  %arrayidx13.115 = phi i32* [ %arrayidx13.1, %vaarg.in_reg.1 ], [ %arrayidx13.116, %vaarg.in_mem.1 ]
  %gp_offset.2 = phi i32 [ %10, %vaarg.in_reg.1 ], [ %gp_offset.114, %vaarg.in_mem.1 ]
  %vaarg.addr.in.1 = phi i8* [ %9, %vaarg.in_reg.1 ], [ %overflow_arg_area.1, %vaarg.in_mem.1 ]
  %vaarg.addr.1 = bitcast i8* %vaarg.addr.in.1 to i32*
  %7 = load i32* %vaarg.addr.1, align 4
  store i32 %7, i32* %arrayidx13.115, align 8
  %arrayidx13.2 = getelementptr [11 x i32]* %n, i64 0, i64 7
  %fits_in_gp.2 = icmp ult i32 %gp_offset.2, 41
  br i1 %fits_in_gp.2, label %vaarg.end.2, label %vaarg.end.2.thread

vaarg.in_reg.1:                                   ; preds = %vaarg.end
  %reg_save_area.1 = load i8** %0, align 16
  %8 = sext i32 %4 to i64
  %9 = getelementptr i8* %reg_save_area.1, i64 %8
  %10 = add i32 %gp_offset, 16
  store i32 %10, i32* %gp_offset_p, align 16
  br label %vaarg.end.1

vaarg.in_mem.1:                                   ; preds = %vaarg.end.thread, %vaarg.end
  %arrayidx13.116 = phi i32* [ %arrayidx13.112, %vaarg.end.thread ], [ %arrayidx13.1, %vaarg.end ]
  %gp_offset.114 = phi i32 [ %gp_offset, %vaarg.end.thread ], [ %4, %vaarg.end ]
  %overflow_arg_area.1 = load i8** %overflow_arg_area_p, align 8
  %overflow_arg_area.next.1 = getelementptr i8* %overflow_arg_area.1, i64 8
  store i8* %overflow_arg_area.next.1, i8** %overflow_arg_area_p, align 8
  br label %vaarg.end.1

vaarg.end.2:                                      ; preds = %vaarg.end.1
  %reg_save_area.2 = load i8** %0, align 16
  %11 = sext i32 %gp_offset.2 to i64
  %12 = getelementptr i8* %reg_save_area.2, i64 %11
  %13 = add i32 %gp_offset.2, 8
  store i32 %13, i32* %gp_offset_p, align 16
  %vaarg.addr.2 = bitcast i8* %12 to i32*
  %14 = load i32* %vaarg.addr.2, align 4
  store i32 %14, i32* %arrayidx13.2, align 4
  %arrayidx13.3 = getelementptr [11 x i32]* %n, i64 0, i64 8
  %fits_in_gp.3 = icmp ult i32 %13, 41
  br i1 %fits_in_gp.3, label %vaarg.in_reg.3, label %vaarg.in_mem.3

vaarg.end.2.thread:                               ; preds = %vaarg.end.1
  %overflow_arg_area.2 = load i8** %overflow_arg_area_p, align 8
  %overflow_arg_area.next.2 = getelementptr i8* %overflow_arg_area.2, i64 8
  store i8* %overflow_arg_area.next.2, i8** %overflow_arg_area_p, align 8
  %vaarg.addr.217 = bitcast i8* %overflow_arg_area.2 to i32*
  %15 = load i32* %vaarg.addr.217, align 4
  store i32 %15, i32* %arrayidx13.2, align 4
  %arrayidx13.318 = getelementptr [11 x i32]* %n, i64 0, i64 8
  br label %vaarg.in_mem.3

vaarg.end.3:                                      ; preds = %vaarg.in_mem.3, %vaarg.in_reg.3
  %arrayidx13.321 = phi i32* [ %arrayidx13.3, %vaarg.in_reg.3 ], [ %arrayidx13.322, %vaarg.in_mem.3 ]
  %gp_offset.4 = phi i32 [ %19, %vaarg.in_reg.3 ], [ %gp_offset.320, %vaarg.in_mem.3 ]
  %vaarg.addr.in.3 = phi i8* [ %18, %vaarg.in_reg.3 ], [ %overflow_arg_area.3, %vaarg.in_mem.3 ]
  %vaarg.addr.3 = bitcast i8* %vaarg.addr.in.3 to i32*
  %16 = load i32* %vaarg.addr.3, align 4
  store i32 %16, i32* %arrayidx13.321, align 16
  %arrayidx13.4 = getelementptr [11 x i32]* %n, i64 0, i64 9
  %fits_in_gp.4 = icmp ult i32 %gp_offset.4, 41
  br i1 %fits_in_gp.4, label %vaarg.end.4, label %vaarg.end.4.thread

vaarg.in_reg.3:                                   ; preds = %vaarg.end.2
  %reg_save_area.3 = load i8** %0, align 16
  %17 = sext i32 %13 to i64
  %18 = getelementptr i8* %reg_save_area.3, i64 %17
  %19 = add i32 %gp_offset.2, 16
  store i32 %19, i32* %gp_offset_p, align 16
  br label %vaarg.end.3

vaarg.in_mem.3:                                   ; preds = %vaarg.end.2.thread, %vaarg.end.2
  %arrayidx13.322 = phi i32* [ %arrayidx13.318, %vaarg.end.2.thread ], [ %arrayidx13.3, %vaarg.end.2 ]
  %gp_offset.320 = phi i32 [ %gp_offset.2, %vaarg.end.2.thread ], [ %13, %vaarg.end.2 ]
  %overflow_arg_area.3 = load i8** %overflow_arg_area_p, align 8
  %overflow_arg_area.next.3 = getelementptr i8* %overflow_arg_area.3, i64 8
  store i8* %overflow_arg_area.next.3, i8** %overflow_arg_area_p, align 8
  br label %vaarg.end.3

vaarg.end.4:                                      ; preds = %vaarg.end.3
  %reg_save_area.4 = load i8** %0, align 16
  %20 = sext i32 %gp_offset.4 to i64
  %21 = getelementptr i8* %reg_save_area.4, i64 %20
  %22 = add i32 %gp_offset.4, 8
  store i32 %22, i32* %gp_offset_p, align 16
  %vaarg.addr.4 = bitcast i8* %21 to i32*
  %23 = load i32* %vaarg.addr.4, align 4
  store i32 %23, i32* %arrayidx13.4, align 4
  %arrayidx13.5 = getelementptr [11 x i32]* %n, i64 0, i64 10
  %fits_in_gp.5 = icmp ult i32 %22, 41
  br i1 %fits_in_gp.5, label %vaarg.in_reg.5, label %vaarg.in_mem.5

vaarg.end.4.thread:                               ; preds = %vaarg.end.3
  %overflow_arg_area.4 = load i8** %overflow_arg_area_p, align 8
  %overflow_arg_area.next.4 = getelementptr i8* %overflow_arg_area.4, i64 8
  store i8* %overflow_arg_area.next.4, i8** %overflow_arg_area_p, align 8
  %vaarg.addr.423 = bitcast i8* %overflow_arg_area.4 to i32*
  %24 = load i32* %vaarg.addr.423, align 4
  store i32 %24, i32* %arrayidx13.4, align 4
  %arrayidx13.524 = getelementptr [11 x i32]* %n, i64 0, i64 10
  br label %vaarg.in_mem.5

vaarg.end.5:                                      ; preds = %vaarg.in_mem.5, %vaarg.in_reg.5
  %arrayidx13.526 = phi i32* [ %arrayidx13.5, %vaarg.in_reg.5 ], [ %arrayidx13.527, %vaarg.in_mem.5 ]
  %vaarg.addr.in.5 = phi i8* [ %27, %vaarg.in_reg.5 ], [ %overflow_arg_area.5, %vaarg.in_mem.5 ]
  %vaarg.addr.5 = bitcast i8* %vaarg.addr.in.5 to i32*
  %25 = load i32* %vaarg.addr.5, align 4
  store i32 %25, i32* %arrayidx13.526, align 8
  call void @llvm.va_end(i8* %arraydecay1)
  br label %for.body.i

vaarg.in_reg.5:                                   ; preds = %vaarg.end.4
  %reg_save_area.5 = load i8** %0, align 16
  %26 = sext i32 %22 to i64
  %27 = getelementptr i8* %reg_save_area.5, i64 %26
  %28 = add i32 %gp_offset.4, 16
  store i32 %28, i32* %gp_offset_p, align 16
  br label %vaarg.end.5

vaarg.in_mem.5:                                   ; preds = %vaarg.end.4.thread, %vaarg.end.4
  %arrayidx13.527 = phi i32* [ %arrayidx13.524, %vaarg.end.4.thread ], [ %arrayidx13.5, %vaarg.end.4 ]
  %overflow_arg_area.5 = load i8** %overflow_arg_area_p, align 8
  %overflow_arg_area.next.5 = getelementptr i8* %overflow_arg_area.5, i64 8
  store i8* %overflow_arg_area.next.5, i8** %overflow_arg_area_p, align 8
  br label %vaarg.end.5
}

define internal void @varargs5(...) nounwind uwtable {
entry:
  %ap = alloca [1 x %struct.__va_list_tag], align 16
  %n = alloca [11 x i32], align 16
  %arraydecay1 = bitcast [1 x %struct.__va_list_tag]* %ap to i8*
  call void @llvm.va_start(i8* %arraydecay1)
  %arrayidx = getelementptr inbounds [11 x i32]* %n, i64 0, i64 0
  store i32 0, i32* %arrayidx, align 16
  %arrayidx3 = getelementptr inbounds [11 x i32]* %n, i64 0, i64 1
  store i32 1, i32* %arrayidx3, align 4
  %arrayidx5 = getelementptr inbounds [11 x i32]* %n, i64 0, i64 2
  store i32 2, i32* %arrayidx5, align 8
  %arrayidx7 = getelementptr inbounds [11 x i32]* %n, i64 0, i64 3
  store i32 3, i32* %arrayidx7, align 4
  %arrayidx9 = getelementptr inbounds [11 x i32]* %n, i64 0, i64 4
  store i32 4, i32* %arrayidx9, align 16
  %arrayidx11 = getelementptr inbounds [11 x i32]* %n, i64 0, i64 5
  store i32 5, i32* %arrayidx11, align 4
  %gp_offset_p = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i64 0, i64 0, i32 0
  %0 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i64 0, i64 0, i32 3
  %overflow_arg_area_p = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i64 0, i64 0, i32 2
  %arrayidx15 = getelementptr [11 x i32]* %n, i64 0, i64 6
  %gp_offset = load i32* %gp_offset_p, align 16
  %fits_in_gp = icmp ult i32 %gp_offset, 41
  br i1 %fits_in_gp, label %vaarg.end, label %vaarg.end.thread

vaarg.end.thread:                                 ; preds = %entry
  %overflow_arg_area = load i8** %overflow_arg_area_p, align 8
  %overflow_arg_area.next = getelementptr i8* %overflow_arg_area, i64 8
  store i8* %overflow_arg_area.next, i8** %overflow_arg_area_p, align 8
  %vaarg.addr10 = bitcast i8* %overflow_arg_area to i32*
  %1 = load i32* %vaarg.addr10, align 4
  store i32 %1, i32* %arrayidx15, align 8
  %arrayidx15.111 = getelementptr [11 x i32]* %n, i64 0, i64 7
  br label %vaarg.in_mem.1

vaarg.end:                                        ; preds = %entry
  %reg_save_area = load i8** %0, align 16
  %2 = sext i32 %gp_offset to i64
  %3 = getelementptr i8* %reg_save_area, i64 %2
  %4 = add i32 %gp_offset, 8
  store i32 %4, i32* %gp_offset_p, align 16
  %vaarg.addr = bitcast i8* %3 to i32*
  %5 = load i32* %vaarg.addr, align 4
  store i32 %5, i32* %arrayidx15, align 8
  %arrayidx15.1 = getelementptr [11 x i32]* %n, i64 0, i64 7
  %fits_in_gp.1 = icmp ult i32 %4, 41
  br i1 %fits_in_gp.1, label %vaarg.in_reg.1, label %vaarg.in_mem.1

for.body.i:                                       ; preds = %for.inc.i.for.body.i_crit_edge, %vaarg.end.4
  %tmp3.i = phi i32 [ 0, %vaarg.end.4 ], [ %tmp3.i.pre, %for.inc.i.for.body.i_crit_edge ]
  %indvar.i = phi i64 [ 0, %vaarg.end.4 ], [ %6, %for.inc.i.for.body.i_crit_edge ]
  %storemerge1.i = trunc i64 %indvar.i to i32
  %cmp5.i = icmp eq i32 %tmp3.i, %storemerge1.i
  br i1 %cmp5.i, label %for.inc.i, label %if.then.i

if.then.i:                                        ; preds = %for.body.i
  %call.i = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str1, i64 0, i64 0), i8* getelementptr inbounds ([9 x i8]* @.str5, i64 0, i64 0), i32 %storemerge1.i, i32 %tmp3.i, i32 %storemerge1.i) nounwind
  %tmp14.i = load i32* @errors, align 4
  %inc.i = add nsw i32 %tmp14.i, 1
  store i32 %inc.i, i32* @errors, align 4
  br label %for.inc.i

for.inc.i:                                        ; preds = %if.then.i, %for.body.i
  %6 = add i64 %indvar.i, 1
  %exitcond = icmp eq i64 %6, 11
  br i1 %exitcond, label %verify.exit, label %for.inc.i.for.body.i_crit_edge

for.inc.i.for.body.i_crit_edge:                   ; preds = %for.inc.i
  %arrayidx.i.phi.trans.insert = getelementptr [11 x i32]* %n, i64 0, i64 %6
  %tmp3.i.pre = load i32* %arrayidx.i.phi.trans.insert, align 4
  br label %for.body.i

verify.exit:                                      ; preds = %for.inc.i
  ret void

vaarg.end.1:                                      ; preds = %vaarg.in_mem.1, %vaarg.in_reg.1
  %arrayidx15.114 = phi i32* [ %arrayidx15.1, %vaarg.in_reg.1 ], [ %arrayidx15.115, %vaarg.in_mem.1 ]
  %gp_offset.2 = phi i32 [ %10, %vaarg.in_reg.1 ], [ %gp_offset.113, %vaarg.in_mem.1 ]
  %vaarg.addr.in.1 = phi i8* [ %9, %vaarg.in_reg.1 ], [ %overflow_arg_area.1, %vaarg.in_mem.1 ]
  %vaarg.addr.1 = bitcast i8* %vaarg.addr.in.1 to i32*
  %7 = load i32* %vaarg.addr.1, align 4
  store i32 %7, i32* %arrayidx15.114, align 4
  %arrayidx15.2 = getelementptr [11 x i32]* %n, i64 0, i64 8
  %fits_in_gp.2 = icmp ult i32 %gp_offset.2, 41
  br i1 %fits_in_gp.2, label %vaarg.end.2, label %vaarg.end.2.thread

vaarg.in_reg.1:                                   ; preds = %vaarg.end
  %reg_save_area.1 = load i8** %0, align 16
  %8 = sext i32 %4 to i64
  %9 = getelementptr i8* %reg_save_area.1, i64 %8
  %10 = add i32 %gp_offset, 16
  store i32 %10, i32* %gp_offset_p, align 16
  br label %vaarg.end.1

vaarg.in_mem.1:                                   ; preds = %vaarg.end.thread, %vaarg.end
  %arrayidx15.115 = phi i32* [ %arrayidx15.111, %vaarg.end.thread ], [ %arrayidx15.1, %vaarg.end ]
  %gp_offset.113 = phi i32 [ %gp_offset, %vaarg.end.thread ], [ %4, %vaarg.end ]
  %overflow_arg_area.1 = load i8** %overflow_arg_area_p, align 8
  %overflow_arg_area.next.1 = getelementptr i8* %overflow_arg_area.1, i64 8
  store i8* %overflow_arg_area.next.1, i8** %overflow_arg_area_p, align 8
  br label %vaarg.end.1

vaarg.end.2:                                      ; preds = %vaarg.end.1
  %reg_save_area.2 = load i8** %0, align 16
  %11 = sext i32 %gp_offset.2 to i64
  %12 = getelementptr i8* %reg_save_area.2, i64 %11
  %13 = add i32 %gp_offset.2, 8
  store i32 %13, i32* %gp_offset_p, align 16
  %vaarg.addr.2 = bitcast i8* %12 to i32*
  %14 = load i32* %vaarg.addr.2, align 4
  store i32 %14, i32* %arrayidx15.2, align 16
  %arrayidx15.3 = getelementptr [11 x i32]* %n, i64 0, i64 9
  %fits_in_gp.3 = icmp ult i32 %13, 41
  br i1 %fits_in_gp.3, label %vaarg.in_reg.3, label %vaarg.in_mem.3

vaarg.end.2.thread:                               ; preds = %vaarg.end.1
  %overflow_arg_area.2 = load i8** %overflow_arg_area_p, align 8
  %overflow_arg_area.next.2 = getelementptr i8* %overflow_arg_area.2, i64 8
  store i8* %overflow_arg_area.next.2, i8** %overflow_arg_area_p, align 8
  %vaarg.addr.216 = bitcast i8* %overflow_arg_area.2 to i32*
  %15 = load i32* %vaarg.addr.216, align 4
  store i32 %15, i32* %arrayidx15.2, align 16
  %arrayidx15.317 = getelementptr [11 x i32]* %n, i64 0, i64 9
  br label %vaarg.in_mem.3

vaarg.end.3:                                      ; preds = %vaarg.in_mem.3, %vaarg.in_reg.3
  %arrayidx15.320 = phi i32* [ %arrayidx15.3, %vaarg.in_reg.3 ], [ %arrayidx15.321, %vaarg.in_mem.3 ]
  %gp_offset.4 = phi i32 [ %19, %vaarg.in_reg.3 ], [ %gp_offset.319, %vaarg.in_mem.3 ]
  %vaarg.addr.in.3 = phi i8* [ %18, %vaarg.in_reg.3 ], [ %overflow_arg_area.3, %vaarg.in_mem.3 ]
  %vaarg.addr.3 = bitcast i8* %vaarg.addr.in.3 to i32*
  %16 = load i32* %vaarg.addr.3, align 4
  store i32 %16, i32* %arrayidx15.320, align 4
  %arrayidx15.4 = getelementptr [11 x i32]* %n, i64 0, i64 10
  %fits_in_gp.4 = icmp ult i32 %gp_offset.4, 41
  br i1 %fits_in_gp.4, label %vaarg.in_reg.4, label %vaarg.in_mem.4

vaarg.in_reg.3:                                   ; preds = %vaarg.end.2
  %reg_save_area.3 = load i8** %0, align 16
  %17 = sext i32 %13 to i64
  %18 = getelementptr i8* %reg_save_area.3, i64 %17
  %19 = add i32 %gp_offset.2, 16
  store i32 %19, i32* %gp_offset_p, align 16
  br label %vaarg.end.3

vaarg.in_mem.3:                                   ; preds = %vaarg.end.2.thread, %vaarg.end.2
  %arrayidx15.321 = phi i32* [ %arrayidx15.317, %vaarg.end.2.thread ], [ %arrayidx15.3, %vaarg.end.2 ]
  %gp_offset.319 = phi i32 [ %gp_offset.2, %vaarg.end.2.thread ], [ %13, %vaarg.end.2 ]
  %overflow_arg_area.3 = load i8** %overflow_arg_area_p, align 8
  %overflow_arg_area.next.3 = getelementptr i8* %overflow_arg_area.3, i64 8
  store i8* %overflow_arg_area.next.3, i8** %overflow_arg_area_p, align 8
  br label %vaarg.end.3

vaarg.end.4:                                      ; preds = %vaarg.in_mem.4, %vaarg.in_reg.4
  %vaarg.addr.in.4 = phi i8* [ %22, %vaarg.in_reg.4 ], [ %overflow_arg_area.4, %vaarg.in_mem.4 ]
  %vaarg.addr.4 = bitcast i8* %vaarg.addr.in.4 to i32*
  %20 = load i32* %vaarg.addr.4, align 4
  store i32 %20, i32* %arrayidx15.4, align 8
  call void @llvm.va_end(i8* %arraydecay1)
  br label %for.body.i

vaarg.in_reg.4:                                   ; preds = %vaarg.end.3
  %reg_save_area.4 = load i8** %0, align 16
  %21 = sext i32 %gp_offset.4 to i64
  %22 = getelementptr i8* %reg_save_area.4, i64 %21
  %23 = add i32 %gp_offset.4, 8
  store i32 %23, i32* %gp_offset_p, align 16
  br label %vaarg.end.4

vaarg.in_mem.4:                                   ; preds = %vaarg.end.3
  %overflow_arg_area.4 = load i8** %overflow_arg_area_p, align 8
  %overflow_arg_area.next.4 = getelementptr i8* %overflow_arg_area.4, i64 8
  store i8* %overflow_arg_area.next.4, i8** %overflow_arg_area_p, align 8
  br label %vaarg.end.4
}

define internal void @varargs6(...) nounwind uwtable {
entry:
  %ap = alloca [1 x %struct.__va_list_tag], align 16
  %n = alloca [11 x i32], align 16
  %arraydecay1 = bitcast [1 x %struct.__va_list_tag]* %ap to i8*
  call void @llvm.va_start(i8* %arraydecay1)
  %arrayidx = getelementptr inbounds [11 x i32]* %n, i64 0, i64 0
  store i32 0, i32* %arrayidx, align 16
  %arrayidx3 = getelementptr inbounds [11 x i32]* %n, i64 0, i64 1
  store i32 1, i32* %arrayidx3, align 4
  %arrayidx5 = getelementptr inbounds [11 x i32]* %n, i64 0, i64 2
  store i32 2, i32* %arrayidx5, align 8
  %arrayidx7 = getelementptr inbounds [11 x i32]* %n, i64 0, i64 3
  store i32 3, i32* %arrayidx7, align 4
  %arrayidx9 = getelementptr inbounds [11 x i32]* %n, i64 0, i64 4
  store i32 4, i32* %arrayidx9, align 16
  %arrayidx11 = getelementptr inbounds [11 x i32]* %n, i64 0, i64 5
  store i32 5, i32* %arrayidx11, align 4
  %arrayidx13 = getelementptr inbounds [11 x i32]* %n, i64 0, i64 6
  store i32 6, i32* %arrayidx13, align 8
  %gp_offset_p = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i64 0, i64 0, i32 0
  %0 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i64 0, i64 0, i32 3
  %overflow_arg_area_p = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i64 0, i64 0, i32 2
  %arrayidx17 = getelementptr [11 x i32]* %n, i64 0, i64 7
  %gp_offset = load i32* %gp_offset_p, align 16
  %fits_in_gp = icmp ult i32 %gp_offset, 41
  br i1 %fits_in_gp, label %vaarg.end, label %vaarg.end.thread

vaarg.end.thread:                                 ; preds = %entry
  %overflow_arg_area = load i8** %overflow_arg_area_p, align 8
  %overflow_arg_area.next = getelementptr i8* %overflow_arg_area, i64 8
  store i8* %overflow_arg_area.next, i8** %overflow_arg_area_p, align 8
  %vaarg.addr9 = bitcast i8* %overflow_arg_area to i32*
  %1 = load i32* %vaarg.addr9, align 4
  store i32 %1, i32* %arrayidx17, align 4
  %arrayidx17.110 = getelementptr [11 x i32]* %n, i64 0, i64 8
  br label %vaarg.in_mem.1

vaarg.end:                                        ; preds = %entry
  %reg_save_area = load i8** %0, align 16
  %2 = sext i32 %gp_offset to i64
  %3 = getelementptr i8* %reg_save_area, i64 %2
  %4 = add i32 %gp_offset, 8
  store i32 %4, i32* %gp_offset_p, align 16
  %vaarg.addr = bitcast i8* %3 to i32*
  %5 = load i32* %vaarg.addr, align 4
  store i32 %5, i32* %arrayidx17, align 4
  %arrayidx17.1 = getelementptr [11 x i32]* %n, i64 0, i64 8
  %fits_in_gp.1 = icmp ult i32 %4, 41
  br i1 %fits_in_gp.1, label %vaarg.in_reg.1, label %vaarg.in_mem.1

for.body.i:                                       ; preds = %for.inc.i.for.body.i_crit_edge, %vaarg.end.3
  %tmp3.i = phi i32 [ 0, %vaarg.end.3 ], [ %tmp3.i.pre, %for.inc.i.for.body.i_crit_edge ]
  %indvar.i = phi i64 [ 0, %vaarg.end.3 ], [ %6, %for.inc.i.for.body.i_crit_edge ]
  %storemerge1.i = trunc i64 %indvar.i to i32
  %cmp5.i = icmp eq i32 %tmp3.i, %storemerge1.i
  br i1 %cmp5.i, label %for.inc.i, label %if.then.i

if.then.i:                                        ; preds = %for.body.i
  %call.i = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str1, i64 0, i64 0), i8* getelementptr inbounds ([9 x i8]* @.str4, i64 0, i64 0), i32 %storemerge1.i, i32 %tmp3.i, i32 %storemerge1.i) nounwind
  %tmp14.i = load i32* @errors, align 4
  %inc.i = add nsw i32 %tmp14.i, 1
  store i32 %inc.i, i32* @errors, align 4
  br label %for.inc.i

for.inc.i:                                        ; preds = %if.then.i, %for.body.i
  %6 = add i64 %indvar.i, 1
  %exitcond = icmp eq i64 %6, 11
  br i1 %exitcond, label %verify.exit, label %for.inc.i.for.body.i_crit_edge

for.inc.i.for.body.i_crit_edge:                   ; preds = %for.inc.i
  %arrayidx.i.phi.trans.insert = getelementptr [11 x i32]* %n, i64 0, i64 %6
  %tmp3.i.pre = load i32* %arrayidx.i.phi.trans.insert, align 4
  br label %for.body.i

verify.exit:                                      ; preds = %for.inc.i
  ret void

vaarg.end.1:                                      ; preds = %vaarg.in_mem.1, %vaarg.in_reg.1
  %arrayidx17.113 = phi i32* [ %arrayidx17.1, %vaarg.in_reg.1 ], [ %arrayidx17.114, %vaarg.in_mem.1 ]
  %gp_offset.2 = phi i32 [ %10, %vaarg.in_reg.1 ], [ %gp_offset.112, %vaarg.in_mem.1 ]
  %vaarg.addr.in.1 = phi i8* [ %9, %vaarg.in_reg.1 ], [ %overflow_arg_area.1, %vaarg.in_mem.1 ]
  %vaarg.addr.1 = bitcast i8* %vaarg.addr.in.1 to i32*
  %7 = load i32* %vaarg.addr.1, align 4
  store i32 %7, i32* %arrayidx17.113, align 16
  %arrayidx17.2 = getelementptr [11 x i32]* %n, i64 0, i64 9
  %fits_in_gp.2 = icmp ult i32 %gp_offset.2, 41
  br i1 %fits_in_gp.2, label %vaarg.end.2, label %vaarg.end.2.thread

vaarg.in_reg.1:                                   ; preds = %vaarg.end
  %reg_save_area.1 = load i8** %0, align 16
  %8 = sext i32 %4 to i64
  %9 = getelementptr i8* %reg_save_area.1, i64 %8
  %10 = add i32 %gp_offset, 16
  store i32 %10, i32* %gp_offset_p, align 16
  br label %vaarg.end.1

vaarg.in_mem.1:                                   ; preds = %vaarg.end.thread, %vaarg.end
  %arrayidx17.114 = phi i32* [ %arrayidx17.110, %vaarg.end.thread ], [ %arrayidx17.1, %vaarg.end ]
  %gp_offset.112 = phi i32 [ %gp_offset, %vaarg.end.thread ], [ %4, %vaarg.end ]
  %overflow_arg_area.1 = load i8** %overflow_arg_area_p, align 8
  %overflow_arg_area.next.1 = getelementptr i8* %overflow_arg_area.1, i64 8
  store i8* %overflow_arg_area.next.1, i8** %overflow_arg_area_p, align 8
  br label %vaarg.end.1

vaarg.end.2:                                      ; preds = %vaarg.end.1
  %reg_save_area.2 = load i8** %0, align 16
  %11 = sext i32 %gp_offset.2 to i64
  %12 = getelementptr i8* %reg_save_area.2, i64 %11
  %13 = add i32 %gp_offset.2, 8
  store i32 %13, i32* %gp_offset_p, align 16
  %vaarg.addr.2 = bitcast i8* %12 to i32*
  %14 = load i32* %vaarg.addr.2, align 4
  store i32 %14, i32* %arrayidx17.2, align 4
  %arrayidx17.3 = getelementptr [11 x i32]* %n, i64 0, i64 10
  %fits_in_gp.3 = icmp ult i32 %13, 41
  br i1 %fits_in_gp.3, label %vaarg.in_reg.3, label %vaarg.in_mem.3

vaarg.end.2.thread:                               ; preds = %vaarg.end.1
  %overflow_arg_area.2 = load i8** %overflow_arg_area_p, align 8
  %overflow_arg_area.next.2 = getelementptr i8* %overflow_arg_area.2, i64 8
  store i8* %overflow_arg_area.next.2, i8** %overflow_arg_area_p, align 8
  %vaarg.addr.215 = bitcast i8* %overflow_arg_area.2 to i32*
  %15 = load i32* %vaarg.addr.215, align 4
  store i32 %15, i32* %arrayidx17.2, align 4
  %arrayidx17.316 = getelementptr [11 x i32]* %n, i64 0, i64 10
  br label %vaarg.in_mem.3

vaarg.end.3:                                      ; preds = %vaarg.in_mem.3, %vaarg.in_reg.3
  %arrayidx17.318 = phi i32* [ %arrayidx17.3, %vaarg.in_reg.3 ], [ %arrayidx17.319, %vaarg.in_mem.3 ]
  %vaarg.addr.in.3 = phi i8* [ %18, %vaarg.in_reg.3 ], [ %overflow_arg_area.3, %vaarg.in_mem.3 ]
  %vaarg.addr.3 = bitcast i8* %vaarg.addr.in.3 to i32*
  %16 = load i32* %vaarg.addr.3, align 4
  store i32 %16, i32* %arrayidx17.318, align 8
  call void @llvm.va_end(i8* %arraydecay1)
  br label %for.body.i

vaarg.in_reg.3:                                   ; preds = %vaarg.end.2
  %reg_save_area.3 = load i8** %0, align 16
  %17 = sext i32 %13 to i64
  %18 = getelementptr i8* %reg_save_area.3, i64 %17
  %19 = add i32 %gp_offset.2, 16
  store i32 %19, i32* %gp_offset_p, align 16
  br label %vaarg.end.3

vaarg.in_mem.3:                                   ; preds = %vaarg.end.2.thread, %vaarg.end.2
  %arrayidx17.319 = phi i32* [ %arrayidx17.316, %vaarg.end.2.thread ], [ %arrayidx17.3, %vaarg.end.2 ]
  %overflow_arg_area.3 = load i8** %overflow_arg_area_p, align 8
  %overflow_arg_area.next.3 = getelementptr i8* %overflow_arg_area.3, i64 8
  store i8* %overflow_arg_area.next.3, i8** %overflow_arg_area_p, align 8
  br label %vaarg.end.3
}

define internal void @varargs7(...) nounwind uwtable {
entry:
  %ap = alloca [1 x %struct.__va_list_tag], align 16
  %n = alloca [11 x i32], align 16
  %arraydecay1 = bitcast [1 x %struct.__va_list_tag]* %ap to i8*
  call void @llvm.va_start(i8* %arraydecay1)
  %arrayidx = getelementptr inbounds [11 x i32]* %n, i64 0, i64 0
  store i32 0, i32* %arrayidx, align 16
  %arrayidx3 = getelementptr inbounds [11 x i32]* %n, i64 0, i64 1
  store i32 1, i32* %arrayidx3, align 4
  %arrayidx5 = getelementptr inbounds [11 x i32]* %n, i64 0, i64 2
  store i32 2, i32* %arrayidx5, align 8
  %arrayidx7 = getelementptr inbounds [11 x i32]* %n, i64 0, i64 3
  store i32 3, i32* %arrayidx7, align 4
  %arrayidx9 = getelementptr inbounds [11 x i32]* %n, i64 0, i64 4
  store i32 4, i32* %arrayidx9, align 16
  %arrayidx11 = getelementptr inbounds [11 x i32]* %n, i64 0, i64 5
  store i32 5, i32* %arrayidx11, align 4
  %arrayidx13 = getelementptr inbounds [11 x i32]* %n, i64 0, i64 6
  store i32 6, i32* %arrayidx13, align 8
  %arrayidx15 = getelementptr inbounds [11 x i32]* %n, i64 0, i64 7
  store i32 7, i32* %arrayidx15, align 4
  %gp_offset_p = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i64 0, i64 0, i32 0
  %0 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i64 0, i64 0, i32 3
  %overflow_arg_area_p = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i64 0, i64 0, i32 2
  %arrayidx19 = getelementptr [11 x i32]* %n, i64 0, i64 8
  %gp_offset = load i32* %gp_offset_p, align 16
  %fits_in_gp = icmp ult i32 %gp_offset, 41
  br i1 %fits_in_gp, label %vaarg.end, label %vaarg.end.thread

vaarg.end.thread:                                 ; preds = %entry
  %overflow_arg_area = load i8** %overflow_arg_area_p, align 8
  %overflow_arg_area.next = getelementptr i8* %overflow_arg_area, i64 8
  store i8* %overflow_arg_area.next, i8** %overflow_arg_area_p, align 8
  %vaarg.addr8 = bitcast i8* %overflow_arg_area to i32*
  %1 = load i32* %vaarg.addr8, align 4
  store i32 %1, i32* %arrayidx19, align 16
  %arrayidx19.19 = getelementptr [11 x i32]* %n, i64 0, i64 9
  br label %vaarg.in_mem.1

vaarg.end:                                        ; preds = %entry
  %reg_save_area = load i8** %0, align 16
  %2 = sext i32 %gp_offset to i64
  %3 = getelementptr i8* %reg_save_area, i64 %2
  %4 = add i32 %gp_offset, 8
  store i32 %4, i32* %gp_offset_p, align 16
  %vaarg.addr = bitcast i8* %3 to i32*
  %5 = load i32* %vaarg.addr, align 4
  store i32 %5, i32* %arrayidx19, align 16
  %arrayidx19.1 = getelementptr [11 x i32]* %n, i64 0, i64 9
  %fits_in_gp.1 = icmp ult i32 %4, 41
  br i1 %fits_in_gp.1, label %vaarg.in_reg.1, label %vaarg.in_mem.1

for.body.i:                                       ; preds = %for.inc.i.for.body.i_crit_edge, %vaarg.end.2
  %tmp3.i = phi i32 [ 0, %vaarg.end.2 ], [ %tmp3.i.pre, %for.inc.i.for.body.i_crit_edge ]
  %indvar.i = phi i64 [ 0, %vaarg.end.2 ], [ %6, %for.inc.i.for.body.i_crit_edge ]
  %storemerge1.i = trunc i64 %indvar.i to i32
  %cmp5.i = icmp eq i32 %tmp3.i, %storemerge1.i
  br i1 %cmp5.i, label %for.inc.i, label %if.then.i

if.then.i:                                        ; preds = %for.body.i
  %call.i = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str1, i64 0, i64 0), i8* getelementptr inbounds ([9 x i8]* @.str3, i64 0, i64 0), i32 %storemerge1.i, i32 %tmp3.i, i32 %storemerge1.i) nounwind
  %tmp14.i = load i32* @errors, align 4
  %inc.i = add nsw i32 %tmp14.i, 1
  store i32 %inc.i, i32* @errors, align 4
  br label %for.inc.i

for.inc.i:                                        ; preds = %if.then.i, %for.body.i
  %6 = add i64 %indvar.i, 1
  %exitcond = icmp eq i64 %6, 11
  br i1 %exitcond, label %verify.exit, label %for.inc.i.for.body.i_crit_edge

for.inc.i.for.body.i_crit_edge:                   ; preds = %for.inc.i
  %arrayidx.i.phi.trans.insert = getelementptr [11 x i32]* %n, i64 0, i64 %6
  %tmp3.i.pre = load i32* %arrayidx.i.phi.trans.insert, align 4
  br label %for.body.i

verify.exit:                                      ; preds = %for.inc.i
  ret void

vaarg.end.1:                                      ; preds = %vaarg.in_mem.1, %vaarg.in_reg.1
  %arrayidx19.112 = phi i32* [ %arrayidx19.1, %vaarg.in_reg.1 ], [ %arrayidx19.113, %vaarg.in_mem.1 ]
  %gp_offset.2 = phi i32 [ %10, %vaarg.in_reg.1 ], [ %gp_offset.111, %vaarg.in_mem.1 ]
  %vaarg.addr.in.1 = phi i8* [ %9, %vaarg.in_reg.1 ], [ %overflow_arg_area.1, %vaarg.in_mem.1 ]
  %vaarg.addr.1 = bitcast i8* %vaarg.addr.in.1 to i32*
  %7 = load i32* %vaarg.addr.1, align 4
  store i32 %7, i32* %arrayidx19.112, align 4
  %arrayidx19.2 = getelementptr [11 x i32]* %n, i64 0, i64 10
  %fits_in_gp.2 = icmp ult i32 %gp_offset.2, 41
  br i1 %fits_in_gp.2, label %vaarg.in_reg.2, label %vaarg.in_mem.2

vaarg.in_reg.1:                                   ; preds = %vaarg.end
  %reg_save_area.1 = load i8** %0, align 16
  %8 = sext i32 %4 to i64
  %9 = getelementptr i8* %reg_save_area.1, i64 %8
  %10 = add i32 %gp_offset, 16
  store i32 %10, i32* %gp_offset_p, align 16
  br label %vaarg.end.1

vaarg.in_mem.1:                                   ; preds = %vaarg.end.thread, %vaarg.end
  %arrayidx19.113 = phi i32* [ %arrayidx19.19, %vaarg.end.thread ], [ %arrayidx19.1, %vaarg.end ]
  %gp_offset.111 = phi i32 [ %gp_offset, %vaarg.end.thread ], [ %4, %vaarg.end ]
  %overflow_arg_area.1 = load i8** %overflow_arg_area_p, align 8
  %overflow_arg_area.next.1 = getelementptr i8* %overflow_arg_area.1, i64 8
  store i8* %overflow_arg_area.next.1, i8** %overflow_arg_area_p, align 8
  br label %vaarg.end.1

vaarg.end.2:                                      ; preds = %vaarg.in_mem.2, %vaarg.in_reg.2
  %vaarg.addr.in.2 = phi i8* [ %13, %vaarg.in_reg.2 ], [ %overflow_arg_area.2, %vaarg.in_mem.2 ]
  %vaarg.addr.2 = bitcast i8* %vaarg.addr.in.2 to i32*
  %11 = load i32* %vaarg.addr.2, align 4
  store i32 %11, i32* %arrayidx19.2, align 8
  call void @llvm.va_end(i8* %arraydecay1)
  br label %for.body.i

vaarg.in_reg.2:                                   ; preds = %vaarg.end.1
  %reg_save_area.2 = load i8** %0, align 16
  %12 = sext i32 %gp_offset.2 to i64
  %13 = getelementptr i8* %reg_save_area.2, i64 %12
  %14 = add i32 %gp_offset.2, 8
  store i32 %14, i32* %gp_offset_p, align 16
  br label %vaarg.end.2

vaarg.in_mem.2:                                   ; preds = %vaarg.end.1
  %overflow_arg_area.2 = load i8** %overflow_arg_area_p, align 8
  %overflow_arg_area.next.2 = getelementptr i8* %overflow_arg_area.2, i64 8
  store i8* %overflow_arg_area.next.2, i8** %overflow_arg_area_p, align 8
  br label %vaarg.end.2
}

define internal void @varargs8(...) nounwind uwtable {
entry:
  %ap = alloca [1 x %struct.__va_list_tag], align 16
  %n = alloca [11 x i32], align 16
  %arraydecay1 = bitcast [1 x %struct.__va_list_tag]* %ap to i8*
  call void @llvm.va_start(i8* %arraydecay1)
  %arrayidx = getelementptr inbounds [11 x i32]* %n, i64 0, i64 0
  store i32 0, i32* %arrayidx, align 16
  %arrayidx3 = getelementptr inbounds [11 x i32]* %n, i64 0, i64 1
  store i32 1, i32* %arrayidx3, align 4
  %arrayidx5 = getelementptr inbounds [11 x i32]* %n, i64 0, i64 2
  store i32 2, i32* %arrayidx5, align 8
  %arrayidx7 = getelementptr inbounds [11 x i32]* %n, i64 0, i64 3
  store i32 3, i32* %arrayidx7, align 4
  %arrayidx9 = getelementptr inbounds [11 x i32]* %n, i64 0, i64 4
  store i32 4, i32* %arrayidx9, align 16
  %arrayidx11 = getelementptr inbounds [11 x i32]* %n, i64 0, i64 5
  store i32 5, i32* %arrayidx11, align 4
  %arrayidx13 = getelementptr inbounds [11 x i32]* %n, i64 0, i64 6
  store i32 6, i32* %arrayidx13, align 8
  %arrayidx15 = getelementptr inbounds [11 x i32]* %n, i64 0, i64 7
  store i32 7, i32* %arrayidx15, align 4
  %arrayidx17 = getelementptr inbounds [11 x i32]* %n, i64 0, i64 8
  store i32 8, i32* %arrayidx17, align 16
  %gp_offset_p = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i64 0, i64 0, i32 0
  %0 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i64 0, i64 0, i32 3
  %overflow_arg_area_p = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i64 0, i64 0, i32 2
  %arrayidx21 = getelementptr [11 x i32]* %n, i64 0, i64 9
  %gp_offset = load i32* %gp_offset_p, align 16
  %fits_in_gp = icmp ult i32 %gp_offset, 41
  br i1 %fits_in_gp, label %vaarg.end, label %vaarg.end.thread

vaarg.end.thread:                                 ; preds = %entry
  %overflow_arg_area = load i8** %overflow_arg_area_p, align 8
  %overflow_arg_area.next = getelementptr i8* %overflow_arg_area, i64 8
  store i8* %overflow_arg_area.next, i8** %overflow_arg_area_p, align 8
  %vaarg.addr7 = bitcast i8* %overflow_arg_area to i32*
  %1 = load i32* %vaarg.addr7, align 4
  store i32 %1, i32* %arrayidx21, align 4
  %arrayidx21.18 = getelementptr [11 x i32]* %n, i64 0, i64 10
  br label %vaarg.in_mem.1

vaarg.end:                                        ; preds = %entry
  %reg_save_area = load i8** %0, align 16
  %2 = sext i32 %gp_offset to i64
  %3 = getelementptr i8* %reg_save_area, i64 %2
  %4 = add i32 %gp_offset, 8
  store i32 %4, i32* %gp_offset_p, align 16
  %vaarg.addr = bitcast i8* %3 to i32*
  %5 = load i32* %vaarg.addr, align 4
  store i32 %5, i32* %arrayidx21, align 4
  %arrayidx21.1 = getelementptr [11 x i32]* %n, i64 0, i64 10
  %fits_in_gp.1 = icmp ult i32 %4, 41
  br i1 %fits_in_gp.1, label %vaarg.in_reg.1, label %vaarg.in_mem.1

for.body.i:                                       ; preds = %for.inc.i.for.body.i_crit_edge, %vaarg.end.1
  %tmp3.i = phi i32 [ 0, %vaarg.end.1 ], [ %tmp3.i.pre, %for.inc.i.for.body.i_crit_edge ]
  %indvar.i = phi i64 [ 0, %vaarg.end.1 ], [ %6, %for.inc.i.for.body.i_crit_edge ]
  %storemerge1.i = trunc i64 %indvar.i to i32
  %cmp5.i = icmp eq i32 %tmp3.i, %storemerge1.i
  br i1 %cmp5.i, label %for.inc.i, label %if.then.i

if.then.i:                                        ; preds = %for.body.i
  %call.i = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str1, i64 0, i64 0), i8* getelementptr inbounds ([9 x i8]* @.str2, i64 0, i64 0), i32 %storemerge1.i, i32 %tmp3.i, i32 %storemerge1.i) nounwind
  %tmp14.i = load i32* @errors, align 4
  %inc.i = add nsw i32 %tmp14.i, 1
  store i32 %inc.i, i32* @errors, align 4
  br label %for.inc.i

for.inc.i:                                        ; preds = %if.then.i, %for.body.i
  %6 = add i64 %indvar.i, 1
  %exitcond = icmp eq i64 %6, 11
  br i1 %exitcond, label %verify.exit, label %for.inc.i.for.body.i_crit_edge

for.inc.i.for.body.i_crit_edge:                   ; preds = %for.inc.i
  %arrayidx.i.phi.trans.insert = getelementptr [11 x i32]* %n, i64 0, i64 %6
  %tmp3.i.pre = load i32* %arrayidx.i.phi.trans.insert, align 4
  br label %for.body.i

verify.exit:                                      ; preds = %for.inc.i
  ret void

vaarg.end.1:                                      ; preds = %vaarg.in_mem.1, %vaarg.in_reg.1
  %arrayidx21.110 = phi i32* [ %arrayidx21.1, %vaarg.in_reg.1 ], [ %arrayidx21.111, %vaarg.in_mem.1 ]
  %vaarg.addr.in.1 = phi i8* [ %9, %vaarg.in_reg.1 ], [ %overflow_arg_area.1, %vaarg.in_mem.1 ]
  %vaarg.addr.1 = bitcast i8* %vaarg.addr.in.1 to i32*
  %7 = load i32* %vaarg.addr.1, align 4
  store i32 %7, i32* %arrayidx21.110, align 8
  call void @llvm.va_end(i8* %arraydecay1)
  br label %for.body.i

vaarg.in_reg.1:                                   ; preds = %vaarg.end
  %reg_save_area.1 = load i8** %0, align 16
  %8 = sext i32 %4 to i64
  %9 = getelementptr i8* %reg_save_area.1, i64 %8
  %10 = add i32 %gp_offset, 16
  store i32 %10, i32* %gp_offset_p, align 16
  br label %vaarg.end.1

vaarg.in_mem.1:                                   ; preds = %vaarg.end.thread, %vaarg.end
  %arrayidx21.111 = phi i32* [ %arrayidx21.18, %vaarg.end.thread ], [ %arrayidx21.1, %vaarg.end ]
  %overflow_arg_area.1 = load i8** %overflow_arg_area_p, align 8
  %overflow_arg_area.next.1 = getelementptr i8* %overflow_arg_area.1, i64 8
  store i8* %overflow_arg_area.next.1, i8** %overflow_arg_area_p, align 8
  br label %vaarg.end.1
}

define internal void @varargs9(...) nounwind uwtable {
for.body:
  %ap = alloca [1 x %struct.__va_list_tag], align 16
  %n = alloca [11 x i32], align 16
  %arraydecay1 = bitcast [1 x %struct.__va_list_tag]* %ap to i8*
  call void @llvm.va_start(i8* %arraydecay1)
  %arrayidx = getelementptr inbounds [11 x i32]* %n, i64 0, i64 0
  store i32 0, i32* %arrayidx, align 16
  %arrayidx3 = getelementptr inbounds [11 x i32]* %n, i64 0, i64 1
  store i32 1, i32* %arrayidx3, align 4
  %arrayidx5 = getelementptr inbounds [11 x i32]* %n, i64 0, i64 2
  store i32 2, i32* %arrayidx5, align 8
  %arrayidx7 = getelementptr inbounds [11 x i32]* %n, i64 0, i64 3
  store i32 3, i32* %arrayidx7, align 4
  %arrayidx9 = getelementptr inbounds [11 x i32]* %n, i64 0, i64 4
  store i32 4, i32* %arrayidx9, align 16
  %arrayidx11 = getelementptr inbounds [11 x i32]* %n, i64 0, i64 5
  store i32 5, i32* %arrayidx11, align 4
  %arrayidx13 = getelementptr inbounds [11 x i32]* %n, i64 0, i64 6
  store i32 6, i32* %arrayidx13, align 8
  %arrayidx15 = getelementptr inbounds [11 x i32]* %n, i64 0, i64 7
  store i32 7, i32* %arrayidx15, align 4
  %arrayidx17 = getelementptr inbounds [11 x i32]* %n, i64 0, i64 8
  store i32 8, i32* %arrayidx17, align 16
  %arrayidx19 = getelementptr inbounds [11 x i32]* %n, i64 0, i64 9
  store i32 9, i32* %arrayidx19, align 4
  %gp_offset_p = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i64 0, i64 0, i32 0
  %overflow_arg_area_p = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i64 0, i64 0, i32 2
  %gp_offset.pre = load i32* %gp_offset_p, align 16
  %arrayidx23 = getelementptr [11 x i32]* %n, i64 0, i64 10
  %fits_in_gp = icmp ult i32 %gp_offset.pre, 41
  br i1 %fits_in_gp, label %vaarg.in_reg, label %vaarg.in_mem

vaarg.in_reg:                                     ; preds = %for.body
  %0 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i64 0, i64 0, i32 3
  %reg_save_area = load i8** %0, align 16
  %1 = sext i32 %gp_offset.pre to i64
  %2 = getelementptr i8* %reg_save_area, i64 %1
  %3 = add i32 %gp_offset.pre, 8
  store i32 %3, i32* %gp_offset_p, align 16
  br label %for.end

vaarg.in_mem:                                     ; preds = %for.body
  %overflow_arg_area = load i8** %overflow_arg_area_p, align 8
  %overflow_arg_area.next = getelementptr i8* %overflow_arg_area, i64 8
  store i8* %overflow_arg_area.next, i8** %overflow_arg_area_p, align 8
  br label %for.end

for.end:                                          ; preds = %vaarg.in_reg, %vaarg.in_mem
  %vaarg.addr.in = phi i8* [ %2, %vaarg.in_reg ], [ %overflow_arg_area, %vaarg.in_mem ]
  %vaarg.addr = bitcast i8* %vaarg.addr.in to i32*
  %4 = load i32* %vaarg.addr, align 4
  store i32 %4, i32* %arrayidx23, align 8
  call void @llvm.va_end(i8* %arraydecay1)
  br label %for.body.i

for.body.i:                                       ; preds = %for.inc.i, %for.end
  %indvar.i = phi i64 [ 0, %for.end ], [ %5, %for.inc.i ]
  %arrayidx.i = getelementptr [11 x i32]* %n, i64 0, i64 %indvar.i
  %storemerge1.i = trunc i64 %indvar.i to i32
  %tmp3.i = load i32* %arrayidx.i, align 4
  %cmp5.i = icmp eq i32 %tmp3.i, %storemerge1.i
  br i1 %cmp5.i, label %for.inc.i, label %if.then.i

if.then.i:                                        ; preds = %for.body.i
  %call.i = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str1, i64 0, i64 0), i8* getelementptr inbounds ([9 x i8]* @.str, i64 0, i64 0), i32 %storemerge1.i, i32 %tmp3.i, i32 %storemerge1.i) nounwind
  %tmp14.i = load i32* @errors, align 4
  %inc.i = add nsw i32 %tmp14.i, 1
  store i32 %inc.i, i32* @errors, align 4
  br label %for.inc.i

for.inc.i:                                        ; preds = %if.then.i, %for.body.i
  %5 = add i64 %indvar.i, 1
  %exitcond = icmp eq i64 %5, 11
  br i1 %exitcond, label %verify.exit, label %for.body.i

verify.exit:                                      ; preds = %for.inc.i
  ret void
}

declare void @abort() noreturn nounwind

declare void @exit(i32) noreturn nounwind

declare void @llvm.va_start(i8*) nounwind

declare void @llvm.va_end(i8*) nounwind

declare i32 @printf(i8* nocapture, ...) nounwind
