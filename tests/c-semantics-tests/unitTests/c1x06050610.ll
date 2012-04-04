; ModuleID = '/home/david/src/c-semantics/tests/unitTests/c1x06050610.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
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
  %0 = load i32* %n, align 4
  %1 = zext i32 %0 to i64
  %2 = load i32* %m, align 4
  %3 = zext i32 %2 to i64
  %4 = call i8* @llvm.stacksave()
  store i8* %4, i8** %saved_stack
  %5 = mul nuw i64 %1, %3
  %vla = alloca i32, i64 %5, align 16
  %6 = load i32* %m, align 4
  %7 = zext i32 %6 to i64
  store i32* %vla, i32** %p, align 8
  %8 = load i32** %p, align 8
  %9 = mul nsw i64 0, %3
  %arrayidx = getelementptr inbounds i32* %vla, i64 %9
  %cmp = icmp eq i32* %8, %arrayidx
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  %call = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([12 x i8]* @.str, i32 0, i32 0))
  br label %if.end

if.else:                                          ; preds = %entry
  %call1 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([12 x i8]* @.str1, i32 0, i32 0))
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %10 = load i32** %p, align 8
  %vla.index = mul nsw i64 1, %7
  %add.ptr = getelementptr inbounds i32* %10, i64 %vla.index
  store i32* %add.ptr, i32** %p, align 8
  %11 = load i32** %p, align 8
  %12 = mul nsw i64 1, %3
  %arrayidx2 = getelementptr inbounds i32* %vla, i64 %12
  %cmp3 = icmp eq i32* %11, %arrayidx2
  br i1 %cmp3, label %if.then4, label %if.else6

if.then4:                                         ; preds = %if.end
  %call5 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([12 x i8]* @.str2, i32 0, i32 0))
  br label %if.end8

if.else6:                                         ; preds = %if.end
  %call7 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([12 x i8]* @.str3, i32 0, i32 0))
  br label %if.end8

if.end8:                                          ; preds = %if.else6, %if.then4
  %13 = load i32** %p, align 8
  %arrayidx9 = getelementptr inbounds i32* %13, i64 2
  store i32 99, i32* %arrayidx9, align 4
  %14 = mul nsw i64 1, %3
  %arrayidx10 = getelementptr inbounds i32* %vla, i64 %14
  %arrayidx11 = getelementptr inbounds i32* %arrayidx10, i64 2
  %15 = load i32* %arrayidx11, align 4
  %call12 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([15 x i8]* @.str4, i32 0, i32 0), i32 %15)
  %16 = load i32** %p, align 8
  %sub.ptr.lhs.cast = ptrtoint i32* %16 to i64
  %sub.ptr.rhs.cast = ptrtoint i32* %vla to i64
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast
  %17 = mul nuw i64 4, %7
  %sub.ptr.div = sdiv exact i64 %sub.ptr.sub, %17
  %conv = trunc i64 %sub.ptr.div to i32
  store i32 %conv, i32* %n, align 4
  %18 = load i32* %n, align 4
  %call13 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([9 x i8]* @.str5, i32 0, i32 0), i32 %18)
  store i32 0, i32* %retval
  store i32 1, i32* %cleanup.dest.slot
  %19 = load i8** %saved_stack
  call void @llvm.stackrestore(i8* %19)
  %20 = load i32* %retval
  ret i32 %20
}

declare i8* @llvm.stacksave() nounwind

declare i32 @printf(i8*, ...)

declare void @llvm.stackrestore(i8*) nounwind
