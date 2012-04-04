; ModuleID = '/home/david/src/c-semantics/tests/unitTests/longjump.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.__jmp_buf_tag = type { [8 x i64], i32, %struct.__sigset_t }
%struct.__sigset_t = type { [16 x i64] }

@.str = private unnamed_addr constant [6 x i8] c"in f\0A\00", align 1
@x = internal global [1 x %struct.__jmp_buf_tag] zeroinitializer, align 16
@.str1 = private unnamed_addr constant [8 x i8] c"second\0A\00", align 1
@buf = internal global [1 x %struct.__jmp_buf_tag] zeroinitializer, align 16
@.str2 = private unnamed_addr constant [7 x i8] c"first\0A\00", align 1
@.str3 = private unnamed_addr constant [12 x i8] c"after jump\0A\00", align 1
@.str4 = private unnamed_addr constant [11 x i8] c"calling f\0A\00", align 1
@.str5 = private unnamed_addr constant [5 x i8] c"zzz\0A\00", align 1
@.str6 = private unnamed_addr constant [17 x i8] c"error code = %d\0A\00", align 1
@.str7 = private unnamed_addr constant [5 x i8] c"xxx\0A\00", align 1
@.str8 = private unnamed_addr constant [7 x i8] c"test2\0A\00", align 1
@env = common global [1 x %struct.__jmp_buf_tag] zeroinitializer, align 16
@.str9 = private unnamed_addr constant [20 x i8] c"setjmp returned %d\0A\00", align 1
@.str10 = private unnamed_addr constant [8 x i8] c"in foo\0A\00", align 1
@.str11 = private unnamed_addr constant [12 x i8] c"Hello World\00", align 1
@.str12 = private unnamed_addr constant [11 x i8] c"data = %s\0A\00", align 1
@.str13 = private unnamed_addr constant [12 x i8] c"in handler\0A\00", align 1
@.str14 = private unnamed_addr constant [12 x i8] c"data freed\0A\00", align 1

define void @f() nounwind uwtable {
entry:
  %call = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([6 x i8]* @.str, i32 0, i32 0))
  call void @longjmp(%struct.__jmp_buf_tag* getelementptr inbounds ([1 x %struct.__jmp_buf_tag]* @x, i32 0, i32 0), i32 5) noreturn nounwind
  unreachable

return:                                           ; No predecessors!
  ret void
}

declare i32 @printf(i8*, ...)

declare void @longjmp(%struct.__jmp_buf_tag*, i32) noreturn nounwind

define void @second() nounwind uwtable {
entry:
  %call = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([8 x i8]* @.str1, i32 0, i32 0))
  call void @longjmp(%struct.__jmp_buf_tag* getelementptr inbounds ([1 x %struct.__jmp_buf_tag]* @buf, i32 0, i32 0), i32 1) noreturn nounwind
  unreachable

return:                                           ; No predecessors!
  ret void
}

define void @first() nounwind uwtable {
entry:
  call void @second()
  %call = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([7 x i8]* @.str2, i32 0, i32 0))
  ret void
}

define void @test1() nounwind uwtable {
entry:
  %i = alloca i32, align 4
  store i32 0, i32* %i, align 4
  %call = call i32 @_setjmp(%struct.__jmp_buf_tag* getelementptr inbounds ([1 x %struct.__jmp_buf_tag]* @x, i32 0, i32 0)) nounwind returns_twice
  store i32 %call, i32* %i, align 4
  %call1 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([12 x i8]* @.str3, i32 0, i32 0))
  %0 = load i32* %i, align 4
  %tobool = icmp ne i32 %0, 0
  br i1 %tobool, label %if.else, label %if.then

if.then:                                          ; preds = %entry
  %call2 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([11 x i8]* @.str4, i32 0, i32 0))
  call void @f()
  %call3 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]* @.str5, i32 0, i32 0))
  br label %if.end

if.else:                                          ; preds = %entry
  %1 = load i32* %i, align 4
  %call4 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @.str6, i32 0, i32 0), i32 %1)
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %call5 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]* @.str7, i32 0, i32 0))
  ret void
}

declare i32 @_setjmp(%struct.__jmp_buf_tag*) nounwind returns_twice

define void @test2() nounwind uwtable {
entry:
  %call = call i32 @_setjmp(%struct.__jmp_buf_tag* getelementptr inbounds ([1 x %struct.__jmp_buf_tag]* @buf, i32 0, i32 0)) nounwind returns_twice
  %tobool = icmp ne i32 %call, 0
  br i1 %tobool, label %if.else, label %if.then

if.then:                                          ; preds = %entry
  call void @first()
  br label %if.end

if.else:                                          ; preds = %entry
  %call1 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([7 x i8]* @.str8, i32 0, i32 0))
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  ret void
}

define i32 @test3() nounwind uwtable {
entry:
  %data = alloca i8*, align 8
  %res = alloca i32, align 4
  store i8* null, i8** %data, align 8
  %call = call i32 @_setjmp(%struct.__jmp_buf_tag* getelementptr inbounds ([1 x %struct.__jmp_buf_tag]* @env, i32 0, i32 0)) nounwind returns_twice
  store i32 %call, i32* %res, align 4
  %0 = load i32* %res, align 4
  %call1 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([20 x i8]* @.str9, i32 0, i32 0), i32 %0)
  %1 = load i32* %res, align 4
  %cmp = icmp eq i32 %1, 0
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  call void @foo(i8** %data)
  br label %if.end

if.else:                                          ; preds = %entry
  %2 = load i8** %data, align 8
  call void @handle(i8* %2)
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  ret i32 0
}

define void @foo(i8** %data) nounwind uwtable {
entry:
  %data.addr = alloca i8**, align 8
  store i8** %data, i8*** %data.addr, align 8
  %call = call noalias i8* @malloc(i64 32) nounwind
  %0 = load i8*** %data.addr, align 8
  store i8* %call, i8** %0, align 8
  %call1 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([8 x i8]* @.str10, i32 0, i32 0))
  %1 = load i8*** %data.addr, align 8
  %2 = load i8** %1, align 8
  %call2 = call i8* @strcpy(i8* %2, i8* getelementptr inbounds ([12 x i8]* @.str11, i32 0, i32 0)) nounwind
  %3 = load i8*** %data.addr, align 8
  %4 = load i8** %3, align 8
  %call3 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([11 x i8]* @.str12, i32 0, i32 0), i8* %4)
  call void @longjmp(%struct.__jmp_buf_tag* getelementptr inbounds ([1 x %struct.__jmp_buf_tag]* @env, i32 0, i32 0), i32 42) noreturn nounwind
  unreachable

return:                                           ; No predecessors!
  ret void
}

define void @handle(i8* %data) nounwind uwtable {
entry:
  %data.addr = alloca i8*, align 8
  store i8* %data, i8** %data.addr, align 8
  %call = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([12 x i8]* @.str13, i32 0, i32 0))
  %0 = load i8** %data.addr, align 8
  %tobool = icmp ne i8* %0, null
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %1 = load i8** %data.addr, align 8
  call void @free(i8* %1) nounwind
  %call1 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([12 x i8]* @.str14, i32 0, i32 0))
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  ret void
}

declare noalias i8* @malloc(i64) nounwind

declare i8* @strcpy(i8*, i8*) nounwind

declare void @free(i8*) nounwind

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval
  call void @test1()
  call void @test2()
  %call = call i32 @test3()
  ret i32 0
}
