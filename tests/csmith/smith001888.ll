; ModuleID = '/home/grosu/celliso2/c-semantics/tests/csmith/smith001888.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@g_2 = global i32 -2, align 4
@.str = private unnamed_addr constant [19 x i8] c"checksum g_2 = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define i32 @func_1() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %l_5 = alloca [9 x i64], align 16
  %i = alloca i32, align 4
  %i8 = alloca i32, align 4
  %l_6 = alloca i32, align 4
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %tmp = load i32* %i, align 4
  %cmp = icmp slt i32 %tmp, 9
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %tmp1 = load i32* %i, align 4
  %idxprom = sext i32 %tmp1 to i64
  %arrayidx = getelementptr inbounds [9 x i64]* %l_5, i32 0, i64 %idxprom
  store i64 -2, i64* %arrayidx, align 8
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %tmp2 = load i32* %i, align 4
  %inc = add nsw i32 %tmp2, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  store i32 22, i32* @g_2, align 4
  br label %for.cond3

for.cond3:                                        ; preds = %for.inc18, %for.end
  %tmp4 = load i32* @g_2, align 4
  %cmp5 = icmp ne i32 %tmp4, 0
  br i1 %cmp5, label %for.body6, label %for.end20

for.body6:                                        ; preds = %for.cond3
  store i32 0, i32* @g_2, align 4
  br label %for.cond9

for.cond9:                                        ; preds = %for.inc15, %for.body6
  %tmp10 = load i32* @g_2, align 4
  %cmp11 = icmp slt i32 %tmp10, 9
  br i1 %cmp11, label %for.body12, label %for.end17

for.body12:                                       ; preds = %for.cond9
  store i32 -1282269715, i32* %l_6, align 4
  %tmp14 = load i32* %l_6, align 4
  store i32 %tmp14, i32* %retval
  br label %return

for.inc15:                                        ; No predecessors!
  %tmp16 = load i32* @g_2, align 4
  %add = add nsw i32 %tmp16, 5
  store i32 %add, i32* @g_2, align 4
  br label %for.cond9

for.end17:                                        ; preds = %for.cond9
  br label %for.inc18

for.inc18:                                        ; preds = %for.end17
  %tmp19 = load i32* @g_2, align 4
  %call = call i32 @safe_sub_func_int32_t_s_s(i32 %tmp19, i32 3)
  store i32 %call, i32* @g_2, align 4
  br label %for.cond3

for.end20:                                        ; preds = %for.cond3
  %tmp21 = load i32* @g_2, align 4
  store i32 %tmp21, i32* %retval
  br label %return

return:                                           ; preds = %for.end20, %for.body12
  %0 = load i32* %retval
  ret i32 %0
}

define internal i32 @safe_sub_func_int32_t_s_s(i32 %si1, i32 %si2) nounwind uwtable {
entry:
  %si1.addr = alloca i32, align 4
  %si2.addr = alloca i32, align 4
  store i32 %si1, i32* %si1.addr, align 4
  store i32 %si2, i32* %si2.addr, align 4
  %tmp = load i32* %si1.addr, align 4
  %tmp1 = load i32* %si2.addr, align 4
  %xor = xor i32 %tmp, %tmp1
  %tmp2 = load i32* %si1.addr, align 4
  %tmp3 = load i32* %si1.addr, align 4
  %tmp4 = load i32* %si2.addr, align 4
  %xor5 = xor i32 %tmp3, %tmp4
  %and = and i32 %xor5, -2147483648
  %xor6 = xor i32 %tmp2, %and
  %tmp7 = load i32* %si2.addr, align 4
  %sub = sub nsw i32 %xor6, %tmp7
  %tmp8 = load i32* %si2.addr, align 4
  %xor9 = xor i32 %sub, %tmp8
  %and10 = and i32 %xor, %xor9
  %cmp = icmp slt i32 %and10, 0
  br i1 %cmp, label %cond.true, label %cond.false

cond.true:                                        ; preds = %entry
  %tmp11 = load i32* %si1.addr, align 4
  br label %cond.end

cond.false:                                       ; preds = %entry
  %tmp12 = load i32* %si1.addr, align 4
  %tmp13 = load i32* %si2.addr, align 4
  %sub14 = sub nsw i32 %tmp12, %tmp13
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %tmp11, %cond.true ], [ %sub14, %cond.false ]
  ret i32 %cond
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
