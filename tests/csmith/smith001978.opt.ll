; ModuleID = '/home/grosu/celliso2/c-semantics/tests/csmith/smith001978.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@g_2 = global i32 966279603, align 4
@g_9 = constant i32* @g_2, align 8
@g_53 = global i32* @g_2, align 8
@g_52 = global i32** @g_53, align 8
@g_76 = global [1 x i32*] zeroinitializer, align 8
@g_75 = global [10 x [5 x i32**]] [[5 x i32**] [i32** getelementptr inbounds ([1 x i32*]* @g_76, i32 0, i32 0), i32** getelementptr inbounds ([1 x i32*]* @g_76, i32 0, i32 0), i32** getelementptr inbounds ([1 x i32*]* @g_76, i32 0, i32 0), i32** getelementptr inbounds ([1 x i32*]* @g_76, i32 0, i32 0), i32** getelementptr inbounds ([1 x i32*]* @g_76, i32 0, i32 0)], [5 x i32**] [i32** getelementptr inbounds ([1 x i32*]* @g_76, i32 0, i32 0), i32** getelementptr inbounds ([1 x i32*]* @g_76, i32 0, i32 0), i32** getelementptr inbounds ([1 x i32*]* @g_76, i32 0, i32 0), i32** getelementptr inbounds ([1 x i32*]* @g_76, i32 0, i32 0), i32** getelementptr inbounds ([1 x i32*]* @g_76, i32 0, i32 0)], [5 x i32**] [i32** getelementptr inbounds ([1 x i32*]* @g_76, i32 0, i32 0), i32** getelementptr inbounds ([1 x i32*]* @g_76, i32 0, i32 0), i32** getelementptr inbounds ([1 x i32*]* @g_76, i32 0, i32 0), i32** getelementptr inbounds ([1 x i32*]* @g_76, i32 0, i32 0), i32** getelementptr inbounds ([1 x i32*]* @g_76, i32 0, i32 0)], [5 x i32**] [i32** getelementptr inbounds ([1 x i32*]* @g_76, i32 0, i32 0), i32** getelementptr inbounds ([1 x i32*]* @g_76, i32 0, i32 0), i32** getelementptr inbounds ([1 x i32*]* @g_76, i32 0, i32 0), i32** getelementptr inbounds ([1 x i32*]* @g_76, i32 0, i32 0), i32** getelementptr inbounds ([1 x i32*]* @g_76, i32 0, i32 0)], [5 x i32**] [i32** getelementptr inbounds ([1 x i32*]* @g_76, i32 0, i32 0), i32** getelementptr inbounds ([1 x i32*]* @g_76, i32 0, i32 0), i32** getelementptr inbounds ([1 x i32*]* @g_76, i32 0, i32 0), i32** getelementptr inbounds ([1 x i32*]* @g_76, i32 0, i32 0), i32** getelementptr inbounds ([1 x i32*]* @g_76, i32 0, i32 0)], [5 x i32**] [i32** getelementptr inbounds ([1 x i32*]* @g_76, i32 0, i32 0), i32** getelementptr inbounds ([1 x i32*]* @g_76, i32 0, i32 0), i32** getelementptr inbounds ([1 x i32*]* @g_76, i32 0, i32 0), i32** getelementptr inbounds ([1 x i32*]* @g_76, i32 0, i32 0), i32** getelementptr inbounds ([1 x i32*]* @g_76, i32 0, i32 0)], [5 x i32**] [i32** getelementptr inbounds ([1 x i32*]* @g_76, i32 0, i32 0), i32** getelementptr inbounds ([1 x i32*]* @g_76, i32 0, i32 0), i32** getelementptr inbounds ([1 x i32*]* @g_76, i32 0, i32 0), i32** getelementptr inbounds ([1 x i32*]* @g_76, i32 0, i32 0), i32** getelementptr inbounds ([1 x i32*]* @g_76, i32 0, i32 0)], [5 x i32**] [i32** getelementptr inbounds ([1 x i32*]* @g_76, i32 0, i32 0), i32** getelementptr inbounds ([1 x i32*]* @g_76, i32 0, i32 0), i32** getelementptr inbounds ([1 x i32*]* @g_76, i32 0, i32 0), i32** getelementptr inbounds ([1 x i32*]* @g_76, i32 0, i32 0), i32** getelementptr inbounds ([1 x i32*]* @g_76, i32 0, i32 0)], [5 x i32**] [i32** getelementptr inbounds ([1 x i32*]* @g_76, i32 0, i32 0), i32** getelementptr inbounds ([1 x i32*]* @g_76, i32 0, i32 0), i32** getelementptr inbounds ([1 x i32*]* @g_76, i32 0, i32 0), i32** getelementptr inbounds ([1 x i32*]* @g_76, i32 0, i32 0), i32** getelementptr inbounds ([1 x i32*]* @g_76, i32 0, i32 0)], [5 x i32**] [i32** getelementptr inbounds ([1 x i32*]* @g_76, i32 0, i32 0), i32** getelementptr inbounds ([1 x i32*]* @g_76, i32 0, i32 0), i32** getelementptr inbounds ([1 x i32*]* @g_76, i32 0, i32 0), i32** getelementptr inbounds ([1 x i32*]* @g_76, i32 0, i32 0), i32** getelementptr inbounds ([1 x i32*]* @g_76, i32 0, i32 0)]], align 16
@g_82 = global i32 1, align 4
@g_92 = global i32* @g_2, align 8
@g_91 = constant [7 x i32**] [i32** @g_92, i32** @g_92, i32** @g_92, i32** @g_92, i32** @g_92, i32** @g_92, i32** @g_92], align 16
@.str = private unnamed_addr constant [19 x i8] c"checksum g_2 = %d\0A\00", align 1
@.str1 = private unnamed_addr constant [20 x i8] c"checksum g_82 = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define zeroext i16 @func_1() nounwind uwtable {
for.body:
  store i32 0, i32* @g_2, align 4
  ret i16 7
}

define i32 @func_19(i32* nocapture %p_20, i32* nocapture %p_21, i8 zeroext %p_22, i32* nocapture %p_23) nounwind uwtable readnone {
entry:
  ret i32 442835045
}

define i32* @func_25(i32* %p_26, i32* nocapture %p_27, i8 signext %p_28) nounwind uwtable readnone {
entry:
  ret i32* %p_26
}

define i32* @func_77(i64 %p_78) nounwind uwtable readnone {
entry:
  br label %for.cond4.backedge

for.cond4.backedge:                               ; preds = %entry, %for.cond4.backedge
  br label %for.cond4.backedge
}

define i32 @func_42(i32 %p_43, i32 %p_44) nounwind uwtable readnone {
entry:
  ret i32 1410334470
}

define i32* @func_30(i32* %p_31) nounwind uwtable {
entry:
  %l_48.i = alloca i32, align 4
  store i32 7, i32* %p_31, align 4
  %0 = bitcast i32* %l_48.i to i8*
  call void @llvm.lifetime.start(i64 -1, i8* %0)
  store i32** null, i32*** @g_52, align 8
  call void @llvm.lifetime.end(i64 -1, i8* %0)
  ret i32* %p_31
}

define i32* @func_33(i32 %p_34, i32* %p_35, i32 %p_36, i64 %p_37, i16 signext %p_38) nounwind uwtable {
entry:
  %l_48 = alloca i32, align 4
  store i32** null, i32*** @g_52, align 8
  ret i32* %l_48
}

define i32* @func_58(i32 %p_59, i32*** nocapture %p_60, i8 signext %p_61) nounwind uwtable readnone {
entry:
  ret i32* @g_2
}

define i32 @func_63(i32** nocapture %p_64, i32 %p_65, i16 signext %p_66, i32** nocapture %p_67, i32 %p_68) nounwind uwtable readnone {
entry:
  %l_69 = alloca [9 x [10 x i32]], align 16
  br label %for.cond1.preheader

for.cond1.preheader:                              ; preds = %for.cond1.preheader, %entry
  %indvar4 = phi i64 [ 0, %entry ], [ %indvar.next5, %for.cond1.preheader ]
  %arrayidx8.9 = getelementptr [9 x [10 x i32]]* %l_69, i64 0, i64 %indvar4, i64 9
  %arrayidx8.8 = getelementptr [9 x [10 x i32]]* %l_69, i64 0, i64 %indvar4, i64 8
  %arrayidx8.7 = getelementptr [9 x [10 x i32]]* %l_69, i64 0, i64 %indvar4, i64 7
  %arrayidx8.6 = getelementptr [9 x [10 x i32]]* %l_69, i64 0, i64 %indvar4, i64 6
  %arrayidx8.5 = getelementptr [9 x [10 x i32]]* %l_69, i64 0, i64 %indvar4, i64 5
  %arrayidx8.4 = getelementptr [9 x [10 x i32]]* %l_69, i64 0, i64 %indvar4, i64 4
  %arrayidx8.3 = getelementptr [9 x [10 x i32]]* %l_69, i64 0, i64 %indvar4, i64 3
  %arrayidx8.2 = getelementptr [9 x [10 x i32]]* %l_69, i64 0, i64 %indvar4, i64 2
  %arrayidx8.1 = getelementptr [9 x [10 x i32]]* %l_69, i64 0, i64 %indvar4, i64 1
  %arrayidx8 = getelementptr [9 x [10 x i32]]* %l_69, i64 0, i64 %indvar4, i64 0
  store i32 -1503318190, i32* %arrayidx8, align 8
  store i32 -1503318190, i32* %arrayidx8.1, align 4
  store i32 -1503318190, i32* %arrayidx8.2, align 8
  store i32 -1503318190, i32* %arrayidx8.3, align 4
  store i32 -1503318190, i32* %arrayidx8.4, align 8
  store i32 -1503318190, i32* %arrayidx8.5, align 4
  store i32 -1503318190, i32* %arrayidx8.6, align 8
  store i32 -1503318190, i32* %arrayidx8.7, align 4
  store i32 -1503318190, i32* %arrayidx8.8, align 8
  store i32 -1503318190, i32* %arrayidx8.9, align 4
  %indvar.next5 = add i64 %indvar4, 1
  %exitcond = icmp eq i64 %indvar.next5, 9
  br i1 %exitcond, label %for.end13, label %for.cond1.preheader

for.end13:                                        ; preds = %for.cond1.preheader
  %arrayidx18 = getelementptr inbounds [9 x [10 x i32]]* %l_69, i64 0, i64 5, i64 6
  %tmp19 = load i32* %arrayidx18, align 8
  ret i32 %tmp19
}

define i32** @func_70(i32* nocapture %p_71, i32** nocapture %p_72, i16 zeroext %p_73, i16 signext %p_74) nounwind uwtable readonly {
entry:
  %tmp = load i32*** getelementptr inbounds ([10 x [5 x i32**]]* @g_75, i64 0, i64 4, i64 3), align 8
  ret i32** %tmp
}

define i32 @main(i32 %argc, i8** nocapture %argv) nounwind uwtable {
entry:
  store i32 0, i32* @g_2, align 4
  %call1 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str, i64 0, i64 0), i32 0) nounwind
  %tmp2 = load i32* @g_82, align 4
  %call3 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([20 x i8]* @.str1, i64 0, i64 0), i32 %tmp2) nounwind
  ret i32 0
}

declare i32 @printf(i8* nocapture, ...) nounwind

declare void @llvm.lifetime.start(i64, i8* nocapture) nounwind

declare void @llvm.lifetime.end(i64, i8* nocapture) nounwind
