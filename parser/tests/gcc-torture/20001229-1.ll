; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/20001229-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

define void @foo(i8* %a, i8* %b) nounwind uwtable {
entry:
  %a.addr = alloca i8*, align 8
  %b.addr = alloca i8*, align 8
  store i8* %a, i8** %a.addr, align 8
  store i8* %b, i8** %b.addr, align 8
  ret void
}

define void @showinfo() nounwind uwtable {
entry:
  %uname = alloca [33 x i8], align 16
  %tty = alloca [38 x i8], align 16
  %tmp = bitcast [33 x i8]* %uname to i8*
  call void @llvm.memset.p0i8.i64(i8* %tmp, i8 0, i64 33, i32 16, i1 false)
  %tmp2 = bitcast [38 x i8]* %tty to i8*
  call void @llvm.memset.p0i8.i64(i8* %tmp2, i8 0, i64 38, i32 16, i1 false)
  %0 = bitcast i8* %tmp2 to [38 x i8]*
  %1 = getelementptr [38 x i8]* %0, i32 0, i32 0
  store i8 47, i8* %1
  %2 = getelementptr [38 x i8]* %0, i32 0, i32 1
  store i8 100, i8* %2
  %3 = getelementptr [38 x i8]* %0, i32 0, i32 2
  store i8 101, i8* %3
  %4 = getelementptr [38 x i8]* %0, i32 0, i32 3
  store i8 118, i8* %4
  %5 = getelementptr [38 x i8]* %0, i32 0, i32 4
  store i8 47, i8* %5
  %arraydecay = getelementptr inbounds [33 x i8]* %uname, i32 0, i32 0
  %arraydecay3 = getelementptr inbounds [38 x i8]* %tty, i32 0, i32 0
  call void @foo(i8* %arraydecay, i8* %arraydecay3)
  ret void
}

declare void @llvm.memset.p0i8.i64(i8* nocapture, i8, i64, i32, i1) nounwind

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval
  call void @showinfo()
  call void @exit(i32 0) noreturn
  unreachable

return:                                           ; No predecessors!
  %0 = load i32* %retval
  ret i32 %0
}

declare void @exit(i32) noreturn
