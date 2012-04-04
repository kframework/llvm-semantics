; ModuleID = '/home/david/src/c-semantics/tests/llvm-unit/Looping.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.__jmp_buf_tag = type { [8 x i64], i32, %struct.__sigset_t }
%struct.__sigset_t = type { [16 x i64] }

@.str = private unnamed_addr constant [9 x i8] c"i == %u\0A\00", align 1

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %buf = alloca [1 x %struct.__jmp_buf_tag], align 16
  %i = alloca i32, align 4
  store i32 0, i32* %retval
  store volatile i32 0, i32* %i, align 4
  %arraydecay = getelementptr inbounds [1 x %struct.__jmp_buf_tag]* %buf, i32 0, i32 0
  %call = call i32 @_setjmp(%struct.__jmp_buf_tag* %arraydecay) nounwind returns_twice
  %cmp = icmp slt i32 %call, 10
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %0 = load volatile i32* %i, align 4
  %call1 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([9 x i8]* @.str, i32 0, i32 0), i32 %0)
  %arraydecay2 = getelementptr inbounds [1 x %struct.__jmp_buf_tag]* %buf, i32 0, i32 0
  %1 = load volatile i32* %i, align 4
  %inc = add i32 %1, 1
  store volatile i32 %inc, i32* %i, align 4
  call void @longjmp(%struct.__jmp_buf_tag* %arraydecay2, i32 %inc) noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  ret i32 0
}

declare i32 @_setjmp(%struct.__jmp_buf_tag*) nounwind returns_twice

declare i32 @printf(i8*, ...)

declare void @longjmp(%struct.__jmp_buf_tag*, i32) noreturn nounwind
