; ModuleID = '/home/grosu/celliso2/c-semantics/tests/unitTests/conditionalTests.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

%struct.S = type { i32, i32 }

@main.a = internal unnamed_addr constant %struct.S { i32 1, i32 0 }, align 4
@main.b = internal unnamed_addr constant %struct.S { i32 2, i32 0 }, align 4
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
  %tmp10 = alloca %struct.S, align 4
  %tmp23 = alloca %struct.S, align 4
  store i32 0, i32* %retval
  %tmp = bitcast %struct.S* %a to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %tmp, i8* bitcast (%struct.S* @main.a to i8*), i64 8, i32 4, i1 false)
  %tmp2 = bitcast %struct.S* %b to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %tmp2, i8* bitcast (%struct.S* @main.b to i8*), i64 8, i32 4, i1 false)
  store %struct.S* %a, %struct.S** %p1, align 8
  store %struct.S* %b, %struct.S** %p2, align 8
  %call = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i32 0, i32 0), i32 -2147483648)
  %call5 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i32 0, i32 0), i32 -2147483648)
  %call6 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i32 0, i32 0), i32 250)
  %tmp7 = load %struct.S** %p2, align 8
  %x = getelementptr inbounds %struct.S* %tmp7, i32 0, i32 0
  %tmp8 = load i32* %x, align 4
  %call9 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i32 0, i32 0), i32 %tmp8)
  br i1 true, label %cond.true, label %cond.false

cond.true:                                        ; preds = %entry
  %tmp11 = load %struct.S** %p1, align 8
  %tmp12 = bitcast %struct.S* %tmp10 to i8*
  %tmp13 = bitcast %struct.S* %tmp11 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %tmp12, i8* %tmp13, i64 8, i32 4, i1 false)
  br label %cond.end

cond.false:                                       ; preds = %entry
  %tmp14 = load %struct.S** %p2, align 8
  %tmp15 = bitcast %struct.S* %tmp10 to i8*
  %tmp16 = bitcast %struct.S* %tmp14 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %tmp15, i8* %tmp16, i64 8, i32 4, i1 false)
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %x17 = getelementptr inbounds %struct.S* %tmp10, i32 0, i32 0
  %tmp18 = load i32* %x17, align 4
  %call19 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i32 0, i32 0), i32 %tmp18)
  %x20 = getelementptr inbounds %struct.S* %b, i32 0, i32 0
  %tmp21 = load i32* %x20, align 4
  %call22 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i32 0, i32 0), i32 %tmp21)
  br i1 true, label %cond.true24, label %cond.false27

cond.true24:                                      ; preds = %cond.end
  %tmp25 = bitcast %struct.S* %tmp23 to i8*
  %tmp26 = bitcast %struct.S* %a to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %tmp25, i8* %tmp26, i64 8, i32 4, i1 false)
  br label %cond.end30

cond.false27:                                     ; preds = %cond.end
  %tmp28 = bitcast %struct.S* %tmp23 to i8*
  %tmp29 = bitcast %struct.S* %b to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %tmp28, i8* %tmp29, i64 8, i32 4, i1 false)
  br label %cond.end30

cond.end30:                                       ; preds = %cond.false27, %cond.true24
  %x31 = getelementptr inbounds %struct.S* %tmp23, i32 0, i32 0
  %tmp32 = load i32* %x31, align 4
  %call33 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i32 0, i32 0), i32 %tmp32)
  call void @f()
  %0 = load i32* %retval
  ret i32 %0
}

declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture, i64, i32, i1) nounwind

declare i32 @printf(i8*, ...)
