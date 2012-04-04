; ModuleID = '/home/david/src/c-semantics/tests/llvm-unit/2007-03-02-VaCopy.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.__va_list_tag = type { i32, i32, i8*, i8* }

@.str = private unnamed_addr constant [11 x i8] c"string %s\0A\00", align 1
@.str1 = private unnamed_addr constant [2 x i8] c"s\00", align 1
@.str2 = private unnamed_addr constant [4 x i8] c"abc\00", align 1

define void @testVaCopyArg(i8* %fmt, ...) nounwind uwtable {
entry:
  %fmt.addr = alloca i8*, align 8
  %ap = alloca [1 x %struct.__va_list_tag], align 16
  %aq = alloca [1 x %struct.__va_list_tag], align 16
  %s = alloca i8*, align 8
  store i8* %fmt, i8** %fmt.addr, align 8
  %arraydecay = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %arraydecay1 = bitcast %struct.__va_list_tag* %arraydecay to i8*
  call void @llvm.va_start(i8* %arraydecay1)
  %arraydecay2 = getelementptr inbounds [1 x %struct.__va_list_tag]* %aq, i32 0, i32 0
  %arraydecay3 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %0 = bitcast %struct.__va_list_tag* %arraydecay2 to i8*
  %1 = bitcast %struct.__va_list_tag* %arraydecay3 to i8*
  call void @llvm.va_copy(i8* %0, i8* %1)
  %arraydecay4 = getelementptr inbounds [1 x %struct.__va_list_tag]* %aq, i32 0, i32 0
  %2 = va_arg %struct.__va_list_tag* %arraydecay4, i8*
  store i8* %2, i8** %s, align 8
  %3 = load i8** %s, align 8
  %call = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([11 x i8]* @.str, i32 0, i32 0), i8* %3)
  ret void
}

declare void @llvm.va_start(i8*) nounwind

declare void @llvm.va_copy(i8*, i8*) nounwind

declare i32 @printf(i8*, ...)

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval
  call void (i8*, ...)* @testVaCopyArg(i8* getelementptr inbounds ([2 x i8]* @.str1, i32 0, i32 0), i8* getelementptr inbounds ([4 x i8]* @.str2, i32 0, i32 0))
  ret i32 0
}
