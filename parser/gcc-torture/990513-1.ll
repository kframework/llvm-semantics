; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/990513-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

define void @foo(i32* %BM_tab, i32 %j) nounwind uwtable {
entry:
  %BM_tab.addr = alloca i32*, align 8
  %j.addr = alloca i32, align 4
  %BM_tab_base = alloca i32*, align 8
  store i32* %BM_tab, i32** %BM_tab.addr, align 8
  store i32 %j, i32* %j.addr, align 4
  %tmp = load i32** %BM_tab.addr, align 8
  store i32* %tmp, i32** %BM_tab_base, align 8
  %tmp1 = load i32** %BM_tab.addr, align 8
  %add.ptr = getelementptr inbounds i32* %tmp1, i64 256
  store i32* %add.ptr, i32** %BM_tab.addr, align 8
  br label %while.cond

while.cond:                                       ; preds = %while.body, %entry
  %tmp2 = load i32** %BM_tab_base, align 8
  %tmp3 = load i32** %BM_tab.addr, align 8
  %cmp = icmp ne i32* %tmp2, %tmp3
  br i1 %cmp, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %tmp4 = load i32* %j.addr, align 4
  %tmp5 = load i32** %BM_tab.addr, align 8
  %incdec.ptr = getelementptr inbounds i32* %tmp5, i32 -1
  store i32* %incdec.ptr, i32** %BM_tab.addr, align 8
  store i32 %tmp4, i32* %incdec.ptr
  %tmp6 = load i32* %j.addr, align 4
  %tmp7 = load i32** %BM_tab.addr, align 8
  %incdec.ptr8 = getelementptr inbounds i32* %tmp7, i32 -1
  store i32* %incdec.ptr8, i32** %BM_tab.addr, align 8
  store i32 %tmp6, i32* %incdec.ptr8
  %tmp9 = load i32* %j.addr, align 4
  %tmp10 = load i32** %BM_tab.addr, align 8
  %incdec.ptr11 = getelementptr inbounds i32* %tmp10, i32 -1
  store i32* %incdec.ptr11, i32** %BM_tab.addr, align 8
  store i32 %tmp9, i32* %incdec.ptr11
  %tmp12 = load i32* %j.addr, align 4
  %tmp13 = load i32** %BM_tab.addr, align 8
  %incdec.ptr14 = getelementptr inbounds i32* %tmp13, i32 -1
  store i32* %incdec.ptr14, i32** %BM_tab.addr, align 8
  store i32 %tmp12, i32* %incdec.ptr14
  br label %while.cond

while.end:                                        ; preds = %while.cond
  ret void
}

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %BM_tab = alloca [256 x i32], align 16
  store i32 0, i32* %retval
  %arraydecay = getelementptr inbounds [256 x i32]* %BM_tab, i32 0, i32 0
  %0 = bitcast i32* %arraydecay to i8*
  call void @llvm.memset.p0i8.i64(i8* %0, i8 0, i64 1024, i32 1, i1 false)
  %arraydecay1 = getelementptr inbounds [256 x i32]* %BM_tab, i32 0, i32 0
  call void @foo(i32* %arraydecay1, i32 6)
  %arrayidx = getelementptr inbounds [256 x i32]* %BM_tab, i32 0, i64 0
  %tmp = load i32* %arrayidx, align 4
  %cmp = icmp ne i32 %tmp, 6
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @abort() noreturn
  unreachable

if.end:                                           ; preds = %entry
  ret i32 0
}

declare void @llvm.memset.p0i8.i64(i8* nocapture, i8, i64, i32, i1) nounwind

declare void @abort() noreturn
