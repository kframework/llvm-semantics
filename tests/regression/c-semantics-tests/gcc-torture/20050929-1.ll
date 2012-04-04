; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/20050929-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.A = type { i32, i32 }
%struct.B = type { %struct.A*, %struct.A* }
%struct.C = type { %struct.B*, %struct.A* }

@.compoundliteral = internal global %struct.A { i32 1, i32 2 }
@.compoundliteral1 = internal global %struct.A { i32 3, i32 4 }
@.compoundliteral2 = internal global %struct.B { %struct.A* @.compoundliteral, %struct.A* @.compoundliteral1 }
@.compoundliteral3 = internal global %struct.A { i32 5, i32 6 }
@e = global %struct.C { %struct.B* @.compoundliteral2, %struct.A* @.compoundliteral3 }, align 8

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval
  %0 = load %struct.B** getelementptr inbounds (%struct.C* @e, i32 0, i32 0), align 8
  %a = getelementptr inbounds %struct.B* %0, i32 0, i32 0
  %1 = load %struct.A** %a, align 8
  %i = getelementptr inbounds %struct.A* %1, i32 0, i32 0
  %2 = load i32* %i, align 4
  %cmp = icmp ne i32 %2, 1
  br i1 %cmp, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %3 = load %struct.B** getelementptr inbounds (%struct.C* @e, i32 0, i32 0), align 8
  %a1 = getelementptr inbounds %struct.B* %3, i32 0, i32 0
  %4 = load %struct.A** %a1, align 8
  %j = getelementptr inbounds %struct.A* %4, i32 0, i32 1
  %5 = load i32* %j, align 4
  %cmp2 = icmp ne i32 %5, 2
  br i1 %cmp2, label %if.then, label %if.end

if.then:                                          ; preds = %lor.lhs.false, %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %lor.lhs.false
  %6 = load %struct.B** getelementptr inbounds (%struct.C* @e, i32 0, i32 0), align 8
  %b = getelementptr inbounds %struct.B* %6, i32 0, i32 1
  %7 = load %struct.A** %b, align 8
  %i3 = getelementptr inbounds %struct.A* %7, i32 0, i32 0
  %8 = load i32* %i3, align 4
  %cmp4 = icmp ne i32 %8, 3
  br i1 %cmp4, label %if.then9, label %lor.lhs.false5

lor.lhs.false5:                                   ; preds = %if.end
  %9 = load %struct.B** getelementptr inbounds (%struct.C* @e, i32 0, i32 0), align 8
  %b6 = getelementptr inbounds %struct.B* %9, i32 0, i32 1
  %10 = load %struct.A** %b6, align 8
  %j7 = getelementptr inbounds %struct.A* %10, i32 0, i32 1
  %11 = load i32* %j7, align 4
  %cmp8 = icmp ne i32 %11, 4
  br i1 %cmp8, label %if.then9, label %if.end10

if.then9:                                         ; preds = %lor.lhs.false5, %if.end
  call void @abort() noreturn nounwind
  unreachable

if.end10:                                         ; preds = %lor.lhs.false5
  %12 = load %struct.A** getelementptr inbounds (%struct.C* @e, i32 0, i32 1), align 8
  %i11 = getelementptr inbounds %struct.A* %12, i32 0, i32 0
  %13 = load i32* %i11, align 4
  %cmp12 = icmp ne i32 %13, 5
  br i1 %cmp12, label %if.then16, label %lor.lhs.false13

lor.lhs.false13:                                  ; preds = %if.end10
  %14 = load %struct.A** getelementptr inbounds (%struct.C* @e, i32 0, i32 1), align 8
  %j14 = getelementptr inbounds %struct.A* %14, i32 0, i32 1
  %15 = load i32* %j14, align 4
  %cmp15 = icmp ne i32 %15, 6
  br i1 %cmp15, label %if.then16, label %if.end17

if.then16:                                        ; preds = %lor.lhs.false13, %if.end10
  call void @abort() noreturn nounwind
  unreachable

if.end17:                                         ; preds = %lor.lhs.false13
  ret i32 0
}

declare void @abort() noreturn nounwind
