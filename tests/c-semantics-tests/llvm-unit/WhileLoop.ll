; ModuleID = '/home/david/src/c-semantics/tests/llvm-unit/WhileLoop.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.__jmp_buf_tag = type { [8 x i64], i32, %struct.__sigset_t }
%struct.__sigset_t = type { [16 x i64] }

@.str = private unnamed_addr constant [16 x i8] c"Inside foo: %d\0A\00", align 1
@.str1 = private unnamed_addr constant [25 x i8] c"Return from longjmp: %d\0A\00", align 1

define void @foo(%struct.__jmp_buf_tag* %buf, i32 %i) nounwind uwtable {
entry:
  %buf.addr = alloca %struct.__jmp_buf_tag*, align 8
  %i.addr = alloca i32, align 4
  store %struct.__jmp_buf_tag* %buf, %struct.__jmp_buf_tag** %buf.addr, align 8
  store i32 %i, i32* %i.addr, align 4
  %0 = load i32* %i.addr, align 4
  %call = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([16 x i8]* @.str, i32 0, i32 0), i32 %0)
  %1 = load %struct.__jmp_buf_tag** %buf.addr, align 8
  %2 = load i32* %i.addr, align 4
  call void @longjmp(%struct.__jmp_buf_tag* %1, i32 %2) noreturn nounwind
  unreachable

return:                                           ; No predecessors!
  ret void
}

declare i32 @printf(i8*, ...)

declare void @longjmp(%struct.__jmp_buf_tag*, i32) noreturn nounwind

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %i = alloca i32, align 4
  %buf = alloca [1 x %struct.__jmp_buf_tag], align 16
  %ret = alloca i32, align 4
  store i32 0, i32* %retval
  store i32 37, i32* %i, align 4
  br label %while.cond

while.cond:                                       ; preds = %if.end, %entry
  %0 = load i32* %i, align 4
  %dec = add nsw i32 %0, -1
  store i32 %dec, i32* %i, align 4
  %tobool = icmp ne i32 %0, 0
  br i1 %tobool, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %arraydecay = getelementptr inbounds [1 x %struct.__jmp_buf_tag]* %buf, i32 0, i32 0
  %call = call i32 @_setjmp(%struct.__jmp_buf_tag* %arraydecay) nounwind returns_twice
  store i32 %call, i32* %ret, align 4
  %cmp = icmp ne i32 %call, 0
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %while.body
  %1 = load i32* %ret, align 4
  %call1 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str1, i32 0, i32 0), i32 %1)
  br label %if.end

if.else:                                          ; preds = %while.body
  %arraydecay2 = getelementptr inbounds [1 x %struct.__jmp_buf_tag]* %buf, i32 0, i32 0
  %2 = load i32* %i, align 4
  call void @foo(%struct.__jmp_buf_tag* %arraydecay2, i32 %2)
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  br label %while.cond

while.end:                                        ; preds = %while.cond
  %3 = load i32* %retval
  ret i32 %3
}

declare i32 @_setjmp(%struct.__jmp_buf_tag*) nounwind returns_twice
