; ModuleID = '/home/david/src/c-semantics/tests/cil/test31.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@main.zz = private unnamed_addr constant [2 x i32] [i32 3, i32 5], align 4
@.str = private unnamed_addr constant [18 x i8] c"hello world - %d\0A\00", align 1

define void @silly(i32* %w) nounwind uwtable {
entry:
  %w.addr = alloca i32*, align 8
  store i32* %w, i32** %w.addr, align 8
  %0 = load i32** %w.addr, align 8
  %arrayidx = getelementptr inbounds i32* %0, i64 1
  %1 = load i32* %arrayidx, align 4
  %inc = add nsw i32 %1, 1
  store i32 %inc, i32* %arrayidx, align 4
  ret void
}

define i32 @main(i32 %argc, i8** %argv) nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  %zz = alloca [2 x i32], align 4
  store i32 0, i32* %retval
  store i32 %argc, i32* %argc.addr, align 4
  store i8** %argv, i8*** %argv.addr, align 8
  %0 = bitcast [2 x i32]* %zz to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %0, i8* bitcast ([2 x i32]* @main.zz to i8*), i64 8, i32 4, i1 false)
  %arraydecay = getelementptr inbounds [2 x i32]* %zz, i32 0, i32 0
  call void @silly(i32* %arraydecay)
  %arrayidx = getelementptr inbounds [2 x i32]* %zz, i32 0, i64 1
  %1 = load i32* %arrayidx, align 4
  %call = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([18 x i8]* @.str, i32 0, i32 0), i32 %1)
  ret i32 0
}

declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture, i64, i32, i1) nounwind

declare i32 @printf(i8*, ...)
