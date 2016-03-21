; ModuleID = './passUnionWithBitfield.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%union.U1 = type { i16, [2 x i8] }
%union.U2 = type { i16, [2 x i8] }
%union.U3 = type { i32 }

@u1 = global { i8, i8, [2 x i8] } { i8 123, i8 0, [2 x i8] undef }, align 4
@u2 = global { i8, i8, [2 x i8] } { i8 123, i8 0, [2 x i8] undef }, align 4
@u3 = global { i8, i8, [2 x i8] } { i8 123, i8 0, [2 x i8] undef }, align 4
@.str = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1

; Function Attrs: nounwind uwtable
define i32 @f1(i32 %u.coerce) #0 {
  %1 = alloca %union.U1, align 4
  %u = alloca %union.U1, align 4
  %2 = bitcast %union.U1* %u to i32*
  store i32 %u.coerce, i32* %2, align 4
  %3 = bitcast %union.U1* %1 to i8*
  %4 = bitcast %union.U1* %u to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %3, i8* %4, i64 4, i32 4, i1 false)
  %5 = bitcast %union.U1* %1 to i32*
  %6 = load i32, i32* %5, align 4
  ret i32 %6
}

; Function Attrs: nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture readonly, i64, i32, i1) #1

; Function Attrs: nounwind uwtable
define i32 @f2(i32 %u.coerce) #0 {
  %1 = alloca %union.U2, align 4
  %u = alloca %union.U2, align 4
  %2 = bitcast %union.U2* %u to i32*
  store i32 %u.coerce, i32* %2, align 4
  %3 = bitcast %union.U2* %1 to i8*
  %4 = bitcast %union.U2* %u to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %3, i8* %4, i64 4, i32 4, i1 false)
  %5 = bitcast %union.U2* %1 to i32*
  %6 = load i32, i32* %5, align 4
  ret i32 %6
}

; Function Attrs: nounwind uwtable
define i32 @f3(i32 %u.coerce) #0 {
  %1 = alloca %union.U3, align 4
  %u = alloca %union.U3, align 4
  %2 = getelementptr %union.U3, %union.U3* %u, i32 0, i32 0
  store i32 %u.coerce, i32* %2, align 4
  %3 = bitcast %union.U3* %1 to i8*
  %4 = bitcast %union.U3* %u to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %3, i8* %4, i64 4, i32 4, i1 false)
  %5 = getelementptr %union.U3, %union.U3* %1, i32 0, i32 0
  %6 = load i32, i32* %5, align 4
  ret i32 %6
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca %union.U1, align 4
  %2 = alloca %union.U2, align 4
  %3 = alloca %union.U3, align 4
  %4 = load i32, i32* bitcast ({ i8, i8, [2 x i8] }* @u1 to i32*), align 4
  %5 = call i32 @f1(i32 %4)
  %6 = bitcast %union.U1* %1 to i32*
  store i32 %5, i32* %6, align 4
  %7 = bitcast %union.U1* %1 to i16*
  %8 = load i16, i16* %7
  %9 = shl i16 %8, 3
  %10 = ashr i16 %9, 3
  %11 = sext i16 %10 to i32
  %12 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i32 0, i32 0), i32 %11)
  %13 = load i32, i32* bitcast ({ i8, i8, [2 x i8] }* @u2 to i32*), align 4
  %14 = call i32 @f2(i32 %13)
  %15 = bitcast %union.U2* %2 to i32*
  store i32 %14, i32* %15, align 4
  %16 = bitcast %union.U2* %2 to i16*
  %17 = load i16, i16* %16
  %18 = shl i16 %17, 3
  %19 = ashr i16 %18, 3
  %20 = sext i16 %19 to i32
  %21 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i32 0, i32 0), i32 %20)
  %22 = load i32, i32* getelementptr (%union.U3, %union.U3* bitcast ({ i8, i8, [2 x i8] }* @u3 to %union.U3*), i32 0, i32 0), align 4
  %23 = call i32 @f3(i32 %22)
  %24 = getelementptr %union.U3, %union.U3* %3, i32 0, i32 0
  store i32 %23, i32* %24, align 4
  %25 = bitcast %union.U3* %3 to i16*
  %26 = load i16, i16* %25
  %27 = shl i16 %26, 3
  %28 = ashr i16 %27, 3
  %29 = sext i16 %28 to i32
  %30 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i32 0, i32 0), i32 %29)
  ret i32 0
}

declare i32 @printf(i8*, ...) #2

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind }
attributes #2 = { "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = !{!"Ubuntu clang version 3.7.1-svn253571-1~exp1 (branches/release_37) (based on LLVM 3.7.1)"}
