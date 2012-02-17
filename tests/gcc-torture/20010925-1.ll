; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/20010925-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@dst = common global [10 x i32] zeroinitializer, align 16
@src = common global [10 x i32] zeroinitializer, align 16

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval
  %call = call i32 @foo(i8* bitcast ([10 x i32]* @dst to i8*), i8* bitcast ([10 x i32]* @src to i8*), i32 10)
  %cmp = icmp ne i32 %call, 0
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @abort() noreturn
  unreachable

if.end:                                           ; preds = %entry
  call void @exit(i32 0) noreturn
  unreachable

return:                                           ; No predecessors!
  %0 = load i32* %retval
  ret i32 %0
}

define i32 @foo(i8* %a, i8* %b, i32 %c) nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %a.addr = alloca i8*, align 8
  %b.addr = alloca i8*, align 8
  %c.addr = alloca i32, align 4
  store i8* %a, i8** %a.addr, align 8
  store i8* %b, i8** %b.addr, align 8
  store i32 %c, i32* %c.addr, align 4
  %tmp = load i32* %c.addr, align 4
  %cmp = icmp eq i32 %tmp, 0
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  store i32 1, i32* %retval
  br label %return

if.end:                                           ; preds = %entry
  %tmp1 = load i8** %a.addr, align 8
  %tmp2 = load i8** %b.addr, align 8
  %tmp3 = load i32* %c.addr, align 4
  %conv = zext i32 %tmp3 to i64
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %tmp1, i8* %tmp2, i64 %conv, i32 1, i1 false)
  store i32 0, i32* %retval
  br label %return

return:                                           ; preds = %if.end, %if.then
  %0 = load i32* %retval
  ret i32 %0
}

declare void @abort() noreturn

declare void @exit(i32) noreturn

declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture, i64, i32, i1) nounwind
