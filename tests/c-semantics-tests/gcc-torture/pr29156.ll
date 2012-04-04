; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/pr29156.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.test1 = type { i32, i32 }
%struct.test2 = type { float, %struct.test1 }

@global = common global i32 0, align 4

define i32 @bla(%struct.test1* %xa, %struct.test2* %xb) nounwind uwtable {
entry:
  %xa.addr = alloca %struct.test1*, align 8
  %xb.addr = alloca %struct.test2*, align 8
  store %struct.test1* %xa, %struct.test1** %xa.addr, align 8
  store %struct.test2* %xb, %struct.test2** %xb.addr, align 8
  store i32 1, i32* @global, align 4
  %0 = load %struct.test2** %xb.addr, align 8
  %sub = getelementptr inbounds %struct.test2* %0, i32 0, i32 1
  %a = getelementptr inbounds %struct.test1* %sub, i32 0, i32 0
  store i32 1, i32* %a, align 4
  %1 = load %struct.test1** %xa.addr, align 8
  %a1 = getelementptr inbounds %struct.test1* %1, i32 0, i32 0
  store i32 8, i32* %a1, align 4
  %2 = load %struct.test2** %xb.addr, align 8
  %sub2 = getelementptr inbounds %struct.test2* %2, i32 0, i32 1
  %a3 = getelementptr inbounds %struct.test1* %sub2, i32 0, i32 0
  %3 = load i32* %a3, align 4
  ret i32 %3
}

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %pom = alloca %struct.test2, align 4
  store i32 0, i32* %retval
  %sub = getelementptr inbounds %struct.test2* %pom, i32 0, i32 1
  %call = call i32 @bla(%struct.test1* %sub, %struct.test2* %pom)
  %cmp = icmp ne i32 %call, 8
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  ret i32 0
}

declare void @abort() noreturn nounwind
