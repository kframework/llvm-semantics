; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/cmpdi-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
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
  %0 = load i64* %x.addr, align 8
  %1 = load i64* %y.addr, align 8
  %cmp = icmp eq i64 %0, %1
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  store i32 13, i32* %retval
  br label %return

if.else:                                          ; preds = %entry
  store i32 140, i32* %retval
  br label %return

return:                                           ; preds = %if.else, %if.then
  %2 = load i32* %retval
  ret i32 %2
}

define i32 @fne(i64 %x, i64 %y) nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %x.addr = alloca i64, align 8
  %y.addr = alloca i64, align 8
  store i64 %x, i64* %x.addr, align 8
  store i64 %y, i64* %y.addr, align 8
  %0 = load i64* %x.addr, align 8
  %1 = load i64* %y.addr, align 8
  %cmp = icmp ne i64 %0, %1
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  store i32 13, i32* %retval
  br label %return

if.else:                                          ; preds = %entry
  store i32 140, i32* %retval
  br label %return

return:                                           ; preds = %if.else, %if.then
  %2 = load i32* %retval
  ret i32 %2
}

define i32 @flt(i64 %x, i64 %y) nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %x.addr = alloca i64, align 8
  %y.addr = alloca i64, align 8
  store i64 %x, i64* %x.addr, align 8
  store i64 %y, i64* %y.addr, align 8
  %0 = load i64* %x.addr, align 8
  %1 = load i64* %y.addr, align 8
  %cmp = icmp slt i64 %0, %1
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  store i32 13, i32* %retval
  br label %return

if.else:                                          ; preds = %entry
  store i32 140, i32* %retval
  br label %return

return:                                           ; preds = %if.else, %if.then
  %2 = load i32* %retval
  ret i32 %2
}

define i32 @fge(i64 %x, i64 %y) nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %x.addr = alloca i64, align 8
  %y.addr = alloca i64, align 8
  store i64 %x, i64* %x.addr, align 8
  store i64 %y, i64* %y.addr, align 8
  %0 = load i64* %x.addr, align 8
  %1 = load i64* %y.addr, align 8
  %cmp = icmp sge i64 %0, %1
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  store i32 13, i32* %retval
  br label %return

if.else:                                          ; preds = %entry
  store i32 140, i32* %retval
  br label %return

return:                                           ; preds = %if.else, %if.then
  %2 = load i32* %retval
  ret i32 %2
}

define i32 @fgt(i64 %x, i64 %y) nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %x.addr = alloca i64, align 8
  %y.addr = alloca i64, align 8
  store i64 %x, i64* %x.addr, align 8
  store i64 %y, i64* %y.addr, align 8
  %0 = load i64* %x.addr, align 8
  %1 = load i64* %y.addr, align 8
  %cmp = icmp sgt i64 %0, %1
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  store i32 13, i32* %retval
  br label %return

if.else:                                          ; preds = %entry
  store i32 140, i32* %retval
  br label %return

return:                                           ; preds = %if.else, %if.then
  %2 = load i32* %retval
  ret i32 %2
}

define i32 @fle(i64 %x, i64 %y) nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %x.addr = alloca i64, align 8
  %y.addr = alloca i64, align 8
  store i64 %x, i64* %x.addr, align 8
  store i64 %y, i64* %y.addr, align 8
  %0 = load i64* %x.addr, align 8
  %1 = load i64* %y.addr, align 8
  %cmp = icmp sle i64 %0, %1
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  store i32 13, i32* %retval
  br label %return

if.else:                                          ; preds = %entry
  store i32 140, i32* %retval
  br label %return

return:                                           ; preds = %if.else, %if.then
  %2 = load i32* %retval
  ret i32 %2
}

define i32 @fltu(i64 %x, i64 %y) nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %x.addr = alloca i64, align 8
  %y.addr = alloca i64, align 8
  store i64 %x, i64* %x.addr, align 8
  store i64 %y, i64* %y.addr, align 8
  %0 = load i64* %x.addr, align 8
  %1 = load i64* %y.addr, align 8
  %cmp = icmp ult i64 %0, %1
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  store i32 13, i32* %retval
  br label %return

if.else:                                          ; preds = %entry
  store i32 140, i32* %retval
  br label %return

return:                                           ; preds = %if.else, %if.then
  %2 = load i32* %retval
  ret i32 %2
}

define i32 @fgeu(i64 %x, i64 %y) nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %x.addr = alloca i64, align 8
  %y.addr = alloca i64, align 8
  store i64 %x, i64* %x.addr, align 8
  store i64 %y, i64* %y.addr, align 8
  %0 = load i64* %x.addr, align 8
  %1 = load i64* %y.addr, align 8
  %cmp = icmp uge i64 %0, %1
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  store i32 13, i32* %retval
  br label %return

if.else:                                          ; preds = %entry
  store i32 140, i32* %retval
  br label %return

return:                                           ; preds = %if.else, %if.then
  %2 = load i32* %retval
  ret i32 %2
}

define i32 @fgtu(i64 %x, i64 %y) nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %x.addr = alloca i64, align 8
  %y.addr = alloca i64, align 8
  store i64 %x, i64* %x.addr, align 8
  store i64 %y, i64* %y.addr, align 8
  %0 = load i64* %x.addr, align 8
  %1 = load i64* %y.addr, align 8
  %cmp = icmp ugt i64 %0, %1
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  store i32 13, i32* %retval
  br label %return

if.else:                                          ; preds = %entry
  store i32 140, i32* %retval
  br label %return

return:                                           ; preds = %if.else, %if.then
  %2 = load i32* %retval
  ret i32 %2
}

define i32 @fleu(i64 %x, i64 %y) nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %x.addr = alloca i64, align 8
  %y.addr = alloca i64, align 8
  store i64 %x, i64* %x.addr, align 8
  store i64 %y, i64* %y.addr, align 8
  %0 = load i64* %x.addr, align 8
  %1 = load i64* %y.addr, align 8
  %cmp = icmp ule i64 %0, %1
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  store i32 13, i32* %retval
  br label %return

if.else:                                          ; preds = %entry
  store i32 140, i32* %retval
  br label %return

return:                                           ; preds = %if.else, %if.then
  %2 = load i32* %retval
  ret i32 %2
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

for.cond:                                         ; preds = %for.inc52, %entry
  %0 = load i32* %i, align 4
  %cmp = icmp slt i32 %0, 8
  br i1 %cmp, label %for.body, label %for.end54

for.body:                                         ; preds = %for.cond
  %1 = load i32* %i, align 4
  %idxprom = sext i32 %1 to i64
  %arrayidx = getelementptr inbounds [8 x i64]* @args, i32 0, i64 %idxprom
  %2 = load i64* %arrayidx, align 8
  store i64 %2, i64* %arg0, align 8
  store i32 0, i32* %j, align 4
  br label %for.cond1

for.cond1:                                        ; preds = %for.inc, %for.body
  %3 = load i32* %j, align 4
  %cmp2 = icmp slt i32 %3, 8
  br i1 %cmp2, label %for.body3, label %for.end

for.body3:                                        ; preds = %for.cond1
  %4 = load i32* %j, align 4
  %idxprom4 = sext i32 %4 to i64
  %arrayidx5 = getelementptr inbounds [8 x i64]* @args, i32 0, i64 %idxprom4
  %5 = load i64* %arrayidx5, align 8
  store i64 %5, i64* %arg1, align 8
  %6 = load i64* %arg0, align 8
  %7 = load i64* %arg1, align 8
  %call = call i32 (...)* bitcast (i32 (i64, i64)* @feq to i32 (...)*)(i64 %6, i64 %7)
  %8 = load i32** %res, align 8
  %incdec.ptr = getelementptr inbounds i32* %8, i32 1
  store i32* %incdec.ptr, i32** %res, align 8
  %9 = load i32* %8, align 4
  %cmp6 = icmp ne i32 %call, %9
  br i1 %cmp6, label %if.then, label %if.end

if.then:                                          ; preds = %for.body3
  call void @abort() noreturn
  unreachable

if.end:                                           ; preds = %for.body3
  %10 = load i64* %arg0, align 8
  %11 = load i64* %arg1, align 8
  %call7 = call i32 (...)* bitcast (i32 (i64, i64)* @fne to i32 (...)*)(i64 %10, i64 %11)
  %12 = load i32** %res, align 8
  %incdec.ptr8 = getelementptr inbounds i32* %12, i32 1
  store i32* %incdec.ptr8, i32** %res, align 8
  %13 = load i32* %12, align 4
  %cmp9 = icmp ne i32 %call7, %13
  br i1 %cmp9, label %if.then10, label %if.end11

if.then10:                                        ; preds = %if.end
  call void @abort() noreturn
  unreachable

if.end11:                                         ; preds = %if.end
  %14 = load i64* %arg0, align 8
  %15 = load i64* %arg1, align 8
  %call12 = call i32 (...)* bitcast (i32 (i64, i64)* @flt to i32 (...)*)(i64 %14, i64 %15)
  %16 = load i32** %res, align 8
  %incdec.ptr13 = getelementptr inbounds i32* %16, i32 1
  store i32* %incdec.ptr13, i32** %res, align 8
  %17 = load i32* %16, align 4
  %cmp14 = icmp ne i32 %call12, %17
  br i1 %cmp14, label %if.then15, label %if.end16

if.then15:                                        ; preds = %if.end11
  call void @abort() noreturn
  unreachable

if.end16:                                         ; preds = %if.end11
  %18 = load i64* %arg0, align 8
  %19 = load i64* %arg1, align 8
  %call17 = call i32 (...)* bitcast (i32 (i64, i64)* @fge to i32 (...)*)(i64 %18, i64 %19)
  %20 = load i32** %res, align 8
  %incdec.ptr18 = getelementptr inbounds i32* %20, i32 1
  store i32* %incdec.ptr18, i32** %res, align 8
  %21 = load i32* %20, align 4
  %cmp19 = icmp ne i32 %call17, %21
  br i1 %cmp19, label %if.then20, label %if.end21

if.then20:                                        ; preds = %if.end16
  call void @abort() noreturn
  unreachable

if.end21:                                         ; preds = %if.end16
  %22 = load i64* %arg0, align 8
  %23 = load i64* %arg1, align 8
  %call22 = call i32 (...)* bitcast (i32 (i64, i64)* @fgt to i32 (...)*)(i64 %22, i64 %23)
  %24 = load i32** %res, align 8
  %incdec.ptr23 = getelementptr inbounds i32* %24, i32 1
  store i32* %incdec.ptr23, i32** %res, align 8
  %25 = load i32* %24, align 4
  %cmp24 = icmp ne i32 %call22, %25
  br i1 %cmp24, label %if.then25, label %if.end26

if.then25:                                        ; preds = %if.end21
  call void @abort() noreturn
  unreachable

if.end26:                                         ; preds = %if.end21
  %26 = load i64* %arg0, align 8
  %27 = load i64* %arg1, align 8
  %call27 = call i32 (...)* bitcast (i32 (i64, i64)* @fle to i32 (...)*)(i64 %26, i64 %27)
  %28 = load i32** %res, align 8
  %incdec.ptr28 = getelementptr inbounds i32* %28, i32 1
  store i32* %incdec.ptr28, i32** %res, align 8
  %29 = load i32* %28, align 4
  %cmp29 = icmp ne i32 %call27, %29
  br i1 %cmp29, label %if.then30, label %if.end31

if.then30:                                        ; preds = %if.end26
  call void @abort() noreturn
  unreachable

if.end31:                                         ; preds = %if.end26
  %30 = load i64* %arg0, align 8
  %31 = load i64* %arg1, align 8
  %call32 = call i32 (...)* bitcast (i32 (i64, i64)* @fltu to i32 (...)*)(i64 %30, i64 %31)
  %32 = load i32** %res, align 8
  %incdec.ptr33 = getelementptr inbounds i32* %32, i32 1
  store i32* %incdec.ptr33, i32** %res, align 8
  %33 = load i32* %32, align 4
  %cmp34 = icmp ne i32 %call32, %33
  br i1 %cmp34, label %if.then35, label %if.end36

if.then35:                                        ; preds = %if.end31
  call void @abort() noreturn
  unreachable

if.end36:                                         ; preds = %if.end31
  %34 = load i64* %arg0, align 8
  %35 = load i64* %arg1, align 8
  %call37 = call i32 (...)* bitcast (i32 (i64, i64)* @fgeu to i32 (...)*)(i64 %34, i64 %35)
  %36 = load i32** %res, align 8
  %incdec.ptr38 = getelementptr inbounds i32* %36, i32 1
  store i32* %incdec.ptr38, i32** %res, align 8
  %37 = load i32* %36, align 4
  %cmp39 = icmp ne i32 %call37, %37
  br i1 %cmp39, label %if.then40, label %if.end41

if.then40:                                        ; preds = %if.end36
  call void @abort() noreturn
  unreachable

if.end41:                                         ; preds = %if.end36
  %38 = load i64* %arg0, align 8
  %39 = load i64* %arg1, align 8
  %call42 = call i32 (...)* bitcast (i32 (i64, i64)* @fgtu to i32 (...)*)(i64 %38, i64 %39)
  %40 = load i32** %res, align 8
  %incdec.ptr43 = getelementptr inbounds i32* %40, i32 1
  store i32* %incdec.ptr43, i32** %res, align 8
  %41 = load i32* %40, align 4
  %cmp44 = icmp ne i32 %call42, %41
  br i1 %cmp44, label %if.then45, label %if.end46

if.then45:                                        ; preds = %if.end41
  call void @abort() noreturn
  unreachable

if.end46:                                         ; preds = %if.end41
  %42 = load i64* %arg0, align 8
  %43 = load i64* %arg1, align 8
  %call47 = call i32 (...)* bitcast (i32 (i64, i64)* @fleu to i32 (...)*)(i64 %42, i64 %43)
  %44 = load i32** %res, align 8
  %incdec.ptr48 = getelementptr inbounds i32* %44, i32 1
  store i32* %incdec.ptr48, i32** %res, align 8
  %45 = load i32* %44, align 4
  %cmp49 = icmp ne i32 %call47, %45
  br i1 %cmp49, label %if.then50, label %if.end51

if.then50:                                        ; preds = %if.end46
  call void @abort() noreturn
  unreachable

if.end51:                                         ; preds = %if.end46
  br label %for.inc

for.inc:                                          ; preds = %if.end51
  %46 = load i32* %j, align 4
  %inc = add nsw i32 %46, 1
  store i32 %inc, i32* %j, align 4
  br label %for.cond1

for.end:                                          ; preds = %for.cond1
  br label %for.inc52

for.inc52:                                        ; preds = %for.end
  %47 = load i32* %i, align 4
  %inc53 = add nsw i32 %47, 1
  store i32 %inc53, i32* %i, align 4
  br label %for.cond

for.end54:                                        ; preds = %for.cond
  call void @exit(i32 0) noreturn
  unreachable

return:                                           ; No predecessors!
  %48 = load i32* %retval
  ret i32 %48
}

declare void @abort() noreturn

declare void @exit(i32) noreturn
