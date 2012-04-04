; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/20010925-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@dst = common global [10 x i32] zeroinitializer, align 16
@src = common global [10 x i32] zeroinitializer, align 16

define i32 @main() noreturn nounwind uwtable {
if.end:
  tail call void @llvm.memcpy.p0i8.p0i8.i64(i8* bitcast ([10 x i32]* @dst to i8*), i8* bitcast ([10 x i32]* @src to i8*), i64 10, i32 16, i1 false) nounwind
  tail call void @exit(i32 0) noreturn nounwind
  unreachable
}

define i32 @foo(i8* nocapture %a, i8* nocapture %b, i32 %c) nounwind uwtable {
entry:
  %cmp = icmp eq i32 %c, 0
  br i1 %cmp, label %return, label %if.end

if.end:                                           ; preds = %entry
  %conv = zext i32 %c to i64
  tail call void @llvm.memcpy.p0i8.p0i8.i64(i8* %a, i8* %b, i64 %conv, i32 1, i1 false)
  br label %return

return:                                           ; preds = %entry, %if.end
  %retval.0 = phi i32 [ 0, %if.end ], [ 1, %entry ]
  ret i32 %retval.0
}

declare void @exit(i32) noreturn

declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture, i64, i32, i1) nounwind
