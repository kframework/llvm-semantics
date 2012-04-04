; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/20000801-4.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@main.s = private unnamed_addr constant [2 x i8] c"x\00", align 1
@t = common global i8* null, align 8

define i32 @foo() nounwind uwtable {
entry:
  %s = alloca [2 x i8], align 1
  %0 = bitcast [2 x i8]* %s to i8*
  call void @llvm.memset.p0i8.i64(i8* %0, i8 0, i64 2, i32 1, i1 false)
  %arrayidx = getelementptr inbounds [2 x i8]* %s, i32 0, i64 1
  %1 = load i8* %arrayidx, align 1
  %conv = sext i8 %1 to i32
  %cmp = icmp eq i32 0, %conv
  %conv1 = zext i1 %cmp to i32
  ret i32 %conv1
}

declare void @llvm.memset.p0i8.i64(i8* nocapture, i8, i64, i32, i1) nounwind

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %s = alloca [2 x i8], align 1
  store i32 0, i32* %retval
  %0 = bitcast [2 x i8]* %s to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %0, i8* getelementptr inbounds ([2 x i8]* @main.s, i32 0, i32 0), i64 2, i32 1, i1 false)
  %arraydecay = getelementptr inbounds [2 x i8]* %s, i32 0, i32 0
  store i8* %arraydecay, i8** @t, align 8
  %call = call i32 @foo()
  %tobool = icmp ne i32 %call, 0
  br i1 %tobool, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  call void @exit(i32 0) noreturn nounwind
  unreachable

if.else:                                          ; preds = %entry
  call void @abort() noreturn nounwind
  unreachable

return:                                           ; No predecessors!
  %1 = load i32* %retval
  ret i32 %1
}

declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture, i64, i32, i1) nounwind

declare void @exit(i32) noreturn nounwind

declare void @abort() noreturn nounwind
