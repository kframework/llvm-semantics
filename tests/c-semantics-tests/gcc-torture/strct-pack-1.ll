; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/strct-pack-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.TRIAL = type <{ i16, double }>

define i32 @check(%struct.TRIAL* %t) nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %t.addr = alloca %struct.TRIAL*, align 8
  store %struct.TRIAL* %t, %struct.TRIAL** %t.addr, align 8
  %0 = load %struct.TRIAL** %t.addr, align 8
  %s = getelementptr inbounds %struct.TRIAL* %0, i32 0, i32 0
  %1 = load i16* %s, align 2
  %conv = sext i16 %1 to i32
  %cmp = icmp ne i32 %conv, 1
  br i1 %cmp, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %2 = load %struct.TRIAL** %t.addr, align 8
  %d = getelementptr inbounds %struct.TRIAL* %2, i32 0, i32 1
  %3 = load double* %d, align 2
  %cmp2 = fcmp une double %3, 1.600000e+01
  br i1 %cmp2, label %if.then, label %if.end

if.then:                                          ; preds = %lor.lhs.false, %entry
  store i32 1, i32* %retval
  br label %return

if.end:                                           ; preds = %lor.lhs.false
  store i32 0, i32* %retval
  br label %return

return:                                           ; preds = %if.end, %if.then
  %4 = load i32* %retval
  ret i32 %4
}

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %trial = alloca %struct.TRIAL, align 2
  store i32 0, i32* %retval
  %s = getelementptr inbounds %struct.TRIAL* %trial, i32 0, i32 0
  store i16 1, i16* %s, align 2
  %d = getelementptr inbounds %struct.TRIAL* %trial, i32 0, i32 1
  store double 1.600000e+01, double* %d, align 2
  %call = call i32 @check(%struct.TRIAL* %trial)
  %cmp = icmp ne i32 %call, 0
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  call void @exit(i32 0) noreturn nounwind
  unreachable

return:                                           ; No predecessors!
  %0 = load i32* %retval
  ret i32 %0
}

declare void @abort() noreturn nounwind

declare void @exit(i32) noreturn nounwind
