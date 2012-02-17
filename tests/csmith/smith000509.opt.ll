; ModuleID = '/home/grosu/celliso2/c-semantics/tests/csmith/smith000509.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@__undefined = common global i64 0, align 8

define i32 @func_1() nounwind uwtable readnone {
for.inc17.2.4:
  %l_2 = alloca [5 x [3 x [1 x i64]]], align 16
  %scevgep = getelementptr [5 x [3 x [1 x i64]]]* %l_2, i64 0, i64 0, i64 2, i64 0
  %scevgep14 = getelementptr [5 x [3 x [1 x i64]]]* %l_2, i64 0, i64 0, i64 1, i64 0
  %arrayidx15 = getelementptr [5 x [3 x [1 x i64]]]* %l_2, i64 0, i64 0, i64 0, i64 0
  store i64 0, i64* %arrayidx15, align 16
  store i64 0, i64* %scevgep14, align 8
  store i64 0, i64* %scevgep, align 16
  %scevgep.1 = getelementptr [5 x [3 x [1 x i64]]]* %l_2, i64 0, i64 1, i64 2, i64 0
  %scevgep14.1 = getelementptr [5 x [3 x [1 x i64]]]* %l_2, i64 0, i64 1, i64 1, i64 0
  %arrayidx15.120 = getelementptr [5 x [3 x [1 x i64]]]* %l_2, i64 0, i64 1, i64 0, i64 0
  store i64 0, i64* %arrayidx15.120, align 8
  store i64 0, i64* %scevgep14.1, align 8
  store i64 0, i64* %scevgep.1, align 8
  %scevgep.2 = getelementptr [5 x [3 x [1 x i64]]]* %l_2, i64 0, i64 2, i64 2, i64 0
  %scevgep14.2 = getelementptr [5 x [3 x [1 x i64]]]* %l_2, i64 0, i64 2, i64 1, i64 0
  %arrayidx15.225 = getelementptr [5 x [3 x [1 x i64]]]* %l_2, i64 0, i64 2, i64 0, i64 0
  store i64 0, i64* %arrayidx15.225, align 16
  store i64 0, i64* %scevgep14.2, align 8
  store i64 0, i64* %scevgep.2, align 16
  %scevgep.3 = getelementptr [5 x [3 x [1 x i64]]]* %l_2, i64 0, i64 3, i64 2, i64 0
  %scevgep14.3 = getelementptr [5 x [3 x [1 x i64]]]* %l_2, i64 0, i64 3, i64 1, i64 0
  %arrayidx15.3 = getelementptr [5 x [3 x [1 x i64]]]* %l_2, i64 0, i64 3, i64 0, i64 0
  store i64 0, i64* %arrayidx15.3, align 8
  store i64 0, i64* %scevgep14.3, align 8
  store i64 0, i64* %scevgep.3, align 8
  %scevgep.4 = getelementptr [5 x [3 x [1 x i64]]]* %l_2, i64 0, i64 4, i64 2, i64 0
  %scevgep14.4 = getelementptr [5 x [3 x [1 x i64]]]* %l_2, i64 0, i64 4, i64 1, i64 0
  %arrayidx15.4 = getelementptr [5 x [3 x [1 x i64]]]* %l_2, i64 0, i64 4, i64 0, i64 0
  store i64 0, i64* %arrayidx15.4, align 16
  store i64 0, i64* %scevgep14.4, align 8
  store i64 0, i64* %scevgep.4, align 16
  %tmp28 = load i64* %scevgep.3, align 8
  %conv = trunc i64 %tmp28 to i32
  ret i32 %conv
}

define i32 @main(i32 %argc, i8** nocapture %argv) nounwind uwtable readnone {
entry:
  ret i32 0
}
