; ModuleID = '/home/grosu/celliso2/c-semantics/tests/integration/fib.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %x = alloca i32, align 4
  store i32 0, i32* %retval
  store i32 0, i32* %x, align 4
  %call = call i32 @fib(i32 10)
  %tmp = load i32* %x, align 4
  %add = add i32 %tmp, %call
  store i32 %add, i32* %x, align 4
  %call1 = call i32 @fastfib(i32 10)
  %tmp2 = load i32* %x, align 4
  %add3 = add i32 %tmp2, %call1
  store i32 %add3, i32* %x, align 4
  %call4 = call i32 @fastfib_v2(i32 10)
  %tmp5 = load i32* %x, align 4
  %add6 = add i32 %tmp5, %call4
  store i32 %add6, i32* %x, align 4
  %tmp7 = load i32* %x, align 4
  ret i32 %tmp7
}

define i32 @fib(i32 %n) nounwind uwtable {
entry:
  %n.addr = alloca i32, align 4
  store i32 %n, i32* %n.addr, align 4
  %tmp = load i32* %n.addr, align 4
  %cmp = icmp ult i32 %tmp, 2
  br i1 %cmp, label %cond.true, label %cond.false

cond.true:                                        ; preds = %entry
  %tmp1 = load i32* %n.addr, align 4
  br label %cond.end

cond.false:                                       ; preds = %entry
  %tmp2 = load i32* %n.addr, align 4
  %sub = sub i32 %tmp2, 1
  %call = call i32 @fib(i32 %sub)
  %tmp3 = load i32* %n.addr, align 4
  %sub4 = sub i32 %tmp3, 2
  %call5 = call i32 @fib(i32 %sub4)
  %add = add i32 %call, %call5
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %tmp1, %cond.true ], [ %add, %cond.false ]
  ret i32 %cond
}

define i32 @fastfib(i32 %n) nounwind uwtable {
entry:
  %n.addr = alloca i32, align 4
  %a = alloca [3 x i32], align 4
  %p = alloca i32*, align 8
  %i = alloca i32, align 4
  store i32 %n, i32* %n.addr, align 4
  %arraydecay = getelementptr inbounds [3 x i32]* %a, i32 0, i32 0
  store i32* %arraydecay, i32** %p, align 8
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %tmp = load i32* %i, align 4
  %tmp1 = load i32* %n.addr, align 4
  %cmp = icmp ule i32 %tmp, %tmp1
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %tmp2 = load i32* %i, align 4
  %cmp3 = icmp ult i32 %tmp2, 2
  br i1 %cmp3, label %if.then, label %if.else

if.then:                                          ; preds = %for.body
  %tmp4 = load i32* %i, align 4
  %tmp5 = load i32** %p, align 8
  store i32 %tmp4, i32* %tmp5
  br label %if.end38

if.else:                                          ; preds = %for.body
  %tmp6 = load i32** %p, align 8
  %arraydecay7 = getelementptr inbounds [3 x i32]* %a, i32 0, i32 0
  %cmp8 = icmp eq i32* %tmp6, %arraydecay7
  br i1 %cmp8, label %if.then9, label %if.else16

if.then9:                                         ; preds = %if.else
  %arraydecay10 = getelementptr inbounds [3 x i32]* %a, i32 0, i32 0
  %add.ptr = getelementptr inbounds i32* %arraydecay10, i64 1
  %tmp11 = load i32* %add.ptr
  %arraydecay12 = getelementptr inbounds [3 x i32]* %a, i32 0, i32 0
  %add.ptr13 = getelementptr inbounds i32* %arraydecay12, i64 2
  %tmp14 = load i32* %add.ptr13
  %add = add i32 %tmp11, %tmp14
  %tmp15 = load i32** %p, align 8
  store i32 %add, i32* %tmp15
  br label %if.end37

if.else16:                                        ; preds = %if.else
  %tmp17 = load i32** %p, align 8
  %arraydecay18 = getelementptr inbounds [3 x i32]* %a, i32 0, i32 0
  %add.ptr19 = getelementptr inbounds i32* %arraydecay18, i64 1
  %cmp20 = icmp eq i32* %tmp17, %add.ptr19
  br i1 %cmp20, label %if.then21, label %if.else29

if.then21:                                        ; preds = %if.else16
  %arraydecay22 = getelementptr inbounds [3 x i32]* %a, i32 0, i32 0
  %tmp23 = load i32* %arraydecay22
  %arraydecay24 = getelementptr inbounds [3 x i32]* %a, i32 0, i32 0
  %add.ptr25 = getelementptr inbounds i32* %arraydecay24, i64 2
  %tmp26 = load i32* %add.ptr25
  %add27 = add i32 %tmp23, %tmp26
  %tmp28 = load i32** %p, align 8
  store i32 %add27, i32* %tmp28
  br label %if.end

if.else29:                                        ; preds = %if.else16
  %arraydecay30 = getelementptr inbounds [3 x i32]* %a, i32 0, i32 0
  %tmp31 = load i32* %arraydecay30
  %arraydecay32 = getelementptr inbounds [3 x i32]* %a, i32 0, i32 0
  %add.ptr33 = getelementptr inbounds i32* %arraydecay32, i64 1
  %tmp34 = load i32* %add.ptr33
  %add35 = add i32 %tmp31, %tmp34
  %tmp36 = load i32** %p, align 8
  store i32 %add35, i32* %tmp36
  br label %if.end

if.end:                                           ; preds = %if.else29, %if.then21
  br label %if.end37

if.end37:                                         ; preds = %if.end, %if.then9
  br label %if.end38

if.end38:                                         ; preds = %if.end37, %if.then
  %tmp39 = load i32** %p, align 8
  %incdec.ptr = getelementptr inbounds i32* %tmp39, i32 1
  store i32* %incdec.ptr, i32** %p, align 8
  %arraydecay40 = getelementptr inbounds [3 x i32]* %a, i32 0, i32 0
  %add.ptr41 = getelementptr inbounds i32* %arraydecay40, i64 2
  %cmp42 = icmp ugt i32* %incdec.ptr, %add.ptr41
  br i1 %cmp42, label %if.then43, label %if.end45

if.then43:                                        ; preds = %if.end38
  %arraydecay44 = getelementptr inbounds [3 x i32]* %a, i32 0, i32 0
  store i32* %arraydecay44, i32** %p, align 8
  br label %if.end45

if.end45:                                         ; preds = %if.then43, %if.end38
  br label %for.inc

for.inc:                                          ; preds = %if.end45
  %tmp46 = load i32* %i, align 4
  %inc = add i32 %tmp46, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %tmp47 = load i32** %p, align 8
  %arraydecay48 = getelementptr inbounds [3 x i32]* %a, i32 0, i32 0
  %cmp49 = icmp eq i32* %tmp47, %arraydecay48
  br i1 %cmp49, label %cond.true, label %cond.false

cond.true:                                        ; preds = %for.end
  %tmp50 = load i32** %p, align 8
  %add.ptr51 = getelementptr inbounds i32* %tmp50, i64 2
  %tmp52 = load i32* %add.ptr51
  br label %cond.end

cond.false:                                       ; preds = %for.end
  %tmp53 = load i32** %p, align 8
  %sub.ptr = getelementptr inbounds i32* %tmp53, i64 -1
  %tmp54 = load i32* %sub.ptr
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %tmp52, %cond.true ], [ %tmp54, %cond.false ]
  ret i32 %cond
}

define i32 @fastfib_v2(i32 %n) nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %n.addr = alloca i32, align 4
  %n0 = alloca i32, align 4
  %n1 = alloca i32, align 4
  %naux = alloca i32, align 4
  %i = alloca i32, align 4
  store i32 %n, i32* %n.addr, align 4
  store i32 0, i32* %n0, align 4
  store i32 1, i32* %n1, align 4
  %tmp = load i32* %n.addr, align 4
  %cmp = icmp eq i32 %tmp, 0
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  store i32 0, i32* %retval
  br label %return

if.end:                                           ; preds = %entry
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %if.end
  %tmp1 = load i32* %i, align 4
  %tmp2 = load i32* %n.addr, align 4
  %sub = sub i32 %tmp2, 1
  %cmp3 = icmp ult i32 %tmp1, %sub
  br i1 %cmp3, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %tmp4 = load i32* %n1, align 4
  store i32 %tmp4, i32* %naux, align 4
  %tmp5 = load i32* %n0, align 4
  %tmp6 = load i32* %n1, align 4
  %add = add i32 %tmp5, %tmp6
  store i32 %add, i32* %n1, align 4
  %tmp7 = load i32* %naux, align 4
  store i32 %tmp7, i32* %n0, align 4
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %tmp8 = load i32* %i, align 4
  %inc = add i32 %tmp8, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %tmp9 = load i32* %n1, align 4
  store i32 %tmp9, i32* %retval
  br label %return

return:                                           ; preds = %for.end, %if.then
  %0 = load i32* %retval
  ret i32 %0
}
