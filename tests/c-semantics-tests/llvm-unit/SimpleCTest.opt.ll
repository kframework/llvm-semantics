; ModuleID = '/home/david/src/c-semantics/tests/llvm-unit/SimpleCTest.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.__jmp_buf_tag = type { [8 x i64], i32, %struct.__sigset_t }
%struct.__sigset_t = type { [16 x i64] }

@.str2 = private unnamed_addr constant [11 x i8] c"ret == %d\0A\00", align 1
@str = private unnamed_addr constant [11 x i8] c"Inside baz\00"
@str3 = private unnamed_addr constant [12 x i8] c"Inside main\00"

define void @baz(%struct.__jmp_buf_tag* %buf) noreturn nounwind uwtable {
entry:
  %puts = tail call i32 @puts(i8* getelementptr inbounds ([11 x i8]* @str, i64 0, i64 0))
  tail call void @longjmp(%struct.__jmp_buf_tag* %buf, i32 37) noreturn nounwind
  unreachable
}

declare i32 @printf(i8* nocapture, ...) nounwind

declare void @longjmp(%struct.__jmp_buf_tag*, i32) noreturn nounwind

define i32 @main() nounwind uwtable {
entry:
  %buf = alloca [1 x %struct.__jmp_buf_tag], align 16
  %puts = call i32 @puts(i8* getelementptr inbounds ([12 x i8]* @str3, i64 0, i64 0))
  %arraydecay = getelementptr inbounds [1 x %struct.__jmp_buf_tag]* %buf, i64 0, i64 0
  %call1 = call i32 @_setjmp(%struct.__jmp_buf_tag* %arraydecay) nounwind returns_twice
  %cmp = icmp eq i32 %call1, 0
  br i1 %cmp, label %if.else, label %if.end

if.else:                                          ; preds = %entry
  call void @baz(%struct.__jmp_buf_tag* %arraydecay)
  unreachable

if.end:                                           ; preds = %entry
  %call2 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([11 x i8]* @.str2, i64 0, i64 0), i32 %call1) nounwind
  ret i32 0
}

declare i32 @_setjmp(%struct.__jmp_buf_tag*) nounwind returns_twice

declare i32 @puts(i8* nocapture) nounwind
