; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/930628-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

%struct.anon = type { [3 x i32], [1 x [2 x double]] }

define i32 @gnu_dev_major(i64 %__dev) nounwind uwtable inlinehint {
entry:
  %__dev.addr = alloca i64, align 8
  store i64 %__dev, i64* %__dev.addr, align 8
  %tmp = load i64* %__dev.addr, align 8
  %shr = lshr i64 %tmp, 8
  %and = and i64 %shr, 4095
  %tmp1 = load i64* %__dev.addr, align 8
  %shr2 = lshr i64 %tmp1, 32
  %conv = trunc i64 %shr2 to i32
  %and3 = and i32 %conv, -4096
  %conv4 = zext i32 %and3 to i64
  %or = or i64 %and, %conv4
  %conv5 = trunc i64 %or to i32
  ret i32 %conv5
}

define i32 @gnu_dev_minor(i64 %__dev) nounwind uwtable inlinehint {
entry:
  %__dev.addr = alloca i64, align 8
  store i64 %__dev, i64* %__dev.addr, align 8
  %tmp = load i64* %__dev.addr, align 8
  %and = and i64 %tmp, 255
  %tmp1 = load i64* %__dev.addr, align 8
  %shr = lshr i64 %tmp1, 12
  %conv = trunc i64 %shr to i32
  %and2 = and i32 %conv, -256
  %conv3 = zext i32 %and2 to i64
  %or = or i64 %and, %conv3
  %conv4 = trunc i64 %or to i32
  ret i32 %conv4
}

define i64 @gnu_dev_makedev(i32 %__major, i32 %__minor) nounwind uwtable inlinehint {
entry:
  %__major.addr = alloca i32, align 4
  %__minor.addr = alloca i32, align 4
  store i32 %__major, i32* %__major.addr, align 4
  store i32 %__minor, i32* %__minor.addr, align 4
  %tmp = load i32* %__minor.addr, align 4
  %and = and i32 %tmp, 255
  %tmp1 = load i32* %__major.addr, align 4
  %and2 = and i32 %tmp1, 4095
  %shl = shl i32 %and2, 8
  %or = or i32 %and, %shl
  %conv = zext i32 %or to i64
  %tmp3 = load i32* %__minor.addr, align 4
  %and4 = and i32 %tmp3, -256
  %conv5 = zext i32 %and4 to i64
  %shl6 = shl i64 %conv5, 12
  %or7 = or i64 %conv, %shl6
  %tmp8 = load i32* %__major.addr, align 4
  %and9 = and i32 %tmp8, -4096
  %conv10 = zext i32 %and9 to i64
  %shl11 = shl i64 %conv10, 32
  %or12 = or i64 %or7, %shl11
  ret i64 %or12
}

define void @f(double* %x, double* %y) nounwind uwtable {
entry:
  %x.addr = alloca double*, align 8
  %y.addr = alloca double*, align 8
  store double* %x, double** %x.addr, align 8
  store double* %y, double** %y.addr, align 8
  %tmp = load double** %x.addr, align 8
  %tmp1 = load double** %y.addr, align 8
  %cmp = icmp eq double* %tmp, %tmp1
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  ret void
}

declare void @abort() noreturn nounwind

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %tp = alloca [4 x [2 x %struct.anon]], align 16
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %ki = alloca i32, align 4
  %kj = alloca i32, align 4
  %mi = alloca i32, align 4
  %mj = alloca i32, align 4
  %bdm = alloca [4 x [2 x [4 x [2 x float]]]], align 16
  store i32 0, i32* %retval
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc87, %entry
  %tmp = load i32* %i, align 4
  %cmp = icmp slt i32 %tmp, 4
  br i1 %cmp, label %for.body, label %for.end90

for.body:                                         ; preds = %for.cond
  %tmp1 = load i32* %i, align 4
  store i32 %tmp1, i32* %j, align 4
  br label %for.cond2

for.cond2:                                        ; preds = %for.inc83, %for.body
  %tmp3 = load i32* %j, align 4
  %cmp4 = icmp slt i32 %tmp3, 4
  br i1 %cmp4, label %for.body5, label %for.end86

for.body5:                                        ; preds = %for.cond2
  store i32 0, i32* %ki, align 4
  br label %for.cond6

for.cond6:                                        ; preds = %for.inc79, %for.body5
  %tmp7 = load i32* %ki, align 4
  %cmp8 = icmp slt i32 %tmp7, 2
  br i1 %cmp8, label %for.body9, label %for.end82

for.body9:                                        ; preds = %for.cond6
  store i32 0, i32* %kj, align 4
  br label %for.cond10

for.cond10:                                       ; preds = %for.inc75, %for.body9
  %tmp11 = load i32* %kj, align 4
  %cmp12 = icmp slt i32 %tmp11, 2
  br i1 %cmp12, label %for.body13, label %for.end78

for.body13:                                       ; preds = %for.cond10
  %tmp14 = load i32* %j, align 4
  %tmp15 = load i32* %i, align 4
  %cmp16 = icmp eq i32 %tmp14, %tmp15
  br i1 %cmp16, label %land.lhs.true, label %if.else

land.lhs.true:                                    ; preds = %for.body13
  %tmp17 = load i32* %ki, align 4
  %tmp18 = load i32* %kj, align 4
  %cmp19 = icmp eq i32 %tmp17, %tmp18
  br i1 %cmp19, label %if.then, label %if.else

if.then:                                          ; preds = %land.lhs.true
  %tmp20 = load i32* %kj, align 4
  %idxprom = sext i32 %tmp20 to i64
  %tmp21 = load i32* %j, align 4
  %idxprom22 = sext i32 %tmp21 to i64
  %tmp23 = load i32* %ki, align 4
  %idxprom24 = sext i32 %tmp23 to i64
  %tmp25 = load i32* %i, align 4
  %idxprom26 = sext i32 %tmp25 to i64
  %arrayidx = getelementptr inbounds [4 x [2 x [4 x [2 x float]]]]* %bdm, i32 0, i64 %idxprom26
  %arrayidx27 = getelementptr inbounds [2 x [4 x [2 x float]]]* %arrayidx, i32 0, i64 %idxprom24
  %arrayidx28 = getelementptr inbounds [4 x [2 x float]]* %arrayidx27, i32 0, i64 %idxprom22
  %arrayidx29 = getelementptr inbounds [2 x float]* %arrayidx28, i32 0, i64 %idxprom
  store float 1.000000e+03, float* %arrayidx29, align 4
  br label %if.end

if.else:                                          ; preds = %land.lhs.true, %for.body13
  store i32 0, i32* %mi, align 4
  br label %for.cond30

for.cond30:                                       ; preds = %for.inc59, %if.else
  %tmp31 = load i32* %mi, align 4
  %cmp32 = icmp slt i32 %tmp31, 1
  br i1 %cmp32, label %for.body33, label %for.end62

for.body33:                                       ; preds = %for.cond30
  store i32 0, i32* %mj, align 4
  br label %for.cond34

for.cond34:                                       ; preds = %for.inc, %for.body33
  %tmp35 = load i32* %mj, align 4
  %cmp36 = icmp slt i32 %tmp35, 1
  br i1 %cmp36, label %for.body37, label %for.end

for.body37:                                       ; preds = %for.cond34
  %tmp38 = load i32* %mi, align 4
  %idxprom39 = sext i32 %tmp38 to i64
  %tmp40 = load i32* %ki, align 4
  %idxprom41 = sext i32 %tmp40 to i64
  %tmp42 = load i32* %i, align 4
  %idxprom43 = sext i32 %tmp42 to i64
  %arrayidx44 = getelementptr inbounds [4 x [2 x %struct.anon]]* %tp, i32 0, i64 %idxprom43
  %arrayidx45 = getelementptr inbounds [2 x %struct.anon]* %arrayidx44, i32 0, i64 %idxprom41
  %x = getelementptr inbounds %struct.anon* %arrayidx45, i32 0, i32 1
  %arrayidx46 = getelementptr inbounds [1 x [2 x double]]* %x, i32 0, i64 %idxprom39
  %arraydecay = getelementptr inbounds [2 x double]* %arrayidx46, i32 0, i32 0
  %tmp47 = load i32* %mj, align 4
  %idxprom48 = sext i32 %tmp47 to i64
  %tmp49 = load i32* %kj, align 4
  %idxprom50 = sext i32 %tmp49 to i64
  %tmp51 = load i32* %j, align 4
  %idxprom52 = sext i32 %tmp51 to i64
  %arrayidx53 = getelementptr inbounds [4 x [2 x %struct.anon]]* %tp, i32 0, i64 %idxprom52
  %arrayidx54 = getelementptr inbounds [2 x %struct.anon]* %arrayidx53, i32 0, i64 %idxprom50
  %x55 = getelementptr inbounds %struct.anon* %arrayidx54, i32 0, i32 1
  %arrayidx56 = getelementptr inbounds [1 x [2 x double]]* %x55, i32 0, i64 %idxprom48
  %arraydecay57 = getelementptr inbounds [2 x double]* %arrayidx56, i32 0, i32 0
  call void @f(double* %arraydecay, double* %arraydecay57)
  br label %for.inc

for.inc:                                          ; preds = %for.body37
  %tmp58 = load i32* %mj, align 4
  %inc = add nsw i32 %tmp58, 1
  store i32 %inc, i32* %mj, align 4
  br label %for.cond34

for.end:                                          ; preds = %for.cond34
  br label %for.inc59

for.inc59:                                        ; preds = %for.end
  %tmp60 = load i32* %mi, align 4
  %inc61 = add nsw i32 %tmp60, 1
  store i32 %inc61, i32* %mi, align 4
  br label %for.cond30

for.end62:                                        ; preds = %for.cond30
  %tmp63 = load i32* %kj, align 4
  %idxprom64 = sext i32 %tmp63 to i64
  %tmp65 = load i32* %j, align 4
  %idxprom66 = sext i32 %tmp65 to i64
  %tmp67 = load i32* %ki, align 4
  %idxprom68 = sext i32 %tmp67 to i64
  %tmp69 = load i32* %i, align 4
  %idxprom70 = sext i32 %tmp69 to i64
  %arrayidx71 = getelementptr inbounds [4 x [2 x [4 x [2 x float]]]]* %bdm, i32 0, i64 %idxprom70
  %arrayidx72 = getelementptr inbounds [2 x [4 x [2 x float]]]* %arrayidx71, i32 0, i64 %idxprom68
  %arrayidx73 = getelementptr inbounds [4 x [2 x float]]* %arrayidx72, i32 0, i64 %idxprom66
  %arrayidx74 = getelementptr inbounds [2 x float]* %arrayidx73, i32 0, i64 %idxprom64
  store float 1.000000e+03, float* %arrayidx74, align 4
  br label %if.end

if.end:                                           ; preds = %for.end62, %if.then
  br label %for.inc75

for.inc75:                                        ; preds = %if.end
  %tmp76 = load i32* %kj, align 4
  %inc77 = add nsw i32 %tmp76, 1
  store i32 %inc77, i32* %kj, align 4
  br label %for.cond10

for.end78:                                        ; preds = %for.cond10
  br label %for.inc79

for.inc79:                                        ; preds = %for.end78
  %tmp80 = load i32* %ki, align 4
  %inc81 = add nsw i32 %tmp80, 1
  store i32 %inc81, i32* %ki, align 4
  br label %for.cond6

for.end82:                                        ; preds = %for.cond6
  br label %for.inc83

for.inc83:                                        ; preds = %for.end82
  %tmp84 = load i32* %j, align 4
  %inc85 = add nsw i32 %tmp84, 1
  store i32 %inc85, i32* %j, align 4
  br label %for.cond2

for.end86:                                        ; preds = %for.cond2
  br label %for.inc87

for.inc87:                                        ; preds = %for.end86
  %tmp88 = load i32* %i, align 4
  %inc89 = add nsw i32 %tmp88, 1
  store i32 %inc89, i32* %i, align 4
  br label %for.cond

for.end90:                                        ; preds = %for.cond
  call void @exit(i32 0) noreturn nounwind
  unreachable

return:                                           ; No predecessors!
  %0 = load i32* %retval
  ret i32 %0
}

declare void @exit(i32) noreturn nounwind
