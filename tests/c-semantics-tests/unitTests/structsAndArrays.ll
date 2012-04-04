; ModuleID = '/home/david/src/c-semantics/tests/unitTests/structsAndArrays.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.S = type { i32, i32, [6 x i32], %struct.T }
%struct.T = type { i32, [8 x i32] }

@.str = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1
@main.s = private unnamed_addr constant %struct.S { i32 6, i32 12, [6 x i32] [i32 1, i32 2, i32 3, i32 4, i32 5, i32 6], %struct.T { i32 7, [8 x i32] [i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15] } }, align 4

define void @foo(%struct.S* %s) nounwind uwtable {
entry:
  %s.addr = alloca %struct.S*, align 8
  %.compoundliteral = alloca %struct.S, align 4
  store %struct.S* %s, %struct.S** %s.addr, align 8
  %0 = load %struct.S** %s.addr, align 8
  %a = getelementptr inbounds %struct.S* %0, i32 0, i32 0
  %1 = load i32* %a, align 4
  %call = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i32 0, i32 0), i32 %1)
  %2 = load %struct.S** %s.addr, align 8
  %b = getelementptr inbounds %struct.S* %2, i32 0, i32 1
  %3 = load i32* %b, align 4
  %call1 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i32 0, i32 0), i32 %3)
  %4 = load %struct.S** %s.addr, align 8
  %c = getelementptr inbounds %struct.S* %4, i32 0, i32 2
  %arrayidx = getelementptr inbounds [6 x i32]* %c, i32 0, i64 0
  %5 = load i32* %arrayidx, align 4
  %call2 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i32 0, i32 0), i32 %5)
  %6 = load %struct.S** %s.addr, align 8
  %c3 = getelementptr inbounds %struct.S* %6, i32 0, i32 2
  %arrayidx4 = getelementptr inbounds [6 x i32]* %c3, i32 0, i64 1
  %7 = load i32* %arrayidx4, align 4
  %call5 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i32 0, i32 0), i32 %7)
  %8 = load %struct.S** %s.addr, align 8
  %c6 = getelementptr inbounds %struct.S* %8, i32 0, i32 2
  %arrayidx7 = getelementptr inbounds [6 x i32]* %c6, i32 0, i64 2
  %9 = load i32* %arrayidx7, align 4
  %call8 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i32 0, i32 0), i32 %9)
  %10 = load %struct.S** %s.addr, align 8
  %c9 = getelementptr inbounds %struct.S* %10, i32 0, i32 2
  %arrayidx10 = getelementptr inbounds [6 x i32]* %c9, i32 0, i64 3
  %11 = load i32* %arrayidx10, align 4
  %call11 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i32 0, i32 0), i32 %11)
  %12 = load %struct.S** %s.addr, align 8
  %c12 = getelementptr inbounds %struct.S* %12, i32 0, i32 2
  %arrayidx13 = getelementptr inbounds [6 x i32]* %c12, i32 0, i64 4
  %13 = load i32* %arrayidx13, align 4
  %call14 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i32 0, i32 0), i32 %13)
  %14 = load %struct.S** %s.addr, align 8
  %c15 = getelementptr inbounds %struct.S* %14, i32 0, i32 2
  %arrayidx16 = getelementptr inbounds [6 x i32]* %c15, i32 0, i64 5
  %15 = load i32* %arrayidx16, align 4
  %call17 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i32 0, i32 0), i32 %15)
  %16 = load %struct.S** %s.addr, align 8
  %d = getelementptr inbounds %struct.S* %16, i32 0, i32 3
  %t = getelementptr inbounds %struct.T* %d, i32 0, i32 0
  %17 = load i32* %t, align 4
  %call18 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i32 0, i32 0), i32 %17)
  %18 = load %struct.S** %s.addr, align 8
  %d19 = getelementptr inbounds %struct.S* %18, i32 0, i32 3
  %r = getelementptr inbounds %struct.T* %d19, i32 0, i32 1
  %arrayidx20 = getelementptr inbounds [8 x i32]* %r, i32 0, i64 0
  %19 = load i32* %arrayidx20, align 4
  %call21 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i32 0, i32 0), i32 %19)
  %20 = load %struct.S** %s.addr, align 8
  %d22 = getelementptr inbounds %struct.S* %20, i32 0, i32 3
  %r23 = getelementptr inbounds %struct.T* %d22, i32 0, i32 1
  %arrayidx24 = getelementptr inbounds [8 x i32]* %r23, i32 0, i64 1
  %21 = load i32* %arrayidx24, align 4
  %call25 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i32 0, i32 0), i32 %21)
  %22 = load %struct.S** %s.addr, align 8
  %d26 = getelementptr inbounds %struct.S* %22, i32 0, i32 3
  %r27 = getelementptr inbounds %struct.T* %d26, i32 0, i32 1
  %arrayidx28 = getelementptr inbounds [8 x i32]* %r27, i32 0, i64 2
  %23 = load i32* %arrayidx28, align 4
  %call29 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i32 0, i32 0), i32 %23)
  %24 = load %struct.S** %s.addr, align 8
  %d30 = getelementptr inbounds %struct.S* %24, i32 0, i32 3
  %r31 = getelementptr inbounds %struct.T* %d30, i32 0, i32 1
  %arrayidx32 = getelementptr inbounds [8 x i32]* %r31, i32 0, i64 3
  %25 = load i32* %arrayidx32, align 4
  %call33 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i32 0, i32 0), i32 %25)
  %26 = load %struct.S** %s.addr, align 8
  %d34 = getelementptr inbounds %struct.S* %26, i32 0, i32 3
  %r35 = getelementptr inbounds %struct.T* %d34, i32 0, i32 1
  %arrayidx36 = getelementptr inbounds [8 x i32]* %r35, i32 0, i64 4
  %27 = load i32* %arrayidx36, align 4
  %call37 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i32 0, i32 0), i32 %27)
  %28 = load %struct.S** %s.addr, align 8
  %d38 = getelementptr inbounds %struct.S* %28, i32 0, i32 3
  %r39 = getelementptr inbounds %struct.T* %d38, i32 0, i32 1
  %arrayidx40 = getelementptr inbounds [8 x i32]* %r39, i32 0, i64 5
  %29 = load i32* %arrayidx40, align 4
  %call41 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i32 0, i32 0), i32 %29)
  %30 = load %struct.S** %s.addr, align 8
  %d42 = getelementptr inbounds %struct.S* %30, i32 0, i32 3
  %r43 = getelementptr inbounds %struct.T* %d42, i32 0, i32 1
  %arrayidx44 = getelementptr inbounds [8 x i32]* %r43, i32 0, i64 6
  %31 = load i32* %arrayidx44, align 4
  %call45 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i32 0, i32 0), i32 %31)
  %32 = load %struct.S** %s.addr, align 8
  %d46 = getelementptr inbounds %struct.S* %32, i32 0, i32 3
  %r47 = getelementptr inbounds %struct.T* %d46, i32 0, i32 1
  %arrayidx48 = getelementptr inbounds [8 x i32]* %r47, i32 0, i64 7
  %33 = load i32* %arrayidx48, align 4
  %call49 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i32 0, i32 0), i32 %33)
  %34 = load %struct.S** %s.addr, align 8
  %a50 = getelementptr inbounds %struct.S* %.compoundliteral, i32 0, i32 0
  %35 = load %struct.S** %s.addr, align 8
  %b51 = getelementptr inbounds %struct.S* %35, i32 0, i32 1
  %36 = load i32* %b51, align 4
  store i32 %36, i32* %a50, align 4
  %b52 = getelementptr inbounds %struct.S* %.compoundliteral, i32 0, i32 1
  %37 = load %struct.S** %s.addr, align 8
  %a53 = getelementptr inbounds %struct.S* %37, i32 0, i32 0
  %38 = load i32* %a53, align 4
  store i32 %38, i32* %b52, align 4
  %c54 = getelementptr inbounds %struct.S* %.compoundliteral, i32 0, i32 2
  %39 = bitcast [6 x i32]* %c54 to i8*
  call void @llvm.memset.p0i8.i64(i8* %39, i8 0, i64 24, i32 4, i1 false)
  %arrayinit.begin = getelementptr inbounds [6 x i32]* %c54, i64 0, i64 0
  %arrayinit.element = getelementptr inbounds i32* %arrayinit.begin, i64 1
  %arrayinit.element55 = getelementptr inbounds i32* %arrayinit.element, i64 1
  %arrayinit.element56 = getelementptr inbounds i32* %arrayinit.element55, i64 1
  %arrayinit.element57 = getelementptr inbounds i32* %arrayinit.element56, i64 1
  %arrayinit.element58 = getelementptr inbounds i32* %arrayinit.element57, i64 1
  %d59 = getelementptr inbounds %struct.S* %.compoundliteral, i32 0, i32 3
  %40 = load %struct.S** %s.addr, align 8
  %d60 = getelementptr inbounds %struct.S* %40, i32 0, i32 3
  %41 = bitcast %struct.T* %d59 to i8*
  %42 = bitcast %struct.T* %d60 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %41, i8* %42, i64 36, i32 4, i1 false)
  %43 = bitcast %struct.S* %34 to i8*
  %44 = bitcast %struct.S* %.compoundliteral to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %43, i8* %44, i64 68, i32 4, i1 false)
  ret void
}

declare i32 @printf(i8*, ...)

declare void @llvm.memset.p0i8.i64(i8* nocapture, i8, i64, i32, i1) nounwind

declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture, i64, i32, i1) nounwind

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %s = alloca %struct.S, align 4
  store i32 0, i32* %retval
  %0 = bitcast %struct.S* %s to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %0, i8* bitcast (%struct.S* @main.s to i8*), i64 68, i32 4, i1 false)
  call void @foo(%struct.S* %s)
  %a = getelementptr inbounds %struct.S* %s, i32 0, i32 0
  %1 = load i32* %a, align 4
  %call = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i32 0, i32 0), i32 %1)
  %b = getelementptr inbounds %struct.S* %s, i32 0, i32 1
  %2 = load i32* %b, align 4
  %call1 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i32 0, i32 0), i32 %2)
  %c = getelementptr inbounds %struct.S* %s, i32 0, i32 2
  %arrayidx = getelementptr inbounds [6 x i32]* %c, i32 0, i64 0
  %3 = load i32* %arrayidx, align 4
  %call2 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i32 0, i32 0), i32 %3)
  %c3 = getelementptr inbounds %struct.S* %s, i32 0, i32 2
  %arrayidx4 = getelementptr inbounds [6 x i32]* %c3, i32 0, i64 1
  %4 = load i32* %arrayidx4, align 4
  %call5 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i32 0, i32 0), i32 %4)
  %c6 = getelementptr inbounds %struct.S* %s, i32 0, i32 2
  %arrayidx7 = getelementptr inbounds [6 x i32]* %c6, i32 0, i64 2
  %5 = load i32* %arrayidx7, align 4
  %call8 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i32 0, i32 0), i32 %5)
  %c9 = getelementptr inbounds %struct.S* %s, i32 0, i32 2
  %arrayidx10 = getelementptr inbounds [6 x i32]* %c9, i32 0, i64 3
  %6 = load i32* %arrayidx10, align 4
  %call11 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i32 0, i32 0), i32 %6)
  %c12 = getelementptr inbounds %struct.S* %s, i32 0, i32 2
  %arrayidx13 = getelementptr inbounds [6 x i32]* %c12, i32 0, i64 4
  %7 = load i32* %arrayidx13, align 4
  %call14 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i32 0, i32 0), i32 %7)
  %c15 = getelementptr inbounds %struct.S* %s, i32 0, i32 2
  %arrayidx16 = getelementptr inbounds [6 x i32]* %c15, i32 0, i64 5
  %8 = load i32* %arrayidx16, align 4
  %call17 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i32 0, i32 0), i32 %8)
  %d = getelementptr inbounds %struct.S* %s, i32 0, i32 3
  %t = getelementptr inbounds %struct.T* %d, i32 0, i32 0
  %9 = load i32* %t, align 4
  %call18 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i32 0, i32 0), i32 %9)
  %d19 = getelementptr inbounds %struct.S* %s, i32 0, i32 3
  %r = getelementptr inbounds %struct.T* %d19, i32 0, i32 1
  %arrayidx20 = getelementptr inbounds [8 x i32]* %r, i32 0, i64 0
  %10 = load i32* %arrayidx20, align 4
  %call21 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i32 0, i32 0), i32 %10)
  %d22 = getelementptr inbounds %struct.S* %s, i32 0, i32 3
  %r23 = getelementptr inbounds %struct.T* %d22, i32 0, i32 1
  %arrayidx24 = getelementptr inbounds [8 x i32]* %r23, i32 0, i64 1
  %11 = load i32* %arrayidx24, align 4
  %call25 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i32 0, i32 0), i32 %11)
  %d26 = getelementptr inbounds %struct.S* %s, i32 0, i32 3
  %r27 = getelementptr inbounds %struct.T* %d26, i32 0, i32 1
  %arrayidx28 = getelementptr inbounds [8 x i32]* %r27, i32 0, i64 2
  %12 = load i32* %arrayidx28, align 4
  %call29 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i32 0, i32 0), i32 %12)
  %d30 = getelementptr inbounds %struct.S* %s, i32 0, i32 3
  %r31 = getelementptr inbounds %struct.T* %d30, i32 0, i32 1
  %arrayidx32 = getelementptr inbounds [8 x i32]* %r31, i32 0, i64 3
  %13 = load i32* %arrayidx32, align 4
  %call33 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i32 0, i32 0), i32 %13)
  %d34 = getelementptr inbounds %struct.S* %s, i32 0, i32 3
  %r35 = getelementptr inbounds %struct.T* %d34, i32 0, i32 1
  %arrayidx36 = getelementptr inbounds [8 x i32]* %r35, i32 0, i64 4
  %14 = load i32* %arrayidx36, align 4
  %call37 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i32 0, i32 0), i32 %14)
  %d38 = getelementptr inbounds %struct.S* %s, i32 0, i32 3
  %r39 = getelementptr inbounds %struct.T* %d38, i32 0, i32 1
  %arrayidx40 = getelementptr inbounds [8 x i32]* %r39, i32 0, i64 5
  %15 = load i32* %arrayidx40, align 4
  %call41 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i32 0, i32 0), i32 %15)
  %d42 = getelementptr inbounds %struct.S* %s, i32 0, i32 3
  %r43 = getelementptr inbounds %struct.T* %d42, i32 0, i32 1
  %arrayidx44 = getelementptr inbounds [8 x i32]* %r43, i32 0, i64 6
  %16 = load i32* %arrayidx44, align 4
  %call45 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i32 0, i32 0), i32 %16)
  %d46 = getelementptr inbounds %struct.S* %s, i32 0, i32 3
  %r47 = getelementptr inbounds %struct.T* %d46, i32 0, i32 1
  %arrayidx48 = getelementptr inbounds [8 x i32]* %r47, i32 0, i64 7
  %17 = load i32* %arrayidx48, align 4
  %call49 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i32 0, i32 0), i32 %17)
  ret i32 0
}
