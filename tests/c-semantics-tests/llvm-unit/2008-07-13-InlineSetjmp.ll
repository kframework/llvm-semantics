; ModuleID = '/home/david/src/c-semantics/tests/llvm-unit/2008-07-13-InlineSetjmp.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.__jmp_buf_tag = type { [8 x i64], i32, %struct.__sigset_t }
%struct.__sigset_t = type { [16 x i64] }

@.str = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1
@g = common global [1 x %struct.__jmp_buf_tag] zeroinitializer, align 16

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %a = alloca i32, align 4
  store i32 0, i32* %retval
  store i32 1, i32* %a, align 4
  call void @b(i32* %a)
  %0 = load i32* %a, align 4
  %call = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i32 0, i32 0), i32 %0)
  ret i32 0
}

define internal void @b(i32* %x) nounwind uwtable {
entry:
  %x.addr = alloca i32*, align 8
  store i32* %x, i32** %x.addr, align 8
  %call = call i32 @_setjmp(%struct.__jmp_buf_tag* getelementptr inbounds ([1 x %struct.__jmp_buf_tag]* @g, i32 0, i32 0)) nounwind returns_twice
  %tobool = icmp ne i32 %call, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  br label %return

if.end:                                           ; preds = %entry
  %0 = load i32** %x.addr, align 8
  store i32 10, i32* %0, align 4
  %call1 = call i32 @a()
  br label %return

return:                                           ; preds = %if.end, %if.then
  ret void
}

declare i32 @printf(i8*, ...)

declare i32 @_setjmp(%struct.__jmp_buf_tag*) nounwind returns_twice

define internal i32 @a() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  call void @longjmp(%struct.__jmp_buf_tag* getelementptr inbounds ([1 x %struct.__jmp_buf_tag]* @g, i32 0, i32 0), i32 1) noreturn nounwind
  unreachable

return:                                           ; No predecessors!
  %0 = load i32* %retval
  ret i32 %0
}

declare void @longjmp(%struct.__jmp_buf_tag*, i32) noreturn nounwind
