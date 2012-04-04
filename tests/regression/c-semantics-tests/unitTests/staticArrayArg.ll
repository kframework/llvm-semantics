; ModuleID = '/home/david/src/c-semantics/tests/unitTests/staticArrayArg.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@main.a = private unnamed_addr constant [5 x i32] [i32 1, i32 2, i32 3, i32 4, i32 5], align 16

define i32 @f(i32* %a) nounwind uwtable {
entry:
  %a.addr = alloca i32*, align 8
  store i32* %a, i32** %a.addr, align 8
  %0 = load i32** %a.addr, align 8
  %arrayidx = getelementptr inbounds i32* %0, i64 0
  %1 = load i32* %arrayidx, align 4
  %2 = load i32** %a.addr, align 8
  %arrayidx1 = getelementptr inbounds i32* %2, i64 1
  %3 = load i32* %arrayidx1, align 4
  %add = add nsw i32 %1, %3
  %4 = load i32** %a.addr, align 8
  %arrayidx2 = getelementptr inbounds i32* %4, i64 2
  %5 = load i32* %arrayidx2, align 4
  %add3 = add nsw i32 %add, %5
  ret i32 %add3
}

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %a = alloca [5 x i32], align 16
  store i32 0, i32* %retval
  %0 = bitcast [5 x i32]* %a to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %0, i8* bitcast ([5 x i32]* @main.a to i8*), i64 20, i32 16, i1 false)
  %arraydecay = getelementptr inbounds [5 x i32]* %a, i32 0, i32 0
  %call = call i32 @f(i32* %arraydecay)
  ret i32 %call
}

declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture, i64, i32, i1) nounwind
