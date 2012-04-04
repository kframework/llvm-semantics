; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/20040411-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

define i32 @sub1(i32 %i, i32 %j) nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %i.addr = alloca i32, align 4
  %j.addr = alloca i32, align 4
  %x = alloca [10 x i32], align 16
  %y = alloca [10 x i32], align 16
  store i32 %i, i32* %i.addr, align 4
  store i32 %j, i32* %j.addr, align 4
  %0 = load i32* %i.addr, align 4
  %add = add nsw i32 %0, 2
  %1 = zext i32 %add to i64
  %2 = load i32* %j.addr, align 4
  %cmp = icmp eq i32 %2, 2
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  %arraydecay = getelementptr inbounds [10 x i32]* %x, i32 0, i32 0
  %3 = bitcast i32* %arraydecay to i8*
  %arraydecay1 = getelementptr inbounds [10 x i32]* %y, i32 0, i32 0
  %4 = bitcast i32* %arraydecay1 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %3, i8* %4, i64 40, i32 4, i1 false)
  %5 = mul nuw i64 4, %1
  %conv = trunc i64 %5 to i32
  store i32 %conv, i32* %retval
  br label %return

if.else:                                          ; preds = %entry
  %6 = mul nuw i64 4, %1
  %mul = mul i64 %6, 3
  %conv2 = trunc i64 %mul to i32
  store i32 %conv2, i32* %retval
  br label %return

return:                                           ; preds = %if.else, %if.then
  %7 = load i32* %retval
  ret i32 %7
}

declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture, i64, i32, i1) nounwind

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval
  %call = call i32 @sub1(i32 20, i32 3)
  %conv = sext i32 %call to i64
  %cmp = icmp ne i64 %conv, 264
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  ret i32 0
}

declare void @abort() noreturn nounwind
