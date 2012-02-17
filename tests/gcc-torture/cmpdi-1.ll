; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/cmpdi-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@args = global [8 x i64] [i64 0, i64 1, i64 -1, i64 9223372036854775807, i64 -9223372036854775808, i64 -9223372036854775807, i64 1891269347843992664, i64 -7816825554603336956], align 16
@correct_results = global [640 x i32] [i32 13, i32 140, i32 140, i32 13, i32 140, i32 13, i32 140, i32 13, i32 140, i32 13, i32 140, i32 13, i32 13, i32 140, i32 140, i32 13, i32 13, i32 140, i32 140, i32 13, i32 140, i32 13, i32 140, i32 13, i32 13, i32 140, i32 13, i32 140, i32 140, i32 13, i32 140, i32 13, i32 13, i32 140, i32 140, i32 13, i32 13, i32 140, i32 140, i32 13, i32 140, i32 13, i32 140, i32 13, i32 13, i32 140, i32 13, i32 140, i32 140, i32 13, i32 140, i32 13, i32 140, i32 13, i32 13, i32 140, i32 13, i32 140, i32 140, i32 13, i32 140, i32 13, i32 13, i32 140, i32 140, i32 13, i32 13, i32 140, i32 140, i32 13, i32 140, i32 13, i32 140, i32 13, i32 13, i32 140, i32 13, i32 140, i32 140, i32 13, i32 140, i32 13, i32 140, i32 13, i32 13, i32 140, i32 140, i32 13, i32 13, i32 140, i32 13, i32 140, i32 140, i32 13, i32 140, i32 13, i32 140, i32 13, i32 140, i32 13, i32 140, i32 13, i32 140, i32 13, i32 13, i32 140, i32 13, i32 140, i32 140, i32 13, i32 140, i32 13, i32 13, i32 140, i32 140, i32 13, i32 13, i32 140, i32 140, i32 13, i32 140, i32 13, i32 140, i32 13, i32 13, i32 140, i32 13, i32 140, i32 140, i32 13, i32 140, i32 13, i32 140, i32 13, i32 13, i32 140, i32 13, i32 140, i32 140, i32 13, i32 140, i32 13, i32 13, i32 140, i32 140, i32 13, i32 13, i32 140, i32 140, i32 13, i32 140, i32 13, i32 140, i32 13, i32 13, i32 140, i32 13, i32 140, i32 140, i32 13, i32 140, i32 13, i32 13, i32 140, i32 140, i32 13, i32 140, i32 13, i32 13, i32 140, i32 140, i32 13, i32 13, i32 140, i32 140, i32 13, i32 140, i32 13, i32 13, i32 140, i32 13, i32 140, i32 140, i32 13, i32 140, i32 13, i32 140, i32 13, i32 140, i32 13, i32 140, i32 13, i32 13, i32 140, i32 140, i32 13, i32 140, i32 13, i32 13, i32 140, i32 140, i32 13, i32 140, i32 13, i32 13, i32 140, i32 140, i32 13, i32 13, i32 140, i32 140, i32 13, i32 140, i32 13, i32 13, i32 140, i32 140, i32 13, i32 13, i32 140, i32 140, i32 13, i32 13, i32 140, i32 140, i32 13, i32 140, i32 13, i32 13, i32 140, i32 140, i32 13, i32 140, i32 13, i32 13, i32 140, i32 140, i32 13, i32 13, i32 140, i32 140, i32 13, i32 140, i32 13, i32 13, i32 140, i32 140, i32 13, i32 13, i32 140, i32 140, i32 13, i32 140, i32 13, i32 13, i32 140, i32 140, i32 13, i32 13, i32 140, i32 140, i32 13, i32 140, i32 13, i32 13, i32 140, i32 13, i32 140, i32 140, i32 13, i32 13, i32 140, i32 140, i32 13, i32 140, i32 13, i32 140, i32 13, i32 140, i32 13, i32 140, i32 13, i32 140, i32 13, i32 13, i32 140, i32 13, i32 140, i32 140, i32 13, i32 140, i32 13, i32 140, i32 13, i32 13, i32 140, i32 13, i32 140, i32 140, i32 13, i32 140, i32 13, i32 140, i32 13, i32 13, i32 140, i32 140, i32 13, i32 13, i32 140, i32 140, i32 13, i32 140, i32 13, i32 13, i32 140, i32 13, i32 140, i32 140, i32 13, i32 140, i32 13, i32 13, i32 140, i32 140, i32 13, i32 140, i32 13, i32 13, i32 140, i32 140, i32 13, i32 13, i32 140, i32 140, i32 13, i32 140, i32 13, i32 13, i32 140, i32 140, i32 13, i32 13, i32 140, i32 140, i32 13, i32 13, i32 140, i32 140, i32 13, i32 140, i32 13, i32 13, i32 140, i32 140, i32 13, i32 140, i32 13, i32 13, i32 140, i32 13, i32 140, i32 140, i32 13, i32 140, i32 13, i32 140, i32 13, i32 140, i32 13, i32 140, i32 13, i32 13, i32 140, i32 140, i32 13, i32 13, i32 140, i32 140, i32 13, i32 140, i32 13, i32 13, i32 140, i32 140, i32 13, i32 140, i32 13, i32 13, i32 140, i32 140, i32 13, i32 13, i32 140, i32 140, i32 13, i32 13, i32 140, i32 140, i32 13, i32 140, i32 13, i32 13, i32 140, i32 140, i32 13, i32 140, i32 13, i32 13, i32 140, i32 140, i32 13, i32 13, i32 140, i32 140, i32 13, i32 140, i32 13, i32 13, i32 140, i32 140, i32 13, i32 13, i32 140, i32 140, i32 13, i32 13, i32 140, i32 140, i32 13, i32 140, i32 13, i32 13, i32 140, i32 140, i32 13, i32 140, i32 13, i32 13, i32 140, i32 140, i32 13, i32 140, i32 13, i32 13, i32 140, i32 140, i32 13, i32 13, i32 140, i32 13, i32 140, i32 140, i32 13, i32 140, i32 13, i32 140, i32 13, i32 140, i32 13, i32 140, i32 13, i32 13, i32 140, i32 140, i32 13, i32 140, i32 13, i32 13, i32 140, i32 140, i32 13, i32 13, i32 140, i32 140, i32 13, i32 13, i32 140, i32 140, i32 13, i32 140, i32 13, i32 140, i32 13, i32 13, i32 140, i32 140, i32 13, i32 13, i32 140, i32 140, i32 13, i32 140, i32 13, i32 13, i32 140, i32 140, i32 13, i32 13, i32 140, i32 140, i32 13, i32 140, i32 13, i32 13, i32 140, i32 13, i32 140, i32 140, i32 13, i32 140, i32 13, i32 13, i32 140, i32 140, i32 13, i32 13, i32 140, i32 140, i32 13, i32 140, i32 13, i32 140, i32 13, i32 13, i32 140, i32 13, i32 140, i32 140, i32 13, i32 140, i32 13, i32 140, i32 13, i32 13, i32 140, i32 13, i32 140, i32 140, i32 13, i32 13, i32 140, i32 140, i32 13, i32 140, i32 13, i32 140, i32 13, i32 140, i32 13, i32 140, i32 13, i32 140, i32 13, i32 13, i32 140, i32 13, i32 140, i32 140, i32 13, i32 140, i32 13, i32 13, i32 140, i32 140, i32 13, i32 140, i32 13, i32 13, i32 140, i32 140, i32 13, i32 13, i32 140, i32 140, i32 13, i32 140, i32 13, i32 13, i32 140, i32 140, i32 13, i32 13, i32 140, i32 140, i32 13, i32 13, i32 140, i32 140, i32 13, i32 140, i32 13, i32 13, i32 140, i32 140, i32 13, i32 140, i32 13, i32 13, i32 140, i32 140, i32 13, i32 140, i32 13, i32 13, i32 140, i32 140, i32 13, i32 13, i32 140, i32 140, i32 13, i32 140, i32 13, i32 13, i32 140, i32 140, i32 13, i32 13, i32 140, i32 140, i32 13, i32 13, i32 140, i32 140, i32 13, i32 140, i32 13, i32 13, i32 140, i32 13, i32 140, i32 140, i32 13, i32 140, i32 13, i32 140, i32 13, i32 140, i32 13], align 16

define i32 @feq(i64 %x, i64 %y) nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %x.addr = alloca i64, align 8
  %y.addr = alloca i64, align 8
  store i64 %x, i64* %x.addr, align 8
  store i64 %y, i64* %y.addr, align 8
  %tmp = load i64* %x.addr, align 8
  %tmp1 = load i64* %y.addr, align 8
  %cmp = icmp eq i64 %tmp, %tmp1
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  store i32 13, i32* %retval
  br label %return

if.else:                                          ; preds = %entry
  store i32 140, i32* %retval
  br label %return

return:                                           ; preds = %if.else, %if.then
  %0 = load i32* %retval
  ret i32 %0
}

define i32 @fne(i64 %x, i64 %y) nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %x.addr = alloca i64, align 8
  %y.addr = alloca i64, align 8
  store i64 %x, i64* %x.addr, align 8
  store i64 %y, i64* %y.addr, align 8
  %tmp = load i64* %x.addr, align 8
  %tmp1 = load i64* %y.addr, align 8
  %cmp = icmp ne i64 %tmp, %tmp1
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  store i32 13, i32* %retval
  br label %return

if.else:                                          ; preds = %entry
  store i32 140, i32* %retval
  br label %return

return:                                           ; preds = %if.else, %if.then
  %0 = load i32* %retval
  ret i32 %0
}

define i32 @flt(i64 %x, i64 %y) nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %x.addr = alloca i64, align 8
  %y.addr = alloca i64, align 8
  store i64 %x, i64* %x.addr, align 8
  store i64 %y, i64* %y.addr, align 8
  %tmp = load i64* %x.addr, align 8
  %tmp1 = load i64* %y.addr, align 8
  %cmp = icmp slt i64 %tmp, %tmp1
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  store i32 13, i32* %retval
  br label %return

if.else:                                          ; preds = %entry
  store i32 140, i32* %retval
  br label %return

return:                                           ; preds = %if.else, %if.then
  %0 = load i32* %retval
  ret i32 %0
}

define i32 @fge(i64 %x, i64 %y) nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %x.addr = alloca i64, align 8
  %y.addr = alloca i64, align 8
  store i64 %x, i64* %x.addr, align 8
  store i64 %y, i64* %y.addr, align 8
  %tmp = load i64* %x.addr, align 8
  %tmp1 = load i64* %y.addr, align 8
  %cmp = icmp sge i64 %tmp, %tmp1
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  store i32 13, i32* %retval
  br label %return

if.else:                                          ; preds = %entry
  store i32 140, i32* %retval
  br label %return

return:                                           ; preds = %if.else, %if.then
  %0 = load i32* %retval
  ret i32 %0
}

define i32 @fgt(i64 %x, i64 %y) nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %x.addr = alloca i64, align 8
  %y.addr = alloca i64, align 8
  store i64 %x, i64* %x.addr, align 8
  store i64 %y, i64* %y.addr, align 8
  %tmp = load i64* %x.addr, align 8
  %tmp1 = load i64* %y.addr, align 8
  %cmp = icmp sgt i64 %tmp, %tmp1
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  store i32 13, i32* %retval
  br label %return

if.else:                                          ; preds = %entry
  store i32 140, i32* %retval
  br label %return

return:                                           ; preds = %if.else, %if.then
  %0 = load i32* %retval
  ret i32 %0
}

define i32 @fle(i64 %x, i64 %y) nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %x.addr = alloca i64, align 8
  %y.addr = alloca i64, align 8
  store i64 %x, i64* %x.addr, align 8
  store i64 %y, i64* %y.addr, align 8
  %tmp = load i64* %x.addr, align 8
  %tmp1 = load i64* %y.addr, align 8
  %cmp = icmp sle i64 %tmp, %tmp1
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  store i32 13, i32* %retval
  br label %return

if.else:                                          ; preds = %entry
  store i32 140, i32* %retval
  br label %return

return:                                           ; preds = %if.else, %if.then
  %0 = load i32* %retval
  ret i32 %0
}

define i32 @fltu(i64 %x, i64 %y) nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %x.addr = alloca i64, align 8
  %y.addr = alloca i64, align 8
  store i64 %x, i64* %x.addr, align 8
  store i64 %y, i64* %y.addr, align 8
  %tmp = load i64* %x.addr, align 8
  %tmp1 = load i64* %y.addr, align 8
  %cmp = icmp ult i64 %tmp, %tmp1
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  store i32 13, i32* %retval
  br label %return

if.else:                                          ; preds = %entry
  store i32 140, i32* %retval
  br label %return

return:                                           ; preds = %if.else, %if.then
  %0 = load i32* %retval
  ret i32 %0
}

define i32 @fgeu(i64 %x, i64 %y) nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %x.addr = alloca i64, align 8
  %y.addr = alloca i64, align 8
  store i64 %x, i64* %x.addr, align 8
  store i64 %y, i64* %y.addr, align 8
  %tmp = load i64* %x.addr, align 8
  %tmp1 = load i64* %y.addr, align 8
  %cmp = icmp uge i64 %tmp, %tmp1
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  store i32 13, i32* %retval
  br label %return

if.else:                                          ; preds = %entry
  store i32 140, i32* %retval
  br label %return

return:                                           ; preds = %if.else, %if.then
  %0 = load i32* %retval
  ret i32 %0
}

define i32 @fgtu(i64 %x, i64 %y) nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %x.addr = alloca i64, align 8
  %y.addr = alloca i64, align 8
  store i64 %x, i64* %x.addr, align 8
  store i64 %y, i64* %y.addr, align 8
  %tmp = load i64* %x.addr, align 8
  %tmp1 = load i64* %y.addr, align 8
  %cmp = icmp ugt i64 %tmp, %tmp1
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  store i32 13, i32* %retval
  br label %return

if.else:                                          ; preds = %entry
  store i32 140, i32* %retval
  br label %return

return:                                           ; preds = %if.else, %if.then
  %0 = load i32* %retval
  ret i32 %0
}

define i32 @fleu(i64 %x, i64 %y) nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %x.addr = alloca i64, align 8
  %y.addr = alloca i64, align 8
  store i64 %x, i64* %x.addr, align 8
  store i64 %y, i64* %y.addr, align 8
  %tmp = load i64* %x.addr, align 8
  %tmp1 = load i64* %y.addr, align 8
  %cmp = icmp ule i64 %tmp, %tmp1
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  store i32 13, i32* %retval
  br label %return

if.else:                                          ; preds = %entry
  store i32 140, i32* %retval
  br label %return

return:                                           ; preds = %if.else, %if.then
  %0 = load i32* %retval
  ret i32 %0
}

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %res = alloca i32*, align 8
  %arg0 = alloca i64, align 8
  %arg1 = alloca i64, align 8
  store i32 0, i32* %retval
  store i32* getelementptr inbounds ([640 x i32]* @correct_results, i32 0, i32 0), i32** %res, align 8
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc100, %entry
  %tmp = load i32* %i, align 4
  %cmp = icmp slt i32 %tmp, 8
  br i1 %cmp, label %for.body, label %for.end103

for.body:                                         ; preds = %for.cond
  %tmp2 = load i32* %i, align 4
  %idxprom = sext i32 %tmp2 to i64
  %arrayidx = getelementptr inbounds [8 x i64]* @args, i32 0, i64 %idxprom
  %tmp3 = load i64* %arrayidx, align 8
  store i64 %tmp3, i64* %arg0, align 8
  store i32 0, i32* %j, align 4
  br label %for.cond4

for.cond4:                                        ; preds = %for.inc, %for.body
  %tmp5 = load i32* %j, align 4
  %cmp6 = icmp slt i32 %tmp5, 8
  br i1 %cmp6, label %for.body7, label %for.end

for.body7:                                        ; preds = %for.cond4
  %tmp9 = load i32* %j, align 4
  %idxprom10 = sext i32 %tmp9 to i64
  %arrayidx11 = getelementptr inbounds [8 x i64]* @args, i32 0, i64 %idxprom10
  %tmp12 = load i64* %arrayidx11, align 8
  store i64 %tmp12, i64* %arg1, align 8
  %tmp13 = load i64* %arg0, align 8
  %tmp14 = load i64* %arg1, align 8
  %call = call i32 (...)* bitcast (i32 (i64, i64)* @feq to i32 (...)*)(i64 %tmp13, i64 %tmp14)
  %tmp15 = load i32** %res, align 8
  %incdec.ptr = getelementptr inbounds i32* %tmp15, i32 1
  store i32* %incdec.ptr, i32** %res, align 8
  %tmp16 = load i32* %tmp15
  %cmp17 = icmp ne i32 %call, %tmp16
  br i1 %cmp17, label %if.then, label %if.end

if.then:                                          ; preds = %for.body7
  call void @abort() noreturn
  unreachable

if.end:                                           ; preds = %for.body7
  %tmp18 = load i64* %arg0, align 8
  %tmp19 = load i64* %arg1, align 8
  %call20 = call i32 (...)* bitcast (i32 (i64, i64)* @fne to i32 (...)*)(i64 %tmp18, i64 %tmp19)
  %tmp21 = load i32** %res, align 8
  %incdec.ptr22 = getelementptr inbounds i32* %tmp21, i32 1
  store i32* %incdec.ptr22, i32** %res, align 8
  %tmp23 = load i32* %tmp21
  %cmp24 = icmp ne i32 %call20, %tmp23
  br i1 %cmp24, label %if.then25, label %if.end26

if.then25:                                        ; preds = %if.end
  call void @abort() noreturn
  unreachable

if.end26:                                         ; preds = %if.end
  %tmp27 = load i64* %arg0, align 8
  %tmp28 = load i64* %arg1, align 8
  %call29 = call i32 (...)* bitcast (i32 (i64, i64)* @flt to i32 (...)*)(i64 %tmp27, i64 %tmp28)
  %tmp30 = load i32** %res, align 8
  %incdec.ptr31 = getelementptr inbounds i32* %tmp30, i32 1
  store i32* %incdec.ptr31, i32** %res, align 8
  %tmp32 = load i32* %tmp30
  %cmp33 = icmp ne i32 %call29, %tmp32
  br i1 %cmp33, label %if.then34, label %if.end35

if.then34:                                        ; preds = %if.end26
  call void @abort() noreturn
  unreachable

if.end35:                                         ; preds = %if.end26
  %tmp36 = load i64* %arg0, align 8
  %tmp37 = load i64* %arg1, align 8
  %call38 = call i32 (...)* bitcast (i32 (i64, i64)* @fge to i32 (...)*)(i64 %tmp36, i64 %tmp37)
  %tmp39 = load i32** %res, align 8
  %incdec.ptr40 = getelementptr inbounds i32* %tmp39, i32 1
  store i32* %incdec.ptr40, i32** %res, align 8
  %tmp41 = load i32* %tmp39
  %cmp42 = icmp ne i32 %call38, %tmp41
  br i1 %cmp42, label %if.then43, label %if.end44

if.then43:                                        ; preds = %if.end35
  call void @abort() noreturn
  unreachable

if.end44:                                         ; preds = %if.end35
  %tmp45 = load i64* %arg0, align 8
  %tmp46 = load i64* %arg1, align 8
  %call47 = call i32 (...)* bitcast (i32 (i64, i64)* @fgt to i32 (...)*)(i64 %tmp45, i64 %tmp46)
  %tmp48 = load i32** %res, align 8
  %incdec.ptr49 = getelementptr inbounds i32* %tmp48, i32 1
  store i32* %incdec.ptr49, i32** %res, align 8
  %tmp50 = load i32* %tmp48
  %cmp51 = icmp ne i32 %call47, %tmp50
  br i1 %cmp51, label %if.then52, label %if.end53

if.then52:                                        ; preds = %if.end44
  call void @abort() noreturn
  unreachable

if.end53:                                         ; preds = %if.end44
  %tmp54 = load i64* %arg0, align 8
  %tmp55 = load i64* %arg1, align 8
  %call56 = call i32 (...)* bitcast (i32 (i64, i64)* @fle to i32 (...)*)(i64 %tmp54, i64 %tmp55)
  %tmp57 = load i32** %res, align 8
  %incdec.ptr58 = getelementptr inbounds i32* %tmp57, i32 1
  store i32* %incdec.ptr58, i32** %res, align 8
  %tmp59 = load i32* %tmp57
  %cmp60 = icmp ne i32 %call56, %tmp59
  br i1 %cmp60, label %if.then61, label %if.end62

if.then61:                                        ; preds = %if.end53
  call void @abort() noreturn
  unreachable

if.end62:                                         ; preds = %if.end53
  %tmp63 = load i64* %arg0, align 8
  %tmp64 = load i64* %arg1, align 8
  %call65 = call i32 (...)* bitcast (i32 (i64, i64)* @fltu to i32 (...)*)(i64 %tmp63, i64 %tmp64)
  %tmp66 = load i32** %res, align 8
  %incdec.ptr67 = getelementptr inbounds i32* %tmp66, i32 1
  store i32* %incdec.ptr67, i32** %res, align 8
  %tmp68 = load i32* %tmp66
  %cmp69 = icmp ne i32 %call65, %tmp68
  br i1 %cmp69, label %if.then70, label %if.end71

if.then70:                                        ; preds = %if.end62
  call void @abort() noreturn
  unreachable

if.end71:                                         ; preds = %if.end62
  %tmp72 = load i64* %arg0, align 8
  %tmp73 = load i64* %arg1, align 8
  %call74 = call i32 (...)* bitcast (i32 (i64, i64)* @fgeu to i32 (...)*)(i64 %tmp72, i64 %tmp73)
  %tmp75 = load i32** %res, align 8
  %incdec.ptr76 = getelementptr inbounds i32* %tmp75, i32 1
  store i32* %incdec.ptr76, i32** %res, align 8
  %tmp77 = load i32* %tmp75
  %cmp78 = icmp ne i32 %call74, %tmp77
  br i1 %cmp78, label %if.then79, label %if.end80

if.then79:                                        ; preds = %if.end71
  call void @abort() noreturn
  unreachable

if.end80:                                         ; preds = %if.end71
  %tmp81 = load i64* %arg0, align 8
  %tmp82 = load i64* %arg1, align 8
  %call83 = call i32 (...)* bitcast (i32 (i64, i64)* @fgtu to i32 (...)*)(i64 %tmp81, i64 %tmp82)
  %tmp84 = load i32** %res, align 8
  %incdec.ptr85 = getelementptr inbounds i32* %tmp84, i32 1
  store i32* %incdec.ptr85, i32** %res, align 8
  %tmp86 = load i32* %tmp84
  %cmp87 = icmp ne i32 %call83, %tmp86
  br i1 %cmp87, label %if.then88, label %if.end89

if.then88:                                        ; preds = %if.end80
  call void @abort() noreturn
  unreachable

if.end89:                                         ; preds = %if.end80
  %tmp90 = load i64* %arg0, align 8
  %tmp91 = load i64* %arg1, align 8
  %call92 = call i32 (...)* bitcast (i32 (i64, i64)* @fleu to i32 (...)*)(i64 %tmp90, i64 %tmp91)
  %tmp93 = load i32** %res, align 8
  %incdec.ptr94 = getelementptr inbounds i32* %tmp93, i32 1
  store i32* %incdec.ptr94, i32** %res, align 8
  %tmp95 = load i32* %tmp93
  %cmp96 = icmp ne i32 %call92, %tmp95
  br i1 %cmp96, label %if.then97, label %if.end98

if.then97:                                        ; preds = %if.end89
  call void @abort() noreturn
  unreachable

if.end98:                                         ; preds = %if.end89
  br label %for.inc

for.inc:                                          ; preds = %if.end98
  %tmp99 = load i32* %j, align 4
  %inc = add nsw i32 %tmp99, 1
  store i32 %inc, i32* %j, align 4
  br label %for.cond4

for.end:                                          ; preds = %for.cond4
  br label %for.inc100

for.inc100:                                       ; preds = %for.end
  %tmp101 = load i32* %i, align 4
  %inc102 = add nsw i32 %tmp101, 1
  store i32 %inc102, i32* %i, align 4
  br label %for.cond

for.end103:                                       ; preds = %for.cond
  call void @exit(i32 0) noreturn
  unreachable

return:                                           ; No predecessors!
  %0 = load i32* %retval
  ret i32 %0
}

declare void @abort() noreturn

declare void @exit(i32) noreturn
