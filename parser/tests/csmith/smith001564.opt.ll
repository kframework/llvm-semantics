; ModuleID = '/home/grosu/celliso2/c-semantics/tests/csmith/smith001564.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@__undefined = common global i64 0, align 8

define i32 @func_1() nounwind uwtable readnone {
entry:
  %l_2 = alloca [8 x [10 x [1 x i32]]], align 16
  br label %for.inc17.9

for.end24:                                        ; preds = %for.inc17.9
  %arrayidx27 = getelementptr inbounds [8 x [10 x [1 x i32]]]* %l_2, i64 0, i64 0, i64 7, i64 0
  %tmp28 = load i32* %arrayidx27, align 4
  ret i32 %tmp28

for.inc17.9:                                      ; preds = %for.inc17.9, %entry
  %indvar6 = phi i64 [ 0, %entry ], [ %indvar.next7, %for.inc17.9 ]
  %scevgep = getelementptr [8 x [10 x [1 x i32]]]* %l_2, i64 0, i64 %indvar6, i64 9, i64 0
  %scevgep14 = getelementptr [8 x [10 x [1 x i32]]]* %l_2, i64 0, i64 %indvar6, i64 8, i64 0
  %scevgep16 = getelementptr [8 x [10 x [1 x i32]]]* %l_2, i64 0, i64 %indvar6, i64 7, i64 0
  %scevgep18 = getelementptr [8 x [10 x [1 x i32]]]* %l_2, i64 0, i64 %indvar6, i64 6, i64 0
  %scevgep20 = getelementptr [8 x [10 x [1 x i32]]]* %l_2, i64 0, i64 %indvar6, i64 5, i64 0
  %scevgep22 = getelementptr [8 x [10 x [1 x i32]]]* %l_2, i64 0, i64 %indvar6, i64 4, i64 0
  %scevgep24 = getelementptr [8 x [10 x [1 x i32]]]* %l_2, i64 0, i64 %indvar6, i64 3, i64 0
  %scevgep26 = getelementptr [8 x [10 x [1 x i32]]]* %l_2, i64 0, i64 %indvar6, i64 2, i64 0
  %scevgep28 = getelementptr [8 x [10 x [1 x i32]]]* %l_2, i64 0, i64 %indvar6, i64 1, i64 0
  %arrayidx15 = getelementptr [8 x [10 x [1 x i32]]]* %l_2, i64 0, i64 %indvar6, i64 0, i64 0
  store i32 -1851766274, i32* %arrayidx15, align 8
  store i32 -1851766274, i32* %scevgep28, align 4
  store i32 -1851766274, i32* %scevgep26, align 8
  store i32 -1851766274, i32* %scevgep24, align 4
  store i32 -1851766274, i32* %scevgep22, align 8
  store i32 -1851766274, i32* %scevgep20, align 4
  store i32 -1851766274, i32* %scevgep18, align 8
  store i32 -1851766274, i32* %scevgep16, align 4
  store i32 -1851766274, i32* %scevgep14, align 8
  store i32 -1851766274, i32* %scevgep, align 4
  %indvar.next7 = add i64 %indvar6, 1
  %exitcond = icmp eq i64 %indvar.next7, 8
  br i1 %exitcond, label %for.end24, label %for.inc17.9
}

define i32 @main(i32 %argc, i8** nocapture %argv) nounwind uwtable readnone {
entry:
  ret i32 0
}
