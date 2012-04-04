; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/strct-pack-2.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.A = type <{ i16, [2 x i16*] }>

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %i = alloca i16, align 2
  %j = alloca i16, align 2
  %a = alloca %struct.A, align 2
  %ap = alloca %struct.A*, align 8
  store i32 0, i32* %retval
  store i16 1, i16* %j, align 2
  store %struct.A* %a, %struct.A** %ap, align 8
  %0 = load i16* %j, align 2
  %idxprom = sext i16 %0 to i64
  %1 = load %struct.A** %ap, align 8
  %ap1 = getelementptr inbounds %struct.A* %1, i32 0, i32 1
  %arrayidx = getelementptr inbounds [2 x i16*]* %ap1, i32 0, i64 %idxprom
  store i16* %i, i16** %arrayidx, align 2
  call void @exit(i32 0) noreturn nounwind
  unreachable

return:                                           ; No predecessors!
  %2 = load i32* %retval
  ret i32 %2
}

declare void @exit(i32) noreturn nounwind
