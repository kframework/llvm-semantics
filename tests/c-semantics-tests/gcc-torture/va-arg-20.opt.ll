; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/va-arg-20.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.__va_list_tag = type { i32, i32, i8*, i8* }

define void @foo(%struct.__va_list_tag* nocapture %v) nounwind uwtable {
entry:
  %0 = va_arg %struct.__va_list_tag* %v, i64
  %cmp = icmp eq i64 %0, 16
  br i1 %cmp, label %if.end, label %if.then

if.then:                                          ; preds = %entry
  tail call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  ret void
}

declare void @abort() noreturn nounwind

define void @bar(i8 signext %c, i8 signext %d, ...) nounwind uwtable {
entry:
  %v = alloca [1 x %struct.__va_list_tag], align 16
  %arraydecay = getelementptr inbounds [1 x %struct.__va_list_tag]* %v, i64 0, i64 0
  %arraydecay1 = bitcast [1 x %struct.__va_list_tag]* %v to i8*
  call void @llvm.va_start(i8* %arraydecay1)
  %0 = va_arg %struct.__va_list_tag* %arraydecay, i64
  %cmp.i = icmp eq i64 %0, 16
  br i1 %cmp.i, label %foo.exit, label %if.then.i

if.then.i:                                        ; preds = %entry
  call void @abort() noreturn nounwind
  unreachable

foo.exit:                                         ; preds = %entry
  call void @llvm.va_end(i8* %arraydecay1)
  ret void
}

declare void @llvm.va_start(i8*) nounwind

declare void @llvm.va_end(i8*) nounwind

define i32 @main() noreturn nounwind uwtable {
entry:
  tail call void (i8, i8, ...)* @bar(i8 signext undef, i8 signext undef, i64 16)
  tail call void @exit(i32 0) noreturn nounwind
  unreachable
}

declare void @exit(i32) noreturn nounwind
