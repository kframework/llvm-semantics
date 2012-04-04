; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/980608-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.__va_list_tag = type { i32, i32, i8*, i8* }

define void @f1(i32 %a, i32 %b, i32 %c, i32 %d, i32 %e, i32 %f, i32 %g, i32 %h, i32 %i, i32 %j, i32 %k, i32 %l, i32 %m, i32 %n, i32 %o) nounwind uwtable readnone {
entry:
  ret void
}

define i32 @main() noreturn nounwind uwtable {
entry:
  tail call void (i8*, ...)* @debug(i8* undef, i32 101, i32 102, i32 103, i32 104, i32 105, i32 106)
  tail call void @exit(i32 0) noreturn nounwind
  unreachable
}

define available_externally void @debug(i8* nocapture %msg, ...) nounwind uwtable inlinehint {
entry:
  %ap = alloca [1 x %struct.__va_list_tag], align 16
  %arraydecay = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i64 0, i64 0
  %arraydecay1 = bitcast [1 x %struct.__va_list_tag]* %ap to i8*
  call void @llvm.va_start(i8* %arraydecay1)
  %0 = va_arg %struct.__va_list_tag* %arraydecay, i32
  %cmp = icmp eq i32 %0, 101
  br i1 %cmp, label %if.end, label %if.then

if.then:                                          ; preds = %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  %1 = va_arg %struct.__va_list_tag* %arraydecay, i32
  %cmp4 = icmp eq i32 %1, 102
  br i1 %cmp4, label %if.end6, label %if.then5

if.then5:                                         ; preds = %if.end
  call void @abort() noreturn nounwind
  unreachable

if.end6:                                          ; preds = %if.end
  %2 = va_arg %struct.__va_list_tag* %arraydecay, i32
  %cmp8 = icmp eq i32 %2, 103
  br i1 %cmp8, label %if.end10, label %if.then9

if.then9:                                         ; preds = %if.end6
  call void @abort() noreturn nounwind
  unreachable

if.end10:                                         ; preds = %if.end6
  %3 = va_arg %struct.__va_list_tag* %arraydecay, i32
  %cmp12 = icmp eq i32 %3, 104
  br i1 %cmp12, label %if.end14, label %if.then13

if.then13:                                        ; preds = %if.end10
  call void @abort() noreturn nounwind
  unreachable

if.end14:                                         ; preds = %if.end10
  %4 = va_arg %struct.__va_list_tag* %arraydecay, i32
  %cmp16 = icmp eq i32 %4, 105
  br i1 %cmp16, label %if.end18, label %if.then17

if.then17:                                        ; preds = %if.end14
  call void @abort() noreturn nounwind
  unreachable

if.end18:                                         ; preds = %if.end14
  %5 = va_arg %struct.__va_list_tag* %arraydecay, i32
  %cmp20 = icmp eq i32 %5, 106
  br i1 %cmp20, label %if.end22, label %if.then21

if.then21:                                        ; preds = %if.end18
  call void @abort() noreturn nounwind
  unreachable

if.end22:                                         ; preds = %if.end18
  call void @llvm.va_end(i8* %arraydecay1)
  ret void
}

declare void @exit(i32) noreturn nounwind

declare void @llvm.va_start(i8*) nounwind

declare void @abort() noreturn nounwind

declare void @llvm.va_end(i8*) nounwind
