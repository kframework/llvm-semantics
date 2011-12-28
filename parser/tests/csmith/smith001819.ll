; ModuleID = '/home/grosu/celliso2/c-semantics/tests/csmith/smith001819.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@g_2 = global i32 1990901451, align 4
@.str = private unnamed_addr constant [19 x i8] c"checksum g_2 = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define zeroext i16 @func_1() nounwind uwtable {
entry:
  %l_5 = alloca i32*, align 8
  %l_6 = alloca i32**, align 8
  store i32 0, i32* @g_2, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %tmp = load i32* @g_2, align 4
  %cmp = icmp sgt i32 %tmp, -15
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  store i32* @g_2, i32** %l_5, align 8
  store i32** %l_5, i32*** %l_6, align 8
  br label %lbl_7

lbl_7:                                            ; preds = %if.then9, %for.body
  %tmp3 = load i32** %l_5, align 8
  %tmp4 = load i32*** %l_6, align 8
  store i32* %tmp3, i32** %tmp4
  %tmp5 = load i32** %l_5, align 8
  %tmp6 = load i32* %tmp5
  %tobool = icmp ne i32 %tmp6, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %lbl_7
  br label %for.end

if.end:                                           ; preds = %lbl_7
  %tmp7 = load i32* @g_2, align 4
  %tobool8 = icmp ne i32 %tmp7, 0
  br i1 %tobool8, label %if.then9, label %if.end10

if.then9:                                         ; preds = %if.end
  br label %lbl_7

if.end10:                                         ; preds = %if.end
  br label %for.inc

for.inc:                                          ; preds = %if.end10
  %tmp11 = load i32* @g_2, align 4
  %conv = trunc i32 %tmp11 to i8
  %call = call zeroext i8 @safe_sub_func_uint8_t_u_u(i8 zeroext %conv, i8 zeroext 1)
  %conv12 = zext i8 %call to i32
  store i32 %conv12, i32* @g_2, align 4
  br label %for.cond

for.end:                                          ; preds = %if.then, %for.cond
  %tmp13 = load i32* @g_2, align 4
  %conv14 = trunc i32 %tmp13 to i16
  ret i16 %conv14
}

define internal zeroext i8 @safe_sub_func_uint8_t_u_u(i8 zeroext %ui1, i8 zeroext %ui2) nounwind uwtable {
entry:
  %ui1.addr = alloca i8, align 1
  %ui2.addr = alloca i8, align 1
  store i8 %ui1, i8* %ui1.addr, align 1
  store i8 %ui2, i8* %ui2.addr, align 1
  %tmp = load i8* %ui1.addr, align 1
  %conv = zext i8 %tmp to i32
  %tmp1 = load i8* %ui2.addr, align 1
  %conv2 = zext i8 %tmp1 to i32
  %sub = sub nsw i32 %conv, %conv2
  %conv3 = trunc i32 %sub to i8
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
  %tmp = load i32* @g_2, align 4
  %call1 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str, i32 0, i32 0), i32 %tmp)
  %0 = load i32* %retval
  ret i32 %0
}

declare i32 @printf(i8*, ...)
