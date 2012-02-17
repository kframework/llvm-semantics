; ModuleID = '/home/grosu/celliso2/c-semantics/tests/csmith/smith000901.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@g_2 = global i32 -1161409944, align 4
@.str = private unnamed_addr constant [19 x i8] c"checksum g_2 = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define i32 @func_1() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %l_8 = alloca i64, align 8
  %l_5 = alloca i32*, align 8
  %l_6 = alloca i32*, align 8
  %l_7 = alloca i32*, align 8
  store i64 -6556048866025357424, i64* %l_8, align 8
  store i32 0, i32* @g_2, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %tmp = load i32* @g_2, align 4
  %cmp = icmp sgt i32 %tmp, -7
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  store i32* null, i32** %l_5, align 8
  store i32* null, i32** %l_6, align 8
  store i32* @g_2, i32** %l_7, align 8
  %tmp4 = load i32** %l_7, align 8
  store i32 2, i32* %tmp4
  %tmp5 = load i64* %l_8, align 8
  %conv = trunc i64 %tmp5 to i32
  store i32 %conv, i32* %retval
  br label %return

for.inc:                                          ; No predecessors!
  %tmp6 = load i32* @g_2, align 4
  %conv7 = trunc i32 %tmp6 to i8
  %call = call zeroext i8 @safe_add_func_uint8_t_u_u(i8 zeroext %conv7, i8 zeroext 1)
  %conv8 = zext i8 %call to i32
  store i32 %conv8, i32* @g_2, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %tmp9 = load i32* @g_2, align 4
  store i32 %tmp9, i32* %retval
  br label %return

return:                                           ; preds = %for.end, %for.body
  %0 = load i32* %retval
  ret i32 %0
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
  %0 = load i32* %retval
  ret i32 %0
}

declare i32 @printf(i8*, ...)
