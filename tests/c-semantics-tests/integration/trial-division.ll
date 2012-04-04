; ModuleID = '/home/david/src/c-semantics/tests/integration/trial-division.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@primes = common global i16* null, align 8
@.str = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1
@.str1 = private unnamed_addr constant [8 x i8] c"------\0A\00", align 1

define i32 @trial_division_sqrt(i32 %n) nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %n.addr = alloca i32, align 4
  %sqrt_n = alloca i32, align 4
  %x = alloca i32, align 4
  store i32 %n, i32* %n.addr, align 4
  %0 = load i32* %n.addr, align 4
  %conv = uitofp i32 %0 to double
  %call = call double @sqrt(double %conv) nounwind readnone
  %conv1 = fptoui double %call to i32
  store i32 %conv1, i32* %sqrt_n, align 4
  store i32 2, i32* %x, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load i32* %x, align 4
  %2 = load i32* %sqrt_n, align 4
  %cmp = icmp ule i32 %1, %2
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %3 = load i32* %n.addr, align 4
  %4 = load i32* %x, align 4
  %rem = urem i32 %3, %4
  %cmp3 = icmp eq i32 %rem, 0
  br i1 %cmp3, label %if.then, label %if.end

if.then:                                          ; preds = %for.body
  %5 = load i32* %x, align 4
  store i32 %5, i32* %retval
  br label %return

if.end:                                           ; preds = %for.body
  br label %for.inc

for.inc:                                          ; preds = %if.end
  %6 = load i32* %x, align 4
  %inc = add i32 %6, 1
  store i32 %inc, i32* %x, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  store i32 0, i32* %retval
  br label %return

return:                                           ; preds = %for.end, %if.then
  %7 = load i32* %retval
  ret i32 %7
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
  %0 = load i32* %x_squared, align 4
  %1 = load i32* %x, align 4
  %mul = mul i32 2, %1
  %sub = sub i32 %mul, 1
  %cmp = icmp ugt i32 %0, %sub
  br i1 %cmp, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %for.cond
  %2 = load i32* %x_squared, align 4
  %3 = load i32* %n.addr, align 4
  %cmp1 = icmp ule i32 %2, %3
  br label %land.end

land.end:                                         ; preds = %land.rhs, %for.cond
  %4 = phi i1 [ false, %for.cond ], [ %cmp1, %land.rhs ]
  br i1 %4, label %for.body, label %for.end

for.body:                                         ; preds = %land.end
  %5 = load i32* %n.addr, align 4
  %6 = load i32* %x, align 4
  %rem = urem i32 %5, %6
  %cmp2 = icmp eq i32 %rem, 0
  br i1 %cmp2, label %if.then, label %if.end

if.then:                                          ; preds = %for.body
  %7 = load i32* %x, align 4
  store i32 %7, i32* %retval
  br label %return

if.end:                                           ; preds = %for.body
  br label %for.inc

for.inc:                                          ; preds = %if.end
  %8 = load i32* %x, align 4
  %inc = add i32 %8, 1
  store i32 %inc, i32* %x, align 4
  %9 = load i32* %x, align 4
  %mul3 = mul i32 2, %9
  %sub4 = sub i32 %mul3, 1
  %10 = load i32* %x_squared, align 4
  %add = add i32 %10, %sub4
  store i32 %add, i32* %x_squared, align 4
  br label %for.cond

for.end:                                          ; preds = %land.end
  store i32 0, i32* %retval
  br label %return

return:                                           ; preds = %for.end, %if.then
  %11 = load i32* %retval
  ret i32 %11
}

define i32 @trial_division_odd(i32 %n) nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %n.addr = alloca i32, align 4
  %sqrt_n = alloca i32, align 4
  %x = alloca i32, align 4
  store i32 %n, i32* %n.addr, align 4
  %0 = load i32* %n.addr, align 4
  %conv = uitofp i32 %0 to double
  %call = call double @sqrt(double %conv) nounwind readnone
  %conv1 = fptoui double %call to i32
  store i32 %conv1, i32* %sqrt_n, align 4
  %1 = load i32* %n.addr, align 4
  %rem = urem i32 %1, 2
  %cmp = icmp eq i32 %rem, 0
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  store i32 2, i32* %retval
  br label %return

if.end:                                           ; preds = %entry
  store i32 3, i32* %x, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %if.end
  %2 = load i32* %x, align 4
  %3 = load i32* %sqrt_n, align 4
  %cmp3 = icmp ule i32 %2, %3
  br i1 %cmp3, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %4 = load i32* %n.addr, align 4
  %5 = load i32* %x, align 4
  %rem5 = urem i32 %4, %5
  %cmp6 = icmp eq i32 %rem5, 0
  br i1 %cmp6, label %if.then8, label %if.end9

if.then8:                                         ; preds = %for.body
  %6 = load i32* %x, align 4
  store i32 %6, i32* %retval
  br label %return

if.end9:                                          ; preds = %for.body
  br label %for.inc

for.inc:                                          ; preds = %if.end9
  %7 = load i32* %x, align 4
  %add = add i32 %7, 2
  store i32 %add, i32* %x, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  store i32 0, i32* %retval
  br label %return

return:                                           ; preds = %for.end, %if.then8, %if.then
  %8 = load i32* %retval
  ret i32 %8
}

define void @generate_prime_list(i32 %max) nounwind uwtable {
entry:
  %max.addr = alloca i32, align 4
  %is_not_prime = alloca i8*, align 8
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %num_primes = alloca i32, align 4
  store i32 %max, i32* %max.addr, align 4
  %0 = load i32* %max.addr, align 4
  %add = add nsw i32 %0, 1
  %conv = sext i32 %add to i64
  %call = call noalias i8* @calloc(i64 %conv, i64 1) nounwind
  store i8* %call, i8** %is_not_prime, align 8
  store i32 1, i32* %num_primes, align 4
  store i32 2, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc10, %entry
  %1 = load i32* %i, align 4
  %2 = load i32* %max.addr, align 4
  %cmp = icmp sle i32 %1, %2
  br i1 %cmp, label %for.body, label %for.end12

for.body:                                         ; preds = %for.cond
  %3 = load i32* %i, align 4
  %idxprom = sext i32 %3 to i64
  %4 = load i8** %is_not_prime, align 8
  %arrayidx = getelementptr inbounds i8* %4, i64 %idxprom
  %5 = load i8* %arrayidx, align 1
  %tobool = icmp ne i8 %5, 0
  br i1 %tobool, label %if.end, label %if.then

if.then:                                          ; preds = %for.body
  %6 = load i32* %num_primes, align 4
  %inc = add nsw i32 %6, 1
  store i32 %inc, i32* %num_primes, align 4
  %7 = load i32* %i, align 4
  %8 = load i32* %i, align 4
  %add2 = add nsw i32 %7, %8
  store i32 %add2, i32* %j, align 4
  br label %for.cond3

for.cond3:                                        ; preds = %for.inc, %if.then
  %9 = load i32* %j, align 4
  %10 = load i32* %max.addr, align 4
  %cmp4 = icmp sle i32 %9, %10
  br i1 %cmp4, label %for.body6, label %for.end

for.body6:                                        ; preds = %for.cond3
  %11 = load i32* %j, align 4
  %idxprom7 = sext i32 %11 to i64
  %12 = load i8** %is_not_prime, align 8
  %arrayidx8 = getelementptr inbounds i8* %12, i64 %idxprom7
  store i8 1, i8* %arrayidx8, align 1
  br label %for.inc

for.inc:                                          ; preds = %for.body6
  %13 = load i32* %i, align 4
  %14 = load i32* %j, align 4
  %add9 = add nsw i32 %14, %13
  store i32 %add9, i32* %j, align 4
  br label %for.cond3

for.end:                                          ; preds = %for.cond3
  br label %if.end

if.end:                                           ; preds = %for.end, %for.body
  br label %for.inc10

for.inc10:                                        ; preds = %if.end
  %15 = load i32* %i, align 4
  %inc11 = add nsw i32 %15, 1
  store i32 %inc11, i32* %i, align 4
  br label %for.cond

for.end12:                                        ; preds = %for.cond
  %16 = load i32* %num_primes, align 4
  %add13 = add nsw i32 %16, 1
  %conv14 = sext i32 %add13 to i64
  %mul = mul i64 2, %conv14
  %call15 = call noalias i8* @malloc(i64 %mul) nounwind
  %17 = bitcast i8* %call15 to i16*
  store i16* %17, i16** @primes, align 8
  store i32 0, i32* %j, align 4
  store i32 2, i32* %i, align 4
  br label %for.cond16

for.cond16:                                       ; preds = %for.inc29, %for.end12
  %18 = load i32* %i, align 4
  %19 = load i32* %max.addr, align 4
  %cmp17 = icmp sle i32 %18, %19
  br i1 %cmp17, label %for.body19, label %for.end31

for.body19:                                       ; preds = %for.cond16
  %20 = load i32* %i, align 4
  %idxprom20 = sext i32 %20 to i64
  %21 = load i8** %is_not_prime, align 8
  %arrayidx21 = getelementptr inbounds i8* %21, i64 %idxprom20
  %22 = load i8* %arrayidx21, align 1
  %tobool22 = icmp ne i8 %22, 0
  br i1 %tobool22, label %if.end28, label %if.then23

if.then23:                                        ; preds = %for.body19
  %23 = load i32* %i, align 4
  %conv24 = trunc i32 %23 to i16
  %24 = load i32* %j, align 4
  %idxprom25 = sext i32 %24 to i64
  %25 = load i16** @primes, align 8
  %arrayidx26 = getelementptr inbounds i16* %25, i64 %idxprom25
  store i16 %conv24, i16* %arrayidx26, align 2
  %26 = load i32* %j, align 4
  %inc27 = add nsw i32 %26, 1
  store i32 %inc27, i32* %j, align 4
  br label %if.end28

if.end28:                                         ; preds = %if.then23, %for.body19
  br label %for.inc29

for.inc29:                                        ; preds = %if.end28
  %27 = load i32* %i, align 4
  %inc30 = add nsw i32 %27, 1
  store i32 %inc30, i32* %i, align 4
  br label %for.cond16

for.end31:                                        ; preds = %for.cond16
  %28 = load i32* %j, align 4
  %idxprom32 = sext i32 %28 to i64
  %29 = load i16** @primes, align 8
  %arrayidx33 = getelementptr inbounds i16* %29, i64 %idxprom32
  store i16 0, i16* %arrayidx33, align 2
  %30 = load i8** %is_not_prime, align 8
  call void @free(i8* %30) nounwind
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
  %0 = load i32* %n.addr, align 4
  %conv = uitofp i32 %0 to double
  %call = call double @sqrt(double %conv) nounwind readnone
  %conv1 = fptoui double %call to i32
  store i32 %conv1, i32* %sqrt_n, align 4
  %1 = load i16** @primes, align 8
  store i16* %1, i16** %prime, align 8
  br label %while.cond

while.cond:                                       ; preds = %if.end, %entry
  %2 = load i16** %prime, align 8
  %3 = load i16* %2, align 2
  %conv2 = zext i16 %3 to i32
  %cmp = icmp ne i32 %conv2, 0
  br i1 %cmp, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %while.cond
  %4 = load i16** %prime, align 8
  %5 = load i16* %4, align 2
  %conv4 = zext i16 %5 to i32
  %6 = load i32* %sqrt_n, align 4
  %cmp5 = icmp ule i32 %conv4, %6
  br label %land.end

land.end:                                         ; preds = %land.rhs, %while.cond
  %7 = phi i1 [ false, %while.cond ], [ %cmp5, %land.rhs ]
  br i1 %7, label %while.body, label %while.end

while.body:                                       ; preds = %land.end
  %8 = load i32* %n.addr, align 4
  %9 = load i16** %prime, align 8
  %10 = load i16* %9, align 2
  %conv7 = zext i16 %10 to i32
  %rem = urem i32 %8, %conv7
  %cmp8 = icmp eq i32 %rem, 0
  br i1 %cmp8, label %if.then, label %if.end

if.then:                                          ; preds = %while.body
  %11 = load i16** %prime, align 8
  %12 = load i16* %11, align 2
  %conv10 = zext i16 %12 to i32
  store i32 %conv10, i32* %retval
  br label %return

if.end:                                           ; preds = %while.body
  %13 = load i16** %prime, align 8
  %incdec.ptr = getelementptr inbounds i16* %13, i32 1
  store i16* %incdec.ptr, i16** %prime, align 8
  br label %while.cond

while.end:                                        ; preds = %land.end
  store i32 0, i32* %retval
  br label %return

return:                                           ; preds = %while.end, %if.then
  %14 = load i32* %retval
  ret i32 %14
}

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %i = alloca i32, align 4
  %n = alloca i32, align 4
  store i32 0, i32* %retval
  call void @generate_prime_list(i32 128)
  store i32 241333, i32* %n, align 4
  %0 = load i32* %n, align 4
  %call = call i32 @trial_division_sqrt(i32 %0)
  %call1 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i32 0, i32 0), i32 %call)
  %1 = load i32* %n, align 4
  %call2 = call i32 @trial_division_squaring(i32 %1)
  %call3 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i32 0, i32 0), i32 %call2)
  %2 = load i32* %n, align 4
  %call4 = call i32 @trial_division_odd(i32 %2)
  %call5 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i32 0, i32 0), i32 %call4)
  %3 = load i32* %n, align 4
  %call6 = call i32 @trial_division_primes(i32 %3)
  %call7 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i32 0, i32 0), i32 %call6)
  %call8 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([8 x i8]* @.str1, i32 0, i32 0))
  store i32 2144892013, i32* %n, align 4
  %4 = load i32* %n, align 4
  %call9 = call i32 @trial_division_sqrt(i32 %4)
  %call10 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i32 0, i32 0), i32 %call9)
  %5 = load i32* %n, align 4
  %call11 = call i32 @trial_division_squaring(i32 %5)
  %call12 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i32 0, i32 0), i32 %call11)
  %6 = load i32* %n, align 4
  %call13 = call i32 @trial_division_odd(i32 %6)
  %call14 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i32 0, i32 0), i32 %call13)
  %7 = load i32* %n, align 4
  %call15 = call i32 @trial_division_primes(i32 %7)
  %call16 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i32 0, i32 0), i32 %call15)
  ret i32 0
}

declare i32 @printf(i8*, ...)
