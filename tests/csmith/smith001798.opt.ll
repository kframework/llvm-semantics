; ModuleID = '/home/grosu/celliso2/c-semantics/tests/csmith/smith001798.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@__undefined = common global i64 0, align 8

define i32 @func_1() nounwind uwtable readnone {
entry:
  %l_2 = alloca [6 x [5 x [3 x [1 x i32]]]], align 16
  br label %for.inc24.2.4

for.end35:                                        ; preds = %for.inc24.2.4
  %arrayidx39 = getelementptr inbounds [6 x [5 x [3 x [1 x i32]]]]* %l_2, i64 0, i64 2, i64 1, i64 2, i64 0
  %tmp40 = load i32* %arrayidx39, align 4
  ret i32 %tmp40

for.inc24.2.4:                                    ; preds = %entry, %for.inc24.2.4
  %indvar8 = phi i64 [ 0, %entry ], [ %indvar.next9, %for.inc24.2.4 ]
  %scevgep32 = getelementptr [6 x [5 x [3 x [1 x i32]]]]* %l_2, i64 0, i64 %indvar8, i64 4, i64 0, i64 0
  %scevgep34 = getelementptr [6 x [5 x [3 x [1 x i32]]]]* %l_2, i64 0, i64 %indvar8, i64 4, i64 1, i64 0
  %scevgep36 = getelementptr [6 x [5 x [3 x [1 x i32]]]]* %l_2, i64 0, i64 %indvar8, i64 4, i64 2, i64 0
  %scevgep38 = getelementptr [6 x [5 x [3 x [1 x i32]]]]* %l_2, i64 0, i64 %indvar8, i64 3, i64 0, i64 0
  %scevgep40 = getelementptr [6 x [5 x [3 x [1 x i32]]]]* %l_2, i64 0, i64 %indvar8, i64 3, i64 1, i64 0
  %scevgep42 = getelementptr [6 x [5 x [3 x [1 x i32]]]]* %l_2, i64 0, i64 %indvar8, i64 3, i64 2, i64 0
  %scevgep44 = getelementptr [6 x [5 x [3 x [1 x i32]]]]* %l_2, i64 0, i64 %indvar8, i64 2, i64 0, i64 0
  %scevgep46 = getelementptr [6 x [5 x [3 x [1 x i32]]]]* %l_2, i64 0, i64 %indvar8, i64 2, i64 1, i64 0
  %scevgep48 = getelementptr [6 x [5 x [3 x [1 x i32]]]]* %l_2, i64 0, i64 %indvar8, i64 2, i64 2, i64 0
  %scevgep50 = getelementptr [6 x [5 x [3 x [1 x i32]]]]* %l_2, i64 0, i64 %indvar8, i64 1, i64 0, i64 0
  %scevgep52 = getelementptr [6 x [5 x [3 x [1 x i32]]]]* %l_2, i64 0, i64 %indvar8, i64 1, i64 1, i64 0
  %scevgep54 = getelementptr [6 x [5 x [3 x [1 x i32]]]]* %l_2, i64 0, i64 %indvar8, i64 1, i64 2, i64 0
  %scevgep57 = getelementptr [6 x [5 x [3 x [1 x i32]]]]* %l_2, i64 0, i64 %indvar8, i64 0, i64 1, i64 0
  %scevgep59 = getelementptr [6 x [5 x [3 x [1 x i32]]]]* %l_2, i64 0, i64 %indvar8, i64 0, i64 2, i64 0
  %arrayidx22 = getelementptr [6 x [5 x [3 x [1 x i32]]]]* %l_2, i64 0, i64 %indvar8, i64 0, i64 0, i64 0
  store i32 -8, i32* %arrayidx22, align 4
  store i32 -8, i32* %scevgep57, align 4
  store i32 -8, i32* %scevgep59, align 4
  store i32 -8, i32* %scevgep50, align 4
  store i32 -8, i32* %scevgep52, align 4
  store i32 -8, i32* %scevgep54, align 4
  store i32 -8, i32* %scevgep44, align 4
  store i32 -8, i32* %scevgep46, align 4
  store i32 -8, i32* %scevgep48, align 4
  store i32 -8, i32* %scevgep38, align 4
  store i32 -8, i32* %scevgep40, align 4
  store i32 -8, i32* %scevgep42, align 4
  store i32 -8, i32* %scevgep32, align 4
  store i32 -8, i32* %scevgep34, align 4
  store i32 -8, i32* %scevgep36, align 4
  %indvar.next9 = add i64 %indvar8, 1
  %exitcond = icmp eq i64 %indvar.next9, 6
  br i1 %exitcond, label %for.end35, label %for.inc24.2.4
}

define i32 @main(i32 %argc, i8** nocapture %argv) nounwind uwtable readnone {
entry:
  ret i32 0
}
