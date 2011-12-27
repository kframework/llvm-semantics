; ModuleID = '/home/grosu/celliso2/c-semantics/tests/integration/pendulum.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@q = constant double 5.000000e-01, align 8
@b = constant double 9.000000e-01, align 8
@w = constant double 0x3FE5555555555555, align 8
@.str = private unnamed_addr constant [7 x i8] c"%d %d\0A\00", align 1

define i32 @main() nounwind uwtable {
entry:
  %y = alloca [2 x [60 x double]], align 16
  %arrayidx3 = getelementptr inbounds [2 x [60 x double]]* %y, i64 0, i64 0, i64 0
  store double 0.000000e+00, double* %arrayidx3, align 16
  %arrayidx5 = getelementptr inbounds [2 x [60 x double]]* %y, i64 0, i64 1, i64 0
  store double 2.000000e+00, double* %arrayidx5, align 16
  br label %for.body

for.body:                                         ; preds = %for.cond.backedge, %entry
  %tmp21 = phi double [ 2.000000e+00, %entry ], [ %add148, %for.cond.backedge ]
  %tmp16 = phi double [ 0.000000e+00, %entry ], [ %sub176, %for.cond.backedge ]
  %indvar = phi i64 [ 0, %entry ], [ %tmp, %for.cond.backedge ]
  %storemerge1 = trunc i64 %indvar to i32
  %tmp = add i64 %indvar, 1
  %add = trunc i64 %tmp to i32
  %arrayidx153 = getelementptr [2 x [60 x double]]* %y, i64 0, i64 1, i64 %tmp
  %arrayidx133 = getelementptr [2 x [60 x double]]* %y, i64 0, i64 0, i64 %tmp
  %conv11 = sitofp i32 %add to double
  %mul12 = fmul double %conv11, 0x3FE58AD76CCCB8F0
  %mul24 = fmul double %tmp21, 0x3FE58AD76CCCB8F0
  %mul27 = fmul double %tmp21, -5.000000e-01
  %call29 = call double @sin(double %tmp16) nounwind readnone
  %sub30 = fsub double %mul27, %call29
  %mul32 = fmul double %mul12, 0x3FE5555555555555
  %call33 = call double @cos(double %mul32) nounwind readnone
  %mul34 = fmul double %call33, 9.000000e-01
  %add35 = fadd double %sub30, %mul34
  %mul36 = fmul double %add35, 0x3FE58AD76CCCB8F0
  %div40 = fmul double %mul36, 5.000000e-01
  %add41 = fadd double %tmp21, %div40
  %mul42 = fmul double %add41, 0x3FE58AD76CCCB8F0
  %mul48 = fmul double %add41, -5.000000e-01
  %div51 = fmul double %mul24, 5.000000e-01
  %add52 = fadd double %tmp16, %div51
  %call53 = call double @sin(double %add52) nounwind readnone
  %sub54 = fsub double %mul48, %call53
  %add58 = fadd double %mul12, 0x3FD58AD76CCCB8F0
  %mul59 = fmul double %add58, 0x3FE5555555555555
  %call60 = call double @cos(double %mul59) nounwind readnone
  %mul61 = fmul double %call60, 9.000000e-01
  %add62 = fadd double %sub54, %mul61
  %mul63 = fmul double %add62, 0x3FE58AD76CCCB8F0
  %div67 = fmul double %mul63, 5.000000e-01
  %add68 = fadd double %tmp21, %div67
  %mul69 = fmul double %add68, 0x3FE58AD76CCCB8F0
  %mul75 = fmul double %add68, -5.000000e-01
  %div78 = fmul double %mul42, 5.000000e-01
  %add79 = fadd double %tmp16, %div78
  %call80 = call double @sin(double %add79) nounwind readnone
  %sub81 = fsub double %mul75, %call80
  %add89 = fadd double %sub81, %mul61
  %mul90 = fmul double %add89, 0x3FE58AD76CCCB8F0
  %add94 = fadd double %tmp21, %mul90
  %mul95 = fmul double %add94, 0x3FE58AD76CCCB8F0
  %mul100 = fmul double %add94, -5.000000e-01
  %add103 = fadd double %tmp16, %mul69
  %call104 = call double @sin(double %add103) nounwind readnone
  %sub105 = fsub double %mul100, %call104
  %add108 = fadd double %mul12, 0x3FE58AD76CCCB8F0
  %mul109 = fmul double %add108, 0x3FE5555555555555
  %call110 = call double @cos(double %mul109) nounwind readnone
  %mul111 = fmul double %call110, 9.000000e-01
  %add112 = fadd double %sub105, %mul111
  %mul113 = fmul double %add112, 0x3FE58AD76CCCB8F0
  %add122 = fadd double %mul42, %mul69
  %mul123 = fmul double %add122, 2.000000e+00
  %add124 = fadd double %mul24, %mul123
  %add126 = fadd double %add124, %mul95
  %div127 = fdiv double %add126, 6.000000e+00
  %add128 = fadd double %tmp16, %div127
  %add142 = fadd double %mul63, %mul90
  %mul143 = fmul double %add142, 2.000000e+00
  %add144 = fadd double %mul36, %mul143
  %add146 = fadd double %add144, %mul113
  %div147 = fdiv double %add146, 6.000000e+00
  %add148 = fadd double %tmp21, %div147
  store double %add148, double* %arrayidx153, align 8
  %div162 = fdiv double %add128, 0x401921FB54442D18
  %add163 = fadd double %div162, 5.000000e-01
  %conv164 = fptosi double %add163 to i32
  %conv174 = sitofp i32 %conv164 to double
  %mul175 = fmul double %conv174, 0x401921FB54442D18
  %sub176 = fsub double %add128, %mul175
  store double %sub176, double* %arrayidx133, align 8
  %cmp183 = icmp eq i32 %storemerge1, 0
  %rem = srem i32 %add, 10
  %cmp188 = icmp eq i32 %rem, 0
  %or.cond = or i1 %cmp183, %cmp188
  br i1 %or.cond, label %if.then, label %for.cond.backedge

if.then:                                          ; preds = %for.body
  %mul195 = fmul double %tmp16, 1.000000e+04
  %conv196 = fptosi double %mul195 to i32
  %mul202 = fmul double %tmp21, 1.000000e+04
  %conv203 = fptosi double %mul202 to i32
  %call204 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([7 x i8]* @.str, i64 0, i64 0), i32 %conv196, i32 %conv203) nounwind
  br label %for.cond.backedge

for.cond.backedge:                                ; preds = %if.then, %for.body
  %exitcond = icmp eq i64 %tmp, 59
  br i1 %exitcond, label %for.end, label %for.body

for.end:                                          ; preds = %for.cond.backedge
  ret i32 0
}

declare double @sin(double) nounwind readnone

declare double @cos(double) nounwind readnone

declare i32 @printf(i8* nocapture, ...) nounwind
