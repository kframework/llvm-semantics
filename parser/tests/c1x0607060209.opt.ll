; ModuleID = '/home/grosu/celliso2/c-semantics/tests/unitTests/c1x0607060209.ll'
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
  %tmp8 = load i32* @m, align 4
  %tmp9 = zext i32 %tmp8 to i64
  %tmp10 = load i32* @n, align 4
  %tmp11 = zext i32 %tmp10 to i64
  %0 = mul i64 %tmp9, 24
  %1 = mul i64 %0, %tmp11
  %2 = mul i64 %1, %tmp11
  %vla14 = alloca i8, i64 %2, align 16
  %add18 = add nsw i32 %tmp10, 1
  %tmp19 = zext i32 %add18 to i64
  %3 = shl nuw nsw i64 %tmp19, 2
  %4 = mul i64 %3, %tmp11
  %arrayidx24.sum = shl nuw nsw i64 %tmp9, 6
  %arrayidx25.sum1 = or i64 %arrayidx24.sum, 20
  %arrayidx26 = getelementptr inbounds i8* %vla14, i64 %arrayidx25.sum1
  %5 = bitcast i8* %arrayidx26 to i32*
  store i32 32, i32* %5, align 4
  %tmp2 = mul i64 %tmp9, 88
  %arrayidx28.sum = add i64 %1, 20
  %arrayidx29.sum = add i64 %arrayidx28.sum, %tmp2
  %arrayidx30 = getelementptr inbounds i8* %vla14, i64 %arrayidx29.sum
  %6 = bitcast i8* %arrayidx30 to i32*
  store i32 24, i32* %6, align 4
  %7 = shl nuw nsw i64 %tmp9, 3
  %8 = mul i64 %tmp9, 48
  %9 = shl i64 %1, 1
  %arrayidx31.sum = add i64 %7, 20
  %arrayidx32.sum = add i64 %arrayidx31.sum, %8
  %arrayidx33.sum = add i64 %arrayidx32.sum, %9
  %arrayidx34 = getelementptr inbounds i8* %vla14, i64 %arrayidx33.sum
  %10 = bitcast i8* %arrayidx34 to i32*
  store i32 17, i32* %10, align 4
  %11 = mul i64 %1, 3
  %arrayidx35.sum = add i64 %7, 16
  %arrayidx36.sum = add i64 %arrayidx35.sum, %8
  %arrayidx37.sum = add i64 %arrayidx36.sum, %11
  %arrayidx38 = getelementptr inbounds i8* %vla14, i64 %arrayidx37.sum
  %12 = bitcast i8* %arrayidx38 to i32*
  store i32 99, i32* %12, align 8
  %13 = shl nuw nsw i64 %tmp19, 4
  %14 = shl i64 %4, 1
  %arrayidx40.sum = add i64 %13, 20
  %arrayidx41.sum = add i64 %arrayidx40.sum, %14
  %arrayidx42 = getelementptr inbounds i8* %vla14, i64 %arrayidx41.sum
  %15 = bitcast i8* %arrayidx42 to i32*
  %tmp43 = load i32* %15, align 4
  %call = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([27 x i8]* @.str, i64 0, i64 0), i32 %tmp43) nounwind
  %16 = mul i64 %4, 3
  %arrayidx46.sum = add i64 %13, 44
  %add.ptr45.sum = add i64 %arrayidx46.sum, %16
  %arrayidx48 = getelementptr inbounds i8* %vla14, i64 %add.ptr45.sum
  %17 = bitcast i8* %arrayidx48 to i32*
  %tmp49 = load i32* %17, align 4
  %call50 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([27 x i8]* @.str1, i64 0, i64 0), i32 %tmp49) nounwind
  %18 = shl nuw nsw i64 %tmp19, 3
  %arrayidx53.sum = add i64 %14, %18
  %add.ptr52.sum = add i64 %arrayidx53.sum, 68
  %arrayidx55 = getelementptr inbounds i8* %vla14, i64 %add.ptr52.sum
  %19 = bitcast i8* %arrayidx55 to i32*
  %tmp56 = load i32* %19, align 4
  %call57 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([27 x i8]* @.str2, i64 0, i64 0), i32 %tmp56) nounwind
  %add.ptr59.sum = add i64 %arrayidx53.sum, 88
  %arrayidx62 = getelementptr inbounds i8* %vla14, i64 %add.ptr59.sum
  %20 = bitcast i8* %arrayidx62 to i32*
  %tmp63 = load i32* %20, align 4
  %call64 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([27 x i8]* @.str3, i64 0, i64 0), i32 %tmp63) nounwind
  ret i32 0
}

declare i32 @printf(i8* nocapture, ...) nounwind
