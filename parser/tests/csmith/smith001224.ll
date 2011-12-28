; ModuleID = '/home/grosu/celliso2/c-semantics/tests/csmith/smith001224.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@g_3 = global i8 8, align 1
@.str = private unnamed_addr constant [19 x i8] c"checksum g_3 = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define i32 @func_1() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %l_2 = alloca i32, align 4
  %l_6 = alloca i32, align 4
  store i32 -5, i32* %l_2, align 4
  %tmp = load i32* %l_2, align 4
  %tobool = icmp ne i32 %tmp, 0
  br i1 %tobool, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %tmp1 = load i8* @g_3, align 1
  %conv = sext i8 %tmp1 to i32
  %tmp2 = load i8* @g_3, align 1
  %conv3 = sext i8 %tmp2 to i32
  %tobool4 = icmp ne i32 %conv3, 0
  br i1 %tobool4, label %land.rhs, label %lor.lhs.false5

lor.lhs.false5:                                   ; preds = %lor.lhs.false
  %tmp6 = load i8* @g_3, align 1
  %conv7 = sext i8 %tmp6 to i32
  %tmp8 = load i8* @g_3, align 1
  %conv9 = sext i8 %tmp8 to i32
  %tmp10 = load i32* %l_2, align 4
  %xor = xor i32 %conv9, %tmp10
  %cmp = icmp ne i32 %conv7, %xor
  br i1 %cmp, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %lor.lhs.false5, %lor.lhs.false
  %tmp12 = load i32* %l_2, align 4
  %conv13 = trunc i32 %tmp12 to i16
  %tmp14 = load i32* %l_2, align 4
  %tobool15 = icmp ne i32 %tmp14, 0
  br i1 %tobool15, label %lor.end, label %lor.rhs

lor.rhs:                                          ; preds = %land.rhs
  %tmp16 = load i32* %l_2, align 4
  %tobool17 = icmp ne i32 %tmp16, 0
  br label %lor.end

lor.end:                                          ; preds = %lor.rhs, %land.rhs
  %0 = phi i1 [ true, %land.rhs ], [ %tobool17, %lor.rhs ]
  %lor.ext = zext i1 %0 to i32
  %conv18 = trunc i32 %lor.ext to i16
  %call = call signext i16 @safe_div_func_int16_t_s_s(i16 signext %conv13, i16 signext %conv18)
  %conv19 = sext i16 %call to i32
  %tobool20 = icmp ne i32 %conv19, 0
  br label %land.end

land.end:                                         ; preds = %lor.end, %lor.lhs.false5
  %1 = phi i1 [ false, %lor.lhs.false5 ], [ %tobool20, %lor.end ]
  %land.ext = zext i1 %1 to i32
  %cmp21 = icmp sge i32 %conv, %land.ext
  br i1 %cmp21, label %if.then, label %if.else

if.then:                                          ; preds = %land.end, %entry
  store i32 -4, i32* %l_6, align 4
  %tmp24 = load i32* %l_6, align 4
  store i32 %tmp24, i32* %retval
  br label %return

if.else:                                          ; preds = %land.end
  %tmp25 = load i8* @g_3, align 1
  %conv26 = sext i8 %tmp25 to i32
  store i32 %conv26, i32* %retval
  br label %return

return:                                           ; preds = %if.else, %if.then
  %2 = load i32* %retval
  ret i32 %2
}

define internal signext i16 @safe_div_func_int16_t_s_s(i16 signext %si1, i16 signext %si2) nounwind uwtable {
entry:
  %si1.addr = alloca i16, align 2
  %si2.addr = alloca i16, align 2
  store i16 %si1, i16* %si1.addr, align 2
  store i16 %si2, i16* %si2.addr, align 2
  %tmp = load i16* %si2.addr, align 2
  %conv = sext i16 %tmp to i32
  %cmp = icmp eq i32 %conv, 0
  br i1 %cmp, label %cond.true, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %tmp2 = load i16* %si1.addr, align 2
  %conv3 = sext i16 %tmp2 to i32
  %cmp4 = icmp eq i32 %conv3, -32768
  br i1 %cmp4, label %land.lhs.true, label %cond.false

land.lhs.true:                                    ; preds = %lor.lhs.false
  %tmp6 = load i16* %si2.addr, align 2
  %conv7 = sext i16 %tmp6 to i32
  %cmp8 = icmp eq i32 %conv7, -1
  br i1 %cmp8, label %cond.true, label %cond.false

cond.true:                                        ; preds = %land.lhs.true, %entry
  %tmp10 = load i16* %si1.addr, align 2
  %conv11 = sext i16 %tmp10 to i32
  br label %cond.end

cond.false:                                       ; preds = %land.lhs.true, %lor.lhs.false
  %tmp12 = load i16* %si1.addr, align 2
  %conv13 = sext i16 %tmp12 to i32
  %tmp14 = load i16* %si2.addr, align 2
  %conv15 = sext i16 %tmp14 to i32
  %div = sdiv i32 %conv13, %conv15
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %conv11, %cond.true ], [ %div, %cond.false ]
  %conv16 = trunc i32 %cond to i16
  ret i16 %conv16
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
  %tmp = load i8* @g_3, align 1
  %conv = sext i8 %tmp to i32
  %call1 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str, i32 0, i32 0), i32 %conv)
  %0 = load i32* %retval
  ret i32 %0
}

declare i32 @printf(i8*, ...)
