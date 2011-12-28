; ModuleID = '/home/grosu/celliso2/c-semantics/tests/csmith/smith001951.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@g_4 = global i32 -1, align 4
@g_5 = global [4 x [2 x [4 x i32*]]] zeroinitializer, align 16
@.str = private unnamed_addr constant [19 x i8] c"checksum g_4 = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define i32 @func_1() nounwind uwtable {
entry:
  %l_3 = alloca [1 x [3 x i32*]], align 16
  %l_2 = alloca [6 x [7 x [1 x [1 x [1 x [1 x i32**]]]]]], align 16
  %l_6 = alloca i64, align 8
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %k = alloca i32, align 4
  %l = alloca i32, align 4
  %m = alloca i32, align 4
  %n = alloca i32, align 4
  store i64 5152474960435308309, i64* %l_6, align 8
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc10, %entry
  %tmp = load i32* %i, align 4
  %cmp = icmp slt i32 %tmp, 1
  br i1 %cmp, label %for.body, label %for.end13

for.body:                                         ; preds = %for.cond
  store i32 0, i32* %j, align 4
  br label %for.cond1

for.cond1:                                        ; preds = %for.inc, %for.body
  %tmp2 = load i32* %j, align 4
  %cmp3 = icmp slt i32 %tmp2, 3
  br i1 %cmp3, label %for.body4, label %for.end

for.body4:                                        ; preds = %for.cond1
  %tmp5 = load i32* %j, align 4
  %idxprom = sext i32 %tmp5 to i64
  %tmp6 = load i32* %i, align 4
  %idxprom7 = sext i32 %tmp6 to i64
  %arrayidx = getelementptr inbounds [1 x [3 x i32*]]* %l_3, i32 0, i64 %idxprom7
  %arrayidx8 = getelementptr inbounds [3 x i32*]* %arrayidx, i32 0, i64 %idxprom
  store i32* @g_4, i32** %arrayidx8, align 8
  br label %for.inc

for.inc:                                          ; preds = %for.body4
  %tmp9 = load i32* %j, align 4
  %inc = add nsw i32 %tmp9, 1
  store i32 %inc, i32* %j, align 4
  br label %for.cond1

for.end:                                          ; preds = %for.cond1
  br label %for.inc10

for.inc10:                                        ; preds = %for.end
  %tmp11 = load i32* %i, align 4
  %inc12 = add nsw i32 %tmp11, 1
  store i32 %inc12, i32* %i, align 4
  br label %for.cond

for.end13:                                        ; preds = %for.cond
  store i32 0, i32* %i, align 4
  br label %for.cond14

for.cond14:                                       ; preds = %for.inc78, %for.end13
  %tmp15 = load i32* %i, align 4
  %cmp16 = icmp slt i32 %tmp15, 6
  br i1 %cmp16, label %for.body17, label %for.end81

for.body17:                                       ; preds = %for.cond14
  store i32 0, i32* %j, align 4
  br label %for.cond18

for.cond18:                                       ; preds = %for.inc74, %for.body17
  %tmp19 = load i32* %j, align 4
  %cmp20 = icmp slt i32 %tmp19, 7
  br i1 %cmp20, label %for.body21, label %for.end77

for.body21:                                       ; preds = %for.cond18
  store i32 0, i32* %k, align 4
  br label %for.cond22

for.cond22:                                       ; preds = %for.inc70, %for.body21
  %tmp23 = load i32* %k, align 4
  %cmp24 = icmp slt i32 %tmp23, 1
  br i1 %cmp24, label %for.body25, label %for.end73

for.body25:                                       ; preds = %for.cond22
  store i32 0, i32* %l, align 4
  br label %for.cond26

for.cond26:                                       ; preds = %for.inc66, %for.body25
  %tmp27 = load i32* %l, align 4
  %cmp28 = icmp slt i32 %tmp27, 1
  br i1 %cmp28, label %for.body29, label %for.end69

for.body29:                                       ; preds = %for.cond26
  store i32 0, i32* %m, align 4
  br label %for.cond30

for.cond30:                                       ; preds = %for.inc62, %for.body29
  %tmp31 = load i32* %m, align 4
  %cmp32 = icmp slt i32 %tmp31, 1
  br i1 %cmp32, label %for.body33, label %for.end65

for.body33:                                       ; preds = %for.cond30
  store i32 0, i32* %n, align 4
  br label %for.cond34

for.cond34:                                       ; preds = %for.inc58, %for.body33
  %tmp35 = load i32* %n, align 4
  %cmp36 = icmp slt i32 %tmp35, 1
  br i1 %cmp36, label %for.body37, label %for.end61

for.body37:                                       ; preds = %for.cond34
  %arrayidx38 = getelementptr inbounds [1 x [3 x i32*]]* %l_3, i32 0, i64 0
  %arrayidx39 = getelementptr inbounds [3 x i32*]* %arrayidx38, i32 0, i64 0
  %tmp40 = load i32* %n, align 4
  %idxprom41 = sext i32 %tmp40 to i64
  %tmp42 = load i32* %m, align 4
  %idxprom43 = sext i32 %tmp42 to i64
  %tmp44 = load i32* %l, align 4
  %idxprom45 = sext i32 %tmp44 to i64
  %tmp46 = load i32* %k, align 4
  %idxprom47 = sext i32 %tmp46 to i64
  %tmp48 = load i32* %j, align 4
  %idxprom49 = sext i32 %tmp48 to i64
  %tmp50 = load i32* %i, align 4
  %idxprom51 = sext i32 %tmp50 to i64
  %arrayidx52 = getelementptr inbounds [6 x [7 x [1 x [1 x [1 x [1 x i32**]]]]]]* %l_2, i32 0, i64 %idxprom51
  %arrayidx53 = getelementptr inbounds [7 x [1 x [1 x [1 x [1 x i32**]]]]]* %arrayidx52, i32 0, i64 %idxprom49
  %arrayidx54 = getelementptr inbounds [1 x [1 x [1 x [1 x i32**]]]]* %arrayidx53, i32 0, i64 %idxprom47
  %arrayidx55 = getelementptr inbounds [1 x [1 x [1 x i32**]]]* %arrayidx54, i32 0, i64 %idxprom45
  %arrayidx56 = getelementptr inbounds [1 x [1 x i32**]]* %arrayidx55, i32 0, i64 %idxprom43
  %arrayidx57 = getelementptr inbounds [1 x i32**]* %arrayidx56, i32 0, i64 %idxprom41
  store i32** %arrayidx39, i32*** %arrayidx57, align 8
  br label %for.inc58

for.inc58:                                        ; preds = %for.body37
  %tmp59 = load i32* %n, align 4
  %inc60 = add nsw i32 %tmp59, 1
  store i32 %inc60, i32* %n, align 4
  br label %for.cond34

for.end61:                                        ; preds = %for.cond34
  br label %for.inc62

for.inc62:                                        ; preds = %for.end61
  %tmp63 = load i32* %m, align 4
  %inc64 = add nsw i32 %tmp63, 1
  store i32 %inc64, i32* %m, align 4
  br label %for.cond30

for.end65:                                        ; preds = %for.cond30
  br label %for.inc66

for.inc66:                                        ; preds = %for.end65
  %tmp67 = load i32* %l, align 4
  %inc68 = add nsw i32 %tmp67, 1
  store i32 %inc68, i32* %l, align 4
  br label %for.cond26

for.end69:                                        ; preds = %for.cond26
  br label %for.inc70

for.inc70:                                        ; preds = %for.end69
  %tmp71 = load i32* %k, align 4
  %inc72 = add nsw i32 %tmp71, 1
  store i32 %inc72, i32* %k, align 4
  br label %for.cond22

for.end73:                                        ; preds = %for.cond22
  br label %for.inc74

for.inc74:                                        ; preds = %for.end73
  %tmp75 = load i32* %j, align 4
  %inc76 = add nsw i32 %tmp75, 1
  store i32 %inc76, i32* %j, align 4
  br label %for.cond18

for.end77:                                        ; preds = %for.cond18
  br label %for.inc78

for.inc78:                                        ; preds = %for.end77
  %tmp79 = load i32* %i, align 4
  %inc80 = add nsw i32 %tmp79, 1
  store i32 %inc80, i32* %i, align 4
  br label %for.cond14

for.end81:                                        ; preds = %for.cond14
  volatile store i32* null, i32** getelementptr inbounds ([4 x [2 x [4 x i32*]]]* @g_5, i32 0, i64 2, i64 1, i64 2), align 8
  %tmp82 = load i64* %l_6, align 8
  %conv = trunc i64 %tmp82 to i32
  ret i32 %conv
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
  %call = call i32 @func_1()
  %tmp = load i32* @g_4, align 4
  %call1 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str, i32 0, i32 0), i32 %tmp)
  %0 = load i32* %retval
  ret i32 %0
}

declare i32 @printf(i8*, ...)
