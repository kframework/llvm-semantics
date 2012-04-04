; ModuleID = '/home/david/src/c-semantics/tests/llvm-unit/MultipleSetjmp.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.__jmp_buf_tag = type { [8 x i64], i32, %struct.__sigset_t }
%struct.__sigset_t = type { [16 x i64] }

@.str = private unnamed_addr constant [15 x i8] c"Inside bar %d\0A\00", align 1
@.str1 = private unnamed_addr constant [26 x i8] c"returning from bar == %d\0A\00", align 1

define i32 @bar(%struct.__jmp_buf_tag* %buf, i32 %i) nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %buf.addr = alloca %struct.__jmp_buf_tag*, align 8
  %i.addr = alloca i32, align 4
  store %struct.__jmp_buf_tag* %buf, %struct.__jmp_buf_tag** %buf.addr, align 8
  store i32 %i, i32* %i.addr, align 4
  %0 = load i32* %i.addr, align 4
  %call = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([15 x i8]* @.str, i32 0, i32 0), i32 %0)
  %1 = load %struct.__jmp_buf_tag** %buf.addr, align 8
  %2 = load i32* %i.addr, align 4
  call void @longjmp(%struct.__jmp_buf_tag* %1, i32 %2) noreturn nounwind
  unreachable

return:                                           ; No predecessors!
  %3 = load i32* %retval
  ret i32 %3
}

declare i32 @printf(i8*, ...)

declare void @longjmp(%struct.__jmp_buf_tag*, i32) noreturn nounwind

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %buf = alloca [1 x %struct.__jmp_buf_tag], align 16
  %ret = alloca i32, align 4
  store i32 0, i32* %retval
  %arraydecay = getelementptr inbounds [1 x %struct.__jmp_buf_tag]* %buf, i32 0, i32 0
  %call = call i32 @_setjmp(%struct.__jmp_buf_tag* %arraydecay) nounwind returns_twice
  store i32 %call, i32* %ret, align 4
  %cmp = icmp ne i32 %call, 0
  br i1 %cmp, label %if.then, label %if.else9

if.then:                                          ; preds = %entry
  %0 = load i32* %ret, align 4
  %call1 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([26 x i8]* @.str1, i32 0, i32 0), i32 %0)
  %arraydecay2 = getelementptr inbounds [1 x %struct.__jmp_buf_tag]* %buf, i32 0, i32 0
  %call3 = call i32 @_setjmp(%struct.__jmp_buf_tag* %arraydecay2) nounwind returns_twice
  store i32 %call3, i32* %ret, align 4
  %cmp4 = icmp ne i32 %call3, 0
  br i1 %cmp4, label %if.then5, label %if.else

if.then5:                                         ; preds = %if.then
  %1 = load i32* %ret, align 4
  %call6 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([26 x i8]* @.str1, i32 0, i32 0), i32 %1)
  br label %if.end

if.else:                                          ; preds = %if.then
  %arraydecay7 = getelementptr inbounds [1 x %struct.__jmp_buf_tag]* %buf, i32 0, i32 0
  %call8 = call i32 @bar(%struct.__jmp_buf_tag* %arraydecay7, i32 927)
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then5
  br label %if.end12

if.else9:                                         ; preds = %entry
  %arraydecay10 = getelementptr inbounds [1 x %struct.__jmp_buf_tag]* %buf, i32 0, i32 0
  %call11 = call i32 @bar(%struct.__jmp_buf_tag* %arraydecay10, i32 37)
  br label %if.end12

if.end12:                                         ; preds = %if.else9, %if.end
  %2 = load i32* %retval
  ret i32 %2
}

declare i32 @_setjmp(%struct.__jmp_buf_tag*) nounwind returns_twice
