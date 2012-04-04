; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/20000519-1.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

%struct.__va_list_tag = type { i32, i32, i8*, i8* }

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

define i32 @bar(i32 %a, %struct.__va_list_tag* %ap) nounwind uwtable {
entry:
  %gp_offset_p = getelementptr inbounds %struct.__va_list_tag* %ap, i64 0, i32 0
  %0 = getelementptr inbounds %struct.__va_list_tag* %ap, i64 0, i32 3
  %overflow_arg_area_p = getelementptr inbounds %struct.__va_list_tag* %ap, i64 0, i32 2
  %gp_offset.pre = load i32* %gp_offset_p, align 4
  br label %do.body

do.body:                                          ; preds = %vaarg.end, %entry
  %gp_offset = phi i32 [ %gp_offset1, %vaarg.end ], [ %gp_offset.pre, %entry ]
  %fits_in_gp = icmp ult i32 %gp_offset, 41
  br i1 %fits_in_gp, label %vaarg.in_reg, label %vaarg.in_mem

vaarg.in_reg:                                     ; preds = %do.body
  %reg_save_area = load i8** %0, align 8
  %1 = sext i32 %gp_offset to i64
  %2 = getelementptr i8* %reg_save_area, i64 %1
  %3 = add i32 %gp_offset, 8
  store i32 %3, i32* %gp_offset_p, align 4
  br label %vaarg.end

vaarg.in_mem:                                     ; preds = %do.body
  %overflow_arg_area = load i8** %overflow_arg_area_p, align 8
  %overflow_arg_area.next = getelementptr i8* %overflow_arg_area, i64 8
  store i8* %overflow_arg_area.next, i8** %overflow_arg_area_p, align 8
  br label %vaarg.end

vaarg.end:                                        ; preds = %vaarg.in_mem, %vaarg.in_reg
  %gp_offset1 = phi i32 [ %3, %vaarg.in_reg ], [ %gp_offset, %vaarg.in_mem ]
  %vaarg.addr.in = phi i8* [ %2, %vaarg.in_reg ], [ %overflow_arg_area, %vaarg.in_mem ]
  %vaarg.addr = bitcast i8* %vaarg.addr.in to i32*
  %4 = load i32* %vaarg.addr, align 4
  %cmp = icmp sgt i32 %4, 10
  br i1 %cmp, label %do.body, label %do.end

do.end:                                           ; preds = %vaarg.end
  %add = add nsw i32 %4, %a
  ret i32 %add
}

define i32 @foo(i32 %a, ...) nounwind uwtable {
entry:
  %ap = alloca [1 x %struct.__va_list_tag], align 16
  %arraydecay1 = bitcast [1 x %struct.__va_list_tag]* %ap to i8*
  call void @llvm.va_start(i8* %arraydecay1)
  %gp_offset_p.i = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i64 0, i64 0, i32 0
  %0 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i64 0, i64 0, i32 3
  %overflow_arg_area_p.i = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i64 0, i64 0, i32 2
  %gp_offset.pre.i = load i32* %gp_offset_p.i, align 16
  br label %do.body.i

do.body.i:                                        ; preds = %vaarg.end.i, %entry
  %gp_offset.i = phi i32 [ %gp_offset1.i, %vaarg.end.i ], [ %gp_offset.pre.i, %entry ]
  %fits_in_gp.i = icmp ult i32 %gp_offset.i, 41
  br i1 %fits_in_gp.i, label %vaarg.in_reg.i, label %vaarg.in_mem.i

vaarg.in_reg.i:                                   ; preds = %do.body.i
  %reg_save_area.i = load i8** %0, align 16
  %1 = sext i32 %gp_offset.i to i64
  %2 = getelementptr i8* %reg_save_area.i, i64 %1
  %3 = add i32 %gp_offset.i, 8
  store i32 %3, i32* %gp_offset_p.i, align 16
  br label %vaarg.end.i

vaarg.in_mem.i:                                   ; preds = %do.body.i
  %overflow_arg_area.i = load i8** %overflow_arg_area_p.i, align 8
  %overflow_arg_area.next.i = getelementptr i8* %overflow_arg_area.i, i64 8
  store i8* %overflow_arg_area.next.i, i8** %overflow_arg_area_p.i, align 8
  br label %vaarg.end.i

vaarg.end.i:                                      ; preds = %vaarg.in_mem.i, %vaarg.in_reg.i
  %gp_offset1.i = phi i32 [ %3, %vaarg.in_reg.i ], [ %gp_offset.i, %vaarg.in_mem.i ]
  %vaarg.addr.in.i = phi i8* [ %2, %vaarg.in_reg.i ], [ %overflow_arg_area.i, %vaarg.in_mem.i ]
  %vaarg.addr.i = bitcast i8* %vaarg.addr.in.i to i32*
  %4 = load i32* %vaarg.addr.i, align 4
  %cmp.i = icmp sgt i32 %4, 10
  br i1 %cmp.i, label %do.body.i, label %bar.exit

bar.exit:                                         ; preds = %vaarg.end.i
  %add.i = add nsw i32 %4, %a
  ret i32 %add.i
}

declare void @llvm.va_start(i8*) nounwind

define i32 @main() nounwind uwtable {
entry:
  %call = tail call i32 (i32, ...)* @foo(i32 1, i32 2, i32 3)
  %cmp = icmp eq i32 %call, 3
  br i1 %cmp, label %if.end, label %if.then

if.then:                                          ; preds = %entry
  tail call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  ret i32 0
}

declare void @abort() noreturn nounwind
