; ModuleID = '/home/grosu/celliso2/c-semantics/tests/unitTests/twoDimensionalArray.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %a = alloca [3 x [2 x i32]], align 16
  store i32 0, i32* %retval
  %arrayidx = getelementptr inbounds [3 x [2 x i32]]* %a, i32 0, i64 0
  %arrayidx1 = getelementptr inbounds [2 x i32]* %arrayidx, i32 0, i64 0
  store i32 5, i32* %arrayidx1, align 4
  %arrayidx2 = getelementptr inbounds [3 x [2 x i32]]* %a, i32 0, i64 0
  %arrayidx3 = getelementptr inbounds [2 x i32]* %arrayidx2, i32 0, i64 1
  store i32 6, i32* %arrayidx3, align 4
  %arrayidx4 = getelementptr inbounds [3 x [2 x i32]]* %a, i32 0, i64 1
  %arrayidx5 = getelementptr inbounds [2 x i32]* %arrayidx4, i32 0, i64 0
  store i32 7, i32* %arrayidx5, align 4
  %arrayidx6 = getelementptr inbounds [3 x [2 x i32]]* %a, i32 0, i64 1
  %arrayidx7 = getelementptr inbounds [2 x i32]* %arrayidx6, i32 0, i64 1
  store i32 8, i32* %arrayidx7, align 4
  %arrayidx8 = getelementptr inbounds [3 x [2 x i32]]* %a, i32 0, i64 2
  %arrayidx9 = getelementptr inbounds [2 x i32]* %arrayidx8, i32 0, i64 0
  store i32 9, i32* %arrayidx9, align 4
  %arrayidx10 = getelementptr inbounds [3 x [2 x i32]]* %a, i32 0, i64 2
  %arrayidx11 = getelementptr inbounds [2 x i32]* %arrayidx10, i32 0, i64 1
  store i32 10, i32* %arrayidx11, align 4
  %arrayidx12 = getelementptr inbounds [3 x [2 x i32]]* %a, i32 0, i64 0
  %arrayidx13 = getelementptr inbounds [2 x i32]* %arrayidx12, i32 0, i64 0
  %tmp = load i32* %arrayidx13, align 4
  %cmp = icmp ne i32 %tmp, 5
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  store i32 5, i32* %retval
  br label %return

if.end:                                           ; preds = %entry
  %arrayidx14 = getelementptr inbounds [3 x [2 x i32]]* %a, i32 0, i64 0
  %arrayidx15 = getelementptr inbounds [2 x i32]* %arrayidx14, i32 0, i64 1
  %tmp16 = load i32* %arrayidx15, align 4
  %cmp17 = icmp ne i32 %tmp16, 6
  br i1 %cmp17, label %if.then18, label %if.end19

if.then18:                                        ; preds = %if.end
  store i32 6, i32* %retval
  br label %return

if.end19:                                         ; preds = %if.end
  %arrayidx20 = getelementptr inbounds [3 x [2 x i32]]* %a, i32 0, i64 1
  %arrayidx21 = getelementptr inbounds [2 x i32]* %arrayidx20, i32 0, i64 0
  %tmp22 = load i32* %arrayidx21, align 4
  %cmp23 = icmp ne i32 %tmp22, 7
  br i1 %cmp23, label %if.then24, label %if.end25

if.then24:                                        ; preds = %if.end19
  store i32 7, i32* %retval
  br label %return

if.end25:                                         ; preds = %if.end19
  %arrayidx26 = getelementptr inbounds [3 x [2 x i32]]* %a, i32 0, i64 1
  %arrayidx27 = getelementptr inbounds [2 x i32]* %arrayidx26, i32 0, i64 1
  %tmp28 = load i32* %arrayidx27, align 4
  %cmp29 = icmp ne i32 %tmp28, 8
  br i1 %cmp29, label %if.then30, label %if.end31

if.then30:                                        ; preds = %if.end25
  store i32 8, i32* %retval
  br label %return

if.end31:                                         ; preds = %if.end25
  %arrayidx32 = getelementptr inbounds [3 x [2 x i32]]* %a, i32 0, i64 2
  %arrayidx33 = getelementptr inbounds [2 x i32]* %arrayidx32, i32 0, i64 0
  %tmp34 = load i32* %arrayidx33, align 4
  %cmp35 = icmp ne i32 %tmp34, 9
  br i1 %cmp35, label %if.then36, label %if.end37

if.then36:                                        ; preds = %if.end31
  store i32 9, i32* %retval
  br label %return

if.end37:                                         ; preds = %if.end31
  %arrayidx38 = getelementptr inbounds [3 x [2 x i32]]* %a, i32 0, i64 2
  %arrayidx39 = getelementptr inbounds [2 x i32]* %arrayidx38, i32 0, i64 1
  %tmp40 = load i32* %arrayidx39, align 4
  %cmp41 = icmp ne i32 %tmp40, 10
  br i1 %cmp41, label %if.then42, label %if.end43

if.then42:                                        ; preds = %if.end37
  store i32 10, i32* %retval
  br label %return

if.end43:                                         ; preds = %if.end37
  store i32 0, i32* %retval
  br label %return

return:                                           ; preds = %if.end43, %if.then42, %if.then36, %if.then30, %if.then24, %if.then18, %if.then
  %0 = load i32* %retval
  ret i32 %0
}
