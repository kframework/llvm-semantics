; ModuleID = '/home/grosu/celliso2/c-semantics/tests/unitTests/inits.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@main.y0 = internal unnamed_addr constant [12 x i32] [i32 1, i32 3, i32 5, i32 2, i32 4, i32 6, i32 3, i32 5, i32 7, i32 0, i32 0, i32 0], align 16
@main.y2 = internal unnamed_addr constant [4 x [3 x i32]] [[3 x i32] [i32 1, i32 3, i32 5], [3 x i32] [i32 2, i32 4, i32 6], [3 x i32] [i32 3, i32 5, i32 7], [3 x i32] zeroinitializer], align 16
@.str = private unnamed_addr constant [54 x i8] c"i=%d, j=%d, k=%d; y0[k]=%d, y1[i][j]=%d, y2[i][j]=%d\0A\00", align 1

define i32 @main() nounwind uwtable {
entry:
  br label %for.cond12.preheader

for.cond12.preheader:                             ; preds = %for.inc.2, %entry
  %indvar8 = phi i64 [ 0, %entry ], [ %indvar.next9, %for.inc.2 ]
  %arrayidx22.2 = getelementptr [4 x [3 x i32]]* @main.y2, i64 0, i64 %indvar8, i64 2
  %arrayidx29.2 = getelementptr [4 x [3 x i32]]* @main.y2, i64 0, i64 %indvar8, i64 2
  %arrayidx22.1 = getelementptr [4 x [3 x i32]]* @main.y2, i64 0, i64 %indvar8, i64 1
  %arrayidx29.1 = getelementptr [4 x [3 x i32]]* @main.y2, i64 0, i64 %indvar8, i64 1
  %tmp14 = mul i64 %indvar8, 3
  %arrayidx49 = getelementptr [12 x i32]* @main.y0, i64 0, i64 %tmp14
  %tmp16 = add i64 %tmp14, 2
  %add.2 = trunc i64 %tmp16 to i32
  %arrayidx49.2 = getelementptr [12 x i32]* @main.y0, i64 0, i64 %tmp16
  %tmp18 = add i64 %tmp14, 1
  %add.1 = trunc i64 %tmp18 to i32
  %arrayidx49.1 = getelementptr [12 x i32]* @main.y0, i64 0, i64 %tmp18
  %arrayidx22 = getelementptr [4 x [3 x i32]]* @main.y2, i64 0, i64 %indvar8, i64 0
  %arrayidx29 = getelementptr [4 x [3 x i32]]* @main.y2, i64 0, i64 %indvar8, i64 0
  %storemerge7 = trunc i64 %indvar8 to i32
  %tmp23 = load i32* %arrayidx22, align 4
  %tmp30 = load i32* %arrayidx29, align 4
  %cmp31 = icmp eq i32 %tmp23, %tmp30
  %tmp42 = load i32* %arrayidx49, align 4
  %cmp43 = icmp eq i32 %tmp23, %tmp42
  %or.cond = and i1 %cmp31, %cmp43
  br i1 %or.cond, label %for.inc, label %if.then

if.then:                                          ; preds = %for.cond12.preheader
  %add = trunc i64 %tmp14 to i32
  %call = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([54 x i8]* @.str, i64 0, i64 0), i32 %storemerge7, i32 0, i32 %add, i32 %tmp42, i32 %tmp23, i32 %tmp30) nounwind
  br label %for.inc

for.inc:                                          ; preds = %for.cond12.preheader, %if.then
  %tmp23.1 = load i32* %arrayidx22.1, align 4
  %tmp30.1 = load i32* %arrayidx29.1, align 4
  %cmp31.1 = icmp eq i32 %tmp23.1, %tmp30.1
  %tmp42.1 = load i32* %arrayidx49.1, align 4
  %cmp43.1 = icmp eq i32 %tmp23.1, %tmp42.1
  %or.cond26 = and i1 %cmp31.1, %cmp43.1
  br i1 %or.cond26, label %for.inc.1, label %if.then.1

for.end69:                                        ; preds = %for.inc.2
  ret i32 0

for.inc.1:                                        ; preds = %for.inc, %if.then.1
  %tmp23.2 = load i32* %arrayidx22.2, align 4
  %tmp30.2 = load i32* %arrayidx29.2, align 4
  %cmp31.2 = icmp eq i32 %tmp23.2, %tmp30.2
  %tmp42.2 = load i32* %arrayidx49.2, align 4
  %cmp43.2 = icmp eq i32 %tmp23.2, %tmp42.2
  %or.cond27 = and i1 %cmp31.2, %cmp43.2
  br i1 %or.cond27, label %for.inc.2, label %if.then.2

if.then.1:                                        ; preds = %for.inc
  %call.1 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([54 x i8]* @.str, i64 0, i64 0), i32 %storemerge7, i32 1, i32 %add.1, i32 %tmp42.1, i32 %tmp23.1, i32 %tmp30.1) nounwind
  br label %for.inc.1

for.inc.2:                                        ; preds = %for.inc.1, %if.then.2
  %indvar.next9 = add i64 %indvar8, 1
  %exitcond = icmp eq i64 %indvar.next9, 4
  br i1 %exitcond, label %for.end69, label %for.cond12.preheader

if.then.2:                                        ; preds = %for.inc.1
  %call.2 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([54 x i8]* @.str, i64 0, i64 0), i32 %storemerge7, i32 2, i32 %add.2, i32 %tmp42.2, i32 %tmp23.2, i32 %tmp30.2) nounwind
  br label %for.inc.2
}

declare i32 @printf(i8* nocapture, ...) nounwind
