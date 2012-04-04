; ModuleID = '/home/david/src/c-semantics/tests/unitTests/c1x0607060209.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@n = global i32 6, align 4
@m = global i32 7, align 4
@.str = private unnamed_addr constant [21 x i8] c"c[0][2][4][5] == %d\0A\00", align 1
@.str1 = private unnamed_addr constant [21 x i8] c"c[1][3][4][5] == %d\0A\00", align 1

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %saved_stack = alloca i8*
  %p = alloca i32*, align 8
  %r = alloca i32*, align 8
  %cleanup.dest.slot = alloca i32
  store i32 0, i32* %retval
  %0 = load i32* @n, align 4
  %1 = zext i32 %0 to i64
  %2 = load i32* @m, align 4
  %3 = zext i32 %2 to i64
  %4 = call i8* @llvm.stacksave()
  store i8* %4, i8** %saved_stack
  %5 = mul nuw i64 %1, 6
  %6 = mul nuw i64 %5, %3
  %vla = alloca i32, i64 %6, align 16
  %7 = load i32* @n, align 4
  %add = add nsw i32 %7, 1
  %8 = zext i32 %add to i64
  %9 = load i32* @n, align 4
  %10 = zext i32 %9 to i64
  %11 = load i32* @n, align 4
  %12 = zext i32 %11 to i64
  %13 = load i32* @m, align 4
  %14 = zext i32 %13 to i64
  %15 = mul nuw i64 %10, %12
  %16 = mul nuw i64 %15, 6
  %17 = mul nuw i64 %16, %14
  %vla1 = alloca i32, i64 %17, align 16
  %18 = load i32* @n, align 4
  %19 = zext i32 %18 to i64
  %20 = load i32* @n, align 4
  %21 = zext i32 %20 to i64
  %22 = load i32* @n, align 4
  %add2 = add nsw i32 %22, 1
  %23 = zext i32 %add2 to i64
  %24 = mul nuw i64 %12, 6
  %25 = mul nuw i64 %24, %14
  %26 = mul nsw i64 0, %25
  %arrayidx = getelementptr inbounds i32* %vla1, i64 %26
  store i32* %arrayidx, i32** %r, align 8
  %27 = mul nuw i64 %12, 6
  %28 = mul nuw i64 %27, %14
  %29 = mul nsw i64 0, %28
  %arrayidx3 = getelementptr inbounds i32* %vla1, i64 %29
  %30 = mul nuw i64 6, %14
  %31 = mul nsw i64 2, %30
  %arrayidx4 = getelementptr inbounds i32* %arrayidx3, i64 %31
  %32 = mul nsw i64 4, %14
  %arrayidx5 = getelementptr inbounds i32* %arrayidx4, i64 %32
  %arrayidx6 = getelementptr inbounds i32* %arrayidx5, i64 5
  store i32 32, i32* %arrayidx6, align 4
  %33 = mul nuw i64 %12, 6
  %34 = mul nuw i64 %33, %14
  %35 = mul nsw i64 1, %34
  %arrayidx7 = getelementptr inbounds i32* %vla1, i64 %35
  %36 = mul nuw i64 6, %14
  %37 = mul nsw i64 3, %36
  %arrayidx8 = getelementptr inbounds i32* %arrayidx7, i64 %37
  %38 = mul nsw i64 4, %14
  %arrayidx9 = getelementptr inbounds i32* %arrayidx8, i64 %38
  %arrayidx10 = getelementptr inbounds i32* %arrayidx9, i64 5
  store i32 24, i32* %arrayidx10, align 4
  %39 = mul nuw i64 %12, 6
  %40 = mul nuw i64 %39, %14
  %41 = mul nsw i64 2, %40
  %arrayidx11 = getelementptr inbounds i32* %vla1, i64 %41
  %42 = mul nuw i64 6, %14
  %43 = mul nsw i64 2, %42
  %arrayidx12 = getelementptr inbounds i32* %arrayidx11, i64 %43
  %44 = mul nsw i64 2, %14
  %arrayidx13 = getelementptr inbounds i32* %arrayidx12, i64 %44
  %arrayidx14 = getelementptr inbounds i32* %arrayidx13, i64 5
  store i32 17, i32* %arrayidx14, align 4
  %45 = mul nuw i64 %12, 6
  %46 = mul nuw i64 %45, %14
  %47 = mul nsw i64 3, %46
  %arrayidx15 = getelementptr inbounds i32* %vla1, i64 %47
  %48 = mul nuw i64 6, %14
  %49 = mul nsw i64 2, %48
  %arrayidx16 = getelementptr inbounds i32* %arrayidx15, i64 %49
  %50 = mul nsw i64 2, %14
  %arrayidx17 = getelementptr inbounds i32* %arrayidx16, i64 %50
  %arrayidx18 = getelementptr inbounds i32* %arrayidx17, i64 4
  store i32 99, i32* %arrayidx18, align 4
  %51 = mul nuw i64 %12, 6
  %52 = mul nuw i64 %51, %14
  %53 = mul nsw i64 0, %52
  %arrayidx19 = getelementptr inbounds i32* %vla1, i64 %53
  %54 = mul nuw i64 6, %14
  %55 = mul nsw i64 2, %54
  %arrayidx20 = getelementptr inbounds i32* %arrayidx19, i64 %55
  %56 = mul nsw i64 4, %14
  %arrayidx21 = getelementptr inbounds i32* %arrayidx20, i64 %56
  %arrayidx22 = getelementptr inbounds i32* %arrayidx21, i64 5
  %57 = load i32* %arrayidx22, align 4
  %call = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([21 x i8]* @.str, i32 0, i32 0), i32 %57)
  %58 = mul nuw i64 %12, 6
  %59 = mul nuw i64 %58, %14
  %60 = mul nsw i64 1, %59
  %arrayidx23 = getelementptr inbounds i32* %vla1, i64 %60
  %61 = mul nuw i64 6, %14
  %62 = mul nsw i64 3, %61
  %arrayidx24 = getelementptr inbounds i32* %arrayidx23, i64 %62
  %63 = mul nsw i64 4, %14
  %arrayidx25 = getelementptr inbounds i32* %arrayidx24, i64 %63
  %arrayidx26 = getelementptr inbounds i32* %arrayidx25, i64 5
  %64 = load i32* %arrayidx26, align 4
  %call27 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([21 x i8]* @.str1, i32 0, i32 0), i32 %64)
  store i32 0, i32* %retval
  store i32 1, i32* %cleanup.dest.slot
  %65 = load i8** %saved_stack
  call void @llvm.stackrestore(i8* %65)
  %66 = load i32* %retval
  ret i32 %66
}

declare i8* @llvm.stacksave() nounwind

declare i32 @printf(i8*, ...)

declare void @llvm.stackrestore(i8*) nounwind
