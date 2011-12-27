; ModuleID = '/home/grosu/celliso2/c-semantics/tests/unitTests/c1x0605030408.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

define i64 @fsize3(i32 %n) nounwind uwtable {
entry:
  %retval = alloca i64, align 8
  %n.addr = alloca i32, align 4
  %saved_stack = alloca i8*
  %cleanup.dest.slot = alloca i32
  store i32 %n, i32* %n.addr, align 4
  %0 = call i8* @llvm.stacksave()
  store i8* %0, i8** %saved_stack
  %tmp = load i32* %n.addr, align 4
  %add = add nsw i32 %tmp, 3
  %tmp1 = zext i32 %add to i64
  %1 = mul i64 1, %tmp1
  %vla = alloca i8, i64 %1, align 16
  store i64 %1, i64* %retval
  store i32 1, i32* %cleanup.dest.slot
  %tmp2 = load i8** %saved_stack
  call void @llvm.stackrestore(i8* %tmp2)
  %2 = load i64* %retval
  ret i64 %2
}

declare i8* @llvm.stacksave() nounwind

declare void @llvm.stackrestore(i8*) nounwind

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %size = alloca i64, align 8
  store i32 0, i32* %retval
  %call = call i64 @fsize3(i32 10)
  store i64 %call, i64* %size, align 8
  %tmp = load i64* %size, align 8
  %conv = trunc i64 %tmp to i32
  ret i32 %conv
}
