; ModuleID = '/home/grosu/celliso2/c-semantics/tests/csmith/smith000131.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@g_2 = global i32 -1, align 4
@g_7 = global i32 -746925003, align 4
@.str = private unnamed_addr constant [19 x i8] c"checksum g_2 = %d\0A\00", align 1
@.str1 = private unnamed_addr constant [19 x i8] c"checksum g_7 = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define signext i16 @func_1() nounwind uwtable {
entry:
  %retval = alloca i16, align 2
  %l_5 = alloca i32*, align 8
  %l_6 = alloca i32**, align 8
  %l_9 = alloca i16, align 2
  store i32* @g_2, i32** %l_5, align 8
  store i32 0, i32* @g_2, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %tmp = load i32* @g_2, align 4
  %cmp = icmp sle i32 %tmp, -21
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  store i32** %l_5, i32*** %l_6, align 8
  br label %lbl_8

lbl_8:                                            ; preds = %if.then7, %for.body
  %tmp2 = load i32** %l_5, align 8
  %tmp3 = load i32*** %l_6, align 8
  store i32* %tmp2, i32** %tmp3
  %tmp4 = load i32* @g_7, align 4
  %tobool = icmp ne i32 %tmp4, 0
  br i1 %tobool, label %if.then, label %if.else

if.then:                                          ; preds = %lbl_8
  %tmp5 = load i32* @g_7, align 4
  %tobool6 = icmp ne i32 %tmp5, 0
  br i1 %tobool6, label %if.then7, label %if.end

if.then7:                                         ; preds = %if.then
  br label %lbl_8

if.end:                                           ; preds = %if.then
  br label %if.end10

if.else:                                          ; preds = %lbl_8
  store i16 5241, i16* %l_9, align 2
  %tmp9 = load i16* %l_9, align 2
  store i16 %tmp9, i16* %retval
  br label %return

if.end10:                                         ; preds = %if.end
  %tmp11 = load i32*** %l_6, align 8
  %tmp12 = load i32** %tmp11
  %tmp13 = load i32* %tmp12
  %tobool14 = icmp ne i32 %tmp13, 0
  br i1 %tobool14, label %if.then15, label %if.end16

if.then15:                                        ; preds = %if.end10
  br label %for.inc

if.end16:                                         ; preds = %if.end10
  br label %for.inc

for.inc:                                          ; preds = %if.end16, %if.then15
  %tmp17 = load i32* @g_2, align 4
  %call = call i32 @safe_sub_func_uint32_t_u_u(i32 %tmp17, i32 6)
  store i32 %call, i32* @g_2, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %tmp18 = load i32** %l_5, align 8
  %tmp19 = load i32* %tmp18
  %conv = trunc i32 %tmp19 to i16
  store i16 %conv, i16* %retval
  br label %return

return:                                           ; preds = %for.end, %if.else
  %0 = load i16* %retval
  ret i16 %0
}

define internal i32 @safe_sub_func_uint32_t_u_u(i32 %ui1, i32 %ui2) nounwind uwtable {
entry:
  %ui1.addr = alloca i32, align 4
  %ui2.addr = alloca i32, align 4
  store i32 %ui1, i32* %ui1.addr, align 4
  store i32 %ui2, i32* %ui2.addr, align 4
  %tmp = load i32* %ui1.addr, align 4
  %tmp1 = load i32* %ui2.addr, align 4
  %sub = sub i32 %tmp, %tmp1
  ret i32 %sub
}

define i32 @main(i32 %argc, i8** %argv) nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval
  store i32 %argc, i32* %argc.addr, align 4
  store i8** %argv, i8*** %argv.addr, align 8
  %call = call signext i16 @func_1()
  %tmp = load i32* @g_2, align 4
  %call1 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str, i32 0, i32 0), i32 %tmp)
  %tmp2 = load i32* @g_7, align 4
  %call3 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str1, i32 0, i32 0), i32 %tmp2)
  %0 = load i32* %retval
  ret i32 %0
}

declare i32 @printf(i8*, ...)
