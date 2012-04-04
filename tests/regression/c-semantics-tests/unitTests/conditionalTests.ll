; ModuleID = '/home/david/src/c-semantics/tests/unitTests/conditionalTests.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.S = type { i32, i32 }

@main.a = private unnamed_addr constant %struct.S { i32 1, i32 0 }, align 4
@main.b = private unnamed_addr constant %struct.S { i32 2, i32 0 }, align 4
@.str = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1

define void @f() nounwind uwtable {
entry:
  ret void
}

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %a = alloca %struct.S, align 4
  %b = alloca %struct.S, align 4
  %p1 = alloca %struct.S*, align 8
  %p2 = alloca %struct.S*, align 8
  %tmp = alloca %struct.S, align 4
  %tmp8 = alloca %struct.S, align 4
  store i32 0, i32* %retval
  %0 = bitcast %struct.S* %a to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %0, i8* bitcast (%struct.S* @main.a to i8*), i64 8, i32 4, i1 false)
  %1 = bitcast %struct.S* %b to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %1, i8* bitcast (%struct.S* @main.b to i8*), i64 8, i32 4, i1 false)
  store %struct.S* %a, %struct.S** %p1, align 8
  store %struct.S* %b, %struct.S** %p2, align 8
  %call = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i32 0, i32 0), i32 -2147483648)
  %call1 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i32 0, i32 0), i32 -2147483648)
  %call2 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i32 0, i32 0), i32 250)
  %2 = load %struct.S** %p2, align 8
  %x = getelementptr inbounds %struct.S* %2, i32 0, i32 0
  %3 = load i32* %x, align 4
  %call3 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i32 0, i32 0), i32 %3)
  br i1 true, label %cond.true, label %cond.false

cond.true:                                        ; preds = %entry
  %4 = load %struct.S** %p1, align 8
  %5 = bitcast %struct.S* %tmp to i8*
  %6 = bitcast %struct.S* %4 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %5, i8* %6, i64 8, i32 4, i1 false)
  br label %cond.end

cond.false:                                       ; preds = %entry
  %7 = load %struct.S** %p2, align 8
  %8 = bitcast %struct.S* %tmp to i8*
  %9 = bitcast %struct.S* %7 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %8, i8* %9, i64 8, i32 4, i1 false)
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %x4 = getelementptr inbounds %struct.S* %tmp, i32 0, i32 0
  %10 = load i32* %x4, align 4
  %call5 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i32 0, i32 0), i32 %10)
  %x6 = getelementptr inbounds %struct.S* %b, i32 0, i32 0
  %11 = load i32* %x6, align 4
  %call7 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i32 0, i32 0), i32 %11)
  br i1 true, label %cond.true9, label %cond.false10

cond.true9:                                       ; preds = %cond.end
  %12 = bitcast %struct.S* %tmp8 to i8*
  %13 = bitcast %struct.S* %a to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %12, i8* %13, i64 8, i32 4, i1 false)
  br label %cond.end11

cond.false10:                                     ; preds = %cond.end
  %14 = bitcast %struct.S* %tmp8 to i8*
  %15 = bitcast %struct.S* %b to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %14, i8* %15, i64 8, i32 4, i1 false)
  br label %cond.end11

cond.end11:                                       ; preds = %cond.false10, %cond.true9
  %x12 = getelementptr inbounds %struct.S* %tmp8, i32 0, i32 0
  %16 = load i32* %x12, align 4
  %call13 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i32 0, i32 0), i32 %16)
  call void @f()
  %17 = load i32* %retval
  ret i32 %17
}

declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture, i64, i32, i1) nounwind

declare i32 @printf(i8*, ...)
