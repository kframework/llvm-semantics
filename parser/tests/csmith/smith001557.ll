; ModuleID = '/home/grosu/celliso2/c-semantics/tests/csmith/smith001557.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@g_3 = global i32* null, align 8
@g_4 = global [2 x [1 x [6 x [5 x i32*]]]] zeroinitializer, align 16
@__undefined = common global i64 0, align 8

define zeroext i16 @func_1() nounwind uwtable {
entry:
  %l_2 = alloca [7 x i32], align 16
  %l_5 = alloca i32, align 4
  %i = alloca i32, align 4
  store i32 -634722377, i32* %l_5, align 4
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %tmp = load i32* %i, align 4
  %cmp = icmp slt i32 %tmp, 7
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %tmp1 = load i32* %i, align 4
  %idxprom = sext i32 %tmp1 to i64
  %arrayidx = getelementptr inbounds [7 x i32]* %l_2, i32 0, i64 %idxprom
  store i32 5, i32* %arrayidx, align 4
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %tmp2 = load i32* %i, align 4
  %inc = add nsw i32 %tmp2, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %arrayidx3 = getelementptr inbounds [7 x i32]* %l_2, i32 0, i64 0
  %tmp4 = load i32* %arrayidx3, align 4
  %tmp5 = load i32* %l_5, align 4
  %xor = xor i32 %tmp5, %tmp4
  store i32 %xor, i32* %l_5, align 4
  %arrayidx6 = getelementptr inbounds [7 x i32]* %l_2, i32 0, i64 0
  %tmp7 = load i32* %arrayidx6, align 4
  %conv = trunc i32 %tmp7 to i16
  ret i16 %conv
}

define i32 @main(i32 %argc, i8** %argv) nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %k = alloca i32, align 4
  %l = alloca i32, align 4
  store i32 0, i32* %retval
  store i32 %argc, i32* %argc.addr, align 4
  store i8** %argv, i8*** %argv.addr, align 8
  %call = call zeroext i16 @func_1()
  %0 = load i32* %retval
  ret i32 %0
}
