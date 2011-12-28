; ModuleID = '/home/grosu/celliso2/c-semantics/tests/csmith/smith001275.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@g_2 = global i32 -878530592, align 4
@g_6 = global [7 x [2 x [1 x i8]]] [[2 x [1 x i8]] [[1 x i8] c"Z", [1 x i8] c"Z"], [2 x [1 x i8]] [[1 x i8] c"Z", [1 x i8] c"Z"], [2 x [1 x i8]] [[1 x i8] c"Z", [1 x i8] c"Z"], [2 x [1 x i8]] [[1 x i8] c"Z", [1 x i8] c"Z"], [2 x [1 x i8]] [[1 x i8] c"Z", [1 x i8] c"Z"], [2 x [1 x i8]] [[1 x i8] c"Z", [1 x i8] c"Z"], [2 x [1 x i8]] [[1 x i8] c"Z", [1 x i8] c"Z"]], align 1
@g_7 = global i32 0, align 4
@g_8 = global i32 0, align 4
@.str = private unnamed_addr constant [19 x i8] c"checksum g_2 = %d\0A\00", align 1
@.str1 = private unnamed_addr constant [28 x i8] c"checksum g_6[0][0][0] = %d\0A\00", align 1
@.str2 = private unnamed_addr constant [28 x i8] c"checksum g_6[0][1][0] = %d\0A\00", align 1
@.str3 = private unnamed_addr constant [28 x i8] c"checksum g_6[1][0][0] = %d\0A\00", align 1
@.str4 = private unnamed_addr constant [28 x i8] c"checksum g_6[1][1][0] = %d\0A\00", align 1
@.str5 = private unnamed_addr constant [28 x i8] c"checksum g_6[2][0][0] = %d\0A\00", align 1
@.str6 = private unnamed_addr constant [28 x i8] c"checksum g_6[2][1][0] = %d\0A\00", align 1
@.str7 = private unnamed_addr constant [28 x i8] c"checksum g_6[3][0][0] = %d\0A\00", align 1
@.str8 = private unnamed_addr constant [28 x i8] c"checksum g_6[3][1][0] = %d\0A\00", align 1
@.str9 = private unnamed_addr constant [28 x i8] c"checksum g_6[4][0][0] = %d\0A\00", align 1
@.str10 = private unnamed_addr constant [28 x i8] c"checksum g_6[4][1][0] = %d\0A\00", align 1
@.str11 = private unnamed_addr constant [28 x i8] c"checksum g_6[5][0][0] = %d\0A\00", align 1
@.str12 = private unnamed_addr constant [28 x i8] c"checksum g_6[5][1][0] = %d\0A\00", align 1
@.str13 = private unnamed_addr constant [28 x i8] c"checksum g_6[6][0][0] = %d\0A\00", align 1
@.str14 = private unnamed_addr constant [28 x i8] c"checksum g_6[6][1][0] = %d\0A\00", align 1
@.str15 = private unnamed_addr constant [19 x i8] c"checksum g_7 = %d\0A\00", align 1
@.str16 = private unnamed_addr constant [19 x i8] c"checksum g_8 = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define signext i16 @func_1() nounwind uwtable {
entry:
  %retval = alloca i16, align 2
  %l_9 = alloca [3 x i32], align 4
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %k = alloca i32, align 4
  %l_5 = alloca i32, align 4
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %tmp = load i32* %i, align 4
  %cmp = icmp slt i32 %tmp, 3
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %tmp1 = load i32* %i, align 4
  %idxprom = sext i32 %tmp1 to i64
  %arrayidx = getelementptr inbounds [3 x i32]* %l_9, i32 0, i64 %idxprom
  store i32 -1418275319, i32* %arrayidx, align 4
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %tmp2 = load i32* %i, align 4
  %inc = add nsw i32 %tmp2, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  store i32 0, i32* @g_2, align 4
  br label %for.cond3

for.cond3:                                        ; preds = %for.inc9, %for.end
  %tmp4 = load i32* @g_2, align 4
  %cmp5 = icmp sge i32 %tmp4, 0
  br i1 %cmp5, label %for.body6, label %for.end11

for.body6:                                        ; preds = %for.cond3
  store i32 -7, i32* %l_5, align 4
  %tmp8 = load i32* %l_5, align 4
  %conv = trunc i32 %tmp8 to i16
  store i16 %conv, i16* %retval
  br label %return

for.inc9:                                         ; No predecessors!
  %tmp10 = load i32* @g_2, align 4
  %call = call i32 @safe_add_func_int32_t_s_s(i32 %tmp10, i32 1)
  store i32 %call, i32* @g_2, align 4
  br label %for.cond3

for.end11:                                        ; preds = %for.cond3
  store i32 1, i32* @g_2, align 4
  br label %for.cond12

for.cond12:                                       ; preds = %for.inc37, %for.end11
  %tmp13 = load i32* @g_2, align 4
  %cmp14 = icmp slt i32 %tmp13, 7
  br i1 %cmp14, label %for.body16, label %for.end40

for.body16:                                       ; preds = %for.cond12
  store i32 0, i32* @g_7, align 4
  br label %for.cond17

for.cond17:                                       ; preds = %for.inc33, %for.body16
  %tmp18 = load i32* @g_7, align 4
  %cmp19 = icmp slt i32 %tmp18, 2
  br i1 %cmp19, label %for.body21, label %for.end36

for.body21:                                       ; preds = %for.cond17
  volatile store i32 0, i32* @g_8, align 4
  br label %for.cond22

for.cond22:                                       ; preds = %for.inc30, %for.body21
  %tmp23 = volatile load i32* @g_8, align 4
  %cmp24 = icmp slt i32 %tmp23, 1
  br i1 %cmp24, label %for.body26, label %for.end32

for.body26:                                       ; preds = %for.cond22
  %arrayidx27 = getelementptr inbounds [3 x i32]* %l_9, i32 0, i64 2
  %tmp28 = load i32* %arrayidx27, align 4
  %conv29 = trunc i32 %tmp28 to i16
  store i16 %conv29, i16* %retval
  br label %return

for.inc30:                                        ; No predecessors!
  %tmp31 = volatile load i32* @g_8, align 4
  %add = add nsw i32 %tmp31, 1
  volatile store i32 %add, i32* @g_8, align 4
  br label %for.cond22

for.end32:                                        ; preds = %for.cond22
  br label %for.inc33

for.inc33:                                        ; preds = %for.end32
  %tmp34 = load i32* @g_7, align 4
  %add35 = add nsw i32 %tmp34, 2
  store i32 %add35, i32* @g_7, align 4
  br label %for.cond17

for.end36:                                        ; preds = %for.cond17
  br label %for.inc37

for.inc37:                                        ; preds = %for.end36
  %tmp38 = load i32* @g_2, align 4
  %add39 = add nsw i32 %tmp38, 6
  store i32 %add39, i32* @g_2, align 4
  br label %for.cond12

for.end40:                                        ; preds = %for.cond12
  store i32 0, i32* @g_2, align 4
  br label %for.cond41

for.cond41:                                       ; preds = %for.inc73, %for.end40
  %tmp42 = load i32* @g_2, align 4
  %cmp43 = icmp slt i32 %tmp42, 7
  br i1 %cmp43, label %for.body45, label %for.end76

for.body45:                                       ; preds = %for.cond41
  volatile store i32 0, i32* @g_8, align 4
  br label %for.cond46

for.cond46:                                       ; preds = %for.inc69, %for.body45
  %tmp47 = volatile load i32* @g_8, align 4
  %cmp48 = icmp slt i32 %tmp47, 2
  br i1 %cmp48, label %for.body50, label %for.end72

for.body50:                                       ; preds = %for.cond46
  store i32 0, i32* @g_7, align 4
  br label %for.cond51

for.cond51:                                       ; preds = %for.inc65, %for.body50
  %tmp52 = load i32* @g_7, align 4
  %cmp53 = icmp slt i32 %tmp52, 1
  br i1 %cmp53, label %for.body55, label %for.end68

for.body55:                                       ; preds = %for.cond51
  %tmp56 = load i32* @g_7, align 4
  %idxprom57 = sext i32 %tmp56 to i64
  %tmp58 = volatile load i32* @g_8, align 4
  %idxprom59 = sext i32 %tmp58 to i64
  %tmp60 = load i32* @g_2, align 4
  %idxprom61 = sext i32 %tmp60 to i64
  %arrayidx62 = getelementptr inbounds [7 x [2 x [1 x i8]]]* @g_6, i32 0, i64 %idxprom61
  %arrayidx63 = getelementptr inbounds [2 x [1 x i8]]* %arrayidx62, i32 0, i64 %idxprom59
  %arrayidx64 = getelementptr inbounds [1 x i8]* %arrayidx63, i32 0, i64 %idxprom57
  store i8 8, i8* %arrayidx64, align 1
  br label %for.inc65

for.inc65:                                        ; preds = %for.body55
  %tmp66 = load i32* @g_7, align 4
  %add67 = add nsw i32 %tmp66, 1
  store i32 %add67, i32* @g_7, align 4
  br label %for.cond51

for.end68:                                        ; preds = %for.cond51
  br label %for.inc69

for.inc69:                                        ; preds = %for.end68
  %tmp70 = volatile load i32* @g_8, align 4
  %add71 = add nsw i32 %tmp70, 1
  volatile store i32 %add71, i32* @g_8, align 4
  br label %for.cond46

for.end72:                                        ; preds = %for.cond46
  br label %for.inc73

for.inc73:                                        ; preds = %for.end72
  %tmp74 = load i32* @g_2, align 4
  %add75 = add nsw i32 %tmp74, 1
  store i32 %add75, i32* @g_2, align 4
  br label %for.cond41

for.end76:                                        ; preds = %for.cond41
  %arrayidx77 = getelementptr inbounds [3 x i32]* %l_9, i32 0, i64 2
  %tmp78 = load i32* %arrayidx77, align 4
  %conv79 = trunc i32 %tmp78 to i16
  store i16 %conv79, i16* %retval
  br label %return

return:                                           ; preds = %for.end76, %for.body26, %for.body6
  %0 = load i16* %retval
  ret i16 %0
}

define internal i32 @safe_add_func_int32_t_s_s(i32 %si1, i32 %si2) nounwind uwtable {
entry:
  %si1.addr = alloca i32, align 4
  %si2.addr = alloca i32, align 4
  store i32 %si1, i32* %si1.addr, align 4
  store i32 %si2, i32* %si2.addr, align 4
  %tmp = load i32* %si1.addr, align 4
  %cmp = icmp sgt i32 %tmp, 0
  br i1 %cmp, label %land.lhs.true, label %lor.lhs.false

land.lhs.true:                                    ; preds = %entry
  %tmp1 = load i32* %si2.addr, align 4
  %cmp2 = icmp sgt i32 %tmp1, 0
  br i1 %cmp2, label %land.lhs.true3, label %lor.lhs.false

land.lhs.true3:                                   ; preds = %land.lhs.true
  %tmp4 = load i32* %si1.addr, align 4
  %tmp5 = load i32* %si2.addr, align 4
  %sub = sub nsw i32 2147483647, %tmp5
  %cmp6 = icmp sgt i32 %tmp4, %sub
  br i1 %cmp6, label %cond.true, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %land.lhs.true3, %land.lhs.true, %entry
  %tmp7 = load i32* %si1.addr, align 4
  %cmp8 = icmp slt i32 %tmp7, 0
  br i1 %cmp8, label %land.lhs.true9, label %cond.false

land.lhs.true9:                                   ; preds = %lor.lhs.false
  %tmp10 = load i32* %si2.addr, align 4
  %cmp11 = icmp slt i32 %tmp10, 0
  br i1 %cmp11, label %land.lhs.true12, label %cond.false

land.lhs.true12:                                  ; preds = %land.lhs.true9
  %tmp13 = load i32* %si1.addr, align 4
  %tmp14 = load i32* %si2.addr, align 4
  %sub15 = sub nsw i32 -2147483648, %tmp14
  %cmp16 = icmp slt i32 %tmp13, %sub15
  br i1 %cmp16, label %cond.true, label %cond.false

cond.true:                                        ; preds = %land.lhs.true12, %land.lhs.true3
  %tmp17 = load i32* %si1.addr, align 4
  br label %cond.end

cond.false:                                       ; preds = %land.lhs.true12, %land.lhs.true9, %lor.lhs.false
  %tmp18 = load i32* %si1.addr, align 4
  %tmp19 = load i32* %si2.addr, align 4
  %add = add nsw i32 %tmp18, %tmp19
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %tmp17, %cond.true ], [ %add, %cond.false ]
  ret i32 %cond
}

define i32 @main(i32 %argc, i8** %argv) nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %k = alloca i32, align 4
  store i32 0, i32* %retval
  store i32 %argc, i32* %argc.addr, align 4
  store i8** %argv, i8*** %argv.addr, align 8
  %call = call signext i16 @func_1()
  %tmp = load i32* @g_2, align 4
  %call1 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str, i32 0, i32 0), i32 %tmp)
  %tmp2 = load i8* getelementptr inbounds ([7 x [2 x [1 x i8]]]* @g_6, i32 0, i64 0, i64 0, i64 0), align 1
  %conv = zext i8 %tmp2 to i32
  %call3 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([28 x i8]* @.str1, i32 0, i32 0), i32 %conv)
  %tmp4 = load i8* getelementptr inbounds ([7 x [2 x [1 x i8]]]* @g_6, i32 0, i64 0, i64 1, i64 0), align 1
  %conv5 = zext i8 %tmp4 to i32
  %call6 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([28 x i8]* @.str2, i32 0, i32 0), i32 %conv5)
  %tmp7 = load i8* getelementptr inbounds ([7 x [2 x [1 x i8]]]* @g_6, i32 0, i64 1, i64 0, i64 0), align 1
  %conv8 = zext i8 %tmp7 to i32
  %call9 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([28 x i8]* @.str3, i32 0, i32 0), i32 %conv8)
  %tmp10 = load i8* getelementptr inbounds ([7 x [2 x [1 x i8]]]* @g_6, i32 0, i64 1, i64 1, i64 0), align 1
  %conv11 = zext i8 %tmp10 to i32
  %call12 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([28 x i8]* @.str4, i32 0, i32 0), i32 %conv11)
  %tmp13 = load i8* getelementptr inbounds ([7 x [2 x [1 x i8]]]* @g_6, i32 0, i64 2, i64 0, i64 0), align 1
  %conv14 = zext i8 %tmp13 to i32
  %call15 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([28 x i8]* @.str5, i32 0, i32 0), i32 %conv14)
  %tmp16 = load i8* getelementptr inbounds ([7 x [2 x [1 x i8]]]* @g_6, i32 0, i64 2, i64 1, i64 0), align 1
  %conv17 = zext i8 %tmp16 to i32
  %call18 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([28 x i8]* @.str6, i32 0, i32 0), i32 %conv17)
  %tmp19 = load i8* getelementptr inbounds ([7 x [2 x [1 x i8]]]* @g_6, i32 0, i64 3, i64 0, i64 0), align 1
  %conv20 = zext i8 %tmp19 to i32
  %call21 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([28 x i8]* @.str7, i32 0, i32 0), i32 %conv20)
  %tmp22 = load i8* getelementptr inbounds ([7 x [2 x [1 x i8]]]* @g_6, i32 0, i64 3, i64 1, i64 0), align 1
  %conv23 = zext i8 %tmp22 to i32
  %call24 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([28 x i8]* @.str8, i32 0, i32 0), i32 %conv23)
  %tmp25 = load i8* getelementptr inbounds ([7 x [2 x [1 x i8]]]* @g_6, i32 0, i64 4, i64 0, i64 0), align 1
  %conv26 = zext i8 %tmp25 to i32
  %call27 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([28 x i8]* @.str9, i32 0, i32 0), i32 %conv26)
  %tmp28 = load i8* getelementptr inbounds ([7 x [2 x [1 x i8]]]* @g_6, i32 0, i64 4, i64 1, i64 0), align 1
  %conv29 = zext i8 %tmp28 to i32
  %call30 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([28 x i8]* @.str10, i32 0, i32 0), i32 %conv29)
  %tmp31 = load i8* getelementptr inbounds ([7 x [2 x [1 x i8]]]* @g_6, i32 0, i64 5, i64 0, i64 0), align 1
  %conv32 = zext i8 %tmp31 to i32
  %call33 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([28 x i8]* @.str11, i32 0, i32 0), i32 %conv32)
  %tmp34 = load i8* getelementptr inbounds ([7 x [2 x [1 x i8]]]* @g_6, i32 0, i64 5, i64 1, i64 0), align 1
  %conv35 = zext i8 %tmp34 to i32
  %call36 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([28 x i8]* @.str12, i32 0, i32 0), i32 %conv35)
  %tmp37 = load i8* getelementptr inbounds ([7 x [2 x [1 x i8]]]* @g_6, i32 0, i64 6, i64 0, i64 0), align 1
  %conv38 = zext i8 %tmp37 to i32
  %call39 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([28 x i8]* @.str13, i32 0, i32 0), i32 %conv38)
  %tmp40 = load i8* getelementptr inbounds ([7 x [2 x [1 x i8]]]* @g_6, i32 0, i64 6, i64 1, i64 0), align 1
  %conv41 = zext i8 %tmp40 to i32
  %call42 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([28 x i8]* @.str14, i32 0, i32 0), i32 %conv41)
  %tmp43 = load i32* @g_7, align 4
  %call44 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str15, i32 0, i32 0), i32 %tmp43)
  %tmp45 = volatile load i32* @g_8, align 4
  %call46 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str16, i32 0, i32 0), i32 %tmp45)
  %0 = load i32* %retval
  ret i32 %0
}

declare i32 @printf(i8*, ...)
