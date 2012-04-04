; ModuleID = '/home/grosu/celliso2/c-semantics/tests/unitTests/structsAndArrays.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

%struct.S = type { i32, i32, [6 x i32], %struct.T }
%struct.T = type { i32, [8 x i32] }

@.str = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1
@main.s = internal unnamed_addr constant %struct.S { i32 6, i32 12, [6 x i32] [i32 1, i32 2, i32 3, i32 4, i32 5, i32 6], %struct.T { i32 7, [8 x i32] [i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15] } }, align 4

define void @foo(%struct.S* %s) nounwind uwtable {
entry:
  %a = getelementptr inbounds %struct.S* %s, i64 0, i32 0
  %tmp1 = load i32* %a, align 4
  %call = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i64 0, i64 0), i32 %tmp1) nounwind
  %b = getelementptr inbounds %struct.S* %s, i64 0, i32 1
  %tmp3 = load i32* %b, align 4
  %call4 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i64 0, i64 0), i32 %tmp3) nounwind
  %arrayidx = getelementptr inbounds %struct.S* %s, i64 0, i32 2, i64 0
  %tmp6 = load i32* %arrayidx, align 4
  %call7 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i64 0, i64 0), i32 %tmp6) nounwind
  %arrayidx10 = getelementptr inbounds %struct.S* %s, i64 0, i32 2, i64 1
  %tmp11 = load i32* %arrayidx10, align 4
  %call12 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i64 0, i64 0), i32 %tmp11) nounwind
  %arrayidx15 = getelementptr inbounds %struct.S* %s, i64 0, i32 2, i64 2
  %tmp16 = load i32* %arrayidx15, align 4
  %call17 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i64 0, i64 0), i32 %tmp16) nounwind
  %arrayidx20 = getelementptr inbounds %struct.S* %s, i64 0, i32 2, i64 3
  %tmp21 = load i32* %arrayidx20, align 4
  %call22 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i64 0, i64 0), i32 %tmp21) nounwind
  %arrayidx25 = getelementptr inbounds %struct.S* %s, i64 0, i32 2, i64 4
  %tmp26 = load i32* %arrayidx25, align 4
  %call27 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i64 0, i64 0), i32 %tmp26) nounwind
  %arrayidx30 = getelementptr inbounds %struct.S* %s, i64 0, i32 2, i64 5
  %tmp31 = load i32* %arrayidx30, align 4
  %call32 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i64 0, i64 0), i32 %tmp31) nounwind
  %t = getelementptr inbounds %struct.S* %s, i64 0, i32 3, i32 0
  %tmp34 = load i32* %t, align 4
  %call35 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i64 0, i64 0), i32 %tmp34) nounwind
  %arrayidx38 = getelementptr inbounds %struct.S* %s, i64 0, i32 3, i32 1, i64 0
  %tmp39 = load i32* %arrayidx38, align 4
  %call40 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i64 0, i64 0), i32 %tmp39) nounwind
  %arrayidx44 = getelementptr inbounds %struct.S* %s, i64 0, i32 3, i32 1, i64 1
  %tmp45 = load i32* %arrayidx44, align 4
  %call46 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i64 0, i64 0), i32 %tmp45) nounwind
  %arrayidx50 = getelementptr inbounds %struct.S* %s, i64 0, i32 3, i32 1, i64 2
  %tmp51 = load i32* %arrayidx50, align 4
  %call52 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i64 0, i64 0), i32 %tmp51) nounwind
  %arrayidx56 = getelementptr inbounds %struct.S* %s, i64 0, i32 3, i32 1, i64 3
  %tmp57 = load i32* %arrayidx56, align 4
  %call58 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i64 0, i64 0), i32 %tmp57) nounwind
  %arrayidx62 = getelementptr inbounds %struct.S* %s, i64 0, i32 3, i32 1, i64 4
  %tmp63 = load i32* %arrayidx62, align 4
  %call64 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i64 0, i64 0), i32 %tmp63) nounwind
  %arrayidx68 = getelementptr inbounds %struct.S* %s, i64 0, i32 3, i32 1, i64 5
  %tmp69 = load i32* %arrayidx68, align 4
  %call70 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i64 0, i64 0), i32 %tmp69) nounwind
  %arrayidx74 = getelementptr inbounds %struct.S* %s, i64 0, i32 3, i32 1, i64 6
  %tmp75 = load i32* %arrayidx74, align 4
  %call76 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i64 0, i64 0), i32 %tmp75) nounwind
  %arrayidx80 = getelementptr inbounds %struct.S* %s, i64 0, i32 3, i32 1, i64 7
  %tmp81 = load i32* %arrayidx80, align 4
  %call82 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i64 0, i64 0), i32 %tmp81) nounwind
  %tmp87 = load i32* %b, align 4
  %tmp91 = load i32* %a, align 4
  store i32 %tmp87, i32* %a, align 4
  store i32 %tmp91, i32* %b, align 4
  %0 = bitcast i32* %arrayidx to i8*
  call void @llvm.memset.p0i8.i64(i8* %0, i8 0, i64 24, i32 4, i1 false)
  ret void
}

declare i32 @printf(i8* nocapture, ...) nounwind

declare void @llvm.memset.p0i8.i64(i8* nocapture, i8, i64, i32, i1) nounwind

declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture, i64, i32, i1) nounwind

define i32 @main() nounwind uwtable {
entry:
  %s = alloca %struct.S, align 4
  %tmp = bitcast %struct.S* %s to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %tmp, i8* bitcast (%struct.S* @main.s to i8*), i64 68, i32 4, i1 false)
  call void @foo(%struct.S* %s)
  %a = getelementptr inbounds %struct.S* %s, i64 0, i32 0
  %tmp1 = load i32* %a, align 4
  %call = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i64 0, i64 0), i32 %tmp1) nounwind
  %b = getelementptr inbounds %struct.S* %s, i64 0, i32 1
  %tmp2 = load i32* %b, align 4
  %call3 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i64 0, i64 0), i32 %tmp2) nounwind
  %arrayidx = getelementptr inbounds %struct.S* %s, i64 0, i32 2, i64 0
  %tmp4 = load i32* %arrayidx, align 4
  %call5 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i64 0, i64 0), i32 %tmp4) nounwind
  %arrayidx7 = getelementptr inbounds %struct.S* %s, i64 0, i32 2, i64 1
  %tmp8 = load i32* %arrayidx7, align 4
  %call9 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i64 0, i64 0), i32 %tmp8) nounwind
  %arrayidx11 = getelementptr inbounds %struct.S* %s, i64 0, i32 2, i64 2
  %tmp12 = load i32* %arrayidx11, align 4
  %call13 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i64 0, i64 0), i32 %tmp12) nounwind
  %arrayidx15 = getelementptr inbounds %struct.S* %s, i64 0, i32 2, i64 3
  %tmp16 = load i32* %arrayidx15, align 4
  %call17 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i64 0, i64 0), i32 %tmp16) nounwind
  %arrayidx19 = getelementptr inbounds %struct.S* %s, i64 0, i32 2, i64 4
  %tmp20 = load i32* %arrayidx19, align 4
  %call21 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i64 0, i64 0), i32 %tmp20) nounwind
  %arrayidx23 = getelementptr inbounds %struct.S* %s, i64 0, i32 2, i64 5
  %tmp24 = load i32* %arrayidx23, align 4
  %call25 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i64 0, i64 0), i32 %tmp24) nounwind
  %t = getelementptr inbounds %struct.S* %s, i64 0, i32 3, i32 0
  %tmp26 = load i32* %t, align 4
  %call27 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i64 0, i64 0), i32 %tmp26) nounwind
  %arrayidx29 = getelementptr inbounds %struct.S* %s, i64 0, i32 3, i32 1, i64 0
  %tmp30 = load i32* %arrayidx29, align 4
  %call31 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i64 0, i64 0), i32 %tmp30) nounwind
  %arrayidx34 = getelementptr inbounds %struct.S* %s, i64 0, i32 3, i32 1, i64 1
  %tmp35 = load i32* %arrayidx34, align 4
  %call36 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i64 0, i64 0), i32 %tmp35) nounwind
  %arrayidx39 = getelementptr inbounds %struct.S* %s, i64 0, i32 3, i32 1, i64 2
  %tmp40 = load i32* %arrayidx39, align 4
  %call41 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i64 0, i64 0), i32 %tmp40) nounwind
  %arrayidx44 = getelementptr inbounds %struct.S* %s, i64 0, i32 3, i32 1, i64 3
  %tmp45 = load i32* %arrayidx44, align 4
  %call46 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i64 0, i64 0), i32 %tmp45) nounwind
  %arrayidx49 = getelementptr inbounds %struct.S* %s, i64 0, i32 3, i32 1, i64 4
  %tmp50 = load i32* %arrayidx49, align 4
  %call51 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i64 0, i64 0), i32 %tmp50) nounwind
  %arrayidx54 = getelementptr inbounds %struct.S* %s, i64 0, i32 3, i32 1, i64 5
  %tmp55 = load i32* %arrayidx54, align 4
  %call56 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i64 0, i64 0), i32 %tmp55) nounwind
  %arrayidx59 = getelementptr inbounds %struct.S* %s, i64 0, i32 3, i32 1, i64 6
  %tmp60 = load i32* %arrayidx59, align 4
  %call61 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i64 0, i64 0), i32 %tmp60) nounwind
  %arrayidx64 = getelementptr inbounds %struct.S* %s, i64 0, i32 3, i32 1, i64 7
  %tmp65 = load i32* %arrayidx64, align 4
  %call66 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i64 0, i64 0), i32 %tmp65) nounwind
  ret i32 0
}
