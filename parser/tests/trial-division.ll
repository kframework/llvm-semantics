; ModuleID = '/home/grosu/celliso2/c-semantics/tests/integration/trial-division.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@primes = common global i16* null, align 8
@.str = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1
@.str1 = private unnamed_addr constant [8 x i8] c"------\0A\00", align 1

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

define i32 @trial_division_sqrt(i32 %n) nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %n.addr = alloca i32, align 4
  %sqrt_n = alloca i32, align 4
  %x = alloca i32, align 4
  store i32 %n, i32* %n.addr, align 4
  %tmp = load i32* %n.addr, align 4
  %conv = uitofp i32 %tmp to double
  %call = call double @sqrt(double %conv) nounwind readnone
  %conv1 = fptoui double %call to i32
  store i32 %conv1, i32* %sqrt_n, align 4
  store i32 2, i32* %x, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %tmp3 = load i32* %x, align 4
  %tmp4 = load i32* %sqrt_n, align 4
  %cmp = icmp ule i32 %tmp3, %tmp4
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %tmp6 = load i32* %n.addr, align 4
  %tmp7 = load i32* %x, align 4
  %rem = urem i32 %tmp6, %tmp7
  %cmp8 = icmp eq i32 %rem, 0
  br i1 %cmp8, label %if.then, label %if.end

if.then:                                          ; preds = %for.body
  %tmp10 = load i32* %x, align 4
  store i32 %tmp10, i32* %retval
  br label %return

if.end:                                           ; preds = %for.body
  br label %for.inc

for.inc:                                          ; preds = %if.end
  %tmp11 = load i32* %x, align 4
  %inc = add i32 %tmp11, 1
  store i32 %inc, i32* %x, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  store i32 0, i32* %retval
  br label %return

return:                                           ; preds = %for.end, %if.then
  %0 = load i32* %retval
  ret i32 %0
}

declare double @sqrt(double) nounwind readnone

define i32 @trial_division_squaring(i32 %n) nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %n.addr = alloca i32, align 4
  %x = alloca i32, align 4
  %x_squared = alloca i32, align 4
  store i32 %n, i32* %n.addr, align 4
  store i32 2, i32* %x, align 4
  store i32 4, i32* %x_squared, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %tmp = load i32* %x_squared, align 4
  %tmp1 = load i32* %x, align 4
  %mul = mul i32 2, %tmp1
  %sub = sub i32 %mul, 1
  %cmp = icmp ugt i32 %tmp, %sub
  br i1 %cmp, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %for.cond
  %tmp2 = load i32* %x_squared, align 4
  %tmp3 = load i32* %n.addr, align 4
  %cmp4 = icmp ule i32 %tmp2, %tmp3
  br label %land.end

land.end:                                         ; preds = %land.rhs, %for.cond
  %0 = phi i1 [ false, %for.cond ], [ %cmp4, %land.rhs ]
  br i1 %0, label %for.body, label %for.end

for.body:                                         ; preds = %land.end
  %tmp5 = load i32* %n.addr, align 4
  %tmp6 = load i32* %x, align 4
  %rem = urem i32 %tmp5, %tmp6
  %cmp7 = icmp eq i32 %rem, 0
  br i1 %cmp7, label %if.then, label %if.end

if.then:                                          ; preds = %for.body
  %tmp8 = load i32* %x, align 4
  store i32 %tmp8, i32* %retval
  br label %return

if.end:                                           ; preds = %for.body
  br label %for.inc

for.inc:                                          ; preds = %if.end
  %tmp9 = load i32* %x, align 4
  %inc = add i32 %tmp9, 1
  store i32 %inc, i32* %x, align 4
  %tmp10 = load i32* %x, align 4
  %mul11 = mul i32 2, %tmp10
  %sub12 = sub i32 %mul11, 1
  %tmp13 = load i32* %x_squared, align 4
  %add = add i32 %tmp13, %sub12
  store i32 %add, i32* %x_squared, align 4
  br label %for.cond

for.end:                                          ; preds = %land.end
  store i32 0, i32* %retval
  br label %return

return:                                           ; preds = %for.end, %if.then
  %1 = load i32* %retval
  ret i32 %1
}

define i32 @trial_division_odd(i32 %n) nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %n.addr = alloca i32, align 4
  %sqrt_n = alloca i32, align 4
  %x = alloca i32, align 4
  store i32 %n, i32* %n.addr, align 4
  %tmp = load i32* %n.addr, align 4
  %conv = uitofp i32 %tmp to double
  %call = call double @sqrt(double %conv) nounwind readnone
  %conv1 = fptoui double %call to i32
  store i32 %conv1, i32* %sqrt_n, align 4
  %tmp3 = load i32* %n.addr, align 4
  %rem = urem i32 %tmp3, 2
  %cmp = icmp eq i32 %rem, 0
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  store i32 2, i32* %retval
  br label %return

if.end:                                           ; preds = %entry
  store i32 3, i32* %x, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %if.end
  %tmp5 = load i32* %x, align 4
  %tmp6 = load i32* %sqrt_n, align 4
  %cmp7 = icmp ule i32 %tmp5, %tmp6
  br i1 %cmp7, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %tmp9 = load i32* %n.addr, align 4
  %tmp10 = load i32* %x, align 4
  %rem11 = urem i32 %tmp9, %tmp10
  %cmp12 = icmp eq i32 %rem11, 0
  br i1 %cmp12, label %if.then14, label %if.end16

if.then14:                                        ; preds = %for.body
  %tmp15 = load i32* %x, align 4
  store i32 %tmp15, i32* %retval
  br label %return

if.end16:                                         ; preds = %for.body
  br label %for.inc

for.inc:                                          ; preds = %if.end16
  %tmp17 = load i32* %x, align 4
  %add = add i32 %tmp17, 2
  store i32 %add, i32* %x, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  store i32 0, i32* %retval
  br label %return

return:                                           ; preds = %for.end, %if.then14, %if.then
  %0 = load i32* %retval
  ret i32 %0
}

define void @generate_prime_list(i32 %max) nounwind uwtable {
entry:
  %max.addr = alloca i32, align 4
  %is_not_prime = alloca i8*, align 8
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %num_primes = alloca i32, align 4
  store i32 %max, i32* %max.addr, align 4
  %tmp = load i32* %max.addr, align 4
  %add = add nsw i32 %tmp, 1
  %conv = sext i32 %add to i64
  %call = call noalias i8* @calloc(i64 %conv, i64 1) nounwind
  store i8* %call, i8** %is_not_prime, align 8
  store i32 1, i32* %num_primes, align 4
  store i32 2, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc27, %entry
  %tmp4 = load i32* %i, align 4
  %tmp5 = load i32* %max.addr, align 4
  %cmp = icmp sle i32 %tmp4, %tmp5
  br i1 %cmp, label %for.body, label %for.end30

for.body:                                         ; preds = %for.cond
  %tmp7 = load i32* %i, align 4
  %idxprom = sext i32 %tmp7 to i64
  %tmp8 = load i8** %is_not_prime, align 8
  %arrayidx = getelementptr inbounds i8* %tmp8, i64 %idxprom
  %tmp9 = load i8* %arrayidx
  %tobool = icmp ne i8 %tmp9, 0
  br i1 %tobool, label %if.end, label %if.then

if.then:                                          ; preds = %for.body
  %tmp10 = load i32* %num_primes, align 4
  %inc = add nsw i32 %tmp10, 1
  store i32 %inc, i32* %num_primes, align 4
  %tmp11 = load i32* %i, align 4
  %tmp12 = load i32* %i, align 4
  %add13 = add nsw i32 %tmp11, %tmp12
  store i32 %add13, i32* %j, align 4
  br label %for.cond14

for.cond14:                                       ; preds = %for.inc, %if.then
  %tmp15 = load i32* %j, align 4
  %tmp16 = load i32* %max.addr, align 4
  %cmp17 = icmp sle i32 %tmp15, %tmp16
  br i1 %cmp17, label %for.body19, label %for.end

for.body19:                                       ; preds = %for.cond14
  %tmp20 = load i32* %j, align 4
  %idxprom21 = sext i32 %tmp20 to i64
  %tmp22 = load i8** %is_not_prime, align 8
  %arrayidx23 = getelementptr inbounds i8* %tmp22, i64 %idxprom21
  store i8 1, i8* %arrayidx23
  br label %for.inc

for.inc:                                          ; preds = %for.body19
  %tmp24 = load i32* %i, align 4
  %tmp25 = load i32* %j, align 4
  %add26 = add nsw i32 %tmp25, %tmp24
  store i32 %add26, i32* %j, align 4
  br label %for.cond14

for.end:                                          ; preds = %for.cond14
  br label %if.end

if.end:                                           ; preds = %for.end, %for.body
  br label %for.inc27

for.inc27:                                        ; preds = %if.end
  %tmp28 = load i32* %i, align 4
  %inc29 = add nsw i32 %tmp28, 1
  store i32 %inc29, i32* %i, align 4
  br label %for.cond

for.end30:                                        ; preds = %for.cond
  %tmp31 = load i32* %num_primes, align 4
  %add32 = add nsw i32 %tmp31, 1
  %conv33 = sext i32 %add32 to i64
  %mul = mul i64 2, %conv33
  %call34 = call noalias i8* @malloc(i64 %mul) nounwind
  %0 = bitcast i8* %call34 to i16*
  store i16* %0, i16** @primes, align 8
  store i32 0, i32* %j, align 4
  store i32 2, i32* %i, align 4
  br label %for.cond35

for.cond35:                                       ; preds = %for.inc57, %for.end30
  %tmp36 = load i32* %i, align 4
  %tmp37 = load i32* %max.addr, align 4
  %cmp38 = icmp sle i32 %tmp36, %tmp37
  br i1 %cmp38, label %for.body40, label %for.end60

for.body40:                                       ; preds = %for.cond35
  %tmp41 = load i32* %i, align 4
  %idxprom42 = sext i32 %tmp41 to i64
  %tmp43 = load i8** %is_not_prime, align 8
  %arrayidx44 = getelementptr inbounds i8* %tmp43, i64 %idxprom42
  %tmp45 = load i8* %arrayidx44
  %tobool46 = icmp ne i8 %tmp45, 0
  br i1 %tobool46, label %if.end56, label %if.then47

if.then47:                                        ; preds = %for.body40
  %tmp48 = load i32* %i, align 4
  %conv49 = trunc i32 %tmp48 to i16
  %tmp50 = load i32* %j, align 4
  %idxprom51 = sext i32 %tmp50 to i64
  %tmp52 = load i16** @primes, align 8
  %arrayidx53 = getelementptr inbounds i16* %tmp52, i64 %idxprom51
  store i16 %conv49, i16* %arrayidx53
  %tmp54 = load i32* %j, align 4
  %inc55 = add nsw i32 %tmp54, 1
  store i32 %inc55, i32* %j, align 4
  br label %if.end56

if.end56:                                         ; preds = %if.then47, %for.body40
  br label %for.inc57

for.inc57:                                        ; preds = %if.end56
  %tmp58 = load i32* %i, align 4
  %inc59 = add nsw i32 %tmp58, 1
  store i32 %inc59, i32* %i, align 4
  br label %for.cond35

for.end60:                                        ; preds = %for.cond35
  %tmp61 = load i32* %j, align 4
  %idxprom62 = sext i32 %tmp61 to i64
  %tmp63 = load i16** @primes, align 8
  %arrayidx64 = getelementptr inbounds i16* %tmp63, i64 %idxprom62
  store i16 0, i16* %arrayidx64
  %tmp65 = load i8** %is_not_prime, align 8
  call void @free(i8* %tmp65) nounwind
  ret void
}

declare noalias i8* @calloc(i64, i64) nounwind

declare noalias i8* @malloc(i64) nounwind

declare void @free(i8*) nounwind

define i32 @trial_division_primes(i32 %n) nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %n.addr = alloca i32, align 4
  %sqrt_n = alloca i32, align 4
  %prime = alloca i16*, align 8
  store i32 %n, i32* %n.addr, align 4
  %tmp = load i32* %n.addr, align 4
  %conv = uitofp i32 %tmp to double
  %call = call double @sqrt(double %conv) nounwind readnone
  %conv1 = fptoui double %call to i32
  store i32 %conv1, i32* %sqrt_n, align 4
  %tmp3 = load i16** @primes, align 8
  store i16* %tmp3, i16** %prime, align 8
  br label %while.cond

while.cond:                                       ; preds = %if.end, %entry
  %tmp4 = load i16** %prime, align 8
  %tmp5 = load i16* %tmp4
  %conv6 = zext i16 %tmp5 to i32
  %cmp = icmp ne i32 %conv6, 0
  br i1 %cmp, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %while.cond
  %tmp8 = load i16** %prime, align 8
  %tmp9 = load i16* %tmp8
  %conv10 = zext i16 %tmp9 to i32
  %tmp11 = load i32* %sqrt_n, align 4
  %cmp12 = icmp ule i32 %conv10, %tmp11
  br label %land.end

land.end:                                         ; preds = %land.rhs, %while.cond
  %0 = phi i1 [ false, %while.cond ], [ %cmp12, %land.rhs ]
  br i1 %0, label %while.body, label %while.end

while.body:                                       ; preds = %land.end
  %tmp14 = load i32* %n.addr, align 4
  %tmp15 = load i16** %prime, align 8
  %tmp16 = load i16* %tmp15
  %conv17 = zext i16 %tmp16 to i32
  %rem = urem i32 %tmp14, %conv17
  %cmp18 = icmp eq i32 %rem, 0
  br i1 %cmp18, label %if.then, label %if.end

if.then:                                          ; preds = %while.body
  %tmp20 = load i16** %prime, align 8
  %tmp21 = load i16* %tmp20
  %conv22 = zext i16 %tmp21 to i32
  store i32 %conv22, i32* %retval
  br label %return

if.end:                                           ; preds = %while.body
  %tmp23 = load i16** %prime, align 8
  %incdec.ptr = getelementptr inbounds i16* %tmp23, i32 1
  store i16* %incdec.ptr, i16** %prime, align 8
  br label %while.cond

while.end:                                        ; preds = %land.end
  store i32 0, i32* %retval
  br label %return

return:                                           ; preds = %while.end, %if.then
  %1 = load i32* %retval
  ret i32 %1
}

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %i = alloca i32, align 4
  %n = alloca i32, align 4
  store i32 0, i32* %retval
  call void @generate_prime_list(i32 128)
  store i32 241333, i32* %n, align 4
  %tmp = load i32* %n, align 4
  %call = call i32 @trial_division_sqrt(i32 %tmp)
  %call1 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i32 0, i32 0), i32 %call)
  %tmp2 = load i32* %n, align 4
  %call3 = call i32 @trial_division_squaring(i32 %tmp2)
  %call4 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i32 0, i32 0), i32 %call3)
  %tmp5 = load i32* %n, align 4
  %call6 = call i32 @trial_division_odd(i32 %tmp5)
  %call7 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i32 0, i32 0), i32 %call6)
  %tmp8 = load i32* %n, align 4
  %call9 = call i32 @trial_division_primes(i32 %tmp8)
  %call10 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i32 0, i32 0), i32 %call9)
  %call11 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([8 x i8]* @.str1, i32 0, i32 0))
  store i32 2144892013, i32* %n, align 4
  %tmp12 = load i32* %n, align 4
  %call13 = call i32 @trial_division_sqrt(i32 %tmp12)
  %call14 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i32 0, i32 0), i32 %call13)
  %tmp15 = load i32* %n, align 4
  %call16 = call i32 @trial_division_squaring(i32 %tmp15)
  %call17 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i32 0, i32 0), i32 %call16)
  %tmp18 = load i32* %n, align 4
  %call19 = call i32 @trial_division_odd(i32 %tmp18)
  %call20 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i32 0, i32 0), i32 %call19)
  %tmp21 = load i32* %n, align 4
  %call22 = call i32 @trial_division_primes(i32 %tmp21)
  %call23 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i32 0, i32 0), i32 %call22)
  ret i32 0
}

declare i32 @printf(i8*, ...)
