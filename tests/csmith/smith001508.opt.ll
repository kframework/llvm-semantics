; ModuleID = '/home/grosu/celliso2/c-semantics/tests/csmith/smith001508.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@g_3 = global [1 x i32] [i32 -194136827], align 4
@g_4 = global i32 1748799429, align 4
@g_5 = global i32 82738465, align 4
@g_12 = constant i32* @g_4, align 8
@g_32 = constant i8 7, align 1
@.str = private unnamed_addr constant [22 x i8] c"checksum g_3[0] = %d\0A\00", align 1
@.str1 = private unnamed_addr constant [19 x i8] c"checksum g_4 = %d\0A\00", align 1
@.str2 = private unnamed_addr constant [19 x i8] c"checksum g_5 = %d\0A\00", align 1
@.str3 = private unnamed_addr constant [20 x i8] c"checksum g_32 = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define signext i8 @func_1() nounwind uwtable readnone {
entry:
  ret i8 -122
}

define i32 @func_16(i64 %p_17, i16 zeroext %p_18) nounwind uwtable {
entry:
  store i32 -29, i32* @g_5, align 4
  %tobool51 = icmp eq i64 %p_17, 0
  br i1 %tobool51, label %for.cond3.backedge.us, label %for.cond3.backedge

for.cond3.backedge.us:                            ; preds = %entry, %for.cond3.backedge.us
  %storemerge1.be6.us = phi i32 [ %conv56.us, %for.cond3.backedge.us ], [ -29, %entry ]
  %tmp1.i.us = volatile load i32** @g_12, align 8
  %sub.i3.us = shl nsw i32 %storemerge1.be6.us, 16
  %sext.us = add i32 %sub.i3.us, -65536
  %conv56.us = ashr exact i32 %sext.us, 16
  %cmp5.us = icmp slt i32 %sext.us, -589824
  br i1 %cmp5.us, label %for.cond3.backedge.us, label %for.cond58.preheader

for.cond58.preheader:                             ; preds = %for.cond3.backedge.us
  store i32 %conv56.us, i32* @g_5, align 4
  br label %for.cond58

for.cond3.backedge:                               ; preds = %for.cond3.backedge, %entry
  %tmp1.i = volatile load i32** @g_12, align 8
  br label %for.cond3.backedge

for.cond58:                                       ; preds = %for.cond58.preheader, %if.end67
  %storemerge2 = phi i32 [ %conv77, %if.end67 ], [ -6, %for.cond58.preheader ]
  store i32 %storemerge2, i32* @g_4, align 4
  %cmp60 = icmp eq i32 %storemerge2, 0
  br i1 %cmp60, label %for.end78, label %for.body62

for.body62:                                       ; preds = %for.cond58
  %tmp63 = volatile load i32** @g_12, align 8
  %tmp64 = load i32* %tmp63, align 4
  %tobool65 = icmp eq i32 %tmp64, 0
  br i1 %tobool65, label %if.end67, label %for.end78

if.end67:                                         ; preds = %for.body62
  %tmp68 = volatile load i32** @g_12, align 8
  %sub.i = add i32 %storemerge2, 247
  %conv77 = and i32 %sub.i, 255
  br label %for.cond58

for.end78:                                        ; preds = %for.body62, %for.cond58
  %conv80 = zext i16 %p_18 to i32
  ret i32 %conv80
}

define i32 @func_27(i64 %p_28, i16 zeroext %p_29) nounwind uwtable {
entry:
  %tmp1 = volatile load i32** @g_12, align 8
  %tmp2 = load i32* %tmp1, align 4
  ret i32 %tmp2
}

define i32 @main(i32 %argc, i8** nocapture %argv) nounwind uwtable {
entry:
  %tmp = load i32* getelementptr inbounds ([1 x i32]* @g_3, i64 0, i64 0), align 4
  %call1 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str, i64 0, i64 0), i32 %tmp) nounwind
  %tmp2 = load i32* getelementptr inbounds ([1 x i32]* @g_3, i64 0, i64 0), align 4
  %call3 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str, i64 0, i64 0), i32 %tmp2) nounwind
  %tmp4 = load i32* @g_4, align 4
  %call5 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str1, i64 0, i64 0), i32 %tmp4) nounwind
  %tmp6 = load i32* @g_5, align 4
  %call7 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str2, i64 0, i64 0), i32 %tmp6) nounwind
  %call8 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([20 x i8]* @.str3, i64 0, i64 0), i32 7) nounwind
  ret i32 0
}

declare i32 @printf(i8* nocapture, ...) nounwind
