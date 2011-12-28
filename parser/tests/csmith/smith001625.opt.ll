; ModuleID = '/home/grosu/celliso2/c-semantics/tests/csmith/smith001625.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@g_4 = global i8 91, align 1
@g_7 = global i32 1, align 4
@g_6 = global i32* @g_7, align 8
@g_18 = global i32 -1, align 4
@g_38 = constant i16 1, align 2
@g_39 = global [4 x [2 x i32]] [[2 x i32] [i32 6, i32 6], [2 x i32] [i32 6, i32 6], [2 x i32] [i32 6, i32 6], [2 x i32] [i32 6, i32 6]], align 16
@.str = private unnamed_addr constant [19 x i8] c"checksum g_4 = %d\0A\00", align 1
@.str1 = private unnamed_addr constant [19 x i8] c"checksum g_7 = %d\0A\00", align 1
@.str2 = private unnamed_addr constant [20 x i8] c"checksum g_18 = %d\0A\00", align 1
@.str3 = private unnamed_addr constant [20 x i8] c"checksum g_38 = %d\0A\00", align 1
@.str4 = private unnamed_addr constant [26 x i8] c"checksum g_39[0][0] = %d\0A\00", align 1
@.str5 = private unnamed_addr constant [26 x i8] c"checksum g_39[0][1] = %d\0A\00", align 1
@.str6 = private unnamed_addr constant [26 x i8] c"checksum g_39[1][0] = %d\0A\00", align 1
@.str7 = private unnamed_addr constant [26 x i8] c"checksum g_39[1][1] = %d\0A\00", align 1
@.str8 = private unnamed_addr constant [26 x i8] c"checksum g_39[2][0] = %d\0A\00", align 1
@.str9 = private unnamed_addr constant [26 x i8] c"checksum g_39[2][1] = %d\0A\00", align 1
@.str10 = private unnamed_addr constant [26 x i8] c"checksum g_39[3][0] = %d\0A\00", align 1
@.str11 = private unnamed_addr constant [26 x i8] c"checksum g_39[3][1] = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define i32 @func_1() nounwind uwtable {
entry:
  store i8 27, i8* @g_4, align 1
  volatile store i32 25, i32* @g_7, align 4
  %tmp20 = volatile load i32* @g_7, align 4
  %cmp21 = icmp slt i32 %tmp20, 14
  br i1 %cmp21, label %for.body23, label %if.end135

for.body23:                                       ; preds = %entry
  %tmp27 = load i32** @g_6, align 8
  %tmp28 = volatile load i32* %tmp27, align 4
  %tobool29 = icmp eq i32 %tmp28, 0
  br i1 %tobool29, label %return.loopexit, label %if.end135

if.end135:                                        ; preds = %entry, %for.body23
  store i32* @g_7, i32** @g_6, align 8
  store i32 0, i32* @g_18, align 4
  %tmp214 = load i32* getelementptr inbounds ([4 x [2 x i32]]* @g_39, i64 0, i64 2, i64 1), align 4
  br label %return

return.loopexit:                                  ; preds = %for.body23
  volatile store i32 -72, i32* %tmp27, align 4
  %tmp40 = load i32** @g_6, align 8
  %tmp41 = volatile load i32* %tmp40, align 4
  %add.i = add i32 %tmp41, 1
  %conv44 = and i32 %add.i, 65535
  %tmp45 = load i32* @g_18, align 4
  %xor = xor i32 %conv44, %tmp45
  store i32 %xor, i32* @g_18, align 4
  br label %return

return:                                           ; preds = %return.loopexit, %if.end135
  %0 = phi i32 [ %tmp214, %if.end135 ], [ -1626839478, %return.loopexit ]
  ret i32 %0
}

define i32 @main(i32 %argc, i8** nocapture %argv) nounwind uwtable {
entry:
  store i8 27, i8* @g_4, align 1
  volatile store i32 25, i32* @g_7, align 4
  %tmp20.i = volatile load i32* @g_7, align 4
  %cmp21.i = icmp slt i32 %tmp20.i, 14
  br i1 %cmp21.i, label %for.body23.i, label %if.end135.i

for.body23.i:                                     ; preds = %entry
  %tmp27.i = load i32** @g_6, align 8
  %tmp28.i = volatile load i32* %tmp27.i, align 4
  %tobool29.i = icmp eq i32 %tmp28.i, 0
  br i1 %tobool29.i, label %return.loopexit.i, label %if.end135.i

if.end135.i:                                      ; preds = %for.body23.i, %entry
  store i32* @g_7, i32** @g_6, align 8
  br label %func_1.exit

return.loopexit.i:                                ; preds = %for.body23.i
  volatile store i32 -72, i32* %tmp27.i, align 4
  %tmp40.i = load i32** @g_6, align 8
  %tmp41.i = volatile load i32* %tmp40.i, align 4
  %add.i.i = add i32 %tmp41.i, 1
  %conv44.i = and i32 %add.i.i, 65535
  %tmp45.i = load i32* @g_18, align 4
  %xor.i = xor i32 %conv44.i, %tmp45.i
  br label %func_1.exit

func_1.exit:                                      ; preds = %if.end135.i, %return.loopexit.i
  %storemerge = phi i32 [ 0, %if.end135.i ], [ %xor.i, %return.loopexit.i ]
  store i32 %storemerge, i32* @g_18, align 4
  %call1 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str, i64 0, i64 0), i32 27) nounwind
  %tmp2 = volatile load i32* @g_7, align 4
  %call3 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str1, i64 0, i64 0), i32 %tmp2) nounwind
  %tmp4 = load i32* @g_18, align 4
  %call5 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([20 x i8]* @.str2, i64 0, i64 0), i32 %tmp4) nounwind
  %call6 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([20 x i8]* @.str3, i64 0, i64 0), i32 1) nounwind
  %tmp7 = load i32* getelementptr inbounds ([4 x [2 x i32]]* @g_39, i64 0, i64 0, i64 0), align 16
  %call8 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([26 x i8]* @.str4, i64 0, i64 0), i32 %tmp7) nounwind
  %tmp9 = load i32* getelementptr inbounds ([4 x [2 x i32]]* @g_39, i64 0, i64 0, i64 1), align 4
  %call10 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([26 x i8]* @.str5, i64 0, i64 0), i32 %tmp9) nounwind
  %tmp11 = load i32* getelementptr inbounds ([4 x [2 x i32]]* @g_39, i64 0, i64 1, i64 0), align 8
  %call12 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([26 x i8]* @.str6, i64 0, i64 0), i32 %tmp11) nounwind
  %tmp13 = load i32* getelementptr inbounds ([4 x [2 x i32]]* @g_39, i64 0, i64 1, i64 1), align 4
  %call14 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([26 x i8]* @.str7, i64 0, i64 0), i32 %tmp13) nounwind
  %tmp15 = load i32* getelementptr inbounds ([4 x [2 x i32]]* @g_39, i64 0, i64 2, i64 0), align 16
  %call16 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([26 x i8]* @.str8, i64 0, i64 0), i32 %tmp15) nounwind
  %tmp17 = load i32* getelementptr inbounds ([4 x [2 x i32]]* @g_39, i64 0, i64 2, i64 1), align 4
  %call18 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([26 x i8]* @.str9, i64 0, i64 0), i32 %tmp17) nounwind
  %tmp19 = load i32* getelementptr inbounds ([4 x [2 x i32]]* @g_39, i64 0, i64 3, i64 0), align 8
  %call20 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([26 x i8]* @.str10, i64 0, i64 0), i32 %tmp19) nounwind
  %tmp21 = load i32* getelementptr inbounds ([4 x [2 x i32]]* @g_39, i64 0, i64 3, i64 1), align 4
  %call22 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([26 x i8]* @.str11, i64 0, i64 0), i32 %tmp21) nounwind
  %tmp23 = load i32* getelementptr inbounds ([4 x [2 x i32]]* @g_39, i64 0, i64 0, i64 1), align 4
  %call24 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([26 x i8]* @.str5, i64 0, i64 0), i32 %tmp23) nounwind
  ret i32 0
}

declare i32 @printf(i8* nocapture, ...) nounwind
