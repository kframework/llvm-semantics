; ModuleID = '/home/david/src/c-semantics/tests/llvm-unit/2007-03-02-VaCopy.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.__va_list_tag = type { i32, i32, i8*, i8* }

@.str = private unnamed_addr constant [11 x i8] c"string %s\0A\00", align 1
@.str2 = private unnamed_addr constant [4 x i8] c"abc\00", align 1

define void @testVaCopyArg(i8* nocapture %fmt, ...) nounwind uwtable {
entry:
  %ap = alloca [1 x %struct.__va_list_tag], align 16
  %aq = alloca [1 x %struct.__va_list_tag], align 16
  %arraydecay1 = bitcast [1 x %struct.__va_list_tag]* %ap to i8*
  call void @llvm.va_start(i8* %arraydecay1)
  %arraydecay2 = getelementptr inbounds [1 x %struct.__va_list_tag]* %aq, i64 0, i64 0
  %0 = bitcast [1 x %struct.__va_list_tag]* %aq to i8*
  call void @llvm.va_copy(i8* %0, i8* %arraydecay1)
  %1 = va_arg %struct.__va_list_tag* %arraydecay2, i8*
  %call = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([11 x i8]* @.str, i64 0, i64 0), i8* %1) nounwind
  ret void
}

declare void @llvm.va_start(i8*) nounwind

declare void @llvm.va_copy(i8*, i8*) nounwind

declare i32 @printf(i8* nocapture, ...) nounwind

define i32 @main() nounwind uwtable {
entry:
  tail call void (i8*, ...)* @testVaCopyArg(i8* undef, i8* getelementptr inbounds ([4 x i8]* @.str2, i64 0, i64 0))
  ret i32 0
}
