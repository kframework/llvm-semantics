; ModuleID = '/home/david/src/c-semantics/tests/unitTests/twoDimensionalArray.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
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
  %0 = load i32* %arrayidx13, align 4
  %cmp = icmp ne i32 %0, 5
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  store i32 5, i32* %retval
  br label %return

if.end:                                           ; preds = %entry
  %arrayidx14 = getelementptr inbounds [3 x [2 x i32]]* %a, i32 0, i64 0
  %arrayidx15 = getelementptr inbounds [2 x i32]* %arrayidx14, i32 0, i64 1
  %1 = load i32* %arrayidx15, align 4
  %cmp16 = icmp ne i32 %1, 6
  br i1 %cmp16, label %if.then17, label %if.end18

if.then17:                                        ; preds = %if.end
  store i32 6, i32* %retval
  br label %return

if.end18:                                         ; preds = %if.end
  %arrayidx19 = getelementptr inbounds [3 x [2 x i32]]* %a, i32 0, i64 1
  %arrayidx20 = getelementptr inbounds [2 x i32]* %arrayidx19, i32 0, i64 0
  %2 = load i32* %arrayidx20, align 4
  %cmp21 = icmp ne i32 %2, 7
  br i1 %cmp21, label %if.then22, label %if.end23

if.then22:                                        ; preds = %if.end18
  store i32 7, i32* %retval
  br label %return

if.end23:                                         ; preds = %if.end18
  %arrayidx24 = getelementptr inbounds [3 x [2 x i32]]* %a, i32 0, i64 1
  %arrayidx25 = getelementptr inbounds [2 x i32]* %arrayidx24, i32 0, i64 1
  %3 = load i32* %arrayidx25, align 4
  %cmp26 = icmp ne i32 %3, 8
  br i1 %cmp26, label %if.then27, label %if.end28

if.then27:                                        ; preds = %if.end23
  store i32 8, i32* %retval
  br label %return

if.end28:                                         ; preds = %if.end23
  %arrayidx29 = getelementptr inbounds [3 x [2 x i32]]* %a, i32 0, i64 2
  %arrayidx30 = getelementptr inbounds [2 x i32]* %arrayidx29, i32 0, i64 0
  %4 = load i32* %arrayidx30, align 4
  %cmp31 = icmp ne i32 %4, 9
  br i1 %cmp31, label %if.then32, label %if.end33

if.then32:                                        ; preds = %if.end28
  store i32 9, i32* %retval
  br label %return

if.end33:                                         ; preds = %if.end28
  %arrayidx34 = getelementptr inbounds [3 x [2 x i32]]* %a, i32 0, i64 2
  %arrayidx35 = getelementptr inbounds [2 x i32]* %arrayidx34, i32 0, i64 1
  %5 = load i32* %arrayidx35, align 4
  %cmp36 = icmp ne i32 %5, 10
  br i1 %cmp36, label %if.then37, label %if.end38

if.then37:                                        ; preds = %if.end33
  store i32 10, i32* %retval
  br label %return

if.end38:                                         ; preds = %if.end33
  store i32 0, i32* %retval
  br label %return

return:                                           ; preds = %if.end38, %if.then37, %if.then32, %if.then27, %if.then22, %if.then17, %if.then
  %6 = load i32* %retval
  ret i32 %6
}
