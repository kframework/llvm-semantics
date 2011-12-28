; ModuleID = '/home/grosu/celliso2/c-semantics/tests/integration/gaussianElimination.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@main.b = internal unnamed_addr constant [3 x double] [double 2.000000e+02, double 0.000000e+00, double 0.000000e+00], align 16
@main.a = internal unnamed_addr constant [3 x [3 x double]] [[3 x double] [double 1.000000e+02, double 1.000000e+02, double 1.000000e+02], [3 x double] [double -1.000000e+02, double 3.000000e+02, double -1.000000e+02], [3 x double] [double -1.000000e+02, double -1.000000e+02, double 3.000000e+02]], align 16
@.str = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1
@.str1 = private unnamed_addr constant [36 x i8] c"The matrix dimension is too large.\0A\00", align 1

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %x = alloca [3 x double], align 16
  %b = alloca [3 x double], align 16
  %a = alloca [3 x [3 x double]], align 16
  %i = alloca i32, align 4
  %n = alloca i32, align 4
  %indx = alloca [3 x i32], align 4
  store i32 0, i32* %retval
  %tmp = bitcast [3 x double]* %b to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %tmp, i8* bitcast ([3 x double]* @main.b to i8*), i64 24, i32 16, i1 false)
  %tmp2 = bitcast [3 x [3 x double]]* %a to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %tmp2, i8* bitcast ([3 x [3 x double]]* @main.a to i8*), i64 72, i32 16, i1 false)
  store i32 3, i32* %n, align 4
  %arraydecay = getelementptr inbounds [3 x [3 x double]]* %a, i32 0, i32 0
  %tmp6 = load i32* %n, align 4
  %arraydecay7 = getelementptr inbounds [3 x double]* %b, i32 0, i32 0
  %arraydecay8 = getelementptr inbounds [3 x double]* %x, i32 0, i32 0
  %arraydecay9 = getelementptr inbounds [3 x i32]* %indx, i32 0, i32 0
  call void (...)* bitcast (void ([3 x double]*, i32, double*, double*, i32*)* @legs to void (...)*)([3 x double]* %arraydecay, i32 %tmp6, double* %arraydecay7, double* %arraydecay8, i32* %arraydecay9)
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %tmp10 = load i32* %i, align 4
  %tmp11 = load i32* %n, align 4
  %cmp = icmp slt i32 %tmp10, %tmp11
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %tmp12 = load i32* %i, align 4
  %idxprom = sext i32 %tmp12 to i64
  %arrayidx = getelementptr inbounds [3 x double]* %x, i32 0, i64 %idxprom
  %tmp13 = load double* %arrayidx, align 8
  %mul = fmul double %tmp13, 1.000000e+04
  %conv = fptosi double %mul to i32
  %call = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i32 0, i32 0), i32 %conv)
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %tmp14 = load i32* %i, align 4
  %inc = add nsw i32 %tmp14, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  ret i32 0
}

declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture, i64, i32, i1) nounwind

declare i32 @printf(i8*, ...)

define void @legs([3 x double]* %a, i32 %n, double* %b, double* %x, i32* %indx) nounwind uwtable {
entry:
  %a.addr = alloca [3 x double]*, align 8
  %n.addr = alloca i32, align 4
  %b.addr = alloca double*, align 8
  %x.addr = alloca double*, align 8
  %indx.addr = alloca i32*, align 8
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  store [3 x double]* %a, [3 x double]** %a.addr, align 8
  store i32 %n, i32* %n.addr, align 4
  store double* %b, double** %b.addr, align 8
  store double* %x, double** %x.addr, align 8
  store i32* %indx, i32** %indx.addr, align 8
  %tmp = load [3 x double]** %a.addr, align 8
  %tmp1 = load i32* %n.addr, align 4
  %tmp2 = load i32** %indx.addr, align 8
  call void (...)* bitcast (void ([3 x double]*, i32, i32*)* @elgs to void (...)*)([3 x double]* %tmp, i32 %tmp1, i32* %tmp2)
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc49, %entry
  %tmp3 = load i32* %i, align 4
  %tmp4 = load i32* %n.addr, align 4
  %sub = sub nsw i32 %tmp4, 1
  %cmp = icmp slt i32 %tmp3, %sub
  br i1 %cmp, label %for.body, label %for.end52

for.body:                                         ; preds = %for.cond
  %tmp5 = load i32* %i, align 4
  %add = add nsw i32 %tmp5, 1
  store i32 %add, i32* %j, align 4
  br label %for.cond6

for.cond6:                                        ; preds = %for.inc, %for.body
  %tmp7 = load i32* %j, align 4
  %tmp8 = load i32* %n.addr, align 4
  %cmp9 = icmp slt i32 %tmp7, %tmp8
  br i1 %cmp9, label %for.body10, label %for.end

for.body10:                                       ; preds = %for.cond6
  %tmp11 = load i32* %j, align 4
  %idxprom = sext i32 %tmp11 to i64
  %tmp12 = load i32** %indx.addr, align 8
  %arrayidx = getelementptr inbounds i32* %tmp12, i64 %idxprom
  %tmp13 = load i32* %arrayidx
  %idxprom14 = sext i32 %tmp13 to i64
  %tmp15 = load double** %b.addr, align 8
  %arrayidx16 = getelementptr inbounds double* %tmp15, i64 %idxprom14
  %tmp17 = load double* %arrayidx16
  %tmp18 = load i32* %i, align 4
  %idxprom19 = sext i32 %tmp18 to i64
  %tmp20 = load i32* %j, align 4
  %idxprom21 = sext i32 %tmp20 to i64
  %tmp22 = load i32** %indx.addr, align 8
  %arrayidx23 = getelementptr inbounds i32* %tmp22, i64 %idxprom21
  %tmp24 = load i32* %arrayidx23
  %idxprom25 = sext i32 %tmp24 to i64
  %tmp26 = load [3 x double]** %a.addr, align 8
  %arrayidx27 = getelementptr inbounds [3 x double]* %tmp26, i64 %idxprom25
  %arrayidx28 = getelementptr inbounds [3 x double]* %arrayidx27, i32 0, i64 %idxprom19
  %tmp29 = load double* %arrayidx28
  %tmp30 = load i32* %i, align 4
  %idxprom31 = sext i32 %tmp30 to i64
  %tmp32 = load i32** %indx.addr, align 8
  %arrayidx33 = getelementptr inbounds i32* %tmp32, i64 %idxprom31
  %tmp34 = load i32* %arrayidx33
  %idxprom35 = sext i32 %tmp34 to i64
  %tmp36 = load double** %b.addr, align 8
  %arrayidx37 = getelementptr inbounds double* %tmp36, i64 %idxprom35
  %tmp38 = load double* %arrayidx37
  %mul = fmul double %tmp29, %tmp38
  %sub39 = fsub double %tmp17, %mul
  %tmp40 = load i32* %j, align 4
  %idxprom41 = sext i32 %tmp40 to i64
  %tmp42 = load i32** %indx.addr, align 8
  %arrayidx43 = getelementptr inbounds i32* %tmp42, i64 %idxprom41
  %tmp44 = load i32* %arrayidx43
  %idxprom45 = sext i32 %tmp44 to i64
  %tmp46 = load double** %b.addr, align 8
  %arrayidx47 = getelementptr inbounds double* %tmp46, i64 %idxprom45
  store double %sub39, double* %arrayidx47
  br label %for.inc

for.inc:                                          ; preds = %for.body10
  %tmp48 = load i32* %j, align 4
  %inc = add nsw i32 %tmp48, 1
  store i32 %inc, i32* %j, align 4
  br label %for.cond6

for.end:                                          ; preds = %for.cond6
  br label %for.inc49

for.inc49:                                        ; preds = %for.end
  %tmp50 = load i32* %i, align 4
  %inc51 = add nsw i32 %tmp50, 1
  store i32 %inc51, i32* %i, align 4
  br label %for.cond

for.end52:                                        ; preds = %for.cond
  %tmp53 = load i32* %n.addr, align 4
  %sub54 = sub nsw i32 %tmp53, 1
  %idxprom55 = sext i32 %sub54 to i64
  %tmp56 = load i32** %indx.addr, align 8
  %arrayidx57 = getelementptr inbounds i32* %tmp56, i64 %idxprom55
  %tmp58 = load i32* %arrayidx57
  %idxprom59 = sext i32 %tmp58 to i64
  %tmp60 = load double** %b.addr, align 8
  %arrayidx61 = getelementptr inbounds double* %tmp60, i64 %idxprom59
  %tmp62 = load double* %arrayidx61
  %tmp63 = load i32* %n.addr, align 4
  %sub64 = sub nsw i32 %tmp63, 1
  %idxprom65 = sext i32 %sub64 to i64
  %tmp66 = load i32* %n.addr, align 4
  %sub67 = sub nsw i32 %tmp66, 1
  %idxprom68 = sext i32 %sub67 to i64
  %tmp69 = load i32** %indx.addr, align 8
  %arrayidx70 = getelementptr inbounds i32* %tmp69, i64 %idxprom68
  %tmp71 = load i32* %arrayidx70
  %idxprom72 = sext i32 %tmp71 to i64
  %tmp73 = load [3 x double]** %a.addr, align 8
  %arrayidx74 = getelementptr inbounds [3 x double]* %tmp73, i64 %idxprom72
  %arrayidx75 = getelementptr inbounds [3 x double]* %arrayidx74, i32 0, i64 %idxprom65
  %tmp76 = load double* %arrayidx75
  %div = fdiv double %tmp62, %tmp76
  %tmp77 = load i32* %n.addr, align 4
  %sub78 = sub nsw i32 %tmp77, 1
  %idxprom79 = sext i32 %sub78 to i64
  %tmp80 = load double** %x.addr, align 8
  %arrayidx81 = getelementptr inbounds double* %tmp80, i64 %idxprom79
  store double %div, double* %arrayidx81
  %tmp82 = load i32* %n.addr, align 4
  %sub83 = sub nsw i32 %tmp82, 2
  store i32 %sub83, i32* %i, align 4
  br label %for.cond84

for.cond84:                                       ; preds = %for.inc162, %for.end52
  %tmp85 = load i32* %i, align 4
  %cmp86 = icmp sge i32 %tmp85, 0
  br i1 %cmp86, label %for.body87, label %for.end164

for.body87:                                       ; preds = %for.cond84
  %tmp88 = load i32* %i, align 4
  %idxprom89 = sext i32 %tmp88 to i64
  %tmp90 = load i32** %indx.addr, align 8
  %arrayidx91 = getelementptr inbounds i32* %tmp90, i64 %idxprom89
  %tmp92 = load i32* %arrayidx91
  %idxprom93 = sext i32 %tmp92 to i64
  %tmp94 = load double** %b.addr, align 8
  %arrayidx95 = getelementptr inbounds double* %tmp94, i64 %idxprom93
  %tmp96 = load double* %arrayidx95
  %tmp97 = load i32* %i, align 4
  %idxprom98 = sext i32 %tmp97 to i64
  %tmp99 = load double** %x.addr, align 8
  %arrayidx100 = getelementptr inbounds double* %tmp99, i64 %idxprom98
  store double %tmp96, double* %arrayidx100
  %tmp101 = load i32* %i, align 4
  %add102 = add nsw i32 %tmp101, 1
  store i32 %add102, i32* %j, align 4
  br label %for.cond103

for.cond103:                                      ; preds = %for.inc136, %for.body87
  %tmp104 = load i32* %j, align 4
  %tmp105 = load i32* %n.addr, align 4
  %cmp106 = icmp slt i32 %tmp104, %tmp105
  br i1 %cmp106, label %for.body107, label %for.end139

for.body107:                                      ; preds = %for.cond103
  %tmp108 = load i32* %i, align 4
  %idxprom109 = sext i32 %tmp108 to i64
  %tmp110 = load double** %x.addr, align 8
  %arrayidx111 = getelementptr inbounds double* %tmp110, i64 %idxprom109
  %tmp112 = load double* %arrayidx111
  %tmp113 = load i32* %j, align 4
  %idxprom114 = sext i32 %tmp113 to i64
  %tmp115 = load i32* %i, align 4
  %idxprom116 = sext i32 %tmp115 to i64
  %tmp117 = load i32** %indx.addr, align 8
  %arrayidx118 = getelementptr inbounds i32* %tmp117, i64 %idxprom116
  %tmp119 = load i32* %arrayidx118
  %idxprom120 = sext i32 %tmp119 to i64
  %tmp121 = load [3 x double]** %a.addr, align 8
  %arrayidx122 = getelementptr inbounds [3 x double]* %tmp121, i64 %idxprom120
  %arrayidx123 = getelementptr inbounds [3 x double]* %arrayidx122, i32 0, i64 %idxprom114
  %tmp124 = load double* %arrayidx123
  %tmp125 = load i32* %j, align 4
  %idxprom126 = sext i32 %tmp125 to i64
  %tmp127 = load double** %x.addr, align 8
  %arrayidx128 = getelementptr inbounds double* %tmp127, i64 %idxprom126
  %tmp129 = load double* %arrayidx128
  %mul130 = fmul double %tmp124, %tmp129
  %sub131 = fsub double %tmp112, %mul130
  %tmp132 = load i32* %i, align 4
  %idxprom133 = sext i32 %tmp132 to i64
  %tmp134 = load double** %x.addr, align 8
  %arrayidx135 = getelementptr inbounds double* %tmp134, i64 %idxprom133
  store double %sub131, double* %arrayidx135
  br label %for.inc136

for.inc136:                                       ; preds = %for.body107
  %tmp137 = load i32* %j, align 4
  %inc138 = add nsw i32 %tmp137, 1
  store i32 %inc138, i32* %j, align 4
  br label %for.cond103

for.end139:                                       ; preds = %for.cond103
  %tmp140 = load i32* %i, align 4
  %idxprom141 = sext i32 %tmp140 to i64
  %tmp142 = load double** %x.addr, align 8
  %arrayidx143 = getelementptr inbounds double* %tmp142, i64 %idxprom141
  %tmp144 = load double* %arrayidx143
  %tmp145 = load i32* %i, align 4
  %idxprom146 = sext i32 %tmp145 to i64
  %tmp147 = load i32* %i, align 4
  %idxprom148 = sext i32 %tmp147 to i64
  %tmp149 = load i32** %indx.addr, align 8
  %arrayidx150 = getelementptr inbounds i32* %tmp149, i64 %idxprom148
  %tmp151 = load i32* %arrayidx150
  %idxprom152 = sext i32 %tmp151 to i64
  %tmp153 = load [3 x double]** %a.addr, align 8
  %arrayidx154 = getelementptr inbounds [3 x double]* %tmp153, i64 %idxprom152
  %arrayidx155 = getelementptr inbounds [3 x double]* %arrayidx154, i32 0, i64 %idxprom146
  %tmp156 = load double* %arrayidx155
  %div157 = fdiv double %tmp144, %tmp156
  %tmp158 = load i32* %i, align 4
  %idxprom159 = sext i32 %tmp158 to i64
  %tmp160 = load double** %x.addr, align 8
  %arrayidx161 = getelementptr inbounds double* %tmp160, i64 %idxprom159
  store double %div157, double* %arrayidx161
  br label %for.inc162

for.inc162:                                       ; preds = %for.end139
  %tmp163 = load i32* %i, align 4
  %dec = add nsw i32 %tmp163, -1
  store i32 %dec, i32* %i, align 4
  br label %for.cond84

for.end164:                                       ; preds = %for.cond84
  ret void
}

define void @elgs([3 x double]* %a, i32 %n, i32* %indx) nounwind uwtable {
entry:
  %a.addr = alloca [3 x double]*, align 8
  %n.addr = alloca i32, align 4
  %indx.addr = alloca i32*, align 8
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %k = alloca i32, align 4
  %itmp = alloca i32, align 4
  %c1 = alloca double, align 8
  %pi = alloca double, align 8
  %pi1 = alloca double, align 8
  %pj = alloca double, align 8
  %c = alloca [3 x double], align 16
  store [3 x double]* %a, [3 x double]** %a.addr, align 8
  store i32 %n, i32* %n.addr, align 4
  store i32* %indx, i32** %indx.addr, align 8
  %tmp = load i32* %n.addr, align 4
  %cmp = icmp sgt i32 %tmp, 3
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %call = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([36 x i8]* @.str1, i32 0, i32 0))
  call void @exit(i32 1) noreturn
  unreachable

if.end:                                           ; preds = %entry
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %if.end
  %tmp1 = load i32* %i, align 4
  %tmp2 = load i32* %n.addr, align 4
  %cmp3 = icmp slt i32 %tmp1, %tmp2
  br i1 %cmp3, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %tmp4 = load i32* %i, align 4
  %tmp5 = load i32* %i, align 4
  %idxprom = sext i32 %tmp5 to i64
  %tmp6 = load i32** %indx.addr, align 8
  %arrayidx = getelementptr inbounds i32* %tmp6, i64 %idxprom
  store i32 %tmp4, i32* %arrayidx
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %tmp7 = load i32* %i, align 4
  %inc = add nsw i32 %tmp7, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  store i32 0, i32* %i, align 4
  br label %for.cond8

for.cond8:                                        ; preds = %for.inc48, %for.end
  %tmp9 = load i32* %i, align 4
  %tmp10 = load i32* %n.addr, align 4
  %cmp11 = icmp slt i32 %tmp9, %tmp10
  br i1 %cmp11, label %for.body12, label %for.end51

for.body12:                                       ; preds = %for.cond8
  store double 0.000000e+00, double* %c1, align 8
  store i32 0, i32* %j, align 4
  br label %for.cond13

for.cond13:                                       ; preds = %for.inc40, %for.body12
  %tmp14 = load i32* %j, align 4
  %tmp15 = load i32* %n.addr, align 4
  %cmp16 = icmp slt i32 %tmp14, %tmp15
  br i1 %cmp16, label %for.body17, label %for.end43

for.body17:                                       ; preds = %for.cond13
  %tmp18 = load i32* %j, align 4
  %idxprom19 = sext i32 %tmp18 to i64
  %tmp20 = load i32* %i, align 4
  %idxprom21 = sext i32 %tmp20 to i64
  %tmp22 = load [3 x double]** %a.addr, align 8
  %arrayidx23 = getelementptr inbounds [3 x double]* %tmp22, i64 %idxprom21
  %arrayidx24 = getelementptr inbounds [3 x double]* %arrayidx23, i32 0, i64 %idxprom19
  %tmp25 = load double* %arrayidx24
  %call26 = call double @fabs(double %tmp25) nounwind readnone
  %tmp27 = load double* %c1, align 8
  %cmp28 = fcmp ogt double %call26, %tmp27
  br i1 %cmp28, label %if.then29, label %if.end39

if.then29:                                        ; preds = %for.body17
  %tmp30 = load i32* %j, align 4
  %idxprom31 = sext i32 %tmp30 to i64
  %tmp32 = load i32* %i, align 4
  %idxprom33 = sext i32 %tmp32 to i64
  %tmp34 = load [3 x double]** %a.addr, align 8
  %arrayidx35 = getelementptr inbounds [3 x double]* %tmp34, i64 %idxprom33
  %arrayidx36 = getelementptr inbounds [3 x double]* %arrayidx35, i32 0, i64 %idxprom31
  %tmp37 = load double* %arrayidx36
  %call38 = call double @fabs(double %tmp37) nounwind readnone
  store double %call38, double* %c1, align 8
  br label %if.end39

if.end39:                                         ; preds = %if.then29, %for.body17
  br label %for.inc40

for.inc40:                                        ; preds = %if.end39
  %tmp41 = load i32* %j, align 4
  %inc42 = add nsw i32 %tmp41, 1
  store i32 %inc42, i32* %j, align 4
  br label %for.cond13

for.end43:                                        ; preds = %for.cond13
  %tmp44 = load double* %c1, align 8
  %tmp45 = load i32* %i, align 4
  %idxprom46 = sext i32 %tmp45 to i64
  %arrayidx47 = getelementptr inbounds [3 x double]* %c, i32 0, i64 %idxprom46
  store double %tmp44, double* %arrayidx47, align 8
  br label %for.inc48

for.inc48:                                        ; preds = %for.end43
  %tmp49 = load i32* %i, align 4
  %inc50 = add nsw i32 %tmp49, 1
  store i32 %inc50, i32* %i, align 4
  br label %for.cond8

for.end51:                                        ; preds = %for.cond8
  store i32 0, i32* %j, align 4
  br label %for.cond52

for.cond52:                                       ; preds = %for.inc209, %for.end51
  %tmp53 = load i32* %j, align 4
  %tmp54 = load i32* %n.addr, align 4
  %sub = sub nsw i32 %tmp54, 1
  %cmp55 = icmp slt i32 %tmp53, %sub
  br i1 %cmp55, label %for.body56, label %for.end212

for.body56:                                       ; preds = %for.cond52
  store double 0.000000e+00, double* %pi1, align 8
  %tmp57 = load i32* %j, align 4
  store i32 %tmp57, i32* %i, align 4
  br label %for.cond58

for.cond58:                                       ; preds = %for.inc91, %for.body56
  %tmp59 = load i32* %i, align 4
  %tmp60 = load i32* %n.addr, align 4
  %cmp61 = icmp slt i32 %tmp59, %tmp60
  br i1 %cmp61, label %for.body62, label %for.end94

for.body62:                                       ; preds = %for.cond58
  %tmp63 = load i32* %j, align 4
  %idxprom64 = sext i32 %tmp63 to i64
  %tmp65 = load i32* %i, align 4
  %idxprom66 = sext i32 %tmp65 to i64
  %tmp67 = load i32** %indx.addr, align 8
  %arrayidx68 = getelementptr inbounds i32* %tmp67, i64 %idxprom66
  %tmp69 = load i32* %arrayidx68
  %idxprom70 = sext i32 %tmp69 to i64
  %tmp71 = load [3 x double]** %a.addr, align 8
  %arrayidx72 = getelementptr inbounds [3 x double]* %tmp71, i64 %idxprom70
  %arrayidx73 = getelementptr inbounds [3 x double]* %arrayidx72, i32 0, i64 %idxprom64
  %tmp74 = load double* %arrayidx73
  %call75 = call double @fabs(double %tmp74) nounwind readnone
  %tmp76 = load i32* %i, align 4
  %idxprom77 = sext i32 %tmp76 to i64
  %tmp78 = load i32** %indx.addr, align 8
  %arrayidx79 = getelementptr inbounds i32* %tmp78, i64 %idxprom77
  %tmp80 = load i32* %arrayidx79
  %idxprom81 = sext i32 %tmp80 to i64
  %arrayidx82 = getelementptr inbounds [3 x double]* %c, i32 0, i64 %idxprom81
  %tmp83 = load double* %arrayidx82, align 8
  %div = fdiv double %call75, %tmp83
  store double %div, double* %pi, align 8
  %tmp84 = load double* %pi, align 8
  %tmp85 = load double* %pi1, align 8
  %cmp86 = fcmp ogt double %tmp84, %tmp85
  br i1 %cmp86, label %if.then87, label %if.end90

if.then87:                                        ; preds = %for.body62
  %tmp88 = load double* %pi, align 8
  store double %tmp88, double* %pi1, align 8
  %tmp89 = load i32* %i, align 4
  store i32 %tmp89, i32* %k, align 4
  br label %if.end90

if.end90:                                         ; preds = %if.then87, %for.body62
  br label %for.inc91

for.inc91:                                        ; preds = %if.end90
  %tmp92 = load i32* %i, align 4
  %inc93 = add nsw i32 %tmp92, 1
  store i32 %inc93, i32* %i, align 4
  br label %for.cond58

for.end94:                                        ; preds = %for.cond58
  %tmp95 = load i32* %j, align 4
  %idxprom96 = sext i32 %tmp95 to i64
  %tmp97 = load i32** %indx.addr, align 8
  %arrayidx98 = getelementptr inbounds i32* %tmp97, i64 %idxprom96
  %tmp99 = load i32* %arrayidx98
  store i32 %tmp99, i32* %itmp, align 4
  %tmp100 = load i32* %k, align 4
  %idxprom101 = sext i32 %tmp100 to i64
  %tmp102 = load i32** %indx.addr, align 8
  %arrayidx103 = getelementptr inbounds i32* %tmp102, i64 %idxprom101
  %tmp104 = load i32* %arrayidx103
  %tmp105 = load i32* %j, align 4
  %idxprom106 = sext i32 %tmp105 to i64
  %tmp107 = load i32** %indx.addr, align 8
  %arrayidx108 = getelementptr inbounds i32* %tmp107, i64 %idxprom106
  store i32 %tmp104, i32* %arrayidx108
  %tmp109 = load i32* %itmp, align 4
  %tmp110 = load i32* %k, align 4
  %idxprom111 = sext i32 %tmp110 to i64
  %tmp112 = load i32** %indx.addr, align 8
  %arrayidx113 = getelementptr inbounds i32* %tmp112, i64 %idxprom111
  store i32 %tmp109, i32* %arrayidx113
  %tmp114 = load i32* %j, align 4
  %add = add nsw i32 %tmp114, 1
  store i32 %add, i32* %i, align 4
  br label %for.cond115

for.cond115:                                      ; preds = %for.inc205, %for.end94
  %tmp116 = load i32* %i, align 4
  %tmp117 = load i32* %n.addr, align 4
  %cmp118 = icmp slt i32 %tmp116, %tmp117
  br i1 %cmp118, label %for.body119, label %for.end208

for.body119:                                      ; preds = %for.cond115
  %tmp120 = load i32* %j, align 4
  %idxprom121 = sext i32 %tmp120 to i64
  %tmp122 = load i32* %i, align 4
  %idxprom123 = sext i32 %tmp122 to i64
  %tmp124 = load i32** %indx.addr, align 8
  %arrayidx125 = getelementptr inbounds i32* %tmp124, i64 %idxprom123
  %tmp126 = load i32* %arrayidx125
  %idxprom127 = sext i32 %tmp126 to i64
  %tmp128 = load [3 x double]** %a.addr, align 8
  %arrayidx129 = getelementptr inbounds [3 x double]* %tmp128, i64 %idxprom127
  %arrayidx130 = getelementptr inbounds [3 x double]* %arrayidx129, i32 0, i64 %idxprom121
  %tmp131 = load double* %arrayidx130
  %tmp132 = load i32* %j, align 4
  %idxprom133 = sext i32 %tmp132 to i64
  %tmp134 = load i32* %j, align 4
  %idxprom135 = sext i32 %tmp134 to i64
  %tmp136 = load i32** %indx.addr, align 8
  %arrayidx137 = getelementptr inbounds i32* %tmp136, i64 %idxprom135
  %tmp138 = load i32* %arrayidx137
  %idxprom139 = sext i32 %tmp138 to i64
  %tmp140 = load [3 x double]** %a.addr, align 8
  %arrayidx141 = getelementptr inbounds [3 x double]* %tmp140, i64 %idxprom139
  %arrayidx142 = getelementptr inbounds [3 x double]* %arrayidx141, i32 0, i64 %idxprom133
  %tmp143 = load double* %arrayidx142
  %div144 = fdiv double %tmp131, %tmp143
  store double %div144, double* %pj, align 8
  %tmp145 = load double* %pj, align 8
  %tmp146 = load i32* %j, align 4
  %idxprom147 = sext i32 %tmp146 to i64
  %tmp148 = load i32* %i, align 4
  %idxprom149 = sext i32 %tmp148 to i64
  %tmp150 = load i32** %indx.addr, align 8
  %arrayidx151 = getelementptr inbounds i32* %tmp150, i64 %idxprom149
  %tmp152 = load i32* %arrayidx151
  %idxprom153 = sext i32 %tmp152 to i64
  %tmp154 = load [3 x double]** %a.addr, align 8
  %arrayidx155 = getelementptr inbounds [3 x double]* %tmp154, i64 %idxprom153
  %arrayidx156 = getelementptr inbounds [3 x double]* %arrayidx155, i32 0, i64 %idxprom147
  store double %tmp145, double* %arrayidx156
  %tmp157 = load i32* %j, align 4
  %add158 = add nsw i32 %tmp157, 1
  store i32 %add158, i32* %k, align 4
  br label %for.cond159

for.cond159:                                      ; preds = %for.inc201, %for.body119
  %tmp160 = load i32* %k, align 4
  %tmp161 = load i32* %n.addr, align 4
  %cmp162 = icmp slt i32 %tmp160, %tmp161
  br i1 %cmp162, label %for.body163, label %for.end204

for.body163:                                      ; preds = %for.cond159
  %tmp164 = load i32* %k, align 4
  %idxprom165 = sext i32 %tmp164 to i64
  %tmp166 = load i32* %i, align 4
  %idxprom167 = sext i32 %tmp166 to i64
  %tmp168 = load i32** %indx.addr, align 8
  %arrayidx169 = getelementptr inbounds i32* %tmp168, i64 %idxprom167
  %tmp170 = load i32* %arrayidx169
  %idxprom171 = sext i32 %tmp170 to i64
  %tmp172 = load [3 x double]** %a.addr, align 8
  %arrayidx173 = getelementptr inbounds [3 x double]* %tmp172, i64 %idxprom171
  %arrayidx174 = getelementptr inbounds [3 x double]* %arrayidx173, i32 0, i64 %idxprom165
  %tmp175 = load double* %arrayidx174
  %tmp176 = load double* %pj, align 8
  %tmp177 = load i32* %k, align 4
  %idxprom178 = sext i32 %tmp177 to i64
  %tmp179 = load i32* %j, align 4
  %idxprom180 = sext i32 %tmp179 to i64
  %tmp181 = load i32** %indx.addr, align 8
  %arrayidx182 = getelementptr inbounds i32* %tmp181, i64 %idxprom180
  %tmp183 = load i32* %arrayidx182
  %idxprom184 = sext i32 %tmp183 to i64
  %tmp185 = load [3 x double]** %a.addr, align 8
  %arrayidx186 = getelementptr inbounds [3 x double]* %tmp185, i64 %idxprom184
  %arrayidx187 = getelementptr inbounds [3 x double]* %arrayidx186, i32 0, i64 %idxprom178
  %tmp188 = load double* %arrayidx187
  %mul = fmul double %tmp176, %tmp188
  %sub189 = fsub double %tmp175, %mul
  %tmp190 = load i32* %k, align 4
  %idxprom191 = sext i32 %tmp190 to i64
  %tmp192 = load i32* %i, align 4
  %idxprom193 = sext i32 %tmp192 to i64
  %tmp194 = load i32** %indx.addr, align 8
  %arrayidx195 = getelementptr inbounds i32* %tmp194, i64 %idxprom193
  %tmp196 = load i32* %arrayidx195
  %idxprom197 = sext i32 %tmp196 to i64
  %tmp198 = load [3 x double]** %a.addr, align 8
  %arrayidx199 = getelementptr inbounds [3 x double]* %tmp198, i64 %idxprom197
  %arrayidx200 = getelementptr inbounds [3 x double]* %arrayidx199, i32 0, i64 %idxprom191
  store double %sub189, double* %arrayidx200
  br label %for.inc201

for.inc201:                                       ; preds = %for.body163
  %tmp202 = load i32* %k, align 4
  %inc203 = add nsw i32 %tmp202, 1
  store i32 %inc203, i32* %k, align 4
  br label %for.cond159

for.end204:                                       ; preds = %for.cond159
  br label %for.inc205

for.inc205:                                       ; preds = %for.end204
  %tmp206 = load i32* %i, align 4
  %inc207 = add nsw i32 %tmp206, 1
  store i32 %inc207, i32* %i, align 4
  br label %for.cond115

for.end208:                                       ; preds = %for.cond115
  br label %for.inc209

for.inc209:                                       ; preds = %for.end208
  %tmp210 = load i32* %j, align 4
  %inc211 = add nsw i32 %tmp210, 1
  store i32 %inc211, i32* %j, align 4
  br label %for.cond52

for.end212:                                       ; preds = %for.cond52
  ret void
}

declare void @exit(i32) noreturn

declare double @fabs(double) nounwind readnone
