; ModuleID = '/home/grosu/celliso2/c-semantics/tests/csmith/smith000234.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@g_2 = global i32 -1324299973, align 4
@func_1.l_8 = internal constant [7 x i64] [i64 -5707313192313671339, i64 -5707313192313671339, i64 -5707313192313671339, i64 -5707313192313671339, i64 -5707313192313671339, i64 -5707313192313671339, i64 -5707313192313671339], align 16
@.str = private unnamed_addr constant [19 x i8] c"checksum g_2 = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define zeroext i16 @func_1() nounwind uwtable {
entry:
  %retval = alloca i16, align 2
  %l_9 = alloca i32, align 4
  %i = alloca i32, align 4
  %l_7 = alloca i64, align 8
  store i32 7, i32* %l_9, align 4
  volatile store i32 -25, i32* @g_2, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc10, %entry
  %tmp = volatile load i32* @g_2, align 4
  %cmp = icmp sgt i32 %tmp, 17
  br i1 %cmp, label %for.body, label %for.end15

for.body:                                         ; preds = %for.cond
  store i64 -1, i64* %l_7, align 8
  volatile store i32 -17, i32* @g_2, align 4
  br label %for.cond2

for.cond2:                                        ; preds = %for.inc, %for.body
  %tmp3 = volatile load i32* @g_2, align 4
  %cmp4 = icmp sle i32 %tmp3, 8
  br i1 %cmp4, label %for.body5, label %for.end

for.body5:                                        ; preds = %for.cond2
  %tmp6 = load i64* %l_7, align 8
  %conv = trunc i64 %tmp6 to i16
  store i16 %conv, i16* %retval
  br label %return

for.inc:                                          ; No predecessors!
  %tmp7 = volatile load i32* @g_2, align 4
  %conv8 = sext i32 %tmp7 to i64
  %call = call i64 @safe_add_func_uint64_t_u_u(i64 %conv8, i64 1)
  %conv9 = trunc i64 %call to i32
  volatile store i32 %conv9, i32* @g_2, align 4
  br label %for.cond2

for.end:                                          ; preds = %for.cond2
  br label %for.inc10

for.inc10:                                        ; preds = %for.end
  %tmp11 = volatile load i32* @g_2, align 4
  %conv12 = trunc i32 %tmp11 to i8
  %call13 = call zeroext i8 @safe_add_func_uint8_t_u_u(i8 zeroext %conv12, i8 zeroext 1)
  %conv14 = zext i8 %call13 to i32
  volatile store i32 %conv14, i32* @g_2, align 4
  br label %for.cond

for.end15:                                        ; preds = %for.cond
  %tmp16 = load i64* getelementptr inbounds ([7 x i64]* @func_1.l_8, i32 0, i64 4), align 8
  %conv17 = trunc i64 %tmp16 to i32
  store i32 %conv17, i32* %l_9, align 4
  %tmp18 = volatile load i32* @g_2, align 4
  %conv19 = trunc i32 %tmp18 to i16
  store i16 %conv19, i16* %retval
  br label %return

return:                                           ; preds = %for.end15, %for.body5
  %0 = load i16* %retval
  ret i16 %0
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
  %call = call zeroext i16 @func_1()
  %tmp = volatile load i32* @g_2, align 4
  %call1 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str, i32 0, i32 0), i32 %tmp)
  %0 = load i32* %retval
  ret i32 %0
}

declare i32 @printf(i8*, ...)
