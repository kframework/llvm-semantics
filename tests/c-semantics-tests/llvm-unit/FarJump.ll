; ModuleID = '/home/david/src/c-semantics/tests/llvm-unit/FarJump.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.__jmp_buf_tag = type { [8 x i64], i32, %struct.__sigset_t }
%struct.__sigset_t = type { [16 x i64] }

@.str = private unnamed_addr constant [13 x i8] c"Inside quux\0A\00", align 1
@.str1 = private unnamed_addr constant [27 x i8] c"Longjmping from quux: 927\0A\00", align 1
@.str2 = private unnamed_addr constant [12 x i8] c"Inside qux\0A\00", align 1
@.str3 = private unnamed_addr constant [33 x i8] c"Error: Shouldn't be here in qux\0A\00", align 1
@.str4 = private unnamed_addr constant [12 x i8] c"Inside baz\0A\00", align 1
@.str5 = private unnamed_addr constant [33 x i8] c"Error: Shouldn't be here in baz\0A\00", align 1
@.str6 = private unnamed_addr constant [12 x i8] c"Inside bar\0A\00", align 1
@.str7 = private unnamed_addr constant [12 x i8] c"Inside foo\0A\00", align 1
@.str8 = private unnamed_addr constant [33 x i8] c"Returning from longjmp into foo\0A\00", align 1

define void @quux(%struct.__jmp_buf_tag* %buf) nounwind uwtable {
entry:
  %buf.addr = alloca %struct.__jmp_buf_tag*, align 8
  store %struct.__jmp_buf_tag* %buf, %struct.__jmp_buf_tag** %buf.addr, align 8
  %call = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([13 x i8]* @.str, i32 0, i32 0))
  %call1 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([27 x i8]* @.str1, i32 0, i32 0))
  %0 = load %struct.__jmp_buf_tag** %buf.addr, align 8
  call void @longjmp(%struct.__jmp_buf_tag* %0, i32 927) noreturn nounwind
  unreachable

return:                                           ; No predecessors!
  ret void
}

declare i32 @printf(i8*, ...)

declare void @longjmp(%struct.__jmp_buf_tag*, i32) noreturn nounwind

define void @qux(%struct.__jmp_buf_tag* %buf) nounwind uwtable {
entry:
  %buf.addr = alloca %struct.__jmp_buf_tag*, align 8
  %local_buf = alloca [1 x %struct.__jmp_buf_tag], align 16
  store %struct.__jmp_buf_tag* %buf, %struct.__jmp_buf_tag** %buf.addr, align 8
  %call = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([12 x i8]* @.str2, i32 0, i32 0))
  %arraydecay = getelementptr inbounds [1 x %struct.__jmp_buf_tag]* %local_buf, i32 0, i32 0
  %call1 = call i32 @_setjmp(%struct.__jmp_buf_tag* %arraydecay) nounwind returns_twice
  %tobool = icmp ne i32 %call1, 0
  br i1 %tobool, label %if.else, label %if.then

if.then:                                          ; preds = %entry
  %0 = load %struct.__jmp_buf_tag** %buf.addr, align 8
  call void @quux(%struct.__jmp_buf_tag* %0)
  br label %if.end

if.else:                                          ; preds = %entry
  %call2 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([33 x i8]* @.str3, i32 0, i32 0))
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  ret void
}

declare i32 @_setjmp(%struct.__jmp_buf_tag*) nounwind returns_twice

define void @baz(%struct.__jmp_buf_tag* %buf) nounwind uwtable {
entry:
  %buf.addr = alloca %struct.__jmp_buf_tag*, align 8
  %local_buf = alloca [1 x %struct.__jmp_buf_tag], align 16
  store %struct.__jmp_buf_tag* %buf, %struct.__jmp_buf_tag** %buf.addr, align 8
  %call = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([12 x i8]* @.str4, i32 0, i32 0))
  %arraydecay = getelementptr inbounds [1 x %struct.__jmp_buf_tag]* %local_buf, i32 0, i32 0
  %call1 = call i32 @_setjmp(%struct.__jmp_buf_tag* %arraydecay) nounwind returns_twice
  %tobool = icmp ne i32 %call1, 0
  br i1 %tobool, label %if.else, label %if.then

if.then:                                          ; preds = %entry
  %0 = load %struct.__jmp_buf_tag** %buf.addr, align 8
  call void @qux(%struct.__jmp_buf_tag* %0)
  br label %if.end

if.else:                                          ; preds = %entry
  %call2 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([33 x i8]* @.str5, i32 0, i32 0))
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  ret void
}

define void @bar(%struct.__jmp_buf_tag* %buf) nounwind uwtable {
entry:
  %buf.addr = alloca %struct.__jmp_buf_tag*, align 8
  store %struct.__jmp_buf_tag* %buf, %struct.__jmp_buf_tag** %buf.addr, align 8
  %call = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([12 x i8]* @.str6, i32 0, i32 0))
  %0 = load %struct.__jmp_buf_tag** %buf.addr, align 8
  call void @baz(%struct.__jmp_buf_tag* %0)
  ret void
}

define void @foo() nounwind uwtable {
entry:
  %buf = alloca [1 x %struct.__jmp_buf_tag], align 16
  %call = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([12 x i8]* @.str7, i32 0, i32 0))
  %arraydecay = getelementptr inbounds [1 x %struct.__jmp_buf_tag]* %buf, i32 0, i32 0
  %call1 = call i32 @_setjmp(%struct.__jmp_buf_tag* %arraydecay) nounwind returns_twice
  %tobool = icmp ne i32 %call1, 0
  br i1 %tobool, label %if.else, label %if.then

if.then:                                          ; preds = %entry
  %arraydecay2 = getelementptr inbounds [1 x %struct.__jmp_buf_tag]* %buf, i32 0, i32 0
  call void @bar(%struct.__jmp_buf_tag* %arraydecay2)
  br label %if.end

if.else:                                          ; preds = %entry
  %call3 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([33 x i8]* @.str8, i32 0, i32 0))
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  ret void
}

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval
  call void @foo()
  ret i32 0
}
