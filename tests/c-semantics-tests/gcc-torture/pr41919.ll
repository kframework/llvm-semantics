; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/pr41919.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.S1 = type { i8 }

@g_23 = global i32 0, align 4
@foo.l_128 = private unnamed_addr constant %struct.S1 { i8 1 }, align 1

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %s = alloca %struct.S1, align 1
  store i32 0, i32* %retval
  %call = call i8 @foo()
  %coerce.dive = getelementptr %struct.S1* %s, i32 0, i32 0
  store i8 %call, i8* %coerce.dive
  %f0 = getelementptr inbounds %struct.S1* %s, i32 0, i32 0
  %0 = load i8* %f0, align 1
  %conv = sext i8 %0 to i32
  %tobool = icmp ne i32 %conv, 0
  br i1 %tobool, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %entry
  br label %land.end

land.end:                                         ; preds = %land.rhs, %entry
  %1 = phi i1 [ false, %entry ], [ true, %land.rhs ]
  %land.ext = zext i1 %1 to i32
  %xor = xor i32 153, %land.ext
  %conv1 = trunc i32 %xor to i8
  %call2 = call signext i8 @bar(i8 signext %conv1, i8 signext 1)
  %conv3 = sext i8 %call2 to i32
  %cmp = icmp ne i32 %conv3, -104
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %land.end
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %land.end
  ret i32 0
}

define internal i8 @foo() nounwind uwtable {
entry:
  %retval = alloca %struct.S1, align 1
  %l_100 = alloca i32*, align 8
  %l_110 = alloca i32**, align 8
  %l_128 = alloca %struct.S1, align 1
  store i32* @g_23, i32** %l_100, align 8
  store i32** %l_100, i32*** %l_110, align 8
  %0 = bitcast %struct.S1* %l_128 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %0, i8* getelementptr inbounds (%struct.S1* @foo.l_128, i32 0, i32 0), i64 1, i32 1, i1 false)
  %1 = load i32** %l_100, align 8
  %cmp = icmp eq i32* %1, @g_23
  br i1 %cmp, label %if.end, label %if.then

if.then:                                          ; preds = %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  %2 = load i32** %l_100, align 8
  %cmp1 = icmp eq i32* %2, @g_23
  br i1 %cmp1, label %if.end3, label %if.then2

if.then2:                                         ; preds = %if.end
  call void @abort() noreturn nounwind
  unreachable

if.end3:                                          ; preds = %if.end
  %3 = load i32** %l_100, align 8
  %cmp4 = icmp eq i32* %3, @g_23
  br i1 %cmp4, label %if.end6, label %if.then5

if.then5:                                         ; preds = %if.end3
  call void @abort() noreturn nounwind
  unreachable

if.end6:                                          ; preds = %if.end3
  %4 = load i32** %l_100, align 8
  %cmp7 = icmp eq i32* %4, @g_23
  br i1 %cmp7, label %if.end9, label %if.then8

if.then8:                                         ; preds = %if.end6
  call void @abort() noreturn nounwind
  unreachable

if.end9:                                          ; preds = %if.end6
  %5 = load i32** %l_100, align 8
  %cmp10 = icmp eq i32* %5, @g_23
  br i1 %cmp10, label %if.end12, label %if.then11

if.then11:                                        ; preds = %if.end9
  call void @abort() noreturn nounwind
  unreachable

if.end12:                                         ; preds = %if.end9
  %6 = load i32** %l_100, align 8
  %cmp13 = icmp eq i32* %6, @g_23
  br i1 %cmp13, label %if.end15, label %if.then14

if.then14:                                        ; preds = %if.end12
  call void @abort() noreturn nounwind
  unreachable

if.end15:                                         ; preds = %if.end12
  %7 = load i32** %l_100, align 8
  %cmp16 = icmp eq i32* %7, @g_23
  br i1 %cmp16, label %if.end18, label %if.then17

if.then17:                                        ; preds = %if.end15
  call void @abort() noreturn nounwind
  unreachable

if.end18:                                         ; preds = %if.end15
  %8 = bitcast %struct.S1* %retval to i8*
  %9 = bitcast %struct.S1* %l_128 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %8, i8* %9, i64 1, i32 1, i1 false)
  %coerce.dive = getelementptr %struct.S1* %retval, i32 0, i32 0
  %10 = load i8* %coerce.dive
  ret i8 %10
}

define internal signext i8 @bar(i8 signext %si1, i8 signext %si2) nounwind uwtable {
entry:
  %si1.addr = alloca i8, align 1
  %si2.addr = alloca i8, align 1
  store i8 %si1, i8* %si1.addr, align 1
  store i8 %si2, i8* %si2.addr, align 1
  %0 = load i8* %si1.addr, align 1
  %conv = sext i8 %0 to i32
  %cmp = icmp sle i32 %conv, 0
  br i1 %cmp, label %cond.true, label %cond.false

cond.true:                                        ; preds = %entry
  %1 = load i8* %si1.addr, align 1
  %conv2 = sext i8 %1 to i32
  br label %cond.end

cond.false:                                       ; preds = %entry
  %2 = load i8* %si2.addr, align 1
  %conv3 = sext i8 %2 to i32
  %mul = mul nsw i32 %conv3, 2
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %conv2, %cond.true ], [ %mul, %cond.false ]
  %conv4 = trunc i32 %cond to i8
  ret i8 %conv4
}

declare void @abort() noreturn nounwind

declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture, i64, i32, i1) nounwind
