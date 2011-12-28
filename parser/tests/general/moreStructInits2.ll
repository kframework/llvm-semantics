; ModuleID = '/home/grosu/celliso2/c-semantics/tests/unitTests/moreStructInits2.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

%struct.S = type { i32, i32, [6 x i32], %struct.T }
%struct.T = type { i32, [8 x i32] }

@main.s = internal unnamed_addr constant %struct.S { i32 6, i32 12, [6 x i32] [i32 1, i32 2, i32 3, i32 4, i32 5, i32 6], %struct.T { i32 7, [8 x i32] [i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15] } }, align 4
@.str = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %s = alloca %struct.S, align 4
  %i = alloca i32, align 4
  %i13 = alloca i32, align 4
  store i32 0, i32* %retval
  %tmp = bitcast %struct.S* %s to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %tmp, i8* bitcast (%struct.S* @main.s to i8*), i64 68, i32 4, i1 false)
  %a = getelementptr inbounds %struct.S* %s, i32 0, i32 0
  %tmp1 = load i32* %a, align 4
  %call = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i32 0, i32 0), i32 %tmp1)
  %b = getelementptr inbounds %struct.S* %s, i32 0, i32 1
  %tmp2 = load i32* %b, align 4
  %call3 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i32 0, i32 0), i32 %tmp2)
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %tmp5 = load i32* %i, align 4
  %cmp = icmp slt i32 %tmp5, 6
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %tmp6 = load i32* %i, align 4
  %idxprom = sext i32 %tmp6 to i64
  %c = getelementptr inbounds %struct.S* %s, i32 0, i32 2
  %arrayidx = getelementptr inbounds [6 x i32]* %c, i32 0, i64 %idxprom
  %tmp7 = load i32* %arrayidx, align 4
  %call8 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i32 0, i32 0), i32 %tmp7)
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %tmp9 = load i32* %i, align 4
  %inc = add nsw i32 %tmp9, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %d = getelementptr inbounds %struct.S* %s, i32 0, i32 3
  %t = getelementptr inbounds %struct.T* %d, i32 0, i32 0
  %tmp10 = load i32* %t, align 4
  %call11 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i32 0, i32 0), i32 %tmp10)
  store i32 0, i32* %i13, align 4
  br label %for.cond14

for.cond14:                                       ; preds = %for.inc24, %for.end
  %tmp15 = load i32* %i13, align 4
  %cmp16 = icmp slt i32 %tmp15, 8
  br i1 %cmp16, label %for.body17, label %for.end27

for.body17:                                       ; preds = %for.cond14
  %tmp18 = load i32* %i13, align 4
  %idxprom19 = sext i32 %tmp18 to i64
  %d20 = getelementptr inbounds %struct.S* %s, i32 0, i32 3
  %r = getelementptr inbounds %struct.T* %d20, i32 0, i32 1
  %arrayidx21 = getelementptr inbounds [8 x i32]* %r, i32 0, i64 %idxprom19
  %tmp22 = load i32* %arrayidx21, align 4
  %call23 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i32 0, i32 0), i32 %tmp22)
  br label %for.inc24

for.inc24:                                        ; preds = %for.body17
  %tmp25 = load i32* %i13, align 4
  %inc26 = add nsw i32 %tmp25, 1
  store i32 %inc26, i32* %i13, align 4
  br label %for.cond14

for.end27:                                        ; preds = %for.cond14
  ret i32 0
}

declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture, i64, i32, i1) nounwind

declare i32 @printf(i8*, ...)
