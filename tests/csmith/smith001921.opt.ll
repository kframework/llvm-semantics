; ModuleID = '/home/grosu/celliso2/c-semantics/tests/csmith/smith001921.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@__undefined = common global i64 0, align 8

define i64 @func_1() nounwind uwtable readnone {
for.inc10.8:
  %l_2 = alloca [9 x [1 x i32]], align 16
  %arrayidx8 = getelementptr [9 x [1 x i32]]* %l_2, i64 0, i64 0, i64 0
  store i32 1250716243, i32* %arrayidx8, align 16
  %arrayidx8.1 = getelementptr [9 x [1 x i32]]* %l_2, i64 0, i64 1, i64 0
  store i32 1250716243, i32* %arrayidx8.1, align 4
  %arrayidx8.2 = getelementptr [9 x [1 x i32]]* %l_2, i64 0, i64 2, i64 0
  store i32 1250716243, i32* %arrayidx8.2, align 8
  %arrayidx8.3 = getelementptr [9 x [1 x i32]]* %l_2, i64 0, i64 3, i64 0
  store i32 1250716243, i32* %arrayidx8.3, align 4
  %arrayidx8.4 = getelementptr [9 x [1 x i32]]* %l_2, i64 0, i64 4, i64 0
  store i32 1250716243, i32* %arrayidx8.4, align 16
  %arrayidx8.5 = getelementptr [9 x [1 x i32]]* %l_2, i64 0, i64 5, i64 0
  store i32 1250716243, i32* %arrayidx8.5, align 4
  %arrayidx8.6 = getelementptr [9 x [1 x i32]]* %l_2, i64 0, i64 6, i64 0
  store i32 1250716243, i32* %arrayidx8.6, align 8
  %arrayidx8.7 = getelementptr [9 x [1 x i32]]* %l_2, i64 0, i64 7, i64 0
  store i32 1250716243, i32* %arrayidx8.7, align 4
  %arrayidx8.8 = getelementptr [9 x [1 x i32]]* %l_2, i64 0, i64 8, i64 0
  store i32 1250716243, i32* %arrayidx8.8, align 16
  %arrayidx15 = getelementptr inbounds [9 x [1 x i32]]* %l_2, i64 0, i64 4, i64 0
  %tmp16 = load i32* %arrayidx15, align 16
  %conv = zext i32 %tmp16 to i64
  ret i64 %conv
}

define i32 @main(i32 %argc, i8** nocapture %argv) nounwind uwtable readnone {
entry:
  ret i32 0
}
