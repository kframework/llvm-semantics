; ModuleID = '/home/grosu/celliso2/c-semantics/tests/unitTests/structsAndArrays.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

%struct.S = type { i32, i32, [6 x i32], %struct.T }
%struct.T = type { i32, [8 x i32] }

@.str = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1
@main.s = internal unnamed_addr constant %struct.S { i32 6, i32 12, [6 x i32] [i32 1, i32 2, i32 3, i32 4, i32 5, i32 6], %struct.T { i32 7, [8 x i32] [i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15] } }, align 4

define void @foo(%struct.S* %s) nounwind uwtable {
entry:
  %s.addr = alloca %struct.S*, align 8
  %.compoundliteral = alloca %struct.S, align 4
  store %struct.S* %s, %struct.S** %s.addr, align 8
  %tmp = load %struct.S** %s.addr, align 8
  %a = getelementptr inbounds %struct.S* %tmp, i32 0, i32 0
  %tmp1 = load i32* %a, align 4
  %call = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i32 0, i32 0), i32 %tmp1)
  %tmp2 = load %struct.S** %s.addr, align 8
  %b = getelementptr inbounds %struct.S* %tmp2, i32 0, i32 1
  %tmp3 = load i32* %b, align 4
  %call4 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i32 0, i32 0), i32 %tmp3)
  %tmp5 = load %struct.S** %s.addr, align 8
  %c = getelementptr inbounds %struct.S* %tmp5, i32 0, i32 2
  %arrayidx = getelementptr inbounds [6 x i32]* %c, i32 0, i64 0
  %tmp6 = load i32* %arrayidx, align 4
  %call7 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i32 0, i32 0), i32 %tmp6)
  %tmp8 = load %struct.S** %s.addr, align 8
  %c9 = getelementptr inbounds %struct.S* %tmp8, i32 0, i32 2
  %arrayidx10 = getelementptr inbounds [6 x i32]* %c9, i32 0, i64 1
  %tmp11 = load i32* %arrayidx10, align 4
  %call12 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i32 0, i32 0), i32 %tmp11)
  %tmp13 = load %struct.S** %s.addr, align 8
  %c14 = getelementptr inbounds %struct.S* %tmp13, i32 0, i32 2
  %arrayidx15 = getelementptr inbounds [6 x i32]* %c14, i32 0, i64 2
  %tmp16 = load i32* %arrayidx15, align 4
  %call17 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i32 0, i32 0), i32 %tmp16)
  %tmp18 = load %struct.S** %s.addr, align 8
  %c19 = getelementptr inbounds %struct.S* %tmp18, i32 0, i32 2
  %arrayidx20 = getelementptr inbounds [6 x i32]* %c19, i32 0, i64 3
  %tmp21 = load i32* %arrayidx20, align 4
  %call22 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i32 0, i32 0), i32 %tmp21)
  %tmp23 = load %struct.S** %s.addr, align 8
  %c24 = getelementptr inbounds %struct.S* %tmp23, i32 0, i32 2
  %arrayidx25 = getelementptr inbounds [6 x i32]* %c24, i32 0, i64 4
  %tmp26 = load i32* %arrayidx25, align 4
  %call27 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i32 0, i32 0), i32 %tmp26)
  %tmp28 = load %struct.S** %s.addr, align 8
  %c29 = getelementptr inbounds %struct.S* %tmp28, i32 0, i32 2
  %arrayidx30 = getelementptr inbounds [6 x i32]* %c29, i32 0, i64 5
  %tmp31 = load i32* %arrayidx30, align 4
  %call32 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i32 0, i32 0), i32 %tmp31)
  %tmp33 = load %struct.S** %s.addr, align 8
  %d = getelementptr inbounds %struct.S* %tmp33, i32 0, i32 3
  %t = getelementptr inbounds %struct.T* %d, i32 0, i32 0
  %tmp34 = load i32* %t, align 4
  %call35 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i32 0, i32 0), i32 %tmp34)
  %tmp36 = load %struct.S** %s.addr, align 8
  %d37 = getelementptr inbounds %struct.S* %tmp36, i32 0, i32 3
  %r = getelementptr inbounds %struct.T* %d37, i32 0, i32 1
  %arrayidx38 = getelementptr inbounds [8 x i32]* %r, i32 0, i64 0
  %tmp39 = load i32* %arrayidx38, align 4
  %call40 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i32 0, i32 0), i32 %tmp39)
  %tmp41 = load %struct.S** %s.addr, align 8
  %d42 = getelementptr inbounds %struct.S* %tmp41, i32 0, i32 3
  %r43 = getelementptr inbounds %struct.T* %d42, i32 0, i32 1
  %arrayidx44 = getelementptr inbounds [8 x i32]* %r43, i32 0, i64 1
  %tmp45 = load i32* %arrayidx44, align 4
  %call46 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i32 0, i32 0), i32 %tmp45)
  %tmp47 = load %struct.S** %s.addr, align 8
  %d48 = getelementptr inbounds %struct.S* %tmp47, i32 0, i32 3
  %r49 = getelementptr inbounds %struct.T* %d48, i32 0, i32 1
  %arrayidx50 = getelementptr inbounds [8 x i32]* %r49, i32 0, i64 2
  %tmp51 = load i32* %arrayidx50, align 4
  %call52 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i32 0, i32 0), i32 %tmp51)
  %tmp53 = load %struct.S** %s.addr, align 8
  %d54 = getelementptr inbounds %struct.S* %tmp53, i32 0, i32 3
  %r55 = getelementptr inbounds %struct.T* %d54, i32 0, i32 1
  %arrayidx56 = getelementptr inbounds [8 x i32]* %r55, i32 0, i64 3
  %tmp57 = load i32* %arrayidx56, align 4
  %call58 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i32 0, i32 0), i32 %tmp57)
  %tmp59 = load %struct.S** %s.addr, align 8
  %d60 = getelementptr inbounds %struct.S* %tmp59, i32 0, i32 3
  %r61 = getelementptr inbounds %struct.T* %d60, i32 0, i32 1
  %arrayidx62 = getelementptr inbounds [8 x i32]* %r61, i32 0, i64 4
  %tmp63 = load i32* %arrayidx62, align 4
  %call64 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i32 0, i32 0), i32 %tmp63)
  %tmp65 = load %struct.S** %s.addr, align 8
  %d66 = getelementptr inbounds %struct.S* %tmp65, i32 0, i32 3
  %r67 = getelementptr inbounds %struct.T* %d66, i32 0, i32 1
  %arrayidx68 = getelementptr inbounds [8 x i32]* %r67, i32 0, i64 5
  %tmp69 = load i32* %arrayidx68, align 4
  %call70 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i32 0, i32 0), i32 %tmp69)
  %tmp71 = load %struct.S** %s.addr, align 8
  %d72 = getelementptr inbounds %struct.S* %tmp71, i32 0, i32 3
  %r73 = getelementptr inbounds %struct.T* %d72, i32 0, i32 1
  %arrayidx74 = getelementptr inbounds [8 x i32]* %r73, i32 0, i64 6
  %tmp75 = load i32* %arrayidx74, align 4
  %call76 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i32 0, i32 0), i32 %tmp75)
  %tmp77 = load %struct.S** %s.addr, align 8
  %d78 = getelementptr inbounds %struct.S* %tmp77, i32 0, i32 3
  %r79 = getelementptr inbounds %struct.T* %d78, i32 0, i32 1
  %arrayidx80 = getelementptr inbounds [8 x i32]* %r79, i32 0, i64 7
  %tmp81 = load i32* %arrayidx80, align 4
  %call82 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i32 0, i32 0), i32 %tmp81)
  %tmp83 = load %struct.S** %s.addr, align 8
  %a84 = getelementptr inbounds %struct.S* %.compoundliteral, i32 0, i32 0
  %tmp85 = load %struct.S** %s.addr, align 8
  %b86 = getelementptr inbounds %struct.S* %tmp85, i32 0, i32 1
  %tmp87 = load i32* %b86, align 4
  store i32 %tmp87, i32* %a84, align 4
  %b88 = getelementptr inbounds %struct.S* %.compoundliteral, i32 0, i32 1
  %tmp89 = load %struct.S** %s.addr, align 8
  %a90 = getelementptr inbounds %struct.S* %tmp89, i32 0, i32 0
  %tmp91 = load i32* %a90, align 4
  store i32 %tmp91, i32* %b88, align 4
  %c92 = getelementptr inbounds %struct.S* %.compoundliteral, i32 0, i32 2
  %0 = bitcast [6 x i32]* %c92 to i8*
  call void @llvm.memset.p0i8.i64(i8* %0, i8 0, i64 24, i32 4, i1 false)
  %d93 = getelementptr inbounds %struct.S* %.compoundliteral, i32 0, i32 3
  %tmp94 = load %struct.S** %s.addr, align 8
  %d95 = getelementptr inbounds %struct.S* %tmp94, i32 0, i32 3
  %tmp96 = bitcast %struct.T* %d93 to i8*
  %tmp97 = bitcast %struct.T* %d95 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %tmp96, i8* %tmp97, i64 36, i32 4, i1 false)
  %tmp98 = bitcast %struct.S* %tmp83 to i8*
  %tmp99 = bitcast %struct.S* %.compoundliteral to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %tmp98, i8* %tmp99, i64 68, i32 4, i1 false)
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
  %tmp = bitcast %struct.S* %s to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %tmp, i8* bitcast (%struct.S* @main.s to i8*), i64 68, i32 4, i1 false)
  call void @foo(%struct.S* %s)
  %a = getelementptr inbounds %struct.S* %s, i32 0, i32 0
  %tmp1 = load i32* %a, align 4
  %call = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i32 0, i32 0), i32 %tmp1)
  %b = getelementptr inbounds %struct.S* %s, i32 0, i32 1
  %tmp2 = load i32* %b, align 4
  %call3 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i32 0, i32 0), i32 %tmp2)
  %c = getelementptr inbounds %struct.S* %s, i32 0, i32 2
  %arrayidx = getelementptr inbounds [6 x i32]* %c, i32 0, i64 0
  %tmp4 = load i32* %arrayidx, align 4
  %call5 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i32 0, i32 0), i32 %tmp4)
  %c6 = getelementptr inbounds %struct.S* %s, i32 0, i32 2
  %arrayidx7 = getelementptr inbounds [6 x i32]* %c6, i32 0, i64 1
  %tmp8 = load i32* %arrayidx7, align 4
  %call9 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i32 0, i32 0), i32 %tmp8)
  %c10 = getelementptr inbounds %struct.S* %s, i32 0, i32 2
  %arrayidx11 = getelementptr inbounds [6 x i32]* %c10, i32 0, i64 2
  %tmp12 = load i32* %arrayidx11, align 4
  %call13 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i32 0, i32 0), i32 %tmp12)
  %c14 = getelementptr inbounds %struct.S* %s, i32 0, i32 2
  %arrayidx15 = getelementptr inbounds [6 x i32]* %c14, i32 0, i64 3
  %tmp16 = load i32* %arrayidx15, align 4
  %call17 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i32 0, i32 0), i32 %tmp16)
  %c18 = getelementptr inbounds %struct.S* %s, i32 0, i32 2
  %arrayidx19 = getelementptr inbounds [6 x i32]* %c18, i32 0, i64 4
  %tmp20 = load i32* %arrayidx19, align 4
  %call21 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i32 0, i32 0), i32 %tmp20)
  %c22 = getelementptr inbounds %struct.S* %s, i32 0, i32 2
  %arrayidx23 = getelementptr inbounds [6 x i32]* %c22, i32 0, i64 5
  %tmp24 = load i32* %arrayidx23, align 4
  %call25 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i32 0, i32 0), i32 %tmp24)
  %d = getelementptr inbounds %struct.S* %s, i32 0, i32 3
  %t = getelementptr inbounds %struct.T* %d, i32 0, i32 0
  %tmp26 = load i32* %t, align 4
  %call27 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i32 0, i32 0), i32 %tmp26)
  %d28 = getelementptr inbounds %struct.S* %s, i32 0, i32 3
  %r = getelementptr inbounds %struct.T* %d28, i32 0, i32 1
  %arrayidx29 = getelementptr inbounds [8 x i32]* %r, i32 0, i64 0
  %tmp30 = load i32* %arrayidx29, align 4
  %call31 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i32 0, i32 0), i32 %tmp30)
  %d32 = getelementptr inbounds %struct.S* %s, i32 0, i32 3
  %r33 = getelementptr inbounds %struct.T* %d32, i32 0, i32 1
  %arrayidx34 = getelementptr inbounds [8 x i32]* %r33, i32 0, i64 1
  %tmp35 = load i32* %arrayidx34, align 4
  %call36 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i32 0, i32 0), i32 %tmp35)
  %d37 = getelementptr inbounds %struct.S* %s, i32 0, i32 3
  %r38 = getelementptr inbounds %struct.T* %d37, i32 0, i32 1
  %arrayidx39 = getelementptr inbounds [8 x i32]* %r38, i32 0, i64 2
  %tmp40 = load i32* %arrayidx39, align 4
  %call41 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i32 0, i32 0), i32 %tmp40)
  %d42 = getelementptr inbounds %struct.S* %s, i32 0, i32 3
  %r43 = getelementptr inbounds %struct.T* %d42, i32 0, i32 1
  %arrayidx44 = getelementptr inbounds [8 x i32]* %r43, i32 0, i64 3
  %tmp45 = load i32* %arrayidx44, align 4
  %call46 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i32 0, i32 0), i32 %tmp45)
  %d47 = getelementptr inbounds %struct.S* %s, i32 0, i32 3
  %r48 = getelementptr inbounds %struct.T* %d47, i32 0, i32 1
  %arrayidx49 = getelementptr inbounds [8 x i32]* %r48, i32 0, i64 4
  %tmp50 = load i32* %arrayidx49, align 4
  %call51 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i32 0, i32 0), i32 %tmp50)
  %d52 = getelementptr inbounds %struct.S* %s, i32 0, i32 3
  %r53 = getelementptr inbounds %struct.T* %d52, i32 0, i32 1
  %arrayidx54 = getelementptr inbounds [8 x i32]* %r53, i32 0, i64 5
  %tmp55 = load i32* %arrayidx54, align 4
  %call56 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i32 0, i32 0), i32 %tmp55)
  %d57 = getelementptr inbounds %struct.S* %s, i32 0, i32 3
  %r58 = getelementptr inbounds %struct.T* %d57, i32 0, i32 1
  %arrayidx59 = getelementptr inbounds [8 x i32]* %r58, i32 0, i64 6
  %tmp60 = load i32* %arrayidx59, align 4
  %call61 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i32 0, i32 0), i32 %tmp60)
  %d62 = getelementptr inbounds %struct.S* %s, i32 0, i32 3
  %r63 = getelementptr inbounds %struct.T* %d62, i32 0, i32 1
  %arrayidx64 = getelementptr inbounds [8 x i32]* %r63, i32 0, i64 7
  %tmp65 = load i32* %arrayidx64, align 4
  %call66 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i32 0, i32 0), i32 %tmp65)
  ret i32 0
}
