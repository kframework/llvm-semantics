; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/20011024-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@buf = common global [50 x i8] zeroinitializer, align 16
@.str = private unnamed_addr constant [4 x i8] c"abc\00", align 1
@.str1 = private unnamed_addr constant [9 x i8] c"abcdefgh\00", align 1

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval
  call void @foo()
  ret i32 0
}

define internal void @foo() nounwind uwtable {
entry:
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* getelementptr inbounds ([50 x i8]* @buf, i32 0, i32 0), i8* getelementptr inbounds ([4 x i8]* @.str, i32 0, i32 0), i64 4, i32 1, i1 false)
  br i1 false, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  %call = call i32 @strcmp(i8* getelementptr inbounds ([50 x i8]* @buf, i32 0, i32 0), i8* getelementptr inbounds ([4 x i8]* @.str, i32 0, i32 0)) nounwind readonly
  %tobool = icmp ne i32 %call, 0
  br i1 %tobool, label %if.then1, label %if.end2

if.then1:                                         ; preds = %if.end
  call void @abort() noreturn nounwind
  unreachable

if.end2:                                          ; preds = %if.end
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* getelementptr inbounds ([50 x i8]* @buf, i32 0, i32 0), i8* getelementptr inbounds ([9 x i8]* @.str1, i32 0, i32 0), i64 9, i32 1, i1 false)
  ret void
}

declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture, i64, i32, i1) nounwind

declare void @abort() noreturn nounwind

declare i32 @strcmp(i8*, i8*) nounwind readonly
