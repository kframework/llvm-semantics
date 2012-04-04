; ModuleID = '/home/david/src/c-semantics/tests/cil/test41.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.__va_list_tag = type { i32, i32, i8*, i8* }

@.str = private unnamed_addr constant [16 x i8] c"hello world %d\0A\00", align 1

define i32 @sum(i32 %s0, ...) nounwind uwtable {
entry:
  %args = alloca [1 x %struct.__va_list_tag], align 16
  %arraydecay = getelementptr inbounds [1 x %struct.__va_list_tag]* %args, i64 0, i64 0
  %arraydecay1 = bitcast [1 x %struct.__va_list_tag]* %args to i8*
  call void @llvm.va_start(i8* %arraydecay1)
  br label %while.cond

while.cond:                                       ; preds = %while.cond, %entry
  %s.0 = phi i32 [ %s0, %entry ], [ %add, %while.cond ]
  %0 = va_arg %struct.__va_list_tag* %arraydecay, i32
  %tobool = icmp eq i32 %0, 0
  %add = add nsw i32 %s.0, %0
  br i1 %tobool, label %while.end, label %while.cond

while.end:                                        ; preds = %while.cond
  call void @llvm.va_end(i8* %arraydecay1)
  ret i32 %s.0
}

declare void @llvm.va_start(i8*) nounwind

declare void @llvm.va_end(i8*) nounwind

define i32 @main(i32 %argc, i8** nocapture %argv) nounwind uwtable {
entry:
  %call = tail call i32 (i32, ...)* @sum(i32 4, i32 3, i32 32, i32 22, i32 0)
  %call1 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([16 x i8]* @.str, i64 0, i64 0), i32 %call) nounwind
  ret i32 0
}

declare i32 @printf(i8* nocapture, ...) nounwind
