; ModuleID = '/home/grosu/celliso2/c-semantics/tests/csmith/smith000686.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@g_2 = global i16 0, align 2
@g_3 = global i16 -1, align 2
@.str = private unnamed_addr constant [19 x i8] c"checksum g_2 = %d\0A\00", align 1
@.str1 = private unnamed_addr constant [19 x i8] c"checksum g_3 = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define zeroext i16 @func_1() nounwind uwtable {
entry:
  %l_4 = alloca i32, align 4
  store i32 -642455217, i32* %l_4, align 4
  %tmp = volatile load i16* @g_2, align 2
  %conv = zext i16 %tmp to i32
  %tmp1 = load i16* @g_3, align 2
  %conv2 = zext i16 %tmp1 to i32
  %xor = xor i32 %conv, %conv2
  %tobool = icmp ne i32 %xor, 0
  br i1 %tobool, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %entry
  %tmp3 = load i16* @g_3, align 2
  %conv4 = zext i16 %tmp3 to i64
  %and = and i64 7, %conv4
  %tobool5 = icmp ne i64 %and, 0
  br label %land.end

land.end:                                         ; preds = %land.rhs, %entry
  %0 = phi i1 [ false, %entry ], [ %tobool5, %land.rhs ]
  %land.ext = zext i1 %0 to i32
  store i32 %land.ext, i32* %l_4, align 4
  %tmp6 = load i32* %l_4, align 4
  %conv7 = trunc i32 %tmp6 to i16
  ret i16 %conv7
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
  %tmp = volatile load i16* @g_2, align 2
  %conv = zext i16 %tmp to i32
  %call1 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str, i32 0, i32 0), i32 %conv)
  %tmp2 = load i16* @g_3, align 2
  %conv3 = zext i16 %tmp2 to i32
  %call4 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str1, i32 0, i32 0), i32 %conv3)
  %0 = load i32* %retval
  ret i32 %0
}

declare i32 @printf(i8*, ...)
