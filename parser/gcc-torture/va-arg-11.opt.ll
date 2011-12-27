; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/va-arg-11.ll'
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

define i32 @main() noreturn nounwind uwtable {
entry:
  %call = tail call i32 (...)* @foo(i32 4, i32 3, i32 2, i32 1, i32 0)
  %tobool = icmp eq i32 %call, 0
  br i1 %tobool, label %if.end, label %if.then

if.then:                                          ; preds = %entry
  tail call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  tail call void @exit(i32 0) noreturn nounwind
  unreachable
}

define internal i32 @foo(...) nounwind uwtable {
entry:
  %va = alloca [1 x %struct.__va_list_tag], align 16
  %arraydecay1 = bitcast [1 x %struct.__va_list_tag]* %va to i8*
  call void @llvm.va_start(i8* %arraydecay1)
  %gp_offset_p = getelementptr inbounds [1 x %struct.__va_list_tag]* %va, i64 0, i64 0, i32 0
  %gp_offset1 = load i32* %gp_offset_p, align 16
  %fits_in_gp2 = icmp ult i32 %gp_offset1, 41
  %overflow_arg_area_p = getelementptr inbounds [1 x %struct.__va_list_tag]* %va, i64 0, i64 0, i32 2
  %overflow_arg_area_p.promoted = load i8** %overflow_arg_area_p, align 8
  br i1 %fits_in_gp2, label %for.inc, label %for.inc.thread

for.inc.thread:                                   ; preds = %entry
  %overflow_arg_area.next = getelementptr i8* %overflow_arg_area_p.promoted, i64 8
  br label %vaarg.in_mem.1

for.inc:                                          ; preds = %entry
  %0 = add i32 %gp_offset1, 8
  %fits_in_gp = icmp ult i32 %0, 41
  br i1 %fits_in_gp, label %vaarg.in_reg.1, label %vaarg.in_mem.1

vaarg.in_reg8:                                    ; preds = %for.inc.3
  %1 = getelementptr inbounds [1 x %struct.__va_list_tag]* %va, i64 0, i64 0, i32 3
  %reg_save_area9 = load i8** %1, align 16
  %2 = sext i32 %gp_offset7.3 to i64
  %3 = getelementptr i8* %reg_save_area9, i64 %2
  %4 = add i32 %gp_offset7.3, 8
  store i32 %4, i32* %gp_offset_p, align 16
  br label %vaarg.end14

vaarg.in_mem10:                                   ; preds = %for.inc.3
  %overflow_arg_area.next13 = getelementptr i8* %overflow_arg_area12, i64 8
  store i8* %overflow_arg_area.next13, i8** %overflow_arg_area_p, align 8
  br label %vaarg.end14

vaarg.end14:                                      ; preds = %vaarg.in_mem10, %vaarg.in_reg8
  %vaarg.addr15.in = phi i8* [ %3, %vaarg.in_reg8 ], [ %overflow_arg_area12, %vaarg.in_mem10 ]
  %vaarg.addr15 = bitcast i8* %vaarg.addr15.in to i32*
  %5 = load i32* %vaarg.addr15, align 4
  call void @llvm.va_end(i8* %arraydecay1)
  ret i32 %5

for.inc.1:                                        ; preds = %vaarg.in_reg.1, %vaarg.in_mem.1
  %overflow_arg_area8.1 = phi i8* [ %overflow_arg_area_p.promoted, %vaarg.in_reg.1 ], [ %overflow_arg_area.next.1, %vaarg.in_mem.1 ]
  %gp_offset7.1 = phi i32 [ %6, %vaarg.in_reg.1 ], [ %gp_offset712, %vaarg.in_mem.1 ]
  %fits_in_gp.1 = icmp ult i32 %gp_offset7.1, 41
  br i1 %fits_in_gp.1, label %for.inc.2, label %for.inc.2.thread

vaarg.in_mem.1:                                   ; preds = %for.inc.thread, %for.inc
  %gp_offset712 = phi i32 [ %gp_offset1, %for.inc.thread ], [ %0, %for.inc ]
  %overflow_arg_area811 = phi i8* [ %overflow_arg_area.next, %for.inc.thread ], [ %overflow_arg_area_p.promoted, %for.inc ]
  %overflow_arg_area.next.1 = getelementptr i8* %overflow_arg_area811, i64 8
  br label %for.inc.1

vaarg.in_reg.1:                                   ; preds = %for.inc
  %6 = add i32 %gp_offset1, 16
  br label %for.inc.1

for.inc.2:                                        ; preds = %for.inc.1
  %7 = add i32 %gp_offset7.1, 8
  %fits_in_gp.2 = icmp ult i32 %7, 41
  br i1 %fits_in_gp.2, label %vaarg.in_reg.3, label %vaarg.in_mem.3

for.inc.2.thread:                                 ; preds = %for.inc.1
  %overflow_arg_area.next.2 = getelementptr i8* %overflow_arg_area8.1, i64 8
  br label %vaarg.in_mem.3

for.inc.3:                                        ; preds = %vaarg.in_reg.3, %vaarg.in_mem.3
  %overflow_arg_area12 = phi i8* [ %overflow_arg_area8.1, %vaarg.in_reg.3 ], [ %overflow_arg_area.next.3, %vaarg.in_mem.3 ]
  %gp_offset7.3 = phi i32 [ %8, %vaarg.in_reg.3 ], [ %gp_offset7.215, %vaarg.in_mem.3 ]
  %fits_in_gp.3 = icmp ult i32 %gp_offset7.3, 41
  store i8* %overflow_arg_area12, i8** %overflow_arg_area_p, align 8
  store i32 %gp_offset7.3, i32* %gp_offset_p, align 16
  br i1 %fits_in_gp.3, label %vaarg.in_reg8, label %vaarg.in_mem10

vaarg.in_mem.3:                                   ; preds = %for.inc.2.thread, %for.inc.2
  %gp_offset7.215 = phi i32 [ %gp_offset7.1, %for.inc.2.thread ], [ %7, %for.inc.2 ]
  %overflow_arg_area8.214 = phi i8* [ %overflow_arg_area.next.2, %for.inc.2.thread ], [ %overflow_arg_area8.1, %for.inc.2 ]
  %overflow_arg_area.next.3 = getelementptr i8* %overflow_arg_area8.214, i64 8
  br label %for.inc.3

vaarg.in_reg.3:                                   ; preds = %for.inc.2
  %8 = add i32 %gp_offset7.1, 16
  br label %for.inc.3
}

declare void @abort() noreturn nounwind

declare void @exit(i32) noreturn nounwind

declare void @llvm.va_start(i8*) nounwind

declare void @llvm.va_end(i8*) nounwind
