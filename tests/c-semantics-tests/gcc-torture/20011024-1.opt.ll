; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/20011024-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@buf = common global [50 x i8] zeroinitializer, align 16
@.str = private unnamed_addr constant [4 x i8] c"abc\00", align 1
@.str1 = private unnamed_addr constant [9 x i8] c"abcdefgh\00", align 1

define i32 @main() nounwind uwtable {
entry:
  store i32 6513249, i32* bitcast ([50 x i8]* @buf to i32*), align 16
  %call.i = tail call i32 @strcmp(i8* getelementptr inbounds ([50 x i8]* @buf, i64 0, i64 0), i8* getelementptr inbounds ([4 x i8]* @.str, i64 0, i64 0)) nounwind readonly
  %tobool.i = icmp eq i32 %call.i, 0
  br i1 %tobool.i, label %foo.exit, label %if.then1.i

if.then1.i:                                       ; preds = %entry
  tail call void @abort() noreturn nounwind
  unreachable

foo.exit:                                         ; preds = %entry
  tail call void @llvm.memcpy.p0i8.p0i8.i64(i8* getelementptr inbounds ([50 x i8]* @buf, i64 0, i64 0), i8* getelementptr inbounds ([9 x i8]* @.str1, i64 0, i64 0), i64 9, i32 1, i1 false) nounwind
  ret i32 0
}

declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture, i64, i32, i1) nounwind

declare void @abort() noreturn nounwind

declare i32 @strcmp(i8* nocapture, i8* nocapture) nounwind readonly
