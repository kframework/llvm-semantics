; ModuleID = '/home/grosu/celliso2/c-semantics/tests/csmith/smith000634.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@g_2 = global i32 736797483, align 4
@.str = private unnamed_addr constant [19 x i8] c"checksum g_2 = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define zeroext i16 @func_1() nounwind uwtable {
entry:
  %retval = alloca i16, align 2
  %l_5 = alloca i32, align 4
  store i32 1, i32* %l_5, align 4
  volatile store i32 0, i32* @g_2, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc12, %entry
  %tmp = volatile load i32* @g_2, align 4
  %cmp = icmp sle i32 %tmp, -2
  br i1 %cmp, label %for.body, label %for.end17

for.body:                                         ; preds = %for.cond
  %tmp1 = volatile load i32* @g_2, align 4
  %tmp2 = load i32* %l_5, align 4
  %or = or i32 %tmp2, %tmp1
  store i32 %or, i32* %l_5, align 4
  volatile store i32 0, i32* @g_2, align 4
  br label %for.cond3

for.cond3:                                        ; preds = %for.inc, %for.body
  %tmp4 = volatile load i32* @g_2, align 4
  %cmp5 = icmp ne i32 %tmp4, -30
  br i1 %cmp5, label %for.body6, label %for.end

for.body6:                                        ; preds = %for.cond3
  %tmp7 = volatile load i32* @g_2, align 4
  %tobool = icmp ne i32 %tmp7, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %for.body6
  br label %for.end

if.end:                                           ; preds = %for.body6
  br label %for.inc

for.inc:                                          ; preds = %if.end
  %tmp8 = volatile load i32* @g_2, align 4
  %conv = trunc i32 %tmp8 to i8
  %call = call signext i8 @safe_sub_func_int8_t_s_s(i8 signext %conv, i8 signext 1)
  %conv9 = sext i8 %call to i32
  volatile store i32 %conv9, i32* @g_2, align 4
  br label %for.cond3

for.end:                                          ; preds = %if.then, %for.cond3
  %tmp10 = volatile load i32* @g_2, align 4
  %conv11 = trunc i32 %tmp10 to i16
  store i16 %conv11, i16* %retval
  br label %return

for.inc12:                                        ; No predecessors!
  %tmp13 = volatile load i32* @g_2, align 4
  %conv14 = trunc i32 %tmp13 to i16
  %call15 = call zeroext i16 @safe_add_func_uint16_t_u_u(i16 zeroext %conv14, i16 zeroext 5)
  %conv16 = zext i16 %call15 to i32
  volatile store i32 %conv16, i32* @g_2, align 4
  br label %for.cond

for.end17:                                        ; preds = %for.cond
  %tmp18 = volatile load i32* @g_2, align 4
  %conv19 = trunc i32 %tmp18 to i16
  store i16 %conv19, i16* %retval
  br label %return

return:                                           ; preds = %for.end17, %for.end
  %0 = load i16* %retval
  ret i16 %0
}

define internal signext i8 @safe_sub_func_int8_t_s_s(i8 signext %si1, i8 signext %si2) nounwind uwtable {
entry:
  %si1.addr = alloca i8, align 1
  %si2.addr = alloca i8, align 1
  store i8 %si1, i8* %si1.addr, align 1
  store i8 %si2, i8* %si2.addr, align 1
  %tmp = load i8* %si1.addr, align 1
  %conv = sext i8 %tmp to i32
  %tmp1 = load i8* %si2.addr, align 1
  %conv2 = sext i8 %tmp1 to i32
  %sub = sub nsw i32 %conv, %conv2
  %conv3 = trunc i32 %sub to i8
  ret i8 %conv3
}

define internal zeroext i16 @safe_add_func_uint16_t_u_u(i16 zeroext %ui1, i16 zeroext %ui2) nounwind uwtable {
entry:
  %ui1.addr = alloca i16, align 2
  %ui2.addr = alloca i16, align 2
  store i16 %ui1, i16* %ui1.addr, align 2
  store i16 %ui2, i16* %ui2.addr, align 2
  %tmp = load i16* %ui1.addr, align 2
  %conv = zext i16 %tmp to i32
  %tmp1 = load i16* %ui2.addr, align 2
  %conv2 = zext i16 %tmp1 to i32
  %add = add nsw i32 %conv, %conv2
  %conv3 = trunc i32 %add to i16
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
  %call = call zeroext i16 @func_1()
  %tmp = volatile load i32* @g_2, align 4
  %call1 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str, i32 0, i32 0), i32 %tmp)
  %0 = load i32* %retval
  ret i32 %0
}

declare i32 @printf(i8*, ...)
