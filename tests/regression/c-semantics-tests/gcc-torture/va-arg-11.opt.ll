; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/va-arg-11.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.__va_list_tag = type { i32, i32, i8*, i8* }

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
  %arraydecay = getelementptr inbounds [1 x %struct.__va_list_tag]* %va, i64 0, i64 0
  %arraydecay1 = bitcast [1 x %struct.__va_list_tag]* %va to i8*
  call void @llvm.va_start(i8* %arraydecay1)
  %0 = va_arg %struct.__va_list_tag* %arraydecay, i32
  %1 = va_arg %struct.__va_list_tag* %arraydecay, i32
  %2 = va_arg %struct.__va_list_tag* %arraydecay, i32
  %3 = va_arg %struct.__va_list_tag* %arraydecay, i32
  %4 = va_arg %struct.__va_list_tag* %arraydecay, i32
  call void @llvm.va_end(i8* %arraydecay1)
  ret i32 %4
}

declare void @abort() noreturn nounwind

declare void @exit(i32) noreturn nounwind

declare void @llvm.va_start(i8*) nounwind

declare void @llvm.va_end(i8*) nounwind
