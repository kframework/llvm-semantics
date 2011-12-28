; ModuleID = '/home/grosu/celliso2/c-semantics/tests/csmith/smith000423.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@g_11 = global i32 -1824385567, align 4
@g_27 = global [1 x [4 x i32]] [[4 x i32] [i32 -1, i32 -1, i32 -1, i32 -1]], align 16
@g_26 = global [1 x i32*] [i32* bitcast (i8* getelementptr (i8* bitcast ([1 x [4 x i32]]* @g_27 to i8*), i64 8) to i32*)], align 8
@g_29 = global i32 -1414046302, align 4
@g_28 = global [6 x [8 x [1 x i32*]]] [[8 x [1 x i32*]] [[1 x i32*] [i32* @g_29], [1 x i32*] [i32* @g_29], [1 x i32*] [i32* @g_29], [1 x i32*] [i32* @g_29], [1 x i32*] [i32* @g_29], [1 x i32*] [i32* @g_29], [1 x i32*] [i32* @g_29], [1 x i32*] [i32* @g_29]], [8 x [1 x i32*]] [[1 x i32*] [i32* @g_29], [1 x i32*] [i32* @g_29], [1 x i32*] [i32* @g_29], [1 x i32*] [i32* @g_29], [1 x i32*] [i32* @g_29], [1 x i32*] [i32* @g_29], [1 x i32*] [i32* @g_29], [1 x i32*] [i32* @g_29]], [8 x [1 x i32*]] [[1 x i32*] [i32* @g_29], [1 x i32*] [i32* @g_29], [1 x i32*] [i32* @g_29], [1 x i32*] [i32* @g_29], [1 x i32*] [i32* @g_29], [1 x i32*] [i32* @g_29], [1 x i32*] [i32* @g_29], [1 x i32*] [i32* @g_29]], [8 x [1 x i32*]] [[1 x i32*] [i32* @g_29], [1 x i32*] [i32* @g_29], [1 x i32*] [i32* @g_29], [1 x i32*] [i32* @g_29], [1 x i32*] [i32* @g_29], [1 x i32*] [i32* @g_29], [1 x i32*] [i32* @g_29], [1 x i32*] [i32* @g_29]], [8 x [1 x i32*]] [[1 x i32*] [i32* @g_29], [1 x i32*] [i32* @g_29], [1 x i32*] [i32* @g_29], [1 x i32*] [i32* @g_29], [1 x i32*] [i32* @g_29], [1 x i32*] [i32* @g_29], [1 x i32*] [i32* @g_29], [1 x i32*] [i32* @g_29]], [8 x [1 x i32*]] [[1 x i32*] [i32* @g_29], [1 x i32*] [i32* @g_29], [1 x i32*] [i32* @g_29], [1 x i32*] [i32* @g_29], [1 x i32*] [i32* @g_29], [1 x i32*] [i32* @g_29], [1 x i32*] [i32* @g_29], [1 x i32*] [i32* @g_29]]], align 16
@g_30 = global i32* null, align 8
@g_35 = global i32* @g_29, align 8
@g_34 = global i32** @g_35, align 8
@g_57 = global i32* null, align 8
@g_56 = global i32** @g_57, align 8
@.str = private unnamed_addr constant [20 x i8] c"checksum g_11 = %d\0A\00", align 1
@.str1 = private unnamed_addr constant [26 x i8] c"checksum g_27[0][0] = %d\0A\00", align 1
@.str2 = private unnamed_addr constant [26 x i8] c"checksum g_27[0][1] = %d\0A\00", align 1
@.str3 = private unnamed_addr constant [26 x i8] c"checksum g_27[0][2] = %d\0A\00", align 1
@.str4 = private unnamed_addr constant [26 x i8] c"checksum g_27[0][3] = %d\0A\00", align 1
@.str5 = private unnamed_addr constant [20 x i8] c"checksum g_29 = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define i32 @func_1() nounwind uwtable {
lor.end:
  %tmp1 = load i32* @g_11, align 4
  %conv7 = zext i32 %tmp1 to i64
  %sub.i17 = sub i64 1, %conv7
  %tmp1.i = volatile load i32* getelementptr inbounds ([1 x [4 x i32]]* @g_27, i64 0, i64 0, i64 2), align 8
  %tmp.i.i = load i32** getelementptr inbounds ([1 x i32*]* @g_26, i64 0, i64 0), align 8
  %cmp.i.i = icmp ne i32* %tmp.i.i, getelementptr inbounds ([1 x [4 x i32]]* @g_27, i64 0, i64 0, i64 2)
  %conv1.i.i = zext i1 %cmp.i.i to i32
  %xor.i.i = xor i32 %conv1.i.i, -1
  store i32 %xor.i.i, i32* @g_29, align 4
  %tmp5.i.i = volatile load i32* getelementptr inbounds ([1 x [4 x i32]]* @g_27, i64 0, i64 0, i64 2), align 8
  %tmp7.i.i = volatile load i32*** @g_34, align 8
  store i32* @g_29, i32** %tmp7.i.i, align 8
  %tmp8.i.i = volatile load i32*** @g_34, align 8
  %tmp9.i.i = load i32** %tmp8.i.i, align 8
  store i32* %tmp9.i.i, i32** @g_35, align 8
  store i32 0, i32* %tmp9.i.i, align 4
  %not.cmp11 = icmp eq i64 %sub.i17, %conv7
  br i1 %not.cmp11, label %for.body85, label %for.body141

for.body85:                                       ; preds = %lor.end
  %tmp55 = volatile load i32*** @g_34, align 8
  %tmp5.i = volatile load i32* getelementptr inbounds ([1 x [4 x i32]]* @g_27, i64 0, i64 0, i64 2), align 8
  %tmp7.i = volatile load i32*** @g_34, align 8
  store i32* @g_29, i32** %tmp7.i, align 8
  %tmp8.i = volatile load i32*** @g_34, align 8
  %tmp9.i = load i32** %tmp8.i, align 8
  %tmp63 = load i32*** @g_56, align 8
  store i32* %tmp9.i, i32** %tmp63, align 8
  volatile store i32 -1, i32* getelementptr inbounds ([1 x [4 x i32]]* @g_27, i64 0, i64 0, i64 0), align 16
  volatile store i32 -1, i32* getelementptr inbounds ([1 x [4 x i32]]* @g_27, i64 0, i64 0, i64 1), align 4
  volatile store i32 -1, i32* getelementptr inbounds ([1 x [4 x i32]]* @g_27, i64 0, i64 0, i64 2), align 8
  volatile store i32 -1, i32* getelementptr inbounds ([1 x [4 x i32]]* @g_27, i64 0, i64 0, i64 3), align 4
  store i32 4, i32* @g_29, align 4
  store i32 12, i32* @g_11, align 4
  br label %return

for.body141:                                      ; preds = %lor.end
  %tmp131 = load i32*** @g_56, align 8
  store i32* @g_29, i32** %tmp131, align 8
  store i32 0, i32* @g_11, align 4
  store i32 3, i32* @g_29, align 4
  %tmp142 = volatile load i32* getelementptr inbounds ([1 x [4 x i32]]* @g_27, i64 0, i64 0, i64 3), align 4
  br label %return

return:                                           ; preds = %for.body141, %for.body85
  %0 = phi i32 [ %tmp142, %for.body141 ], [ 1, %for.body85 ]
  ret i32 %0
}

define i32 @func_14(i8 signext %p_15, i32 %p_16, i64 %p_17, i32 %p_18, i32 %p_19) nounwind uwtable {
entry:
  %tmp1 = volatile load i32* getelementptr inbounds ([1 x [4 x i32]]* @g_27, i64 0, i64 0, i64 2), align 8
  %tmp.i = load i32** getelementptr inbounds ([1 x i32*]* @g_26, i64 0, i64 0), align 8
  %cmp.i = icmp ne i32* %tmp.i, getelementptr inbounds ([1 x [4 x i32]]* @g_27, i64 0, i64 0, i64 2)
  %conv1.i = zext i1 %cmp.i to i32
  %xor.i = xor i32 %conv1.i, -1
  store i32 %xor.i, i32* @g_29, align 4
  %tmp5.i = volatile load i32* getelementptr inbounds ([1 x [4 x i32]]* @g_27, i64 0, i64 0, i64 2), align 8
  %tmp7.i = volatile load i32*** @g_34, align 8
  store i32* @g_29, i32** %tmp7.i, align 8
  %tmp8.i = volatile load i32*** @g_34, align 8
  %tmp9.i = load i32** %tmp8.i, align 8
  store i32* %tmp9.i, i32** @g_35, align 8
  store i32 0, i32* %tmp9.i, align 4
  %conv25 = sext i8 %p_15 to i32
  ret i32 %conv25
}

define i32* @func_20(i64 %p_21, i8 signext %p_22, i32 %p_23) nounwind uwtable {
entry:
  %tmp = load i32** getelementptr inbounds ([1 x i32*]* @g_26, i64 0, i64 0), align 8
  %cmp = icmp ne i32* %tmp, getelementptr inbounds ([1 x [4 x i32]]* @g_27, i64 0, i64 0, i64 2)
  %conv1 = zext i1 %cmp to i32
  %xor = xor i32 %conv1, -1
  store i32 %xor, i32* @g_29, align 4
  %tmp5 = volatile load i32* getelementptr inbounds ([1 x [4 x i32]]* @g_27, i64 0, i64 0, i64 2), align 8
  %tmp7 = volatile load i32*** @g_34, align 8
  store i32* @g_29, i32** %tmp7, align 8
  %tmp8 = volatile load i32*** @g_34, align 8
  %tmp9 = load i32** %tmp8, align 8
  ret i32* %tmp9
}

define i32* @func_32(i32 %p_33) nounwind uwtable readnone {
entry:
  ret i32* @g_29
}

define i32 @func_42(i32 %p_43, i32* nocapture %p_44) nounwind uwtable readonly {
entry:
  %tmp1 = load i32* %p_44, align 4
  ret i32 %tmp1
}

define i32* @func_47(i32** %p_48, i32 %p_49, i32** nocapture %p_50, i32 %p_51) nounwind uwtable readonly {
entry:
  %tmp20 = load i32** %p_48, align 8
  ret i32* %tmp20
}

define i32 @main(i32 %argc, i8** nocapture %argv) nounwind uwtable {
entry:
  %tmp1.i = load i32* @g_11, align 4
  %conv7.i = zext i32 %tmp1.i to i64
  %sub.i17.i = sub i64 1, %conv7.i
  %tmp1.i.i = volatile load i32* getelementptr inbounds ([1 x [4 x i32]]* @g_27, i64 0, i64 0, i64 2), align 8
  %tmp.i.i.i = load i32** getelementptr inbounds ([1 x i32*]* @g_26, i64 0, i64 0), align 8
  %cmp.i.i.i = icmp ne i32* %tmp.i.i.i, getelementptr inbounds ([1 x [4 x i32]]* @g_27, i64 0, i64 0, i64 2)
  %conv1.i.i.i = zext i1 %cmp.i.i.i to i32
  %xor.i.i.i = xor i32 %conv1.i.i.i, -1
  store i32 %xor.i.i.i, i32* @g_29, align 4
  %tmp5.i.i.i = volatile load i32* getelementptr inbounds ([1 x [4 x i32]]* @g_27, i64 0, i64 0, i64 2), align 8
  %tmp7.i.i.i = volatile load i32*** @g_34, align 8
  store i32* @g_29, i32** %tmp7.i.i.i, align 8
  %tmp8.i.i.i = volatile load i32*** @g_34, align 8
  %tmp9.i.i.i = load i32** %tmp8.i.i.i, align 8
  store i32* %tmp9.i.i.i, i32** @g_35, align 8
  store i32 0, i32* %tmp9.i.i.i, align 4
  %not.cmp11.i = icmp eq i64 %sub.i17.i, %conv7.i
  br i1 %not.cmp11.i, label %for.body85.i, label %for.body141.i

for.body85.i:                                     ; preds = %entry
  %tmp55.i = volatile load i32*** @g_34, align 8
  %tmp5.i.i = volatile load i32* getelementptr inbounds ([1 x [4 x i32]]* @g_27, i64 0, i64 0, i64 2), align 8
  %tmp7.i.i = volatile load i32*** @g_34, align 8
  store i32* @g_29, i32** %tmp7.i.i, align 8
  %tmp8.i.i = volatile load i32*** @g_34, align 8
  %tmp9.i.i = load i32** %tmp8.i.i, align 8
  %tmp63.i = load i32*** @g_56, align 8
  store i32* %tmp9.i.i, i32** %tmp63.i, align 8
  volatile store i32 -1, i32* getelementptr inbounds ([1 x [4 x i32]]* @g_27, i64 0, i64 0, i64 0), align 16
  volatile store i32 -1, i32* getelementptr inbounds ([1 x [4 x i32]]* @g_27, i64 0, i64 0, i64 1), align 4
  volatile store i32 -1, i32* getelementptr inbounds ([1 x [4 x i32]]* @g_27, i64 0, i64 0, i64 2), align 8
  volatile store i32 -1, i32* getelementptr inbounds ([1 x [4 x i32]]* @g_27, i64 0, i64 0, i64 3), align 4
  store i32 4, i32* @g_29, align 4
  store i32 12, i32* @g_11, align 4
  br label %func_1.exit

for.body141.i:                                    ; preds = %entry
  %tmp131.i = load i32*** @g_56, align 8
  store i32* @g_29, i32** %tmp131.i, align 8
  store i32 0, i32* @g_11, align 4
  store i32 3, i32* @g_29, align 4
  %tmp142.i = volatile load i32* getelementptr inbounds ([1 x [4 x i32]]* @g_27, i64 0, i64 0, i64 3), align 4
  br label %func_1.exit

func_1.exit:                                      ; preds = %for.body85.i, %for.body141.i
  %tmp = phi i32 [ 12, %for.body85.i ], [ 0, %for.body141.i ]
  %call1 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([20 x i8]* @.str, i64 0, i64 0), i32 %tmp) nounwind
  %tmp2 = volatile load i32* getelementptr inbounds ([1 x [4 x i32]]* @g_27, i64 0, i64 0, i64 0), align 16
  %call3 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([26 x i8]* @.str1, i64 0, i64 0), i32 %tmp2) nounwind
  %tmp4 = volatile load i32* getelementptr inbounds ([1 x [4 x i32]]* @g_27, i64 0, i64 0, i64 1), align 4
  %call5 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([26 x i8]* @.str2, i64 0, i64 0), i32 %tmp4) nounwind
  %tmp6 = volatile load i32* getelementptr inbounds ([1 x [4 x i32]]* @g_27, i64 0, i64 0, i64 2), align 8
  %call7 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([26 x i8]* @.str3, i64 0, i64 0), i32 %tmp6) nounwind
  %tmp8 = volatile load i32* getelementptr inbounds ([1 x [4 x i32]]* @g_27, i64 0, i64 0, i64 3), align 4
  %call9 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([26 x i8]* @.str4, i64 0, i64 0), i32 %tmp8) nounwind
  %tmp10 = volatile load i32* getelementptr inbounds ([1 x [4 x i32]]* @g_27, i64 0, i64 0, i64 2), align 8
  %call11 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([26 x i8]* @.str3, i64 0, i64 0), i32 %tmp10) nounwind
  %tmp12 = load i32* @g_29, align 4
  %call13 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([20 x i8]* @.str5, i64 0, i64 0), i32 %tmp12) nounwind
  ret i32 0
}

declare i32 @printf(i8* nocapture, ...) nounwind
