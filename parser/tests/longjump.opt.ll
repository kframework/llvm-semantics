; ModuleID = '/home/grosu/celliso2/c-semantics/tests/unitTests/longjump.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

%struct.__jmp_buf_tag = type { [8 x i64], i32, %struct.__sigset_t }
%struct.__sigset_t = type { [16 x i64] }

@x = internal global [1 x %struct.__jmp_buf_tag] zeroinitializer, align 16
@buf = internal global [1 x %struct.__jmp_buf_tag] zeroinitializer, align 16
@.str6 = private unnamed_addr constant [17 x i8] c"error code = %d\0A\00", align 1
@env = common global [1 x %struct.__jmp_buf_tag] zeroinitializer, align 16
@.str9 = private unnamed_addr constant [20 x i8] c"setjmp returned %d\0A\00", align 1
@.str11 = private unnamed_addr constant [12 x i8] c"Hello World\00", align 1
@.str12 = private unnamed_addr constant [11 x i8] c"data = %s\0A\00", align 1
@str = internal constant [5 x i8] c"in f\00"
@str1 = internal constant [7 x i8] c"second\00"
@str2 = internal constant [11 x i8] c"after jump\00"
@str3 = internal constant [10 x i8] c"calling f\00"
@str4 = internal constant [4 x i8] c"xxx\00"
@str5 = internal constant [6 x i8] c"test2\00"
@str6 = internal constant [7 x i8] c"in foo\00"
@str7 = internal constant [11 x i8] c"in handler\00"
@str8 = internal constant [11 x i8] c"data freed\00"

define i32 @gnu_dev_major(i64 %__dev) nounwind uwtable readnone inlinehint {
entry:
  %shr = lshr i64 %__dev, 8
  %and = and i64 %shr, 4095
  %shr2 = lshr i64 %__dev, 32
  %and3 = and i64 %shr2, 4294963200
  %or = or i64 %and, %and3
  %conv5 = trunc i64 %or to i32
  ret i32 %conv5
}

define i32 @gnu_dev_minor(i64 %__dev) nounwind uwtable readnone inlinehint {
entry:
  %and = and i64 %__dev, 255
  %shr = lshr i64 %__dev, 12
  %and2 = and i64 %shr, 4294967040
  %or = or i64 %and2, %and
  %conv4 = trunc i64 %or to i32
  ret i32 %conv4
}

define i64 @gnu_dev_makedev(i32 %__major, i32 %__minor) nounwind uwtable readnone inlinehint {
entry:
  %and = and i32 %__minor, 255
  %and2 = shl i32 %__major, 8
  %shl = and i32 %and2, 1048320
  %or = or i32 %and, %shl
  %conv = zext i32 %or to i64
  %and4 = and i32 %__minor, -256
  %conv5 = zext i32 %and4 to i64
  %shl6 = shl nuw nsw i64 %conv5, 12
  %and9 = and i32 %__major, -4096
  %conv10 = zext i32 %and9 to i64
  %shl11 = shl nuw i64 %conv10, 32
  %or7 = or i64 %shl6, %shl11
  %or12 = or i64 %or7, %conv
  ret i64 %or12
}

define void @f() noreturn nounwind uwtable {
entry:
  %puts = tail call i32 @puts(i8* getelementptr inbounds ([5 x i8]* @str, i64 0, i64 0))
  tail call void @longjmp(%struct.__jmp_buf_tag* getelementptr inbounds ([1 x %struct.__jmp_buf_tag]* @x, i64 0, i64 0), i32 5) noreturn nounwind
  unreachable
}

declare i32 @printf(i8* nocapture, ...) nounwind

declare void @longjmp(%struct.__jmp_buf_tag*, i32) noreturn nounwind

define void @second() noreturn nounwind uwtable {
entry:
  %puts = tail call i32 @puts(i8* getelementptr inbounds ([7 x i8]* @str1, i64 0, i64 0))
  tail call void @longjmp(%struct.__jmp_buf_tag* getelementptr inbounds ([1 x %struct.__jmp_buf_tag]* @buf, i64 0, i64 0), i32 1) noreturn nounwind
  unreachable
}

define void @first() noreturn nounwind uwtable {
entry:
  tail call void @second()
  unreachable
}

define void @test1() nounwind uwtable {
entry:
  %call = call i32 @_setjmp(%struct.__jmp_buf_tag* getelementptr inbounds ([1 x %struct.__jmp_buf_tag]* @x, i64 0, i64 0)) nounwind
  %puts = call i32 @puts(i8* getelementptr inbounds ([11 x i8]* @str2, i64 0, i64 0))
  %tobool = icmp eq i32 %call, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %puts1 = call i32 @puts(i8* getelementptr inbounds ([10 x i8]* @str3, i64 0, i64 0))
  call void @f()
  unreachable

if.end:                                           ; preds = %entry
  %call5 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @.str6, i64 0, i64 0), i32 %call) nounwind
  %puts2 = call i32 @puts(i8* getelementptr inbounds ([4 x i8]* @str4, i64 0, i64 0))
  ret void
}

declare i32 @_setjmp(%struct.__jmp_buf_tag*) nounwind

define void @test2() nounwind uwtable {
entry:
  %call = call i32 @_setjmp(%struct.__jmp_buf_tag* getelementptr inbounds ([1 x %struct.__jmp_buf_tag]* @buf, i64 0, i64 0)) nounwind
  %tobool = icmp eq i32 %call, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @first()
  unreachable

if.end:                                           ; preds = %entry
  %puts = call i32 @puts(i8* getelementptr inbounds ([6 x i8]* @str5, i64 0, i64 0))
  ret void
}

define i32 @test3() nounwind uwtable {
entry:
  %data = alloca i8*, align 8
  store i8* null, i8** %data, align 8
  %call = call i32 @_setjmp(%struct.__jmp_buf_tag* getelementptr inbounds ([1 x %struct.__jmp_buf_tag]* @env, i64 0, i64 0)) nounwind
  %call1 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([20 x i8]* @.str9, i64 0, i64 0), i32 %call) nounwind
  %cmp = icmp eq i32 %call, 0
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  call void @foo(i8** %data)
  unreachable

if.else:                                          ; preds = %entry
  %tmp3 = load i8** %data, align 8
  %puts.i = call i32 @puts(i8* getelementptr inbounds ([11 x i8]* @str7, i64 0, i64 0)) nounwind
  %tobool.i = icmp eq i8* %tmp3, null
  br i1 %tobool.i, label %if.end, label %if.then.i

if.then.i:                                        ; preds = %if.else
  call void @free(i8* %tmp3) nounwind
  %puts1.i = call i32 @puts(i8* getelementptr inbounds ([11 x i8]* @str8, i64 0, i64 0)) nounwind
  br label %if.end

if.end:                                           ; preds = %if.then.i, %if.else
  ret i32 0
}

define void @foo(i8** %data) noreturn nounwind uwtable {
entry:
  %call = tail call noalias i8* @malloc(i64 32) nounwind
  store i8* %call, i8** %data, align 8
  %puts = tail call i32 @puts(i8* getelementptr inbounds ([7 x i8]* @str6, i64 0, i64 0))
  %tmp3 = load i8** %data, align 8
  tail call void @llvm.memcpy.p0i8.p0i8.i64(i8* %tmp3, i8* getelementptr inbounds ([12 x i8]* @.str11, i64 0, i64 0), i64 12, i32 1, i1 false)
  %tmp6 = load i8** %data, align 8
  %call7 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([11 x i8]* @.str12, i64 0, i64 0), i8* %tmp6) nounwind
  tail call void @longjmp(%struct.__jmp_buf_tag* getelementptr inbounds ([1 x %struct.__jmp_buf_tag]* @env, i64 0, i64 0), i32 42) noreturn nounwind
  unreachable
}

define void @handle(i8* %data) nounwind uwtable {
entry:
  %puts = tail call i32 @puts(i8* getelementptr inbounds ([11 x i8]* @str7, i64 0, i64 0))
  %tobool = icmp eq i8* %data, null
  br i1 %tobool, label %if.end, label %if.then

if.then:                                          ; preds = %entry
  tail call void @free(i8* %data) nounwind
  %puts1 = tail call i32 @puts(i8* getelementptr inbounds ([11 x i8]* @str8, i64 0, i64 0))
  br label %if.end

if.end:                                           ; preds = %entry, %if.then
  ret void
}

declare noalias i8* @malloc(i64) nounwind

declare void @free(i8* nocapture) nounwind

define i32 @main() nounwind uwtable {
entry:
  tail call void @test1()
  tail call void @test2()
  %call = tail call i32 @test3()
  ret i32 0
}

declare i32 @puts(i8* nocapture) nounwind

declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture, i64, i32, i1) nounwind
