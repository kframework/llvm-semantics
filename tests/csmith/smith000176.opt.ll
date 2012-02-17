; ModuleID = '/home/grosu/celliso2/c-semantics/tests/csmith/smith000176.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@__undefined = common global i64 0, align 8

define i32 @func_1() nounwind uwtable readnone {
entry:
  %l_2 = alloca [7 x [5 x [1 x [1 x i64]]]], align 16
  br label %for.inc28.4

for.end35:                                        ; preds = %for.inc28.4
  %arrayidx39 = getelementptr inbounds [7 x [5 x [1 x [1 x i64]]]]* %l_2, i64 0, i64 5, i64 4, i64 0, i64 0
  %tmp40 = load i64* %arrayidx39, align 8
  %conv = trunc i64 %tmp40 to i32
  ret i32 %conv

for.inc28.4:                                      ; preds = %entry, %for.inc28.4
  %indvar8 = phi i64 [ 0, %entry ], [ %indvar.next9, %for.inc28.4 ]
  %scevgep = getelementptr [7 x [5 x [1 x [1 x i64]]]]* %l_2, i64 0, i64 %indvar8, i64 4, i64 0, i64 0
  %scevgep22 = getelementptr [7 x [5 x [1 x [1 x i64]]]]* %l_2, i64 0, i64 %indvar8, i64 3, i64 0, i64 0
  %scevgep25 = getelementptr [7 x [5 x [1 x [1 x i64]]]]* %l_2, i64 0, i64 %indvar8, i64 2, i64 0, i64 0
  %scevgep28 = getelementptr [7 x [5 x [1 x [1 x i64]]]]* %l_2, i64 0, i64 %indvar8, i64 1, i64 0, i64 0
  %arrayidx22 = getelementptr [7 x [5 x [1 x [1 x i64]]]]* %l_2, i64 0, i64 %indvar8, i64 0, i64 0, i64 0
  store i64 1, i64* %arrayidx22, align 8
  store i64 1, i64* %scevgep28, align 8
  store i64 1, i64* %scevgep25, align 8
  store i64 1, i64* %scevgep22, align 8
  store i64 1, i64* %scevgep, align 8
  %indvar.next9 = add i64 %indvar8, 1
  %exitcond = icmp eq i64 %indvar.next9, 7
  br i1 %exitcond, label %for.end35, label %for.inc28.4
}

define i32 @main(i32 %argc, i8** nocapture %argv) nounwind uwtable readnone {
entry:
  ret i32 0
}
