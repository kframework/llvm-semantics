; ModuleID = '/home/grosu/celliso2/c-semantics/tests/csmith/smith000883.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@g_2 = global i32 -2, align 4
@.str = private unnamed_addr constant [19 x i8] c"checksum g_2 = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define i32 @func_1() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %l_5 = alloca [3 x i32], align 4
  %i = alloca i32, align 4
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %tmp = load i32* %i, align 4
  %cmp = icmp slt i32 %tmp, 3
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %tmp1 = load i32* %i, align 4
  %idxprom = sext i32 %tmp1 to i64
  %arrayidx = getelementptr inbounds [3 x i32]* %l_5, i32 0, i64 %idxprom
  store i32 -1, i32* %arrayidx, align 4
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %tmp2 = load i32* %i, align 4
  %inc = add nsw i32 %tmp2, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  store i32 -24, i32* @g_2, align 4
  br label %for.cond3

for.cond3:                                        ; preds = %for.inc8, %for.end
  %tmp4 = load i32* @g_2, align 4
  %cmp5 = icmp sgt i32 %tmp4, 0
  br i1 %cmp5, label %for.body6, label %for.end11

for.body6:                                        ; preds = %for.cond3
  %tmp7 = load i32* @g_2, align 4
  store i32 %tmp7, i32* %retval
  br label %return

for.inc8:                                         ; No predecessors!
  %tmp9 = load i32* @g_2, align 4
  %conv = trunc i32 %tmp9 to i16
  %call = call signext i16 @safe_sub_func_int16_t_s_s(i16 signext %conv, i16 signext 6)
  %conv10 = sext i16 %call to i32
  store i32 %conv10, i32* @g_2, align 4
  br label %for.cond3

for.end11:                                        ; preds = %for.cond3
  %arrayidx12 = getelementptr inbounds [3 x i32]* %l_5, i32 0, i64 2
  %tmp13 = load i32* %arrayidx12, align 4
  store i32 %tmp13, i32* %retval
  br label %return

return:                                           ; preds = %for.end11, %for.body6
  %0 = load i32* %retval
  ret i32 %0
}

define internal signext i16 @safe_sub_func_int16_t_s_s(i16 signext %si1, i16 signext %si2) nounwind uwtable {
entry:
  %si1.addr = alloca i16, align 2
  %si2.addr = alloca i16, align 2
  store i16 %si1, i16* %si1.addr, align 2
  store i16 %si2, i16* %si2.addr, align 2
  %tmp = load i16* %si1.addr, align 2
  %conv = sext i16 %tmp to i32
  %tmp1 = load i16* %si2.addr, align 2
  %conv2 = sext i16 %tmp1 to i32
  %sub = sub nsw i32 %conv, %conv2
  %conv3 = trunc i32 %sub to i16
  ret i16 %conv3
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
  %tmp = load i32* @g_2, align 4
  %call1 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str, i32 0, i32 0), i32 %tmp)
  %0 = load i32* %retval
  ret i32 %0
}

declare i32 @printf(i8*, ...)
