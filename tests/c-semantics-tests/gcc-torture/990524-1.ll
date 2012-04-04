; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/990524-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@a = global [6 x i8] c"12345\00", align 1
@b = global [6 x i8] c"12345\00", align 1

define void @loop(i8* %pz, i8* %pzDta) nounwind uwtable {
entry:
  %pz.addr = alloca i8*, align 8
  %pzDta.addr = alloca i8*, align 8
  store i8* %pz, i8** %pz.addr, align 8
  store i8* %pzDta, i8** %pzDta.addr, align 8
  br label %for.cond

for.cond:                                         ; preds = %sw.epilog, %entry
  %0 = load i8** %pzDta.addr, align 8
  %incdec.ptr = getelementptr inbounds i8* %0, i32 1
  store i8* %incdec.ptr, i8** %pzDta.addr, align 8
  %1 = load i8* %0, align 1
  %2 = load i8** %pz.addr, align 8
  %incdec.ptr1 = getelementptr inbounds i8* %2, i32 1
  store i8* %incdec.ptr1, i8** %pz.addr, align 8
  store i8 %1, i8* %2, align 1
  %conv = sext i8 %1 to i32
  switch i32 %conv, label %sw.epilog [
    i32 0, label %sw.bb
    i32 34, label %sw.bb2
    i32 92, label %sw.bb2
  ]

sw.bb:                                            ; preds = %for.cond
  br label %loopDone2

sw.bb2:                                           ; preds = %for.cond, %for.cond
  %3 = load i8** %pz.addr, align 8
  %arrayidx = getelementptr inbounds i8* %3, i64 -1
  store i8 92, i8* %arrayidx, align 1
  %4 = load i8** %pzDta.addr, align 8
  %arrayidx3 = getelementptr inbounds i8* %4, i64 -1
  %5 = load i8* %arrayidx3, align 1
  %6 = load i8** %pz.addr, align 8
  %incdec.ptr4 = getelementptr inbounds i8* %6, i32 1
  store i8* %incdec.ptr4, i8** %pz.addr, align 8
  store i8 %5, i8* %6, align 1
  br label %sw.epilog

sw.epilog:                                        ; preds = %sw.bb2, %for.cond
  br label %for.cond

loopDone2:                                        ; preds = %sw.bb
  %7 = load i8** %pz.addr, align 8
  %sub.ptr.rhs.cast = ptrtoint i8* %7 to i64
  %sub.ptr.sub = sub i64 ptrtoint ([6 x i8]* @a to i64), %sub.ptr.rhs.cast
  %8 = load i8** %pzDta.addr, align 8
  %sub.ptr.rhs.cast5 = ptrtoint i8* %8 to i64
  %sub.ptr.sub6 = sub i64 ptrtoint ([6 x i8]* @b to i64), %sub.ptr.rhs.cast5
  %cmp = icmp ne i64 %sub.ptr.sub, %sub.ptr.sub6
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %loopDone2
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %loopDone2
  ret void
}

declare void @abort() noreturn nounwind

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval
  call void @loop(i8* getelementptr inbounds ([6 x i8]* @a, i32 0, i32 0), i8* getelementptr inbounds ([6 x i8]* @b, i32 0, i32 0))
  call void @exit(i32 0) noreturn nounwind
  unreachable

return:                                           ; No predecessors!
  %0 = load i32* %retval
  ret i32 %0
}

declare void @exit(i32) noreturn nounwind
