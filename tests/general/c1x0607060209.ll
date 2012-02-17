; ModuleID = '/home/grosu/celliso2/c-semantics/tests/unitTests/c1x0607060209.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@n = global i32 6, align 4
@m = global i32 7, align 4
@.str = private unnamed_addr constant [27 x i8] c"(*r + 6*0)[2][4][5] == %d\0A\00", align 1
@.str1 = private unnamed_addr constant [27 x i8] c"(*r + 6*1)[3][4][5] == %d\0A\00", align 1
@.str2 = private unnamed_addr constant [27 x i8] c"(*r + 6*2)[2][2][5] == %d\0A\00", align 1
@.str3 = private unnamed_addr constant [27 x i8] c"(*r + 6*2)[2][2][4] == %d\0A\00", align 1

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %saved_stack = alloca i8*
  %p = alloca i32*, align 8
  %r = alloca i32*, align 8
  %cleanup.dest.slot = alloca i32
  store i32 0, i32* %retval
  %0 = call i8* @llvm.stacksave()
  store i8* %0, i8** %saved_stack
  %tmp = load i32* @m, align 4
  %tmp1 = zext i32 %tmp to i64
  %1 = mul i64 4, %tmp1
  %2 = mul i64 %1, 6
  %tmp2 = load i32* @n, align 4
  %tmp3 = zext i32 %tmp2 to i64
  %3 = mul i64 %2, %tmp3
  %vla = alloca i8, i64 %3, align 16
  %tmp4 = bitcast i8* %vla to i32*
  %tmp6 = load i32* @n, align 4
  %add = add nsw i32 %tmp6, 1
  %tmp7 = zext i32 %add to i64
  %4 = mul i64 4, %tmp7
  %5 = mul i64 %4, 4
  %tmp8 = load i32* @m, align 4
  %tmp9 = zext i32 %tmp8 to i64
  %6 = mul i64 4, %tmp9
  %7 = mul i64 %6, 6
  %tmp10 = load i32* @n, align 4
  %tmp11 = zext i32 %tmp10 to i64
  %8 = mul i64 %7, %tmp11
  %tmp12 = load i32* @n, align 4
  %tmp13 = zext i32 %tmp12 to i64
  %9 = mul i64 %8, %tmp13
  %vla14 = alloca i8, i64 %9, align 16
  %tmp15 = bitcast i8* %vla14 to i32*
  %tmp17 = load i32* @n, align 4
  %add18 = add nsw i32 %tmp17, 1
  %tmp19 = zext i32 %add18 to i64
  %10 = mul i64 4, %tmp19
  %tmp20 = load i32* @n, align 4
  %tmp21 = zext i32 %tmp20 to i64
  %11 = mul i64 %10, %tmp21
  %tmp22 = load i32* @n, align 4
  %tmp23 = zext i32 %tmp22 to i64
  %12 = mul i64 %11, %tmp23
  store i32* %tmp15, i32** %r, align 8
  %13 = mul i64 4, %6
  %14 = mul i64 2, %7
  %15 = mul i64 0, %8
  %16 = bitcast i32* %tmp15 to i8*
  %arrayidx = getelementptr inbounds i8* %16, i64 %15
  %17 = bitcast i8* %arrayidx to i32*
  %18 = bitcast i32* %17 to i8*
  %arrayidx24 = getelementptr inbounds i8* %18, i64 %14
  %19 = bitcast i8* %arrayidx24 to i32*
  %20 = bitcast i32* %19 to i8*
  %arrayidx25 = getelementptr inbounds i8* %20, i64 %13
  %21 = bitcast i8* %arrayidx25 to i32*
  %arrayidx26 = getelementptr inbounds i32* %21, i64 5
  store i32 32, i32* %arrayidx26
  %22 = mul i64 4, %6
  %23 = mul i64 3, %7
  %24 = mul i64 1, %8
  %25 = bitcast i32* %tmp15 to i8*
  %arrayidx27 = getelementptr inbounds i8* %25, i64 %24
  %26 = bitcast i8* %arrayidx27 to i32*
  %27 = bitcast i32* %26 to i8*
  %arrayidx28 = getelementptr inbounds i8* %27, i64 %23
  %28 = bitcast i8* %arrayidx28 to i32*
  %29 = bitcast i32* %28 to i8*
  %arrayidx29 = getelementptr inbounds i8* %29, i64 %22
  %30 = bitcast i8* %arrayidx29 to i32*
  %arrayidx30 = getelementptr inbounds i32* %30, i64 5
  store i32 24, i32* %arrayidx30
  %31 = mul i64 2, %6
  %32 = mul i64 2, %7
  %33 = mul i64 2, %8
  %34 = bitcast i32* %tmp15 to i8*
  %arrayidx31 = getelementptr inbounds i8* %34, i64 %33
  %35 = bitcast i8* %arrayidx31 to i32*
  %36 = bitcast i32* %35 to i8*
  %arrayidx32 = getelementptr inbounds i8* %36, i64 %32
  %37 = bitcast i8* %arrayidx32 to i32*
  %38 = bitcast i32* %37 to i8*
  %arrayidx33 = getelementptr inbounds i8* %38, i64 %31
  %39 = bitcast i8* %arrayidx33 to i32*
  %arrayidx34 = getelementptr inbounds i32* %39, i64 5
  store i32 17, i32* %arrayidx34
  %40 = mul i64 2, %6
  %41 = mul i64 2, %7
  %42 = mul i64 3, %8
  %43 = bitcast i32* %tmp15 to i8*
  %arrayidx35 = getelementptr inbounds i8* %43, i64 %42
  %44 = bitcast i8* %arrayidx35 to i32*
  %45 = bitcast i32* %44 to i8*
  %arrayidx36 = getelementptr inbounds i8* %45, i64 %41
  %46 = bitcast i8* %arrayidx36 to i32*
  %47 = bitcast i32* %46 to i8*
  %arrayidx37 = getelementptr inbounds i8* %47, i64 %40
  %48 = bitcast i8* %arrayidx37 to i32*
  %arrayidx38 = getelementptr inbounds i32* %48, i64 4
  store i32 99, i32* %arrayidx38
  %49 = mul i64 4, %10
  %50 = mul i64 2, %11
  %tmp39 = load i32** %r, align 8
  %add.ptr = getelementptr inbounds i32* %tmp39, i64 0
  %51 = bitcast i32* %add.ptr to i8*
  %arrayidx40 = getelementptr inbounds i8* %51, i64 %50
  %52 = bitcast i8* %arrayidx40 to i32*
  %53 = bitcast i32* %52 to i8*
  %arrayidx41 = getelementptr inbounds i8* %53, i64 %49
  %54 = bitcast i8* %arrayidx41 to i32*
  %arrayidx42 = getelementptr inbounds i32* %54, i64 5
  %tmp43 = load i32* %arrayidx42
  %call = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([27 x i8]* @.str, i32 0, i32 0), i32 %tmp43)
  %55 = mul i64 4, %10
  %56 = mul i64 3, %11
  %tmp44 = load i32** %r, align 8
  %add.ptr45 = getelementptr inbounds i32* %tmp44, i64 6
  %57 = bitcast i32* %add.ptr45 to i8*
  %arrayidx46 = getelementptr inbounds i8* %57, i64 %56
  %58 = bitcast i8* %arrayidx46 to i32*
  %59 = bitcast i32* %58 to i8*
  %arrayidx47 = getelementptr inbounds i8* %59, i64 %55
  %60 = bitcast i8* %arrayidx47 to i32*
  %arrayidx48 = getelementptr inbounds i32* %60, i64 5
  %tmp49 = load i32* %arrayidx48
  %call50 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([27 x i8]* @.str1, i32 0, i32 0), i32 %tmp49)
  %61 = mul i64 2, %10
  %62 = mul i64 2, %11
  %tmp51 = load i32** %r, align 8
  %add.ptr52 = getelementptr inbounds i32* %tmp51, i64 12
  %63 = bitcast i32* %add.ptr52 to i8*
  %arrayidx53 = getelementptr inbounds i8* %63, i64 %62
  %64 = bitcast i8* %arrayidx53 to i32*
  %65 = bitcast i32* %64 to i8*
  %arrayidx54 = getelementptr inbounds i8* %65, i64 %61
  %66 = bitcast i8* %arrayidx54 to i32*
  %arrayidx55 = getelementptr inbounds i32* %66, i64 5
  %tmp56 = load i32* %arrayidx55
  %call57 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([27 x i8]* @.str2, i32 0, i32 0), i32 %tmp56)
  %67 = mul i64 2, %10
  %68 = mul i64 2, %11
  %tmp58 = load i32** %r, align 8
  %add.ptr59 = getelementptr inbounds i32* %tmp58, i64 18
  %69 = bitcast i32* %add.ptr59 to i8*
  %arrayidx60 = getelementptr inbounds i8* %69, i64 %68
  %70 = bitcast i8* %arrayidx60 to i32*
  %71 = bitcast i32* %70 to i8*
  %arrayidx61 = getelementptr inbounds i8* %71, i64 %67
  %72 = bitcast i8* %arrayidx61 to i32*
  %arrayidx62 = getelementptr inbounds i32* %72, i64 4
  %tmp63 = load i32* %arrayidx62
  %call64 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([27 x i8]* @.str3, i32 0, i32 0), i32 %tmp63)
  store i32 0, i32* %retval
  store i32 1, i32* %cleanup.dest.slot
  %tmp65 = load i8** %saved_stack
  call void @llvm.stackrestore(i8* %tmp65)
  %73 = load i32* %retval
  ret i32 %73
}

declare i8* @llvm.stacksave() nounwind

declare i32 @printf(i8*, ...)

declare void @llvm.stackrestore(i8*) nounwind
