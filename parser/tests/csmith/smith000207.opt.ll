; ModuleID = '/home/grosu/celliso2/c-semantics/tests/csmith/smith000207.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@g_4 = global i32 -1, align 4
@g_6 = global i32 -103315879, align 4
@g_5 = constant i32* @g_6, align 8
@.str = private unnamed_addr constant [19 x i8] c"checksum g_4 = %d\0A\00", align 1
@.str1 = private unnamed_addr constant [19 x i8] c"checksum g_6 = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define i32 @func_1() nounwind uwtable {
entry:
  %l_7 = alloca [2 x [6 x [3 x [2 x [1 x i16]]]]], align 16
  br label %for.inc31.1.2

for.inc31.1.2:                                    ; preds = %for.inc31.1.2, %entry
  %indvar12 = phi i64 [ 0, %entry ], [ %indvar.next13, %for.inc31.1.2 ]
  %scevgep = getelementptr [2 x [6 x [3 x [2 x [1 x i16]]]]]* %l_7, i64 0, i64 0, i64 %indvar12, i64 0, i64 1, i64 0
  %scevgep44 = getelementptr [2 x [6 x [3 x [2 x [1 x i16]]]]]* %l_7, i64 0, i64 0, i64 %indvar12, i64 1, i64 1, i64 0
  %scevgep46 = getelementptr [2 x [6 x [3 x [2 x [1 x i16]]]]]* %l_7, i64 0, i64 0, i64 %indvar12, i64 1, i64 0, i64 0
  %scevgep48 = getelementptr [2 x [6 x [3 x [2 x [1 x i16]]]]]* %l_7, i64 0, i64 0, i64 %indvar12, i64 2, i64 1, i64 0
  %scevgep50 = getelementptr [2 x [6 x [3 x [2 x [1 x i16]]]]]* %l_7, i64 0, i64 0, i64 %indvar12, i64 2, i64 0, i64 0
  %arrayidx29 = getelementptr [2 x [6 x [3 x [2 x [1 x i16]]]]]* %l_7, i64 0, i64 0, i64 %indvar12, i64 0, i64 0, i64 0
  store i16 -9, i16* %arrayidx29, align 4
  store i16 -9, i16* %scevgep, align 2
  store i16 -9, i16* %scevgep46, align 4
  store i16 -9, i16* %scevgep44, align 2
  store i16 -9, i16* %scevgep50, align 4
  store i16 -9, i16* %scevgep48, align 2
  %indvar.next13 = add i64 %indvar12, 1
  %exitcond = icmp eq i64 %indvar.next13, 6
  br i1 %exitcond, label %for.inc31.1.2.1, label %for.inc31.1.2

for.inc43.1:                                      ; preds = %for.inc31.1.2.1
  %tmp47 = load i32* @g_4, align 4
  %and = and i32 %tmp47, 204
  %tmp50 = volatile load i32** @g_5, align 8
  store i32 %and, i32* %tmp50, align 4
  %arrayidx55 = getelementptr inbounds [2 x [6 x [3 x [2 x [1 x i16]]]]]* %l_7, i64 0, i64 0, i64 1, i64 2, i64 1, i64 0
  %tmp56 = load i16* %arrayidx55, align 2
  %conv57 = zext i16 %tmp56 to i32
  ret i32 %conv57

for.inc31.1.2.1:                                  ; preds = %for.inc31.1.2.1, %for.inc31.1.2
  %indvar12.1 = phi i64 [ %indvar.next13.1, %for.inc31.1.2.1 ], [ 0, %for.inc31.1.2 ]
  %scevgep.1 = getelementptr [2 x [6 x [3 x [2 x [1 x i16]]]]]* %l_7, i64 0, i64 1, i64 %indvar12.1, i64 0, i64 1, i64 0
  %scevgep44.1 = getelementptr [2 x [6 x [3 x [2 x [1 x i16]]]]]* %l_7, i64 0, i64 1, i64 %indvar12.1, i64 1, i64 1, i64 0
  %scevgep46.1 = getelementptr [2 x [6 x [3 x [2 x [1 x i16]]]]]* %l_7, i64 0, i64 1, i64 %indvar12.1, i64 1, i64 0, i64 0
  %scevgep48.1 = getelementptr [2 x [6 x [3 x [2 x [1 x i16]]]]]* %l_7, i64 0, i64 1, i64 %indvar12.1, i64 2, i64 1, i64 0
  %scevgep50.1 = getelementptr [2 x [6 x [3 x [2 x [1 x i16]]]]]* %l_7, i64 0, i64 1, i64 %indvar12.1, i64 2, i64 0, i64 0
  %arrayidx29.155 = getelementptr [2 x [6 x [3 x [2 x [1 x i16]]]]]* %l_7, i64 0, i64 1, i64 %indvar12.1, i64 0, i64 0, i64 0
  store i16 -9, i16* %arrayidx29.155, align 4
  store i16 -9, i16* %scevgep.1, align 2
  store i16 -9, i16* %scevgep46.1, align 4
  store i16 -9, i16* %scevgep44.1, align 2
  store i16 -9, i16* %scevgep50.1, align 4
  store i16 -9, i16* %scevgep48.1, align 2
  %indvar.next13.1 = add i64 %indvar12.1, 1
  %exitcond.1 = icmp eq i64 %indvar.next13.1, 6
  br i1 %exitcond.1, label %for.inc43.1, label %for.inc31.1.2.1
}

define i32 @main(i32 %argc, i8** nocapture %argv) nounwind uwtable {
entry:
  %l_7.i = alloca [2 x [6 x [3 x [2 x [1 x i16]]]]], align 16
  %0 = bitcast [2 x [6 x [3 x [2 x [1 x i16]]]]]* %l_7.i to i8*
  call void @llvm.lifetime.start(i64 -1, i8* %0)
  %arrayidx29.i = getelementptr [2 x [6 x [3 x [2 x [1 x i16]]]]]* %l_7.i, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0
  %scevgep50.i = getelementptr [2 x [6 x [3 x [2 x [1 x i16]]]]]* %l_7.i, i64 0, i64 0, i64 0, i64 2, i64 0, i64 0
  %scevgep48.i = getelementptr [2 x [6 x [3 x [2 x [1 x i16]]]]]* %l_7.i, i64 0, i64 0, i64 0, i64 2, i64 1, i64 0
  %scevgep46.i = getelementptr [2 x [6 x [3 x [2 x [1 x i16]]]]]* %l_7.i, i64 0, i64 0, i64 0, i64 1, i64 0, i64 0
  %scevgep44.i = getelementptr [2 x [6 x [3 x [2 x [1 x i16]]]]]* %l_7.i, i64 0, i64 0, i64 0, i64 1, i64 1, i64 0
  %scevgep.i = getelementptr [2 x [6 x [3 x [2 x [1 x i16]]]]]* %l_7.i, i64 0, i64 0, i64 0, i64 0, i64 1, i64 0
  store i16 -9, i16* %arrayidx29.i, align 16
  store i16 -9, i16* %scevgep.i, align 2
  store i16 -9, i16* %scevgep46.i, align 4
  store i16 -9, i16* %scevgep44.i, align 2
  store i16 -9, i16* %scevgep50.i, align 8
  store i16 -9, i16* %scevgep48.i, align 2
  %arrayidx29.i.1 = getelementptr [2 x [6 x [3 x [2 x [1 x i16]]]]]* %l_7.i, i64 0, i64 0, i64 1, i64 0, i64 0, i64 0
  %scevgep50.i.1 = getelementptr [2 x [6 x [3 x [2 x [1 x i16]]]]]* %l_7.i, i64 0, i64 0, i64 1, i64 2, i64 0, i64 0
  %scevgep48.i.1 = getelementptr [2 x [6 x [3 x [2 x [1 x i16]]]]]* %l_7.i, i64 0, i64 0, i64 1, i64 2, i64 1, i64 0
  %scevgep46.i.1 = getelementptr [2 x [6 x [3 x [2 x [1 x i16]]]]]* %l_7.i, i64 0, i64 0, i64 1, i64 1, i64 0, i64 0
  %scevgep44.i.1 = getelementptr [2 x [6 x [3 x [2 x [1 x i16]]]]]* %l_7.i, i64 0, i64 0, i64 1, i64 1, i64 1, i64 0
  %scevgep.i.1 = getelementptr [2 x [6 x [3 x [2 x [1 x i16]]]]]* %l_7.i, i64 0, i64 0, i64 1, i64 0, i64 1, i64 0
  store i16 -9, i16* %arrayidx29.i.1, align 4
  store i16 -9, i16* %scevgep.i.1, align 2
  store i16 -9, i16* %scevgep46.i.1, align 4
  store i16 -9, i16* %scevgep44.i.1, align 2
  store i16 -9, i16* %scevgep50.i.1, align 4
  store i16 -9, i16* %scevgep48.i.1, align 2
  %arrayidx29.i.2 = getelementptr [2 x [6 x [3 x [2 x [1 x i16]]]]]* %l_7.i, i64 0, i64 0, i64 2, i64 0, i64 0, i64 0
  %scevgep50.i.2 = getelementptr [2 x [6 x [3 x [2 x [1 x i16]]]]]* %l_7.i, i64 0, i64 0, i64 2, i64 2, i64 0, i64 0
  %scevgep48.i.2 = getelementptr [2 x [6 x [3 x [2 x [1 x i16]]]]]* %l_7.i, i64 0, i64 0, i64 2, i64 2, i64 1, i64 0
  %scevgep46.i.2 = getelementptr [2 x [6 x [3 x [2 x [1 x i16]]]]]* %l_7.i, i64 0, i64 0, i64 2, i64 1, i64 0, i64 0
  %scevgep44.i.2 = getelementptr [2 x [6 x [3 x [2 x [1 x i16]]]]]* %l_7.i, i64 0, i64 0, i64 2, i64 1, i64 1, i64 0
  %scevgep.i.2 = getelementptr [2 x [6 x [3 x [2 x [1 x i16]]]]]* %l_7.i, i64 0, i64 0, i64 2, i64 0, i64 1, i64 0
  store i16 -9, i16* %arrayidx29.i.2, align 8
  store i16 -9, i16* %scevgep.i.2, align 2
  store i16 -9, i16* %scevgep46.i.2, align 4
  store i16 -9, i16* %scevgep44.i.2, align 2
  store i16 -9, i16* %scevgep50.i.2, align 8
  store i16 -9, i16* %scevgep48.i.2, align 2
  %arrayidx29.i.3 = getelementptr [2 x [6 x [3 x [2 x [1 x i16]]]]]* %l_7.i, i64 0, i64 0, i64 3, i64 0, i64 0, i64 0
  %scevgep50.i.3 = getelementptr [2 x [6 x [3 x [2 x [1 x i16]]]]]* %l_7.i, i64 0, i64 0, i64 3, i64 2, i64 0, i64 0
  %scevgep48.i.3 = getelementptr [2 x [6 x [3 x [2 x [1 x i16]]]]]* %l_7.i, i64 0, i64 0, i64 3, i64 2, i64 1, i64 0
  %scevgep46.i.3 = getelementptr [2 x [6 x [3 x [2 x [1 x i16]]]]]* %l_7.i, i64 0, i64 0, i64 3, i64 1, i64 0, i64 0
  %scevgep44.i.3 = getelementptr [2 x [6 x [3 x [2 x [1 x i16]]]]]* %l_7.i, i64 0, i64 0, i64 3, i64 1, i64 1, i64 0
  %scevgep.i.3 = getelementptr [2 x [6 x [3 x [2 x [1 x i16]]]]]* %l_7.i, i64 0, i64 0, i64 3, i64 0, i64 1, i64 0
  store i16 -9, i16* %arrayidx29.i.3, align 4
  store i16 -9, i16* %scevgep.i.3, align 2
  store i16 -9, i16* %scevgep46.i.3, align 4
  store i16 -9, i16* %scevgep44.i.3, align 2
  store i16 -9, i16* %scevgep50.i.3, align 4
  store i16 -9, i16* %scevgep48.i.3, align 2
  %arrayidx29.i.4 = getelementptr [2 x [6 x [3 x [2 x [1 x i16]]]]]* %l_7.i, i64 0, i64 0, i64 4, i64 0, i64 0, i64 0
  %scevgep50.i.4 = getelementptr [2 x [6 x [3 x [2 x [1 x i16]]]]]* %l_7.i, i64 0, i64 0, i64 4, i64 2, i64 0, i64 0
  %scevgep48.i.4 = getelementptr [2 x [6 x [3 x [2 x [1 x i16]]]]]* %l_7.i, i64 0, i64 0, i64 4, i64 2, i64 1, i64 0
  %scevgep46.i.4 = getelementptr [2 x [6 x [3 x [2 x [1 x i16]]]]]* %l_7.i, i64 0, i64 0, i64 4, i64 1, i64 0, i64 0
  %scevgep44.i.4 = getelementptr [2 x [6 x [3 x [2 x [1 x i16]]]]]* %l_7.i, i64 0, i64 0, i64 4, i64 1, i64 1, i64 0
  %scevgep.i.4 = getelementptr [2 x [6 x [3 x [2 x [1 x i16]]]]]* %l_7.i, i64 0, i64 0, i64 4, i64 0, i64 1, i64 0
  store i16 -9, i16* %arrayidx29.i.4, align 16
  store i16 -9, i16* %scevgep.i.4, align 2
  store i16 -9, i16* %scevgep46.i.4, align 4
  store i16 -9, i16* %scevgep44.i.4, align 2
  store i16 -9, i16* %scevgep50.i.4, align 8
  store i16 -9, i16* %scevgep48.i.4, align 2
  %arrayidx29.i.5 = getelementptr [2 x [6 x [3 x [2 x [1 x i16]]]]]* %l_7.i, i64 0, i64 0, i64 5, i64 0, i64 0, i64 0
  %scevgep50.i.5 = getelementptr [2 x [6 x [3 x [2 x [1 x i16]]]]]* %l_7.i, i64 0, i64 0, i64 5, i64 2, i64 0, i64 0
  %scevgep48.i.5 = getelementptr [2 x [6 x [3 x [2 x [1 x i16]]]]]* %l_7.i, i64 0, i64 0, i64 5, i64 2, i64 1, i64 0
  %scevgep46.i.5 = getelementptr [2 x [6 x [3 x [2 x [1 x i16]]]]]* %l_7.i, i64 0, i64 0, i64 5, i64 1, i64 0, i64 0
  %scevgep44.i.5 = getelementptr [2 x [6 x [3 x [2 x [1 x i16]]]]]* %l_7.i, i64 0, i64 0, i64 5, i64 1, i64 1, i64 0
  %scevgep.i.5 = getelementptr [2 x [6 x [3 x [2 x [1 x i16]]]]]* %l_7.i, i64 0, i64 0, i64 5, i64 0, i64 1, i64 0
  store i16 -9, i16* %arrayidx29.i.5, align 4
  store i16 -9, i16* %scevgep.i.5, align 2
  store i16 -9, i16* %scevgep46.i.5, align 4
  store i16 -9, i16* %scevgep44.i.5, align 2
  store i16 -9, i16* %scevgep50.i.5, align 4
  store i16 -9, i16* %scevgep48.i.5, align 2
  %arrayidx29.155.i = getelementptr [2 x [6 x [3 x [2 x [1 x i16]]]]]* %l_7.i, i64 0, i64 1, i64 0, i64 0, i64 0, i64 0
  %scevgep50.1.i = getelementptr [2 x [6 x [3 x [2 x [1 x i16]]]]]* %l_7.i, i64 0, i64 1, i64 0, i64 2, i64 0, i64 0
  %scevgep48.1.i = getelementptr [2 x [6 x [3 x [2 x [1 x i16]]]]]* %l_7.i, i64 0, i64 1, i64 0, i64 2, i64 1, i64 0
  %scevgep46.1.i = getelementptr [2 x [6 x [3 x [2 x [1 x i16]]]]]* %l_7.i, i64 0, i64 1, i64 0, i64 1, i64 0, i64 0
  %scevgep44.1.i = getelementptr [2 x [6 x [3 x [2 x [1 x i16]]]]]* %l_7.i, i64 0, i64 1, i64 0, i64 1, i64 1, i64 0
  %scevgep.1.i = getelementptr [2 x [6 x [3 x [2 x [1 x i16]]]]]* %l_7.i, i64 0, i64 1, i64 0, i64 0, i64 1, i64 0
  store i16 -9, i16* %arrayidx29.155.i, align 8
  store i16 -9, i16* %scevgep.1.i, align 2
  store i16 -9, i16* %scevgep46.1.i, align 4
  store i16 -9, i16* %scevgep44.1.i, align 2
  store i16 -9, i16* %scevgep50.1.i, align 8
  store i16 -9, i16* %scevgep48.1.i, align 2
  %arrayidx29.155.i.1 = getelementptr [2 x [6 x [3 x [2 x [1 x i16]]]]]* %l_7.i, i64 0, i64 1, i64 1, i64 0, i64 0, i64 0
  %scevgep50.1.i.1 = getelementptr [2 x [6 x [3 x [2 x [1 x i16]]]]]* %l_7.i, i64 0, i64 1, i64 1, i64 2, i64 0, i64 0
  %scevgep48.1.i.1 = getelementptr [2 x [6 x [3 x [2 x [1 x i16]]]]]* %l_7.i, i64 0, i64 1, i64 1, i64 2, i64 1, i64 0
  %scevgep46.1.i.1 = getelementptr [2 x [6 x [3 x [2 x [1 x i16]]]]]* %l_7.i, i64 0, i64 1, i64 1, i64 1, i64 0, i64 0
  %scevgep44.1.i.1 = getelementptr [2 x [6 x [3 x [2 x [1 x i16]]]]]* %l_7.i, i64 0, i64 1, i64 1, i64 1, i64 1, i64 0
  %scevgep.1.i.1 = getelementptr [2 x [6 x [3 x [2 x [1 x i16]]]]]* %l_7.i, i64 0, i64 1, i64 1, i64 0, i64 1, i64 0
  store i16 -9, i16* %arrayidx29.155.i.1, align 4
  store i16 -9, i16* %scevgep.1.i.1, align 2
  store i16 -9, i16* %scevgep46.1.i.1, align 4
  store i16 -9, i16* %scevgep44.1.i.1, align 2
  store i16 -9, i16* %scevgep50.1.i.1, align 4
  store i16 -9, i16* %scevgep48.1.i.1, align 2
  %arrayidx29.155.i.2 = getelementptr [2 x [6 x [3 x [2 x [1 x i16]]]]]* %l_7.i, i64 0, i64 1, i64 2, i64 0, i64 0, i64 0
  %scevgep50.1.i.2 = getelementptr [2 x [6 x [3 x [2 x [1 x i16]]]]]* %l_7.i, i64 0, i64 1, i64 2, i64 2, i64 0, i64 0
  %scevgep48.1.i.2 = getelementptr [2 x [6 x [3 x [2 x [1 x i16]]]]]* %l_7.i, i64 0, i64 1, i64 2, i64 2, i64 1, i64 0
  %scevgep46.1.i.2 = getelementptr [2 x [6 x [3 x [2 x [1 x i16]]]]]* %l_7.i, i64 0, i64 1, i64 2, i64 1, i64 0, i64 0
  %scevgep44.1.i.2 = getelementptr [2 x [6 x [3 x [2 x [1 x i16]]]]]* %l_7.i, i64 0, i64 1, i64 2, i64 1, i64 1, i64 0
  %scevgep.1.i.2 = getelementptr [2 x [6 x [3 x [2 x [1 x i16]]]]]* %l_7.i, i64 0, i64 1, i64 2, i64 0, i64 1, i64 0
  store i16 -9, i16* %arrayidx29.155.i.2, align 8
  store i16 -9, i16* %scevgep.1.i.2, align 2
  store i16 -9, i16* %scevgep46.1.i.2, align 4
  store i16 -9, i16* %scevgep44.1.i.2, align 2
  store i16 -9, i16* %scevgep50.1.i.2, align 8
  store i16 -9, i16* %scevgep48.1.i.2, align 2
  %arrayidx29.155.i.3 = getelementptr [2 x [6 x [3 x [2 x [1 x i16]]]]]* %l_7.i, i64 0, i64 1, i64 3, i64 0, i64 0, i64 0
  %scevgep50.1.i.3 = getelementptr [2 x [6 x [3 x [2 x [1 x i16]]]]]* %l_7.i, i64 0, i64 1, i64 3, i64 2, i64 0, i64 0
  %scevgep48.1.i.3 = getelementptr [2 x [6 x [3 x [2 x [1 x i16]]]]]* %l_7.i, i64 0, i64 1, i64 3, i64 2, i64 1, i64 0
  %scevgep46.1.i.3 = getelementptr [2 x [6 x [3 x [2 x [1 x i16]]]]]* %l_7.i, i64 0, i64 1, i64 3, i64 1, i64 0, i64 0
  %scevgep44.1.i.3 = getelementptr [2 x [6 x [3 x [2 x [1 x i16]]]]]* %l_7.i, i64 0, i64 1, i64 3, i64 1, i64 1, i64 0
  %scevgep.1.i.3 = getelementptr [2 x [6 x [3 x [2 x [1 x i16]]]]]* %l_7.i, i64 0, i64 1, i64 3, i64 0, i64 1, i64 0
  store i16 -9, i16* %arrayidx29.155.i.3, align 4
  store i16 -9, i16* %scevgep.1.i.3, align 2
  store i16 -9, i16* %scevgep46.1.i.3, align 4
  store i16 -9, i16* %scevgep44.1.i.3, align 2
  store i16 -9, i16* %scevgep50.1.i.3, align 4
  store i16 -9, i16* %scevgep48.1.i.3, align 2
  %arrayidx29.155.i.4 = getelementptr [2 x [6 x [3 x [2 x [1 x i16]]]]]* %l_7.i, i64 0, i64 1, i64 4, i64 0, i64 0, i64 0
  %scevgep50.1.i.4 = getelementptr [2 x [6 x [3 x [2 x [1 x i16]]]]]* %l_7.i, i64 0, i64 1, i64 4, i64 2, i64 0, i64 0
  %scevgep48.1.i.4 = getelementptr [2 x [6 x [3 x [2 x [1 x i16]]]]]* %l_7.i, i64 0, i64 1, i64 4, i64 2, i64 1, i64 0
  %scevgep46.1.i.4 = getelementptr [2 x [6 x [3 x [2 x [1 x i16]]]]]* %l_7.i, i64 0, i64 1, i64 4, i64 1, i64 0, i64 0
  %scevgep44.1.i.4 = getelementptr [2 x [6 x [3 x [2 x [1 x i16]]]]]* %l_7.i, i64 0, i64 1, i64 4, i64 1, i64 1, i64 0
  %scevgep.1.i.4 = getelementptr [2 x [6 x [3 x [2 x [1 x i16]]]]]* %l_7.i, i64 0, i64 1, i64 4, i64 0, i64 1, i64 0
  store i16 -9, i16* %arrayidx29.155.i.4, align 8
  store i16 -9, i16* %scevgep.1.i.4, align 2
  store i16 -9, i16* %scevgep46.1.i.4, align 4
  store i16 -9, i16* %scevgep44.1.i.4, align 2
  store i16 -9, i16* %scevgep50.1.i.4, align 8
  store i16 -9, i16* %scevgep48.1.i.4, align 2
  %arrayidx29.155.i.5 = getelementptr [2 x [6 x [3 x [2 x [1 x i16]]]]]* %l_7.i, i64 0, i64 1, i64 5, i64 0, i64 0, i64 0
  %scevgep50.1.i.5 = getelementptr [2 x [6 x [3 x [2 x [1 x i16]]]]]* %l_7.i, i64 0, i64 1, i64 5, i64 2, i64 0, i64 0
  %scevgep48.1.i.5 = getelementptr [2 x [6 x [3 x [2 x [1 x i16]]]]]* %l_7.i, i64 0, i64 1, i64 5, i64 2, i64 1, i64 0
  %scevgep46.1.i.5 = getelementptr [2 x [6 x [3 x [2 x [1 x i16]]]]]* %l_7.i, i64 0, i64 1, i64 5, i64 1, i64 0, i64 0
  %scevgep44.1.i.5 = getelementptr [2 x [6 x [3 x [2 x [1 x i16]]]]]* %l_7.i, i64 0, i64 1, i64 5, i64 1, i64 1, i64 0
  %scevgep.1.i.5 = getelementptr [2 x [6 x [3 x [2 x [1 x i16]]]]]* %l_7.i, i64 0, i64 1, i64 5, i64 0, i64 1, i64 0
  store i16 -9, i16* %arrayidx29.155.i.5, align 4
  store i16 -9, i16* %scevgep.1.i.5, align 2
  store i16 -9, i16* %scevgep46.1.i.5, align 4
  store i16 -9, i16* %scevgep44.1.i.5, align 2
  store i16 -9, i16* %scevgep50.1.i.5, align 4
  store i16 -9, i16* %scevgep48.1.i.5, align 2
  %tmp47.i = load i32* @g_4, align 4
  %and.i = and i32 %tmp47.i, 204
  %tmp50.i = volatile load i32** @g_5, align 8
  store i32 %and.i, i32* %tmp50.i, align 4
  call void @llvm.lifetime.end(i64 -1, i8* %0)
  %tmp = load i32* @g_4, align 4
  %call1 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str, i64 0, i64 0), i32 %tmp) nounwind
  %tmp2 = load i32* @g_6, align 4
  %call3 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str1, i64 0, i64 0), i32 %tmp2) nounwind
  ret i32 0
}

declare i32 @printf(i8* nocapture, ...) nounwind

declare void @llvm.lifetime.start(i64, i8* nocapture) nounwind

declare void @llvm.lifetime.end(i64, i8* nocapture) nounwind
