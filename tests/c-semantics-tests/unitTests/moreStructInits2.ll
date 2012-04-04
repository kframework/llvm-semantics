; ModuleID = '/home/david/src/c-semantics/tests/unitTests/moreStructInits2.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.S = type { i32, i32, [6 x i32], %struct.T }
%struct.T = type { i32, [8 x i32] }

@main.s = private unnamed_addr constant %struct.S { i32 6, i32 12, [6 x i32] [i32 1, i32 2, i32 3, i32 4, i32 5, i32 6], %struct.T { i32 7, [8 x i32] [i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15] } }, align 4
@.str = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %s = alloca %struct.S, align 4
  %i = alloca i32, align 4
  %i4 = alloca i32, align 4
  store i32 0, i32* %retval
  %0 = bitcast %struct.S* %s to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %0, i8* bitcast (%struct.S* @main.s to i8*), i64 68, i32 4, i1 false)
  %a = getelementptr inbounds %struct.S* %s, i32 0, i32 0
  %1 = load i32* %a, align 4
  %call = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i32 0, i32 0), i32 %1)
  %b = getelementptr inbounds %struct.S* %s, i32 0, i32 1
  %2 = load i32* %b, align 4
  %call1 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i32 0, i32 0), i32 %2)
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %3 = load i32* %i, align 4
  %cmp = icmp slt i32 %3, 6
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %4 = load i32* %i, align 4
  %idxprom = sext i32 %4 to i64
  %c = getelementptr inbounds %struct.S* %s, i32 0, i32 2
  %arrayidx = getelementptr inbounds [6 x i32]* %c, i32 0, i64 %idxprom
  %5 = load i32* %arrayidx, align 4
  %call2 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i32 0, i32 0), i32 %5)
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %6 = load i32* %i, align 4
  %inc = add nsw i32 %6, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %d = getelementptr inbounds %struct.S* %s, i32 0, i32 3
  %t = getelementptr inbounds %struct.T* %d, i32 0, i32 0
  %7 = load i32* %t, align 4
  %call3 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i32 0, i32 0), i32 %7)
  store i32 0, i32* %i4, align 4
  br label %for.cond5

for.cond5:                                        ; preds = %for.inc12, %for.end
  %8 = load i32* %i4, align 4
  %cmp6 = icmp slt i32 %8, 8
  br i1 %cmp6, label %for.body7, label %for.end14

for.body7:                                        ; preds = %for.cond5
  %9 = load i32* %i4, align 4
  %idxprom8 = sext i32 %9 to i64
  %d9 = getelementptr inbounds %struct.S* %s, i32 0, i32 3
  %r = getelementptr inbounds %struct.T* %d9, i32 0, i32 1
  %arrayidx10 = getelementptr inbounds [8 x i32]* %r, i32 0, i64 %idxprom8
  %10 = load i32* %arrayidx10, align 4
  %call11 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i32 0, i32 0), i32 %10)
  br label %for.inc12

for.inc12:                                        ; preds = %for.body7
  %11 = load i32* %i4, align 4
  %inc13 = add nsw i32 %11, 1
  store i32 %inc13, i32* %i4, align 4
  br label %for.cond5

for.end14:                                        ; preds = %for.cond5
  ret i32 0
}

declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture, i64, i32, i1) nounwind

declare i32 @printf(i8*, ...)
