; ModuleID = '/home/grosu/celliso2/c-semantics/tests/csmith/smith001277.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@g_2 = global i32 1988232740, align 4
@g_5 = global i32 -950892824, align 4
@g_11 = global i32* null, align 8
@g_12 = global i32* @g_5, align 8
@.str = private unnamed_addr constant [19 x i8] c"checksum g_2 = %d\0A\00", align 1
@.str1 = private unnamed_addr constant [19 x i8] c"checksum g_5 = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define i64 @func_1() nounwind uwtable {
entry:
  %l_10 = alloca i32, align 4
  store i32 -3, i32* %l_10, align 4
  volatile store i32 0, i32* @g_2, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc9, %entry
  %tmp = volatile load i32* @g_2, align 4
  %cmp = icmp slt i32 %tmp, 5
  br i1 %cmp, label %for.body, label %for.end14

for.body:                                         ; preds = %for.cond
  store i32 0, i32* @g_5, align 4
  br label %for.cond1

for.cond1:                                        ; preds = %for.inc, %for.body
  %tmp2 = load i32* @g_5, align 4
  %cmp3 = icmp ne i32 %tmp2, -21
  br i1 %cmp3, label %for.body4, label %for.end

for.body4:                                        ; preds = %for.cond1
  %tmp5 = load i32* @g_5, align 4
  %tobool = icmp ne i32 %tmp5, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %for.body4
  br label %for.end

if.end:                                           ; preds = %for.body4
  %tmp6 = load i32* @g_5, align 4
  store i32 %tmp6, i32* @g_5, align 4
  br label %for.inc

for.inc:                                          ; preds = %if.end
  %tmp7 = load i32* @g_5, align 4
  %conv = sext i32 %tmp7 to i64
  %call = call i64 @safe_sub_func_uint64_t_u_u(i64 %conv, i64 1)
  %conv8 = trunc i64 %call to i32
  store i32 %conv8, i32* @g_5, align 4
  br label %for.cond1

for.end:                                          ; preds = %if.then, %for.cond1
  br label %for.inc9

for.inc9:                                         ; preds = %for.end
  %tmp10 = volatile load i32* @g_2, align 4
  %conv11 = sext i32 %tmp10 to i64
  %call12 = call i64 @safe_add_func_uint64_t_u_u(i64 %conv11, i64 8)
  %conv13 = trunc i64 %call12 to i32
  volatile store i32 %conv13, i32* @g_2, align 4
  br label %for.cond

for.end14:                                        ; preds = %for.cond
  %tmp15 = load i32* %l_10, align 4
  %conv16 = trunc i32 %tmp15 to i8
  %call17 = call zeroext i8 @safe_div_func_uint8_t_u_u(i8 zeroext %conv16, i8 zeroext -4)
  %conv18 = zext i8 %call17 to i32
  %tmp19 = volatile load i32** @g_12, align 8
  store i32 %conv18, i32* %tmp19
  %tmp20 = volatile load i32* @g_2, align 4
  %conv21 = sext i32 %tmp20 to i64
  ret i64 %conv21
}

define internal i64 @safe_sub_func_uint64_t_u_u(i64 %ui1, i64 %ui2) nounwind uwtable {
entry:
  %ui1.addr = alloca i64, align 8
  %ui2.addr = alloca i64, align 8
  store i64 %ui1, i64* %ui1.addr, align 8
  store i64 %ui2, i64* %ui2.addr, align 8
  %tmp = load i64* %ui1.addr, align 8
  %tmp1 = load i64* %ui2.addr, align 8
  %sub = sub i64 %tmp, %tmp1
  ret i64 %sub
}

define internal i64 @safe_add_func_uint64_t_u_u(i64 %ui1, i64 %ui2) nounwind uwtable {
entry:
  %ui1.addr = alloca i64, align 8
  %ui2.addr = alloca i64, align 8
  store i64 %ui1, i64* %ui1.addr, align 8
  store i64 %ui2, i64* %ui2.addr, align 8
  %tmp = load i64* %ui1.addr, align 8
  %tmp1 = load i64* %ui2.addr, align 8
  %add = add i64 %tmp, %tmp1
  ret i64 %add
}

define internal zeroext i8 @safe_div_func_uint8_t_u_u(i8 zeroext %ui1, i8 zeroext %ui2) nounwind uwtable {
entry:
  %ui1.addr = alloca i8, align 1
  %ui2.addr = alloca i8, align 1
  store i8 %ui1, i8* %ui1.addr, align 1
  store i8 %ui2, i8* %ui2.addr, align 1
  %tmp = load i8* %ui2.addr, align 1
  %conv = zext i8 %tmp to i32
  %cmp = icmp eq i32 %conv, 0
  br i1 %cmp, label %cond.true, label %cond.false

cond.true:                                        ; preds = %entry
  %tmp2 = load i8* %ui1.addr, align 1
  %conv3 = zext i8 %tmp2 to i32
  br label %cond.end

cond.false:                                       ; preds = %entry
  %tmp4 = load i8* %ui1.addr, align 1
  %conv5 = zext i8 %tmp4 to i32
  %tmp6 = load i8* %ui2.addr, align 1
  %conv7 = zext i8 %tmp6 to i32
  %div = sdiv i32 %conv5, %conv7
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %conv3, %cond.true ], [ %div, %cond.false ]
  %conv8 = trunc i32 %cond to i8
  ret i8 %conv8
}

define i32 @main(i32 %argc, i8** %argv) nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval
  store i32 %argc, i32* %argc.addr, align 4
  store i8** %argv, i8*** %argv.addr, align 8
  %call = call i64 @func_1()
  %tmp = volatile load i32* @g_2, align 4
  %call1 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str, i32 0, i32 0), i32 %tmp)
  %tmp2 = load i32* @g_5, align 4
  %call3 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str1, i32 0, i32 0), i32 %tmp2)
  %0 = load i32* %retval
  ret i32 %0
}

declare i32 @printf(i8*, ...)
