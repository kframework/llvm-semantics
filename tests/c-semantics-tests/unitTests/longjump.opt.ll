; ModuleID = '/home/david/src/c-semantics/tests/unitTests/longjump.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
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
@str = private unnamed_addr constant [5 x i8] c"in f\00"
@str15 = private unnamed_addr constant [7 x i8] c"second\00"
@str16 = private unnamed_addr constant [11 x i8] c"after jump\00"
@str17 = private unnamed_addr constant [10 x i8] c"calling f\00"
@str18 = private unnamed_addr constant [4 x i8] c"xxx\00"
@str19 = private unnamed_addr constant [6 x i8] c"test2\00"
@str20 = private unnamed_addr constant [7 x i8] c"in foo\00"
@str21 = private unnamed_addr constant [11 x i8] c"in handler\00"
@str22 = private unnamed_addr constant [11 x i8] c"data freed\00"

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
  %puts = tail call i32 @puts(i8* getelementptr inbounds ([7 x i8]* @str15, i64 0, i64 0))
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
  %call = call i32 @_setjmp(%struct.__jmp_buf_tag* getelementptr inbounds ([1 x %struct.__jmp_buf_tag]* @x, i64 0, i64 0)) nounwind returns_twice
  %puts = call i32 @puts(i8* getelementptr inbounds ([11 x i8]* @str16, i64 0, i64 0))
  %tobool = icmp eq i32 %call, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %puts6 = call i32 @puts(i8* getelementptr inbounds ([10 x i8]* @str17, i64 0, i64 0))
  call void @f()
  unreachable

if.end:                                           ; preds = %entry
  %call4 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @.str6, i64 0, i64 0), i32 %call) nounwind
  %puts7 = call i32 @puts(i8* getelementptr inbounds ([4 x i8]* @str18, i64 0, i64 0))
  ret void
}

declare i32 @_setjmp(%struct.__jmp_buf_tag*) nounwind returns_twice

define void @test2() nounwind uwtable {
entry:
  %call = call i32 @_setjmp(%struct.__jmp_buf_tag* getelementptr inbounds ([1 x %struct.__jmp_buf_tag]* @buf, i64 0, i64 0)) nounwind returns_twice
  %tobool = icmp eq i32 %call, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @first()
  unreachable

if.end:                                           ; preds = %entry
  %puts = call i32 @puts(i8* getelementptr inbounds ([6 x i8]* @str19, i64 0, i64 0))
  ret void
}

define i32 @test3() nounwind uwtable {
entry:
  %data = alloca i8*, align 8
  store i8* null, i8** %data, align 8, !tbaa !0
  %call = call i32 @_setjmp(%struct.__jmp_buf_tag* getelementptr inbounds ([1 x %struct.__jmp_buf_tag]* @env, i64 0, i64 0)) nounwind returns_twice
  %call1 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([20 x i8]* @.str9, i64 0, i64 0), i32 %call) nounwind
  %cmp = icmp eq i32 %call, 0
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @foo(i8** %data)
  unreachable

if.end:                                           ; preds = %entry
  %puts.i = call i32 @puts(i8* getelementptr inbounds ([11 x i8]* @str21, i64 0, i64 0)) nounwind
  ret i32 0
}

define void @foo(i8** nocapture %data) noreturn nounwind uwtable {
entry:
  %call = tail call noalias i8* @malloc(i64 32) nounwind
  store i8* %call, i8** %data, align 8, !tbaa !0
  %puts = tail call i32 @puts(i8* getelementptr inbounds ([7 x i8]* @str20, i64 0, i64 0))
  %0 = load i8** %data, align 8, !tbaa !0
  tail call void @llvm.memcpy.p0i8.p0i8.i64(i8* %0, i8* getelementptr inbounds ([12 x i8]* @.str11, i64 0, i64 0), i64 12, i32 1, i1 false)
  %1 = load i8** %data, align 8, !tbaa !0
  %call3 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([11 x i8]* @.str12, i64 0, i64 0), i8* %1) nounwind
  tail call void @longjmp(%struct.__jmp_buf_tag* getelementptr inbounds ([1 x %struct.__jmp_buf_tag]* @env, i64 0, i64 0), i32 42) noreturn nounwind
  unreachable
}

define void @handle(i8* %data) nounwind uwtable {
entry:
  %puts = tail call i32 @puts(i8* getelementptr inbounds ([11 x i8]* @str21, i64 0, i64 0))
  %tobool = icmp eq i8* %data, null
  br i1 %tobool, label %if.end, label %if.then

if.then:                                          ; preds = %entry
  tail call void @free(i8* %data) nounwind
  %puts2 = tail call i32 @puts(i8* getelementptr inbounds ([11 x i8]* @str22, i64 0, i64 0))
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

!0 = metadata !{metadata !"any pointer", metadata !1}
!1 = metadata !{metadata !"omnipotent char", metadata !2}
!2 = metadata !{metadata !"Simple C/C++ TBAA", null}
