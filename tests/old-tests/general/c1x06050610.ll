; ModuleID = '/home/grosu/celliso2/c-semantics/tests/unitTests/c1x06050610.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [12 x i8] c"p == &a[0]\0A\00", align 1
@.str1 = private unnamed_addr constant [12 x i8] c"p != &a[0]\0A\00", align 1
@.str2 = private unnamed_addr constant [12 x i8] c"p == &a[1]\0A\00", align 1
@.str3 = private unnamed_addr constant [12 x i8] c"p != &a[1]\0A\00", align 1
@.str4 = private unnamed_addr constant [15 x i8] c"a[1][2] == %d\0A\00", align 1
@.str5 = private unnamed_addr constant [9 x i8] c"n == %d\0A\00", align 1

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %n = alloca i32, align 4
  %m = alloca i32, align 4
  %saved_stack = alloca i8*
  %p = alloca i32*, align 8
  %cleanup.dest.slot = alloca i32
  store i32 0, i32* %retval
  store i32 4, i32* %n, align 4
  store i32 3, i32* %m, align 4
  %0 = call i8* @llvm.stacksave()
  store i8* %0, i8** %saved_stack
  %tmp = load i32* %m, align 4
  %tmp1 = zext i32 %tmp to i64
  %1 = mul i64 4, %tmp1
  %tmp2 = load i32* %n, align 4
  %tmp3 = zext i32 %tmp2 to i64
  %2 = mul i64 %1, %tmp3
  %vla = alloca i8, i64 %2, align 16
  %tmp4 = bitcast i8* %vla to i32*
  %tmp6 = load i32* %m, align 4
  %tmp7 = zext i32 %tmp6 to i64
  %3 = mul i64 4, %tmp7
  store i32* %tmp4, i32** %p, align 8
  %tmp8 = load i32** %p, align 8
  %4 = mul i64 0, %1
  %5 = bitcast i32* %tmp4 to i8*
  %arrayidx = getelementptr inbounds i8* %5, i64 %4
  %6 = bitcast i8* %arrayidx to i32*
  %cmp = icmp eq i32* %tmp8, %6
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  %call = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([12 x i8]* @.str, i32 0, i32 0))
  br label %if.end

if.else:                                          ; preds = %entry
  %call9 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([12 x i8]* @.str1, i32 0, i32 0))
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %tmp10 = load i32** %p, align 8
  %add.ptr = getelementptr inbounds i32* %tmp10, i64 1
  store i32* %add.ptr, i32** %p, align 8
  %tmp11 = load i32** %p, align 8
  %7 = mul i64 1, %1
  %8 = bitcast i32* %tmp4 to i8*
  %arrayidx12 = getelementptr inbounds i8* %8, i64 %7
  %9 = bitcast i8* %arrayidx12 to i32*
  %cmp13 = icmp eq i32* %tmp11, %9
  br i1 %cmp13, label %if.then14, label %if.else16

if.then14:                                        ; preds = %if.end
  %call15 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([12 x i8]* @.str2, i32 0, i32 0))
  br label %if.end18

if.else16:                                        ; preds = %if.end
  %call17 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([12 x i8]* @.str3, i32 0, i32 0))
  br label %if.end18

if.end18:                                         ; preds = %if.else16, %if.then14
  %tmp19 = load i32** %p, align 8
  %arrayidx20 = getelementptr inbounds i32* %tmp19, i64 2
  store i32 99, i32* %arrayidx20
  %10 = mul i64 1, %1
  %11 = bitcast i32* %tmp4 to i8*
  %arrayidx21 = getelementptr inbounds i8* %11, i64 %10
  %12 = bitcast i8* %arrayidx21 to i32*
  %arrayidx22 = getelementptr inbounds i32* %12, i64 2
  %tmp23 = load i32* %arrayidx22
  %call24 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([15 x i8]* @.str4, i32 0, i32 0), i32 %tmp23)
  %tmp25 = load i32** %p, align 8
  %sub.ptr.lhs.cast = ptrtoint i32* %tmp25 to i64
  %sub.ptr.rhs.cast = ptrtoint i32* %tmp4 to i64
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast
  %sub.ptr.div = sdiv exact i64 %sub.ptr.sub, 0
  %conv = trunc i64 %sub.ptr.div to i32
  store i32 %conv, i32* %n, align 4
  %tmp26 = load i32* %n, align 4
  %call27 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([9 x i8]* @.str5, i32 0, i32 0), i32 %tmp26)
  store i32 0, i32* %retval
  store i32 1, i32* %cleanup.dest.slot
  %tmp28 = load i8** %saved_stack
  call void @llvm.stackrestore(i8* %tmp28)
  %13 = load i32* %retval
  ret i32 %13
}

declare i8* @llvm.stacksave() nounwind

declare i32 @printf(i8*, ...)

declare void @llvm.stackrestore(i8*) nounwind
