; ModuleID = '/home/david/src/c-semantics/tests/llvm-regression/pointer_arithmetic.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.S1Ty = type { i32 }
%struct.S2Ty = type { %struct.S1Ty, %struct.S1Ty }

define void @takeS1(%struct.S1Ty* %V) nounwind uwtable {
entry:
  %V.addr = alloca %struct.S1Ty*, align 8
  store %struct.S1Ty* %V, %struct.S1Ty** %V.addr, align 8
  ret void
}

define void @takeVoid(i8* %P) nounwind uwtable {
entry:
  %P.addr = alloca i8*, align 8
  store i8* %P, i8** %P.addr, align 8
  ret void
}

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %E = alloca %struct.S2Ty, align 4
  store i32 0, i32* %retval
  %B = getelementptr inbounds %struct.S2Ty* %E, i32 0, i32 1
  call void @takeS1(%struct.S1Ty* %B)
  %0 = bitcast %struct.S2Ty* %E to i8*
  call void @takeVoid(i8* %0)
  ret i32 0
}
