; ModuleID = '/home/david/src/c-semantics/tests/cil/test41.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.__va_list_tag = type { i32, i32, i8*, i8* }

@.str = private unnamed_addr constant [16 x i8] c"hello world %d\0A\00", align 1

define i32 @sum(i32 %s0, ...) nounwind uwtable {
entry:
  %s0.addr = alloca i32, align 4
  %args = alloca [1 x %struct.__va_list_tag], align 16
  %s = alloca i32, align 4
  %n = alloca i32, align 4
  store i32 %s0, i32* %s0.addr, align 4
  %0 = load i32* %s0.addr, align 4
  store i32 %0, i32* %s, align 4
  %arraydecay = getelementptr inbounds [1 x %struct.__va_list_tag]* %args, i32 0, i32 0
  %arraydecay1 = bitcast %struct.__va_list_tag* %arraydecay to i8*
  call void @llvm.va_start(i8* %arraydecay1)
  br label %while.cond

while.cond:                                       ; preds = %while.body, %entry
  %arraydecay2 = getelementptr inbounds [1 x %struct.__va_list_tag]* %args, i32 0, i32 0
  %1 = va_arg %struct.__va_list_tag* %arraydecay2, i32
  store i32 %1, i32* %n, align 4
  %tobool = icmp ne i32 %1, 0
  br i1 %tobool, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %2 = load i32* %n, align 4
  %3 = load i32* %s, align 4
  %add = add nsw i32 %3, %2
  store i32 %add, i32* %s, align 4
  br label %while.cond

while.end:                                        ; preds = %while.cond
  %arraydecay3 = getelementptr inbounds [1 x %struct.__va_list_tag]* %args, i32 0, i32 0
  %arraydecay34 = bitcast %struct.__va_list_tag* %arraydecay3 to i8*
  call void @llvm.va_end(i8* %arraydecay34)
  %4 = load i32* %s, align 4
  ret i32 %4
}

declare void @llvm.va_start(i8*) nounwind

declare void @llvm.va_end(i8*) nounwind

define i32 @main(i32 %argc, i8** %argv) nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  %x = alloca i32, align 4
  store i32 0, i32* %retval
  store i32 %argc, i32* %argc.addr, align 4
  store i8** %argv, i8*** %argv.addr, align 8
  %call = call i32 (i32, ...)* @sum(i32 4, i32 3, i32 32, i32 22, i32 0)
  store i32 %call, i32* %x, align 4
  %0 = load i32* %x, align 4
  %call1 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([16 x i8]* @.str, i32 0, i32 0), i32 %0)
  ret i32 0
}

declare i32 @printf(i8*, ...)
