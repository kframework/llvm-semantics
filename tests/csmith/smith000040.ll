; ModuleID = '/home/grosu/celliso2/c-semantics/tests/csmith/smith000040.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@g_3 = global i32* null, align 8
@__undefined = common global i64 0, align 8

define i32 @func_1() nounwind uwtable {
entry:
  %l_2 = alloca [9 x i64], align 16
  %l_4 = alloca i32, align 4
  %i = alloca i32, align 4
  store i32 627744503, i32* %l_4, align 4
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %tmp = load i32* %i, align 4
  %cmp = icmp slt i32 %tmp, 9
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %tmp1 = load i32* %i, align 4
  %idxprom = sext i32 %tmp1 to i64
  %arrayidx = getelementptr inbounds [9 x i64]* %l_2, i32 0, i64 %idxprom
  store i64 1, i64* %arrayidx, align 8
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %tmp2 = load i32* %i, align 4
  %inc = add nsw i32 %tmp2, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %arrayidx3 = getelementptr inbounds [9 x i64]* %l_2, i32 0, i64 8
  %tmp4 = load i64* %arrayidx3, align 8
  %arrayidx5 = getelementptr inbounds [9 x i64]* %l_2, i32 0, i64 8
  %tmp6 = load i64* %arrayidx5, align 8
  %xor = xor i64 %tmp4, %tmp6
  %conv = trunc i64 %xor to i32
  store i32 %conv, i32* %l_4, align 4
  %arrayidx7 = getelementptr inbounds [9 x i64]* %l_2, i32 0, i64 6
  %tmp8 = load i64* %arrayidx7, align 8
  %conv9 = trunc i64 %tmp8 to i32
  ret i32 %conv9
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
