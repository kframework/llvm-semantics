; ModuleID = '/home/grosu/celliso2/c-semantics/tests/csmith/smith001831.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@g_2 = global i32 -9, align 4
@g_8 = global i32 1372024187, align 4
@g_7 = global i32* @g_8, align 8
@.str = private unnamed_addr constant [19 x i8] c"checksum g_2 = %d\0A\00", align 1
@.str1 = private unnamed_addr constant [19 x i8] c"checksum g_8 = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define i32 @func_1() nounwind uwtable {
entry:
  %l_10 = alloca i16, align 2
  store i16 -1, i16* %l_10, align 2
  store i32 0, i32* @g_2, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %tmp = load i32* @g_2, align 4
  %cmp = icmp sgt i32 %tmp, 7
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  br label %lbl_9

lbl_9:                                            ; preds = %if.then, %for.body
  %tmp1 = load i32* @g_2, align 4
  %conv = sext i32 %tmp1 to i64
  %call = call i64 @safe_div_func_uint64_t_u_u(i64 %conv, i64 -2)
  %tmp2 = volatile load i32** @g_7, align 8
  %tmp3 = load i32* %tmp2
  %conv4 = sext i32 %tmp3 to i64
  %xor = xor i64 %conv4, %call
  %conv5 = trunc i64 %xor to i32
  store i32 %conv5, i32* %tmp2
  br label %for.inc

for.inc:                                          ; preds = %lbl_9
  %tmp6 = load i32* @g_2, align 4
  %conv7 = trunc i32 %tmp6 to i8
  %call8 = call zeroext i8 @safe_add_func_uint8_t_u_u(i8 zeroext %conv7, i8 zeroext 1)
  %conv9 = zext i8 %call8 to i32
  store i32 %conv9, i32* @g_2, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %tmp10 = load i32* @g_2, align 4
  %tobool = icmp ne i32 %tmp10, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %for.end
  br label %lbl_9

if.end:                                           ; preds = %for.end
  %tmp11 = load i16* %l_10, align 2
  %conv12 = sext i16 %tmp11 to i32
  ret i32 %conv12
}

define internal i64 @safe_div_func_uint64_t_u_u(i64 %ui1, i64 %ui2) nounwind uwtable {
entry:
  %ui1.addr = alloca i64, align 8
  %ui2.addr = alloca i64, align 8
  store i64 %ui1, i64* %ui1.addr, align 8
  store i64 %ui2, i64* %ui2.addr, align 8
  %tmp = load i64* %ui2.addr, align 8
  %cmp = icmp eq i64 %tmp, 0
  br i1 %cmp, label %cond.true, label %cond.false

cond.true:                                        ; preds = %entry
  %tmp1 = load i64* %ui1.addr, align 8
  br label %cond.end

cond.false:                                       ; preds = %entry
  %tmp2 = load i64* %ui1.addr, align 8
  %tmp3 = load i64* %ui2.addr, align 8
  %div = udiv i64 %tmp2, %tmp3
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i64 [ %tmp1, %cond.true ], [ %div, %cond.false ]
  ret i64 %cond
}

define internal zeroext i8 @safe_add_func_uint8_t_u_u(i8 zeroext %ui1, i8 zeroext %ui2) nounwind uwtable {
entry:
  %ui1.addr = alloca i8, align 1
  %ui2.addr = alloca i8, align 1
  store i8 %ui1, i8* %ui1.addr, align 1
  store i8 %ui2, i8* %ui2.addr, align 1
  %tmp = load i8* %ui1.addr, align 1
  %conv = zext i8 %tmp to i32
  %tmp1 = load i8* %ui2.addr, align 1
  %conv2 = zext i8 %tmp1 to i32
  %add = add nsw i32 %conv, %conv2
  %conv3 = trunc i32 %add to i8
  ret i8 %conv3
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
  %tmp2 = load i32* @g_8, align 4
  %call3 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str1, i32 0, i32 0), i32 %tmp2)
  %0 = load i32* %retval
  ret i32 %0
}

declare i32 @printf(i8*, ...)
