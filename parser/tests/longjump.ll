; ModuleID = '/home/grosu/celliso2/c-semantics/tests/unitTests/longjump.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
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

define i32 @gnu_dev_major(i64 %__dev) nounwind uwtable inlinehint {
entry:
  %__dev.addr = alloca i64, align 8
  store i64 %__dev, i64* %__dev.addr, align 8
  %tmp = load i64* %__dev.addr, align 8
  %shr = lshr i64 %tmp, 8
  %and = and i64 %shr, 4095
  %tmp1 = load i64* %__dev.addr, align 8
  %shr2 = lshr i64 %tmp1, 32
  %conv = trunc i64 %shr2 to i32
  %and3 = and i32 %conv, -4096
  %conv4 = zext i32 %and3 to i64
  %or = or i64 %and, %conv4
  %conv5 = trunc i64 %or to i32
  ret i32 %conv5
}

define i32 @gnu_dev_minor(i64 %__dev) nounwind uwtable inlinehint {
entry:
  %__dev.addr = alloca i64, align 8
  store i64 %__dev, i64* %__dev.addr, align 8
  %tmp = load i64* %__dev.addr, align 8
  %and = and i64 %tmp, 255
  %tmp1 = load i64* %__dev.addr, align 8
  %shr = lshr i64 %tmp1, 12
  %conv = trunc i64 %shr to i32
  %and2 = and i32 %conv, -256
  %conv3 = zext i32 %and2 to i64
  %or = or i64 %and, %conv3
  %conv4 = trunc i64 %or to i32
  ret i32 %conv4
}

define i64 @gnu_dev_makedev(i32 %__major, i32 %__minor) nounwind uwtable inlinehint {
entry:
  %__major.addr = alloca i32, align 4
  %__minor.addr = alloca i32, align 4
  store i32 %__major, i32* %__major.addr, align 4
  store i32 %__minor, i32* %__minor.addr, align 4
  %tmp = load i32* %__minor.addr, align 4
  %and = and i32 %tmp, 255
  %tmp1 = load i32* %__major.addr, align 4
  %and2 = and i32 %tmp1, 4095
  %shl = shl i32 %and2, 8
  %or = or i32 %and, %shl
  %conv = zext i32 %or to i64
  %tmp3 = load i32* %__minor.addr, align 4
  %and4 = and i32 %tmp3, -256
  %conv5 = zext i32 %and4 to i64
  %shl6 = shl i64 %conv5, 12
  %or7 = or i64 %conv, %shl6
  %tmp8 = load i32* %__major.addr, align 4
  %and9 = and i32 %tmp8, -4096
  %conv10 = zext i32 %and9 to i64
  %shl11 = shl i64 %conv10, 32
  %or12 = or i64 %or7, %shl11
  ret i64 %or12
}

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
  %call = call i32 @_setjmp(%struct.__jmp_buf_tag* getelementptr inbounds ([1 x %struct.__jmp_buf_tag]* @x, i32 0, i32 0)) nounwind
  store i32 %call, i32* %i, align 4
  %call1 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([12 x i8]* @.str3, i32 0, i32 0))
  %tmp = load i32* %i, align 4
  %tobool = icmp ne i32 %tmp, 0
  br i1 %tobool, label %if.else, label %if.then

if.then:                                          ; preds = %entry
  %call2 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([11 x i8]* @.str4, i32 0, i32 0))
  call void @f()
  %call3 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]* @.str5, i32 0, i32 0))
  br label %if.end

if.else:                                          ; preds = %entry
  %tmp4 = load i32* %i, align 4
  %call5 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @.str6, i32 0, i32 0), i32 %tmp4)
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %call6 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]* @.str7, i32 0, i32 0))
  ret void
}

declare i32 @_setjmp(%struct.__jmp_buf_tag*) nounwind

define void @test2() nounwind uwtable {
entry:
  %call = call i32 @_setjmp(%struct.__jmp_buf_tag* getelementptr inbounds ([1 x %struct.__jmp_buf_tag]* @buf, i32 0, i32 0)) nounwind
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
  %call = call i32 @_setjmp(%struct.__jmp_buf_tag* getelementptr inbounds ([1 x %struct.__jmp_buf_tag]* @env, i32 0, i32 0)) nounwind
  store i32 %call, i32* %res, align 4
  %tmp = load i32* %res, align 4
  %call1 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([20 x i8]* @.str9, i32 0, i32 0), i32 %tmp)
  %tmp2 = load i32* %res, align 4
  %cmp = icmp eq i32 %tmp2, 0
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  call void @foo(i8** %data)
  br label %if.end

if.else:                                          ; preds = %entry
  %tmp3 = load i8** %data, align 8
  call void @handle(i8* %tmp3)
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  ret i32 0
}

define void @foo(i8** %data) nounwind uwtable {
entry:
  %data.addr = alloca i8**, align 8
  store i8** %data, i8*** %data.addr, align 8
  %call = call noalias i8* @malloc(i64 32) nounwind
  %tmp = load i8*** %data.addr, align 8
  store i8* %call, i8** %tmp
  %call1 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([8 x i8]* @.str10, i32 0, i32 0))
  %tmp2 = load i8*** %data.addr, align 8
  %tmp3 = load i8** %tmp2
  %call4 = call i8* @strcpy(i8* %tmp3, i8* getelementptr inbounds ([12 x i8]* @.str11, i32 0, i32 0)) nounwind
  %tmp5 = load i8*** %data.addr, align 8
  %tmp6 = load i8** %tmp5
  %call7 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([11 x i8]* @.str12, i32 0, i32 0), i8* %tmp6)
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
  %tmp = load i8** %data.addr, align 8
  %tobool = icmp ne i8* %tmp, null
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %tmp1 = load i8** %data.addr, align 8
  call void @free(i8* %tmp1) nounwind
  %call2 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([12 x i8]* @.str14, i32 0, i32 0))
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
