; ModuleID = '/home/grosu/celliso2/c-semantics/tests/csmith/smith000261.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

%struct.S1 = type { i32, i8 }

@g_2 = global %struct.S1* null, align 8
@g_3 = global %struct.S1** null, align 8
@__undefined = common global i64 0, align 8

define i32 @func_1() nounwind uwtable {
entry:
  %l_4 = alloca [7 x [8 x [1 x %struct.S1**]]], align 16
  %l_5 = alloca i32, align 4
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %k = alloca i32, align 4
  store i32 -1185926829, i32* %l_5, align 4
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc21, %entry
  %tmp = load i32* %i, align 4
  %cmp = icmp slt i32 %tmp, 7
  br i1 %cmp, label %for.body, label %for.end24

for.body:                                         ; preds = %for.cond
  store i32 0, i32* %j, align 4
  br label %for.cond1

for.cond1:                                        ; preds = %for.inc17, %for.body
  %tmp2 = load i32* %j, align 4
  %cmp3 = icmp slt i32 %tmp2, 8
  br i1 %cmp3, label %for.body4, label %for.end20

for.body4:                                        ; preds = %for.cond1
  store i32 0, i32* %k, align 4
  br label %for.cond5

for.cond5:                                        ; preds = %for.inc, %for.body4
  %tmp6 = load i32* %k, align 4
  %cmp7 = icmp slt i32 %tmp6, 1
  br i1 %cmp7, label %for.body8, label %for.end

for.body8:                                        ; preds = %for.cond5
  %tmp9 = load i32* %k, align 4
  %idxprom = sext i32 %tmp9 to i64
  %tmp10 = load i32* %j, align 4
  %idxprom11 = sext i32 %tmp10 to i64
  %tmp12 = load i32* %i, align 4
  %idxprom13 = sext i32 %tmp12 to i64
  %arrayidx = getelementptr inbounds [7 x [8 x [1 x %struct.S1**]]]* %l_4, i32 0, i64 %idxprom13
  %arrayidx14 = getelementptr inbounds [8 x [1 x %struct.S1**]]* %arrayidx, i32 0, i64 %idxprom11
  %arrayidx15 = getelementptr inbounds [1 x %struct.S1**]* %arrayidx14, i32 0, i64 %idxprom
  store %struct.S1** @g_2, %struct.S1*** %arrayidx15, align 8
  br label %for.inc

for.inc:                                          ; preds = %for.body8
  %tmp16 = load i32* %k, align 4
  %inc = add nsw i32 %tmp16, 1
  store i32 %inc, i32* %k, align 4
  br label %for.cond5

for.end:                                          ; preds = %for.cond5
  br label %for.inc17

for.inc17:                                        ; preds = %for.end
  %tmp18 = load i32* %j, align 4
  %inc19 = add nsw i32 %tmp18, 1
  store i32 %inc19, i32* %j, align 4
  br label %for.cond1

for.end20:                                        ; preds = %for.cond1
  br label %for.inc21

for.inc21:                                        ; preds = %for.end20
  %tmp22 = load i32* %i, align 4
  %inc23 = add nsw i32 %tmp22, 1
  store i32 %inc23, i32* %i, align 4
  br label %for.cond

for.end24:                                        ; preds = %for.cond
  %tmp25 = load %struct.S1** @g_2, align 8
  store %struct.S1* %tmp25, %struct.S1** @g_2, align 8
  ret i32 -1185926829
}

define i32 @main(i32 %argc, i8** %argv) nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval
  store i32 %argc, i32* %argc.addr, align 4
  store i8** %argv, i8*** %argv.addr, align 8
  %call = call i32 @func_1()
  %0 = load i32* %retval
  ret i32 %0
}
