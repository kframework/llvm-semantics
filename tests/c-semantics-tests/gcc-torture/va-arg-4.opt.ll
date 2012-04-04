; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/va-arg-4.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.big = type { [32 x i8] }
%struct.__va_list_tag = type { i32, i32, i8*, i8* }

@main.x = internal global %struct.big { [32 x i8] c"abc\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00" }, align 8

define void @f(%struct.big* nocapture byval align 8 %x, i8* nocapture %s, ...) nounwind uwtable {
entry:
  %ap = alloca [1 x %struct.__va_list_tag], align 16
  %0 = bitcast %struct.big* %x to i32*
  %1 = load i32* %0, align 8
  %2 = and i32 %1, 16777215
  %3 = icmp eq i32 %2, 6513249
  br i1 %3, label %if.end, label %if.then

if.then:                                          ; preds = %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  %arraydecay = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i64 0, i64 0
  %arraydecay13 = bitcast [1 x %struct.__va_list_tag]* %ap to i8*
  call void @llvm.va_start(i8* %arraydecay13)
  %4 = va_arg %struct.__va_list_tag* %arraydecay, i32
  %cmp15 = icmp eq i32 %4, 42
  br i1 %cmp15, label %if.end18, label %if.then17

if.then17:                                        ; preds = %if.end
  call void @abort() noreturn nounwind
  unreachable

if.end18:                                         ; preds = %if.end
  %5 = va_arg %struct.__va_list_tag* %arraydecay, i32
  %cmp20 = icmp eq i32 %5, 120
  br i1 %cmp20, label %if.end23, label %if.then22

if.then22:                                        ; preds = %if.end18
  call void @abort() noreturn nounwind
  unreachable

if.end23:                                         ; preds = %if.end18
  %6 = va_arg %struct.__va_list_tag* %arraydecay, i32
  %cmp25 = icmp eq i32 %6, 0
  br i1 %cmp25, label %if.end28, label %if.then27

if.then27:                                        ; preds = %if.end23
  call void @abort() noreturn nounwind
  unreachable

if.end28:                                         ; preds = %if.end23
  call void @llvm.va_end(i8* %arraydecay13)
  ret void
}

declare void @abort() noreturn nounwind

declare void @llvm.va_start(i8*) nounwind

declare void @llvm.va_end(i8*) nounwind

define i32 @main() noreturn nounwind uwtable {
entry:
  tail call void (%struct.big*, i8*, ...)* @f(%struct.big* byval align 8 @main.x, i8* undef, i32 42, i32 120, i32 0)
  tail call void @exit(i32 0) noreturn nounwind
  unreachable
}

declare void @exit(i32) noreturn nounwind
