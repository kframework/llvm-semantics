; ModuleID = '/home/david/src/c-semantics/tests/unitTests/challenge04.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.t = type { [2 x i32] }

@s = common global %struct.t zeroinitializer, align 4

define void @f(i64 %s.coerce) nounwind uwtable {
entry:
  %s = alloca %struct.t, align 8
  %coerce.dive = getelementptr %struct.t* %s, i32 0, i32 0
  %0 = bitcast [2 x i32]* %coerce.dive to i64*
  store i64 %s.coerce, i64* %0, align 1
  %a = getelementptr inbounds %struct.t* %s, i32 0, i32 0
  %arrayidx = getelementptr inbounds [2 x i32]* %a, i32 0, i64 1
  store i32 3, i32* %arrayidx, align 4
  ret void
}

define void @g(i32* %a) nounwind uwtable {
entry:
  %a.addr = alloca i32*, align 8
  store i32* %a, i32** %a.addr, align 8
  %0 = load i32** %a.addr, align 8
  %arrayidx = getelementptr inbounds i32* %0, i64 1
  store i32 5, i32* %arrayidx, align 4
  ret void
}

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %x = alloca i32, align 4
  %y = alloca i32, align 4
  store i32 0, i32* %retval
  %0 = load i64* bitcast (%struct.t* @s to i64*), align 1
  call void @f(i64 %0)
  %1 = load i32* getelementptr inbounds (%struct.t* @s, i32 0, i32 0, i64 1), align 4
  store i32 %1, i32* %x, align 4
  call void @g(i32* getelementptr inbounds (%struct.t* @s, i32 0, i32 0, i32 0))
  %2 = load i32* getelementptr inbounds (%struct.t* @s, i32 0, i32 0, i64 1), align 4
  store i32 %2, i32* %y, align 4
  %3 = load i32* %x, align 4
  %4 = load i32* %y, align 4
  %add = add nsw i32 %3, %4
  ret i32 %add
}
