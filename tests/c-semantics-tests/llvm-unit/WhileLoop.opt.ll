; ModuleID = '/home/david/src/c-semantics/tests/llvm-unit/WhileLoop.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.__jmp_buf_tag = type { [8 x i64], i32, %struct.__sigset_t }
%struct.__sigset_t = type { [16 x i64] }

@.str = private unnamed_addr constant [16 x i8] c"Inside foo: %d\0A\00", align 1
@.str1 = private unnamed_addr constant [25 x i8] c"Return from longjmp: %d\0A\00", align 1

define void @foo(%struct.__jmp_buf_tag* %buf, i32 %i) noreturn nounwind uwtable {
entry:
  %call = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([16 x i8]* @.str, i64 0, i64 0), i32 %i) nounwind
  tail call void @longjmp(%struct.__jmp_buf_tag* %buf, i32 %i) noreturn nounwind
  unreachable
}

declare i32 @printf(i8* nocapture, ...) nounwind

declare void @longjmp(%struct.__jmp_buf_tag*, i32) noreturn nounwind

define i32 @main() nounwind uwtable {
entry:
  %buf = alloca [1 x %struct.__jmp_buf_tag], align 16
  %arraydecay = getelementptr inbounds [1 x %struct.__jmp_buf_tag]* %buf, i64 0, i64 0
  br label %while.cond

while.cond:                                       ; preds = %if.then, %entry
  %i.0 = phi i32 [ 37, %entry ], [ %dec, %if.then ]
  %dec = add nsw i32 %i.0, -1
  %tobool = icmp eq i32 %i.0, 0
  br i1 %tobool, label %while.end, label %while.body

while.body:                                       ; preds = %while.cond
  %call = call i32 @_setjmp(%struct.__jmp_buf_tag* %arraydecay) nounwind returns_twice
  %cmp = icmp eq i32 %call, 0
  br i1 %cmp, label %if.else, label %if.then

if.then:                                          ; preds = %while.body
  %call1 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str1, i64 0, i64 0), i32 %call) nounwind
  br label %while.cond

if.else:                                          ; preds = %while.body
  call void @foo(%struct.__jmp_buf_tag* %arraydecay, i32 %dec)
  unreachable

while.end:                                        ; preds = %while.cond
  ret i32 0
}

declare i32 @_setjmp(%struct.__jmp_buf_tag*) nounwind returns_twice
