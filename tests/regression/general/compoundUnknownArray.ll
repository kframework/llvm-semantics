; ModuleID = '/home/grosu/celliso2/c-semantics/tests/unitTests/compoundUnknownArray.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %.compoundliteral = alloca [5 x i32], align 4
  store i32 0, i32* %retval
  %.array = getelementptr inbounds [5 x i32]* %.compoundliteral, i32 0, i32 0
  store i32 1, i32* %.array
  %.array1 = getelementptr inbounds [5 x i32]* %.compoundliteral, i32 0, i32 1
  store i32 2, i32* %.array1
  %.array2 = getelementptr inbounds [5 x i32]* %.compoundliteral, i32 0, i32 2
  store i32 3, i32* %.array2
  %.array3 = getelementptr inbounds [5 x i32]* %.compoundliteral, i32 0, i32 3
  store i32 4, i32* %.array3
  %.array4 = getelementptr inbounds [5 x i32]* %.compoundliteral, i32 0, i32 4
  store i32 5, i32* %.array4
  %arrayidx = getelementptr inbounds [5 x i32]* %.compoundliteral, i32 0, i64 4
  %tmp = load i32* %arrayidx
  ret i32 %tmp
}
